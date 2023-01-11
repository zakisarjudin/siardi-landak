<?php

namespace App\Controllers\User;

use App\Controllers\User\MainController;
use Config\Services;
use App\Models\DataTableModel;
use stdClass;

class UploadFileController extends MainController
{
    public function index()
    {
        $data = [
            'menu' => 'My File',
            'sub_menu' => 'Upload File'
        ];

        return view('backend/user/upload-file', $data);
    }

    public function getFile()
    {
        $file_uuid = $this->request->getPost('uuid');

        $builder = $this->db->table('view_files');
        $builder->where('uuid', $file_uuid);
        $builder->where('user_id', $this->user->id);
        $file = $builder->get()->getRow();

        echo json_encode($file);
    }

    public function uploadFile()
    {
        $this->validation->setRules([
            'access_modifier' =>  [
                'rules'  => "in_list[public,private]",
            ],
            'file_inputer' => [
                'label'  => "File",
                'rules'  => "max_size[file_inputer,5120]|mime_in[file_inputer,text/plain,image/png,image/jpg,image/jpeg,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation]",
                'errors' => [
                    'max_size' => 'Ukuran {field} maksimal 5Mb',
                    'mime_in' => 'Ekstensi {field} tidak dikenali',
                ],
            ],
        ]);
        $this->validation->withRequest($this->request)->run();
        $errors = $this->validation->getErrors();

        $uniqid = strtoupper(uniqid("Siardi_"));
        if (!$errors) {
            //upload files
            $data = [];
            $files = $this->request->getFiles();
            foreach ($files['file_inputer'] as $file) {

                if ($file->isValid() && !$file->hasMoved()) {
                    $file_name = $file->getName();
                    $file_extension = $file->getExtension();
                    $file_size = $file->getSizeByUnit('kb');

                    $file_path = 'uploads/user-files/' . date('Y-m') . '/' . $uniqid . '/';
                    $data[] = [
                        'user_id' => auth()->id(),
                        'folder_id' => $this->request->getPost('folder_id'),
                        'file_name' => $file_name,
                        'file_path' => $file_path,
                        'file_size' => $file_size,
                        'file_extension' => $file_extension,
                        'access_modifier' => $this->request->getPost('access_modifier'),
                        'created_at' => date("Y-m-d H:i:s")
                    ];

                    $file->move(FCPATH . $file_path, $file_name);
                }
            }

            $builder = $this->db->table('files');
            $builder->insertBatch($data);
        }

        echo json_encode($errors);
    }

    public function downloadFile()
    {
        $file_uuid = $this->request->getPost('uuid');

        $builder = $this->db->table('view_files');
        $builder->where('uuid', $file_uuid);
        $builder->where('user_id', $this->user->id);
        $file = $builder->get()->getRow();

        if ($file) {
            if (!get_file_info($file->file_path . $file->file_name)) {
                return redirect()->back()->with('flash_data', 'File not exist on server!');
            }

            if ($file->user_id != $this->user->id) {
                // add to download history
                $data = [
                    'user_id' => $this->user->id,
                    'file_id' => $file->file_id,
                    'history_file_name' => $file->file_name,
                    'history_file_size' => $file->file_size,
                    'history_file_extension' => $file->file_extension,
                    'history_folder_name' => $file->folder_name,
                    'history_uploader_username' => $file->uploader,
                    'created_at' => date('Y-m-d H:i:s')
                ];

                $builder = $this->db->table('downloads');
                $builder->insert($data);
            }

            // return file
            return $this->response->download($file->file_path . $file->file_name, null);
        } else {
            return redirect()->back()->with('flash_data', 'Unauthorized File Access!');
        }
    }

    public function deleteFile()
    {
        $file_uuid = $this->request->getPost('uuid');

        $builder = $this->db->table('files');
        $builder->where('uuid', $file_uuid);
        $builder->where('user_id', $this->user->id);
        $file = $builder->get()->getRow();

        $response = new stdClass;

        if ($file) {
            $builder = $this->db->table('files');
            $builder->where('uuid', $file->uuid);
            $builder->delete();

            if (get_file_info($file->file_path . $file->file_name)) {
                delete_files($file->file_path, true); //delete file directory
            }
        } else {
            $response->error = "unauthorized or file not exist!";
        }

        echo json_encode($response);
    }

    public function changeAccessModifier()
    {
        $file_uuid = $this->request->getPost('uuid');

        $this->validation->setRules([
            'change_access_modifier' =>  [
                'rules'  => "in_list[public,private]",
            ],
        ]);
        $this->validation->withRequest($this->request)->run();
        $errors = $this->validation->getErrors();

        if (!$errors) {
            $builder = $this->db->table('files');
            $builder->set('access_modifier', $this->request->getPost('change_access_modifier'));
            $builder->where('uuid', $file_uuid);
            $builder->where('user_id', $this->user->id);
            $builder->update();
        }

        echo json_encode($errors);
    }

    public function dtLoadFile()
    {
        $request = Services::request();
        $table = 'view_files';
        $col_order = ['file_id', 'file_name', 'file_size', 'file_extension', 'access_modifier', 'created_at', 'file_id'];
        $col_search = ['file_name', 'file_size', 'file_extension', 'access_modifier', 'created_at'];
        $col_where = ['user_id' => $this->user->id];
        $datatable = new DataTableModel($request, $table, $col_order, $col_search, $col_where, ['file_id' => 'DESC']);

        $lists = $datatable->getDatatables();
        $data = [];
        $no = $request->getPost('start');
        $getFile = base_url('/user/my-file/download-file');
        $deleteUrl = base_url('/user/my-file/delete-file');
        $csrf = csrf_field();
        foreach ($lists as $list) {
            $access_modifier = $list->access_modifier == "public"
                ? "<span class='badge bg-label-success'>$list->access_modifier</span>"
                : "<span class='badge bg-label-danger'>$list->access_modifier</span>";

            $no++;
            $row = [];
            $row[] = $no;
            $row[] = "<span class='d-inline-block text-wrap' style='min-width: 200px;'>$list->file_name</span>";
            $row[] = $list->file_size . "kb";
            $row[] = $list->file_extension;
            $row[] = $list->folder_name;
            $row[] = $access_modifier .
                "<button class='btn rounded-pill btn-outline-primary btn-xs btn-change-access ml-2' data-uuid='$list->uuid'>change</button>";
            $row[] = date("d-m-Y, H:i:s", strtotime($list->created_at));
            $row[] = "<form class='d-inline' action='$getFile' method='POST'>
                            $csrf
                            <input type='hidden' name='uuid' value='$list->uuid'>
                            <button type='submit' class='btn btn-icon btn-sm btn-primary btn-download-myfile'><span class='tf-icons bx bx-download'></span></button>
                      </form>
            
                      <button class='btn btn-icon btn-sm btn-danger btn-delete-myfile' data-uuid='$list->uuid' data-url='$deleteUrl'><span class='tf-icons bx bx-trash'></span></button>";
            $data[] = $row;
        }

        $output = [
            'draw' => $request->getPost('draw'),
            'recordsTotal' => $datatable->countAll(),
            'recordsFiltered' => $datatable->countFiltered(),
            'data' => $data
        ];


        echo json_encode($output);
    }
}
