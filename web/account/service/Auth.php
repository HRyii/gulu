<?php

namespace web\account\service;

use think\Hook;
use core\model\User;

class Auth
{
    const ERR_SUCCESS = 0;
    const ERR_DISABLED = 1;
    const ERR_NOT_EXISTS = 2;
    const ERR_AUTH_FAILED = 3;

    private static $user = null;

    public static function auth($username, $password, $remember = false)
    {
        Hook::listen('login_attempting', $username);

        if (self::isLogined($username)) {
            return true;
        }

        $user = User::get(['username' => $username]);

        if (! $user) {
            return self::ERR_NOT_EXISTS;
        } else if ($user->enabled == 0) {
            return self::ERR_DISABLED;
        }

        $passed = password_verify($password, $user->password);

        //TODO:remember me

        if (password_needs_rehash($user->password, PASSWORD_BCRYPT)) {
            $user->password = password_hash($user->password, PASSWORD_BCRYPT);
            $user->save();
        }

        if (! $passed) {
            Hook::listen('login_failed', $username);
            return self::ERR_AUTH_FAILED;
        } else {
            session('user', serialize($user));
            Hook::listen('login_success', $username);
            return self::ERR_SUCCESS;
        }
    }

    public static function isLogined()
    {
        return session('?user');
    }

    public static function login($username, $password, $remember = false)
    {
        return self::auth($username, $password);
    }

    public static function logout()
    {
        if (self::isLogined()) {
            session('user', null);
            Hook::listen('logout');
            self::$user = null;
        }
    }

    public static function user()
    {
        if (! self::$user && self::isLogined()) {
            self::$user = unserialize(session('user'));
        }

        return self::$user;
    }
}
