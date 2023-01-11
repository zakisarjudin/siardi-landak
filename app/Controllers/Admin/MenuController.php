<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\MainController;
use Config\Services;
use App\Models\DataTableModel;

class MenuController extends MainController
{
    public function index()
    {
        $data = [
            'menu' => 'Menu Management',
            'sub_menu' => 'Menu'
        ];

        return view('backend/admin/menu', $data);
    }

    public function dtLoadMenu()
    {
        $request = Services::request();
        $table = 'menus';
        $col_order = ['menu_id', 'menu_name', 'menu_route', 'menu_description', 'menu_icon', 'menu_id'];
        $col_search = ['menu_name', 'menu_route', 'menu_description'];
        $datatable = new DataTableModel($request, $table, $col_order, $col_search, [], ['menu_id' => 'ASC']);

        $lists = $datatable->getDatatables();
        $data = [];
        $no = $request->getPost('start');
        $getUrl = base_url('/employee/ajax/getActivity');
        $editUrl = base_url('/employee/activity/daily/editActivity');
        $deleteUrl = base_url('/employee/activity/daily/deleteActivity');
        foreach ($lists as $list) {
            $no++;
            $row = [];
            $row[] = $no;
            $row[] = $list->menu_name;
            $row[] = $list->menu_route;
            $row[] = $list->menu_description;
            $row[] = "<i class='tf-icons $list->menu_icon'></i> <small>$list->menu_icon</small>";
            $row[] = "<button type='button' class='btn btn-icon btn-sm btn-primary'><span class='tf-icons bx bx-edit-alt'></span></button>
                      <button type='button' class='btn btn-icon btn-sm btn-danger'><span class='tf-icons bx bx-trash'></span></button>";
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
