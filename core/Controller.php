<?php

namespace Core;

abstract class Controller
{
    protected static $_records_name, $_record_name, $_repository;

    public static function init()
    {
        // static::class  \App\Controllers\AuthorsController
        $root_name = basename(str_replace('\\', '/', static::class), 'Controller');
        static::$_records_name = strtolower($root_name);
        static::$_record_name = basename(strtolower($root_name), 's');
        static::$_repository = '\App\Models\\' . $root_name . 'Repository';
    }

    public static function indexAction()
    {
        static::init();
        ${static::$_records_name} = static::$_repository::findAll();
        include '../app/views/' . static::$_records_name . '/index.php';
    }

    public static function showAction(int $id): void
    {
        static::init();
        ${static::$_record_name} = static::$_repository::findOneById($id);
        include '../app/views/' . static::$_records_name . '/show.php';
    }
}
