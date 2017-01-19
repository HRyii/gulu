<?php

namespace core\model;

class Module extends Model
{
    public function permissions()
    {
        return $this->hasManyThrough('Permission', 'Menu');
    }

    public function menus()
    {
        return $this->hasMany('Menu', 'module_id', 'id');
    }
}
