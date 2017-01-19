<?php

namespace tests\unit\web\account\validate;

use tests\unit\TestCase;
use web\account\validate\Auth as AuthValidator;

class AuthTest extends TestCase
{
    public function setUp()
    {
        $this->validator = new AuthValidator;
    }

    public function testUserNameIsRequired()
    {
        $this->assertFalse($this->validator->check([
            'password' => 'password'
        ]));
        $this->assertSame($this->validator->getError(), '用户名必填');
    }

    public function testUserNameChars()
    {
        $this->assertFalse($this->validator->check([
            'username' => '@#$$%'
        ]));
        $this->assertSame($this->validator->getError(), '用户名含有非法字符');
    }

    public function testUserNameMaxLen()
    {
        $this->assertFalse($this->validator->check([
            'username' => 'abcdefghijklmnopqrstuvwxyzabcde'
        ]));
        $this->assertSame($this->validator->getError(), '用户名超过合法长度');
    }

    public function testToken()
    {
        $this->assertFalse($this->validator->check([
            'username' => 'abcdefghijklmnopqrstuvwxyzabcd',
        ]));
        $this->assertSame($this->validator->getError(), '无效令牌');
    }
}
