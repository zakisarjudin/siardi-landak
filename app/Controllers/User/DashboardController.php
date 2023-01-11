<?php

namespace App\Controllers\User;

use App\Controllers\User\MainController;
use stdClass;

class DashboardController extends MainController
{
    public function index()
    {
        $data = ['username' => $this->user->username];

        return view('backend/user/dashboard', $data);
    }

    public function getSummary()
    {
        $builder = $this->db->table('files');
        $builder->select('COUNT(user_id) as total_file');
        $builder->where('user_id', $this->user->id);
        $file = $builder->get()->getRow();

        $builder = $this->db->table('downloads');
        $builder->select('COUNT(user_id) as total_download');
        $builder->where('user_id', $this->user->id);
        $download = $builder->get()->getRow();

        $obj = new stdClass;
        $obj->file = $file;
        $obj->download = $download;

        echo json_encode($obj);
    }
}
