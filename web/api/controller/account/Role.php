<?php

namespace web\api\controller\account;

use think\Request;
use core\ApiController;
use module\account\service\Role as RoleService;

class Role extends ApiController
{
    /**
     * @only = account_role_delete
     */
    public function delete(Request $request)
    {
        if ($request->isPost()) {
            if (RoleService::delete($request->post('id/a'), true)) {
                return $this->json(['code' => 0, 'text' => 'success'])
                            ->withSuccess(['text' => '成功删除角色']);
            }
        }
    }
}
