<?php

namespace Core;

abstract class Template
{
    private static $zone;

    public static function startSection($zone)
    {
        SELF::$zone = $zone;
        ob_start();
    }

    public static function endSection()
    {
        global ${SELF::$zone};
        ${SELF::$zone} = ob_get_clean();
    }
}
