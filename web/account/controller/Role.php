<?php

namespace web\account\controller;

use think\Request;
use core\Controller;
use module\base\breadcrumb\Breadcrumb;
use module\account\service\Role as RoleService;
use core\model\Module as ModuleModel;

class Role extends Controller
{
    /**
     * @only = account_role_create,account_role_update,account_role_delete,account_role_perm_assign
     */
    public function index()
    {
        //TODO:每一页显示数量可配置
        $roles = RoleService::all(15);
        return $this->view('roles', compact('roles'));
    }

    /**
     * @only = account_role_update
     */
    public function show(Request $request)
    {
        $id = $request->get('id');
        $modules = $this->getPermissionGroupByModule();

        if ($id) {
            $this->breadcrumbs = new Breadcrumb([
                ['text' => '角色列表', 'url' => '/account/role/index'],
                ['text' => '角色详情', 'url' => ''],
            ]);
            $role = RoleService::role($id);
            if (! $role) {
                abort(404, sprintf("Role [%s] was not found!", $id));
            }
            return $this->view('role', compact('role', 'modules'));
        }
        abort(404, "Role was not found!");
    }

    /**
     * @only = account_role_create
     */
    public function create(Request $request)
    {
        if ($request->isGet()) {
            $this->breadcrumbs = new Breadcrumb([
                ['text' => '角色列表', 'url' => '/account/role/index'],
                ['text' => '新建角色', 'url' => ''],
            ]);
            $modules = $this->getPermissionGroupByModule();
            return $this->view('role', compact('modules'));
        } else if ($request->isPost()) {

            $validator = $this->loadValidate('RoleCreate');
            if (! $validator->batch()->check($request->post())) {
                return $this->redirect('role/create')->withError($validator->getError());
            }

            $success = RoleService::create($request->post());
            return $this->redirect('role/create')->withSuccess(['text' => '成功创建角色']);
        }
    }

    /**
     * @only = account_role_update
     */
    public function update(Request $request)
    {
        $id = $request->get('id');

        //TODO:验证
        RoleService::update($id, $request->post());

        return $this->redirect('role/index')->withSuccess(['text' => '成功更新角色']);
    }

    /**
     * @only = account_role_delete
     */
    public function delete($id)
    {
        $success = RoleService::delete($id, true);
        if (! $success) {
            return $this->redirect('role/index')->withWarning(['text' => '删除角色失败']);
        }
        return $this->redirect('role/index')->withSuccess(['text' => '成功删除角色']);
    }

    private function getPermissionGroupByModule()
    {
        //TPSUCK:ModuleModel::with('permissions')->all()，这里不知道为啥不能使用all方法
        return ModuleModel::with('permissions')->select();
    }
}
