<?php

namespace web\company\controller;

use core\Controller;
use core\model\Module;
use core\model\Company as CompanyModel;
use core\model\CompanyUser as CompanyUser;
use core\model\CompanyGroup as CompanyGroup;
use core\model\User as UserModel;
use core\model\District as District;
use think\Db;
use think\Request;
use module\base\upload\Uploader as Uploader;

class Corporate extends Controller
{
    public function apply(Request $request)
    {
        if ($request->isPost()) {
            $user['username'] = $request->post('userName');
            $check =Db::table('gulu_user')->where('username',$user['username'])->find();
            if ($check) {
                return $this->redirect('company/Corporate/apply')->withError(['text' => '此用户名已存在，请重新添加！']);
            }
            $user['password'] = password_hash($request->post('password'), PASSWORD_BCRYPT);
            $adduser = UserModel::create($user);
            $UserId = $adduser->getData('id');
            if($request->file('business_pic')){
                $data['business_pic'] = '/uploads/'.Uploader::upload($request->file('business_pic'));
            }
            if($request->file('logo')){
                $data['logo'] = '/uploads/'.Uploader::upload($request->file('logo'));
            }
            if ($request->post('acceptTerms') == 'on') {
                $data['name'] = $request->post('company');
                $data['name'] = $request->post('company');
                $data['district_id'] = $request->post('district');
                $data['address'] = $request->post('address');
                $data['people'] = $request->post('people');
                $data['charger'] = $request->post('charger');
                $data['charger_phone'] = $request->post('charger_phone');
                $data['business_number'] = $request->post('business_number');
                $data['delivery_time'] = $request->post('delivery_time');
                $data['create_user'] = $UserId;
                $addCompany = CompanyModel::create($data);
                return $this->redirect('Company/Corporate/check')->withSuccess(['text' => '申请成功，请耐心等待申请！']);
            }else{
                return $this->redirect('Company/Corporate/apply')->withError(['text' => '没有同意协议']);
            }

        }else{
            return $this->view('apply');
        }
    }
    public function check()
    {
        $where['display'] = 1;
        $companys = CompanyModel::all($where);
        foreach ($companys as $key => $value) {
            $district = District::get($value['district_id'])->getData();
            $companys[$key]['districtname'] = $district['name'];
        }
        return $this->view('check',['company'=>$companys]);
    }
    public function checkout(Request $request)
    {
        $id = $request->get('id');
        $where['id'] = $id;
        $company = CompanyModel::get($id);
        $data['status'] = 1;
        $data['number'] = $id;
        $data['ratio'] = 1;
        $success = CompanyModel::update($data,$where);
        return $this->redirect('company/Corporate/check')->withSuccess(['text' => '审核成功！']);
    }
    /**
     * @only = company_corporate_delete
     */
    public function delete($id)
    {
        $result = CompanyModel::get($id);
        $form['display'] = '0';
        $delCompany = CompanyModel::update($form,['id' => $id]);
        return $this->redirect('company/Corporate/check')->withSuccess(['text' => '成功删除公司']);
    }
}
