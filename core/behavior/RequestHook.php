<?php

namespace core\behavior;

use think\Request;
use web\account\service\Auth;

/**
 * tp5中不能注入think\Request的子类，
 * 所以只能通过hook的方式来扩展think\Request
 */
class RequestHook
{
    /**
     * 扩展请求类
     */
    public function run()
    {
        Request::hook('user', function() {
            return Auth::user();
        });
    }
}
