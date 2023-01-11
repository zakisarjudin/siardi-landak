<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('RedirectController');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
//$routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'RedirectController::index');

$routes->group('admin', ['filter' => 'group:admin'], static function ($routes) {
    $routes->get('dashboard', 'Admin\DashboardController::index', ['as' => 'admin-dashboard']);

    $routes->group('ajax', static function ($routes) {
        $routes->post('dt-load-menu', 'Admin\MenuController::dtLoadMenu');
        $routes->post('dt-load-sub-menu', 'Admin\SubMenuController::dtLoadSubMenu');
    });

    $routes->group('menu-management', static function ($routes) {
        $routes->get('menu', 'Admin\MenuController::index');

        $routes->get('sub-menu', 'Admin\SubMenuController::index');
    });

    // default route
    $routes->get('/', static function () {
        return redirect('admin-dashboard');
    });
});

$routes->group('user', ['filter' => 'group:user'], static function ($routes) {
    $routes->get('dashboard', 'User\DashboardController::index', ['as' => 'user-dashboard']);

    $routes->group('ajax', static function ($routes) {
        $routes->post('get-summary', 'User\DashboardController::getSummary');
        $routes->post('get-file', 'User\UploadFileController::getFile');
        $routes->post('upload-file', 'User\UploadFileController::uploadFile');
        $routes->post('dt-load-file', 'User\UploadFileController::dtLoadFile');
        $routes->post('dt-load-download-history', 'User\DownloadHistoryController::dtLoadDownloadHistory');
        $routes->post('dt-load-browse-file-by', 'User\BrowseFileController::dtLoadBrowseFileBy');
        $routes->post('dt-load-browse-file-by-user', 'User\BrowseFileController::dtLoadBrowseFileByUser');
        $routes->post('get-folders', 'User\BrowseFileController::getFolders');
        $routes->post('change-access-modifier', 'User\UploadFileController::changeAccessModifier');
    });

    $routes->group('my-file', static function ($routes) {
        $routes->post('download-file', 'User\UploadFileController::downloadFile');
        $routes->post('delete-file', 'User\UploadFileController::deleteFile');
        $routes->get('upload-file', 'User\UploadFileController::index');
        $routes->get('download-history', 'User\DownloadHistoryController::index');
    });

    $routes->group('browse-file', static function ($routes) {
        $routes->post('download-file', 'User\BrowseFileController::downloadFile');

        $routes->get('(:any)/(:any)', 'User\BrowseFileController::browseFileBy/$1/$2');

        $routes->get('(:any)', 'User\BrowseFileController::index/$1');
    });

    // default route
    $routes->get('/', static function () {
        return redirect('user-dashboard');
    });
});

service('auth')->routes($routes);


$routes->get('/(:any)', 'RedirectController::index');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
