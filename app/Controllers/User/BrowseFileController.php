<?php

namespace App\Controllers\User;

use App\Controllers\User\MainController;
use Config\Services;
use App\Models\DataTableModel;

class BrowseFileController extends MainController
{
    public function index($browse_by)
    {
        $data = [
            'menu' => 'Browse File',
        ];

        if ($browse_by === "by-folder") {
            $data['sub_menu'] = "By Folder";
        } elseif ($browse_by === "by-user") {
            $data['sub_menu'] = "By User";
        } else {
            return redirect('user-dashboard');
        }

        return view('backend/user/browse-file-' . $browse_by, $data);
    }

    public function browseFileBy($browse_by, $argument)
    {
        $data = [
            'menu' => 'Browse File',
        ];

        if ($browse_by === "by-folder") {
            $data['sub_menu'] = "By Folder";
            $data['sub_child_menu'] = $argument;
        } elseif ($browse_by === "by-user") {
            $data['sub_menu'] = "By User";
            $data['sub_child_menu'] = $argument;
        } else {
            return redirect('user-dashboard');
        }

        return view('backend/user/browse-' . $browse_by . '-list', $data);
    }

    public function getFolders()
    {
        $browse_by = $this->request->getPost('browse_by');
        $argument = $this->request->getPost('argument');

        $builder = $this->db->table('view_folders');
        if ($browse_by) $builder->like("folder_name", $argument, 'both');

        $result = $builder->get()->getResult();

        echo json_encode($result);
    }

    public function downloadFile()
    {
        $file_uuid = $this->request->getPost('uuid');

        $builder = $this->db->table('view_files');
        $builder->where('uuid', $file_uuid);
        $builder->where('access_modifier', 'public');
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

    public function dtLoadBrowseFileBy()
    {
        $browse_by = $this->request->getPost('browse_by');
        $argument = $this->request->getPost('argument');

        if (!$browse_by || !$argument) return redirect('user-dashboard');

        $_find = $browse_by == "by-folder" ? "folder_slug" : "uploader";

        $request = Services::request();
        $table = 'view_files';
        $col_order = ['file_id', 'file_name', 'file_size', 'file_extension', 'folder_name', 'uploader', 'access_modifier', 'file_id'];
        $col_search = ['file_name', 'file_size', 'file_extension', 'folder_name', 'uploader', 'access_modifier'];
        $col_where = [$_find => $argument];
        $datatable = new DataTableModel($request, $table, $col_order, $col_search, $col_where, ['file_id' => 'DESC']);

        $lists = $datatable->getDatatables();
        $data = [];
        $no = $request->getPost('start');
        $getFile = base_url('/user/browse-file/download-file');
        $csrf = csrf_field();

        foreach ($lists as $list) {
            $file_name = $list->access_modifier == "private"
                ? "<span class='text-blur' >" . str_shuffle($list->file_name . microtime()) . "</span>"
                : $list->file_name;

            $button = $list->access_modifier == "private"
                ? "<div class='btn rounded-pill btn-danger btn-sm'><span class='tf-icons bx bx-lock-alt mr-2'></span>Locked</div>"
                : "<form class='d-inline' action='$getFile' method='POST'>
                            $csrf
                            <input type='hidden' name='uuid' value='$list->uuid'>
                            <button type='submit' class='btn rounded-pill btn-primary btn-sm btn-download'><span class='tf-icons bx bx-download mr-2'></span>Download</button>
                    </form>";

            $access_modifier = $list->access_modifier == "public"
                ? "<span class='badge bg-label-success'>$list->access_modifier</span>"
                : "<span class='badge bg-label-danger'>$list->access_modifier</span>";

            $no++;
            $row = [];
            $row[] = $no;
            $row[] = $file_name;
            $row[] = $list->file_size . "kb";
            $row[] = $list->file_extension;
            $row[] = $access_modifier;
            $row[] = $list->folder_name;
            $row[] = $list->uploader;
            $row[] = $list->download_count . "x";
            $row[] = $button;
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

    public function dtLoadBrowseFileByUser()
    {
        $request = Services::request();
        $table = 'view_user_files';
        $col_order = ['id', 'username', 'file_count', 'id'];
        $col_search = ['username', 'file_count'];
        $datatable = new DataTableModel($request, $table, $col_order, $col_search, [], ['id' => 'ASC']);

        $lists = $datatable->getDatatables();
        $data = [];
        $no = $request->getPost('start');
        foreach ($lists as $list) {
            $getUrl = base_url("/user/browse-file/by-user/$list->username");
            $no++;
            $row = [];
            $row[] = $no;
            $row[] = $list->username;
            $row[] = $list->active == 1 ? "<span class='badge bg-success'>Active</span>" : "<span class='badge bg-danger'>Non-active</span>";
            $row[] = $list->last_active ? date("d-m-Y, H:i:s", strtotime($list->last_active)) : "-";
            $row[] = $list->file_count . " FILE";
            $row[] = "<a href='$getUrl' class='btn rounded-pill btn-outline-primary btn-sm'>View File</a>";
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
