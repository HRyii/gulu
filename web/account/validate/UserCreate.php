<?php

namespace web\account\validate;

use think\Validate;

class UserCreate extends Validate
{
    protected $rule = [
        'username' => 'require|alphaDash|max:30|token',
        'password' => 'require|confirm',
        'enabled' => 'require|in:0,1',
        'roles' => 'array',
    ];

    protected $message = [
        'username.require' => '用户名必填',
        'username.alphaDash' => '用户名含有非法字符',
        'username.max' => '用户名超过合法长度',
        'username.token' => '无效令牌',
        'password.require' => '密码必填',
        'password.confirm' => '两次输入的密码不一致',
        'enabled.require' => '用户状态必填',
        'enabled.in' => '用户状态输入非法',
        'roles.array' => '角色选择非法',
    ];
}
