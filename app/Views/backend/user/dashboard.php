<?= $this->extend('backend/layouts/index') ?>

<?= $this->section('content') ?>
<div id="dashboard-section" class="container-xxl flex-grow-1 container-p-y">
    <!-- Layout -->
    <div class="row">
        <div class="col-lg-12 mb-4 order-0">
            <div class="card">
                <div class="d-flex align-items-end row">
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title text-primary">Welcome to Sistem Arsip Digital, <?= $username; ?>!</h5>
                            <p class="mb-4">
                                You have upload <span class="fw-bold total-file">
                                    <span class="spinner-border spinner-border-sm text-primary"></span>
                                </span> files
                                that have been downloaded <span class="fw-bold total-download">
                                    <span class="spinner-border spinner-border-sm text-primary"></span>
                                </span> times by other user.
                            </p>

                            <a href="<?= base_url('user/my-file/upload-file'); ?>" class="btn btn-sm btn-outline-primary">Upload More Files</a>
                        </div>
                    </div>
                    <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                            <img src="<?= base_url('template/sneat-1.0.0/'); ?>/assets/img/illustrations/man-with-laptop-light.png" height="140" data-app-dark-img="illustrations/man-with-laptop-dark.png" data-app-light-img="illustrations/man-with-laptop-light.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ Layout -->
</div>
<?= $this->endSection() ?>