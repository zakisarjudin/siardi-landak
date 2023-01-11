<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\MainController;
use Config\Services;
use App\Models\DataTableModel;

class SubMenuController extends MainController
{
    public function index()
    {
        $data = [
            'menu' => 'Menu Management',
            'sub_menu' => 'Sub Menu'
        ];

        return view('backend/admin/sub-menu', $data);
    }

    public function dtLoadSubMenu()
    {
        $request = Services::request();
        $table = 'view_sub_menus';
        $col_order = ['sub_menu_id', 'menu_name', 'sub_menu_name', 'sub_menu_route', 'sub_menu_id'];
        $col_search = ['menu_name', 'sub_menu_name', 'sub_menu_route'];
        $datatable = new DataTableModel($request, $table, $col_order, $col_search, [], ['sub_menu_id' => 'ASC']);

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
            $row[] = $list->sub_menu_name;
            $row[] = $list->sub_menu_route;
            $row[] = $list->menu_name;
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
