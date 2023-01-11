<?php

namespace App\Controllers\User;

use App\Controllers\User\MainController;
use Config\Services;
use App\Models\DataTableModel;

class DownloadHistoryController extends MainController
{
    public function index()
    {
        $data = [
            'menu' => 'My File',
            'sub_menu' => 'Download History'
        ];

        return view('backend/user/download-history', $data);
    }

    public function dtLoadDownloadHistory()
    {
        $request = Services::request();
        $table = 'view_downloads';
        $col_order = ['download_id', 'history_file_name', 'history_file_size', 'history_file_extension', 'history_folder_name', 'download_id'];
        $col_search = ['history_file_name', 'history_file_size', 'history_file_extension', 'history_folder_name'];
        $col_where = ['user_id' => $this->user->id];
        $datatable = new DataTableModel($request, $table, $col_order, $col_search, $col_where, ['download_id' => 'DESC']);

        $lists = $datatable->getDatatables();
        $data = [];
        $no = $request->getPost('start');
        foreach ($lists as $list) {
            $badge_icon = $list->availability ? "success" : "danger";
            $badge_text = $list->availability ? "available" : "deleted";
            $availability = "<span class='badge rounded-pill bg-label-$badge_icon'>$badge_text</span>";

            $no++;
            $row = [];
            $row[] = $no;
            $row[] = "<span class='d-inline-block text-wrap' style='min-width: 200px;'>$list->history_file_name</span>";
            $row[] = $list->history_file_size . "kb";
            $row[] = $list->history_file_extension;
            $row[] = $list->history_folder_name;
            $row[] = $list->history_uploader_username;
            $row[] = $availability;
            $row[] = date("d-m-Y, H:i:s", strtotime($list->created_at));
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
