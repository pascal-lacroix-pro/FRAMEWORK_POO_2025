<?php Core\Template::startSection('title') ?>
Latest Authors
<?php Core\Template::endSection() ?>


<?php Core\Template::startSection('content') ?>
<h2>Latest authors</h2>
<?php include '../app/views/authors/_index.php'; ?>
<?php Core\Template::endSection() ?>