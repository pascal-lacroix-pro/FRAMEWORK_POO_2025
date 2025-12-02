<?php Core\Template::startSection('title') ?>
Latest Books
<?php Core\Template::endSection() ?>


<?php Core\Template::startSection('content') ?>
<h2>Latest books</h2>
<?php include "../app/views/books/_index.php"; ?>
<?php Core\Template::endSection() ?>