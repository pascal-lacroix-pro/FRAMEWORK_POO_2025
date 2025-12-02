<?php

namespace Core;

abstract class Model
{
    public $id, $created_at;

    public function __get(string $prop): mixed
    {
        $this->setField($prop);
        return $this->$prop;
    }

    public function setField(string $fieldName)
    {
        $fieldWithoutY = (str_ends_with($fieldName, 'y')) ?
            substr($fieldName, 0, -1) . 'ie' :
            $fieldName;
        $repository =  '\App\Models\\' . ucfirst($fieldWithoutY)  . 'sRepository';
        $fk = $fieldName . "_id";
        if (!$this->$fieldName):
            $this->$fieldName = $repository::findOneById($this->$fk);
        endif;
    }
}
