<?= $this->extend('backend/layouts/index') ?>

<?= $this->section('content') ?>
<div id="upload-file-section" class="container-xxl flex-grow-1 container-p-y">
    <!-- Layout -->
    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"><?= $menu; ?> /</span> <?= $sub_menu; ?></h4>

    <div class="card mb-4">
        <h5 class="card-header">Upload Files</h5>
        <div class="card-body">
            <form id="form-upload-file" action="<?= base_url('user/ajax/upload-file'); ?>" method="POST" enctype="multipart/form-data">
                <div class="input-group">
                    <label class="input-group-text">Folder</label>
                    <select class="form-select" id="folder_id" name="folder_id" required>

                    </select>
                </div>

                <div class=" mt-3">
                    <div class="input-group">
                        <span class="input-group-text">Access</span>
                        <div class="form-control">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="access_modifier" id="access_modifier1" value="public" checked>
                                <label class="form-check-label" for="access_modifier1">Public</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="access_modifier" id="access_modifier2" value="private">
                                <label class="form-check-label" for="access_modifier2">Private</label>
                            </div>

                        </div>
                    </div>


                </div>

                <div class="mt-3">
                    <input id="file_input" name="file_inputer[]" type="file" multiple required>
                    <div class="mt-1 p-1">
                        <div class="form-text text-primary">
                            *Maksimum 5 file dalam 1 kali unggah, dengan ukuran 5Mb per file. [jpg/png/pdf/txt/doc/docx/xls/xlsx]
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-info me-2">Upload File</button>
                        <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                    </div>
                </div>
            </form>
        </div>
        <hr class="my-0">
    </div>
    <div class="card">
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
                            <th>File Size</th>
                            <th>File Extension</th>
                            <th>Folder</th>
                            <th>Access Modifiers</th>
                            <th>Created At</th>
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

    <!-- Modal -->
    <div class="modal modal-top fade" id="modal-change-access" tabindex="-1">
        <div class="modal-dialog">
            <form id="form-change-access" class="modal-content" method="POST" action="<?= base_url('user/ajax/change-access-modifier'); ?>">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTopTitle">Change Access Modifier</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="uuid" id="uuid">
                    <div class="row">
                        <div class="col mb-3">
                            <label for="file_name" class="form-label">File Name</label>
                            <div id="file_name" class="form-control"></div>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <label for="emailSlideTop" class="form-label">Access Modifier</label>
                        <div class="col-md">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="change_access_modifier" id="change_access_modifier1" value="public">
                                <label class="form-check-label" for="change_access_modifier1">Public</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="change_access_modifier" id="change_access_modifier2" value="private">
                                <label class="form-check-label" for="change_access_modifier2">Private</label>
                            </div>
                        </div>
                        <div id="err_change_access_modifier"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>

</div>
<?= $this->endSection() ?>