<?php

namespace core\model;

class Menu extends Model
{
    public function menus()
    {
        return $this->hasMany('Menu', 'pid', 'id');
    }

    public function permissions()
    {
        return $this->hasMany('Permission', 'menu_id', 'id');
    }

    public function module()
    {
        return $this->belongsTo('Module', 'module_id', 'id');
    }
}
