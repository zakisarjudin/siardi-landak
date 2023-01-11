<?= $this->extend('backend/layouts/index') ?>

<?= $this->section('content') ?>
<div id="browse-file-by-user-section" class="container-xxl flex-grow-1 container-p-y">
    <!-- Layout -->
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"><?= $menu; ?> /</span> <?= $sub_menu; ?></h4>

    <div class="card mb-4">
        <h5 class="card-header">User</h5>
        <hr class="m-0">
        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table id="data-table" class="table">
                    <thead>
                        <tr class="text-nowrap">
                            <th>#</th>
                            <th>Username</th>
                            <th>Status</th>
                            <th>Last Active</th>
                            <th>File Count</th>
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