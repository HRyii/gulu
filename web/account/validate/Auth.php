<?php

namespace web\account\validate;

use think\Validate;

class Auth extends Validate
{
    protected $rule = [
        'username' => 'require|alphaDash|max:30|token',
        'password' => 'require'
    ];

    protected $message = [
        'username.require' => '用户名必填',
        'username.alphaDash' => '用户名含有非法字符',
        'username.max' => '用户名超过合法长度',
        'username.token' => '无效令牌',
        'password.require' => '密码必填'
    ];
}
