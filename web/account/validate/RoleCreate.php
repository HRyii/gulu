<?php

namespace web\account\validate;

use think\Validate;

class RoleCreate extends Validate
{
    protected $rule = [
        'name' => 'require|regex:[a-z_]+',
        'display_name' => 'require',
        'permissions' => 'array',
    ];

    protected $message = [
        'name.require' => '角色标识必填',
        'name.regex' => '非法角色标识(只能是小写字母+下划线)',
        'display_name.require' => '角色名称必填',
        'permissions' => '非法权限',
    ];
}
