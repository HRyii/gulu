<?php

namespace web\goods\validate;

use think\Validate;

class Store extends Validate
{
    protected $store = [
        'name' => 'require|alphaDash|max:30|token',
    ];
}
