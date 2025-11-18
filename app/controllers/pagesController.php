<?php

namespace App\Controllers;

use \PDO, \App\Models\BooksRepository, \App\Models\AuthorsRepository;

abstract class PagesController
{
    public static function homeAction(PDO $conn)
    {
        $books = BooksRepository::findAll($conn, 3);
        $authors = AuthorsRepository::findAll($conn, 3);

        global $content, $title;
        ob_start();
        include '../app/views/pages/home.php';
        $content = ob_get_clean();
    }
}
