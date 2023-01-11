<?= $this->extend('backend/layouts/index') ?>

<?= $this->section('content') ?>
<div id="browse-file-by-folder-section" class="container-xxl flex-grow-1 container-p-y">
    <!-- Layout -->
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"><?= $menu; ?> /</span> <?= $sub_menu; ?></h4>

    <div class="card mb-4">
        <div class="card-header d-flex flex-wrap justify-content-between">
            <h4 class="card-title">Folder</h4>
            <div class="folder-display d-flex align-items-stretch">
                <div class="btn-group" role="group">
                    <button class="btn btn-sm btn-folder-display btn-outline-secondary active" data-display="folder">
                        <i class="tf-icons bx bx-folder"></i>
                    </button>
                    <button class="btn btn-sm btn-folder-display btn-outline-secondary" data-display="list">
                        <i class="tf-icons bx bx-list-ul"></i>
                    </button>
                </div>
            </div>
            <div class="folder-search d-flex align-items-stretch ml-3">
                <div class="input-group input-group-merge">
                    <span class="input-group-text"><i class="bx bx-search"></i></span>
                    <input type="text" class="form-control form-control-sm folder-search-input" placeholder="Search...">
                </div>
            </div>
        </div>
        <hr class="m-0">
        <div id="folder-container" class="card-body">
            <div class="loading d-flex justify-content-center">
                <div class="spinner-grow text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </div>
    </div>
    <!--/ Layout -->
</div>
<?= $this->endSection() ?>