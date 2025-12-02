<?php

namespace App\Controllers;

use \App\Models\BooksRepository, \App\Models\AuthorsRepository;

abstract class PagesController
{
    public static function homeAction()
    {
        $books = BooksRepository::findAll(3);
        $authors = AuthorsRepository::findAll(3);

        include '../app/views/pages/home.php';
    }
}
