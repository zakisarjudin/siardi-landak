<?= $this->extend('backend/layouts/index') ?>

<?= $this->section('content') ?>
<div id="menu-section" class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"><?= $menu; ?> /</span> <?= $sub_menu; ?></h4>
    <!-- Responsive Table -->
    <div class="card">
        <h5 class="card-header">
            <div class="d-flex justify-content-between">
                <div class="card-title">Menu List</div>
                <div class="button-list">
                    <button type="button" class="btn btn-primary">
                        <span class="tf-icons bx bx-plus-circle"></span>&nbsp; Add Menu
                    </button>
                </div>
            </div>
        </h5>
        <div class="table-responsive text-nowrap p-4">
            <table id="data-table" class="table">
                <thead>
                    <tr class="text-nowrap">
                        <th>#</th>
                        <th>Menu Name</th>
                        <th>Menu Route</th>
                        <th>Menu Description</th>
                        <th>Menu Icon</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!--/ Responsive Table -->
</div>
<?= $this->endSection() ?>