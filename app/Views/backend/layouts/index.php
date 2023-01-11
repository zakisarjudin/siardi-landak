<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="<?= base_url('template/sneat-1.0.0/'); ?>/assets/">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>SI-ARDI | Sistem - Arsip Digital</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<?= base_url('template/sneat-1.0.0/'); ?>/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<?= base_url('template/sneat-1.0.0/'); ?>/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/vendor/datatables/datatables.min.css" />
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/vendor/bootstrap-icons-1.9.1/bootstrap-icons.css" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/css/custom-style.css" />

    <!-- Helpers -->
    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/js/helpers.js"></script>
    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/js/config.js"></script>

    <!-- FileInput -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/vendor/kartik-v-bootstrap-fileinput/css/fileinput.min.css" />


</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->
            <?= $this->include('backend/layouts/partials/sidebar') ?>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->
                <?= $this->include('backend/layouts/partials/navbar') ?>
                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <?= $this->renderSection('content') ?>
                    <!-- / Content -->

                    <!-- Footer -->
                    <?= $this->include('backend/layouts/partials/footer') ?>
                    <!-- / Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/libs/popper/popper.js"></script>
    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/js/bootstrap.js"></script>
    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="<?= base_url(); ?>/assets/vendor/datatables/datatables.min.js"></script>
    <script src="<?= base_url(); ?>/assets/vendor/kartik-v-bootstrap-fileinput/js/fileinput.min.js"></script>
    <script src="<?= base_url(); ?>/assets/vendor/sweetalert2@11.4.29/sweetalert2.all.min.js"></script>

    <!-- Main JS -->
    <script src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/js/main.js"></script>

    <!-- Page JS -->
    <script>
        let baseUrl = '<?= base_url() ?>';
        $.ajaxSetup({
            headers: {
                "<?= csrf_header(); ?>": "<?= csrf_hash(); ?>",
            },
        });
    </script>

    <?php $user = user_group(); ?>

    <script src="<?= base_url(); ?>/assets/js/custom-core.js"></script>
    <script src="<?= base_url(); ?>/assets/js/<?= $user; ?>-core.js"></script>
</body>

</html>