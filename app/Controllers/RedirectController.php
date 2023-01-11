<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class RedirectController extends BaseController
{
    public function index()
    {
        if (!auth()->loggedIn()) {
            return redirect('login');
        }

        $user = auth()->user();

        return redirect($user->getGroups()[0]);
    }
}
