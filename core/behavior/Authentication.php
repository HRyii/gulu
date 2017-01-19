<?php

namespace core\behavior;

use ReflectionMethod;
use think\Request;
use web\account\service\Auth as AuthService;
use core\RedirectResponse;

class Authentication
{
    protected $loginUrl = 'account/auth/login';
    protected $logoutUrl = 'account/auth/logout';

    public function run(&$call)
    {
        $action = new ReflectionMethod($call[0], $call[1]);
        $docComment = $action->getDocComment();

        do {
            if ($docComment === false && ! AuthService::isLogined()) break;

            $match = preg_match('#@login\h?=\h?(true|false)#', $docComment, $matches);

            if (! $match && ! AuthService::isLogined()) break;

            if ($match && $matches[1] === 'true' && ! AuthService::isLogined()) break;
            else return;

        } while(0);

        if (Request::instance()->isAjax()) {
            //TODO
        } else {
            $this->redirectToLoginPage();
        }
    }

    private function redirectToLoginPage()
    {
        $response = new RedirectResponse($this->loginUrl);
        if (Request::instance()->url() === $this->logoutUrl) {
            $response->send();die;
        } else {
            $response->remember()->send();die;
        }
    }
}
