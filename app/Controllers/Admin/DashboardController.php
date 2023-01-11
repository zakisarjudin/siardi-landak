<?php

namespace App\Controllers\Admin;

use App\Controllers\Admin\MainController;

class DashboardController extends MainController
{
    public function index()
    {
        return view('backend/admin/dashboard');
    }
}
