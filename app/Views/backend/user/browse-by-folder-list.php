<?= $this->extend('backend/layouts/index') ?>

<?= $this->section('content') ?>
<div id="browse-by-folder-list-section" class="container-xxl flex-grow-1 container-p-y">
    <!-- Layout -->
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"><?= $menu; ?> / <?= $sub_menu; ?> /</span> <?= $sub_child_menu; ?></h4>

    <div class="card mb-4">
        <div class="card-header d-flex flex-wrap justify-content-between">
            <h5 class="card-title slug">Slug</h5>
            <a href="<?= base_url('user/browse-file/by-folder'); ?>" class="btn rounded-pill btn-primary">
                <span class="tf-icons bx bx-arrow-back"></span>&nbsp; Back
            </a>
        </div>
        <div class="card-body">
            <?php if ($data = session()->getFlashdata('flash_data')) {
                echo "<div class='alert alert-danger alert-dismissible' role='alert'>
                        $data
                        <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                    </div>";
            }; ?>

            <div class="table-responsive text-nowrap">
                <table id="data-table" class="table">
                    <thead>
                        <tr class="text-nowrap">
                            <th>#</th>
                            <th>File Name</th>
                            <th>Size</th>
                            <th>Extension</th>
                            <th>Access</th>
                            <th>Folder</th>
                            <th>Uploader</th>
                            <th>Downloaded</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--/ Layout -->
</div>
<?= $this->endSection() ?>