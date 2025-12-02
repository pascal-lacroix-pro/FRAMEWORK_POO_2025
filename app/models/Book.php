<?php

namespace App\Models;

class Book extends \Core\Model
{
    public $isbn, $cover, $title, $resume, $author_id, $category_id;

    // Liaisons 1-N
    protected $author, $category;
}


// echo $book->title;
// echo $book->author->firstname; (1-N)

// foreach $author->books (1-N à l'envers)

// foreach $book->tags (N-M)
// foreach $tag->books (N-M)
