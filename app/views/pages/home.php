<h2>Recent books</h2>
<ul>
    <?php foreach ($books as $book): ?>
        <li>
            <?php echo $book['title']; ?> :
            <!-- On va tronquer le resume à 30 caractères -->
            <!-- 
                1. Tranformer notre Helpers en classe
                2. Changer le PSR-4
                3. composer dump-autoload
            -->
            <?php echo \Core\Helpers::truncate($book['resume'], 30); ?>
        </li>
    <?php endforeach; ?>
</ul>