<?php

namespace core\behavior;

use think\Requset;
use web\account\service\Auth as AuthService;
use module\account\service\User as UserService;

class AccountStatus
{
    protected $loginUrl = 'user/account/login';

    public function run(&$call)
    {
        $loginedUser = AuthService::user();
        if ($loginedUser && $loginedUser->enabled === UserService::DISABLED) {
            if (Request::instance()->isAjax()) {
                //TODO:
            } else {
                $this->redirectToLoginPage();
            }
        }
    }

    private function redirectToLoginPage()
    {
        $response = new RedirectResponse($this->loginUrl);
        $response->send()->withError(['text' => '该账号已被禁用，请联系管理员']);die;
    }
}
