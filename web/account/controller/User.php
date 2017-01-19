<?php

namespace web\account\controller;

use think\Request;
use core\Controller;
use module\base\breadcrumb\Breadcrumb;
use module\account\service\User as UserService;
use module\account\service\Role as RoleService;

class User extends Controller
{
    /**
     * @only = account_user_create,account_user_update,account_user_enable,account_user_delete,account_user_reset，account_user_role_assign
     */
    public function index()
    {
        //TODO:每页条目数量可配置
        $accounts = UserService::all(15);
        return $this->view('users', compact('accounts'));
    }

    /**
     * @only = account_user_update
     */
    public function show(Request $request)
    {
        $id = $request->get('id');
        if ($id) {
            $this->breadcrumbs = new Breadcrumb([
                ['text' => '账号列表', 'url' => '/account/user/index'],
                ['text' => '账号详情', 'url' => ''],
            ]);
            $account = UserService::account($id);
            $roles = RoleService::allExcept('admin');
            if (! $account) {
                abort(404, sprintf("Account [%s] was not found!", $id));
            }
            return $this->view('user', compact('account', 'roles'));
        }
        abort(404, "Account was not found!");
    }

    /**
     * @only = account_user_update
     */
    public function update(Request $request)
    {
        $id = $request->get('id');
        //TODO:验证
        UserService::update($id, $request->post());
        return $this->redirect('account/user/index')->withSuccess(['text' => '成功更新账号']);
    }

    /**
     * @only = account_user_reset
     */
    public function reset(Request $request)
    {
        $id = $request->get('id');
        if ($request->isGet()) {
            $account = UserService::account($id);
            return $this->view('reset', compact('account'));
        } else if ($request->isPost()) {
            //TODO:验证确认密码
            if (UserService::reset($id, $request->post())) {
                return $this->redirect('user/index')->withSuccess(['text' => '成功重置密码']);
            }
        }
    }

    /**
     * @only = account_user_create
     */
    public function create(Request $request)
    {
        if ($request->isGet()) {
            $this->breadcrumbs = new Breadcrumb([
                ['text' => '账号列表', 'url' => '/account/user/index'],
                ['text' => '新建账号', 'url' => ''],
            ]);
            $roles = RoleService::allExcept('admin');
            return $this->view('create', compact('roles'));
        } else if ($request->isPost()) {

            $validator = $this->loadValidate('UserCreate');
            if (! $validator->batch()->check($request->post())) {
                return $this->redirect('user/create')->withError($validator->getError());
            }

            $success = UserService::create($request->post());

            return $this->redirect('account/user/create')->withSuccess(['text' => '成功创建账号']);
        }
    }

    public function enable($id)
    {
        UserService::enable($id);
        return $this->redirect('account/user')->withSuccess(['text' => '成功启用账号']);
    }

    public function disable($id)
    {
        UserService::disable($id);
        return $this->redirect('account/user')->withSuccess(['text' => '成功禁用账号']);
    }

    /**
     * @only = account_user_delete
     */
    public function delete($id)
    {
        //软删除
        UserService::delete($id);
        return $this->redirect('user/index')->withSuccess(['text' => '成功删除账号']);
    }
}
