<?php

namespace web\account\controller;

use think\Request;
use core\Controller;
use web\account\service\Auth as AuthService;

class Auth extends Controller
{
    protected $loginUrl = 'account/auth/login';
    protected $afterLoginUrl = '/';

    /**
     * @login = false
     * @noauth
     */
    public function login(Request $request)
    {
        if ($request->isGet()) {
            if (AuthService::isLogined()) {
                return $this->redirect($this->afterLoginUrl)->withWarning(['text' => '您已经登录']);
            } else {
                return $this->view('login');
            }
        } else {
            $validator = validate('Auth');
            if (! $validator->check($request->post())) {
                return $this->redirect($this->loginUrl)->withError(['text' => $validator->getError()]);
            }

            $username = $request->post('username');
            $password = $request->post('password');

            //TODO:
            //$remember = $request->post('remember');

            $success = AuthService::auth($username, $password);

            if ($success === AuthService::ERR_SUCCESS) {
                return $this->needRestored() ? $this->redirect()->restore() : $this->redirect($this->afterLoginUrl);
            } else if ($success === AuthService::ERR_DISABLED) {
                return $this->redirect($this->loginUrl)->withError(['text' => '账号已被锁定，请联系管理员']);
            } else {
                return $this->redirect($this->loginUrl)->withError(['text' => '账号或密码错误']);
            }
        }
    }

    /**
     * @noauth
     */
    public function logout()
    {
        AuthService::logout();
        return $this->redirect($this->loginUrl);
    }
}
