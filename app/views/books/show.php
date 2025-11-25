<h2 class="text-3xl">
    <?php echo $book->title; ?>
</h2>
<div>
    <?php echo $book->resume; ?>
</div>

<ul class="border-y-2 border-gray-300 py-4">
    <li>Author:
        <?php echo $book->author->firstname; ?>
        <?php echo $book->author->lastname; ?>
    </li>
    <li>ISBN: <?php echo $book->isbn; ?></li>
    <li>Category: <?php echo $book->category->name; ?></li>
</ul>