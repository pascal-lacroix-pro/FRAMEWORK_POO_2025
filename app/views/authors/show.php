<?php Core\Template::startSection('title') ?>
<?php echo $author->firstname; ?> <?php echo $author->lastname; ?>
<?php Core\Template::endSection() ?>


<?php Core\Template::startSection('content') ?>
<h2 class="text-3xl">
    <?php echo $author->firstname; ?> <?php echo $author->lastname; ?>
</h2>
<div>
    <?php echo $author->biography; ?>
</div>

<ul class="border-y-2 border-gray-300 py-4">
    <li>Books: ...</li>
</ul>
<?php Core\Template::endSection() ?>