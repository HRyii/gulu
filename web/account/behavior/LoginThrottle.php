<?php

namespace web\account\behavior;

use think\Config;
use think\Request;
use think\Session;
use core\model\User;
use core\RedirectResponse;

class LoginThrottle
{
    public function run($username)
    {
        $request = Request::instance();
        $failRecord = 'login_attemp:' . $username;
        if (Session::has($failRecord)) {
            $attemp = unserialize(Session::get($failRecord));
            $attemp['count'] += 1;
            if ((time() - $attemp['timestamp']) < Config::get('max_attemp_interval')) {
                if ($attemp['count'] >= Config::get('max_attemp')) {
                    $user = User::get(['username' => $username]);
                    $user->enabled = 0;
                    $user->save();
                    Session::set($failRecord, null);
                    $response = (new RedirectResponse('account/auth/login'))->withError(
                        ['text' => '已超过最大登录失败次数']
                    );
                    $response->send();die;
                } else {
                    Session::set($failRecord, null);
                }
            }
            Session::set($failRecord, serialize($attemp));
        } else {
            Session::set($failRecord, serialize(
                ['count' => 1, 'timestamp' => $request->server('REQUEST_TIME')])
            );
        }
    }
}
