<?php

namespace web\company\controller;

use core\Controller;
use core\model\Module;
use core\model\Company as CompanyModel;
use core\model\CompanyUser as CompanyUser;
use core\model\CompanyGroupUser as CompanyGroupUser;
use core\model\CompanyGroup as CompanyGroup;
use core\model\CompanyBill as CompanyBill;
use core\model\Order as OrderModel;
use core\model\CorpUser as CorpUser;
use think\Db;
use think\Request;

class User extends Controller
{
    public function group(){
        $where['create_user'] = $this->user()->id;
        $company = CompanyModel::get($where);
        $GroupWhere['company_id'] = $company['id'];
        $companyGroup = CompanyGroup::all($GroupWhere);
        foreach ($companyGroup as $key => $value) {
            $userWhere['id'] = $value['create_user_id'];
            $user = CorpUser::get($userWhere);
            $companyGroup[$key]['username'] = $user['username'];
        }
        $GroupUser = CompanyGroup::all($GroupWhere);
        $GroupUser = array_map(function($company) {
            return $company['id'];
        }, $GroupUser);
        $userWhere['group_id'] = $GroupUser;
        $userWhere['company_id'] = $company['id'];
        $companyGroupUser = CompanyGroupUser::all($GroupWhere);
        foreach ($companyGroupUser as $key => $value) {
            $userwhile['id'] = $value['user_id'];
            $username = CorpUser::get($userwhile);
            $companyGroupUser[$key]['username'] = $username['username'];
        }
        return $this->view('group',['companyGroup'=>$companyGroup,'comuser'=>$companyGroupUser]);
    }
    public function checked()
    {
        $where['create_user'] = $this->user()->id;
        $company = CompanyModel::get($where);
        $user['company_id'] = $company['id'];
        $companyUsers = CompanyUser::all($user);
        foreach ($companyUsers as $key => $value) {
            $user= Db::table('corp_user')->where('id',$value['user_id'])->find();
            $companyUsers[$key]['name'] = $user['username'];
        }
        return $this->view('checked',['quota'=>$companyUsers]);
    }
    /**
     * @only = company_user_delete
     */
    public function delete($id)
    {
        $result = CompanyUser::get($id);
        $affected = $result -> delete();
        return $this->redirect('company/user/checked')->withSuccess(['text' => '成功删除人员']);
    }
    public function check($id)
    {
        $result = CompanyUser::get($id);
        $form['status'] = '1';
        $form['pass_time'] = time();
        $delGoods = CompanyUser::update($form,['id' => $id]);
        return $this->redirect('company/user/checked')->withSuccess(['text' => '审核成功！']);
    }
    public function groupusercheck($id)
    {
        $where['id'] = $id ;
        $result = CompanyUser::get($where);
        // var_dump($result);die;
        $form['status'] = '1';
        $delGoods = CompanyGroupUser::update($form,['id' => $id]);
        $delGoods = CompanyUser::update($form,['pass_time' => time()]);
        return $this->redirect('company/user/group')->withSuccess(['text' => '审核成功！']);
    }
    /**
     * @only = company_user_delgroupuser
     */
    public function delgroupuser($id)
    {
        $result = CompanyGroupUser::get($id);
        $affected = $result -> delete();
        return $this->redirect('company/user/group')->withSuccess(['text' => '成功删除分组人员']);
    }
}
