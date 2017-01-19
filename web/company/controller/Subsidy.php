<?php

namespace web\company\controller;

use core\Controller;
use core\model\Module;
use core\model\Company as CompanyModel;
use core\model\CompanyUser as CompanyUser;
use core\model\CompanyGroup as CompanyGroup;
use core\model\CompanyBill as CompanyBill;
use core\model\Order as OrderModel;
use core\model\CorpUser as CorpUser;
use think\Db;
use think\Request;

class Subsidy extends Controller
{
    public function companyset(Request $request)
    {
        $where['create_user'] = $this->user()->id;
        $company = CompanyModel::get($where);
        if ($request->isPost()) {
            $data= $request->post();
            $where['id'] = $company['id'];
            $success = CompanyModel::update($data,$where);
            return $this->redirect('company/Subsidy/companyset')->withSuccess(['text' => '成功修改公司默认配额设置！']);
        }else{
            return $this->view('company',['company'=>$company]);
        }
    }
    public function usercreate(Request $request)
    {
        $where['create_user'] = $this->user()->id;
        $company = CompanyModel::get($where);
        $companyUser = Db::table('gulu_company_user')->where('company_id', $company['id'])->select();
        foreach ($companyUser as $key => $value) {
            $corpWhere['id'] = $value['user_id'];
            $corpUser = CorpUser::get($corpWhere);
            $companyUser[$key]['username']=$corpUser['username'];
        }
        if ($request->isPost()) {
            $data= $request->post();
            $where['id'] = $company['id'];
            $success = CompanyModel::update($data,$where);
            return $this->redirect('company/Subsidy/companyset')->withSuccess(['text' => '成功修改公司默认配额设置！']);
        }else{
            return $this->view('user',['company'=>$company,'companyUser'=>$companyUser]);
        }
    }
    public function index()
    {
        $where['create_user'] = $this->user()->id;
        $company = CompanyModel::get($where);
        $user['company_id'] = $company['id'];
        $companyUsers = CompanyUser::all($user);
        foreach ($companyUsers as $key => $value) {
            $user= Db::table('corp_user')->where('id',$value['user_id'])->find();
            $companyUsers[$key]['name'] = $user['username'];
        }
        return $this->view('index',['quota'=>$companyUsers]);
    }
    public function update(Request $request)
    {
        $id = $request->get('id');
        $result = CompanyUser::get($id)->getData();
        $corpWhere['id'] = $result['user_id'];
        $corpUser = CorpUser::get($corpWhere);
        if ($request->isPost()) {
            $data = $request->post();
            $where['id'] = $id ;
            $success = CompanyUser::update($data,$where);
            $text = '成功修改'.$corpUser['username'].'人员配额！';
            return $this->redirect('company/subsidy/index')->withSuccess(['text' => $text]);
        }else{
            return $this->view('update',['company'=>$result,'user'=>$corpUser]);
        }
    }
}
