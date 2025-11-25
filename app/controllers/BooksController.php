<?php

namespace App\Controllers;

use \App\Models\BooksRepository;

abstract class BooksController
{
    public static function showAction(int $id): void
    {
        $book = BooksRepository::findOneById($id);

        global $content, $title;
        $title = $book->title;
        ob_start();
        include '../app/views/books/show.php';
        $content = ob_get_clean();
    }
}
