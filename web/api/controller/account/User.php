<?php

namespace web\api\controller\account;

use think\Request;
use core\ApiController;
use module\account\service\User as UserService;

class User extends ApiController
{
    /**
     * @only = account_user_enable
     */
    public function enabled(Request $request)
    {
        if ($request->isPost()) {
            $id = $request->get('id');
            $enabled = $request->post('enabled/d');
            if ($enabled === UserService::DISABLED) {
                UserService::disable($id);
                return $this->json(['code' => 0, 'text' => '成功禁用账号']);
            } else {
                UserService::enable($id);
                return $this->json(['code' => 0, 'text' => '成功启用账号']);
            }
        }
    }

    /**
     * @only = account_user_delete
     */
    public function delete(Request $request)
    {
        if ($request->isPost()) {
            //TODO:验证
            UserService::delete($request->post('id/a'));
            return $this->json(['code' => 0, 'text' => 'success'])
                        ->withSuccess(['text' => '成功删除账号']);
        }
    }

    public function exists()
    {
    }
}
