<?= $this->extend('backend/layouts/index') ?>

<?= $this->section('content') ?>
<div id="download-history-section" class="container-xxl flex-grow-1 container-p-y">
    <!-- Layout -->
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"><?= $menu; ?> /</span> <?= $sub_menu; ?></h4>

    <div class="card mb-4">
        <h5 class="card-header">Download History</h5>
        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table id="data-table" class="table">
                    <thead>
                        <tr class="text-nowrap">
                            <th>#</th>
                            <th width="10%">File Name</th>
                            <th>Size</th>
                            <th>Extension</th>
                            <th>Folder Name</th>
                            <th>Uploader</th>
                            <th>Availability</th>
                            <th>Downloaded at</th>
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