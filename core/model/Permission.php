<?php

namespace core\model;

class Permission extends Model
{
    public function menu()
    {
        return $this->belongsTo('Menu', 'menu_id', 'id');
    }
}
