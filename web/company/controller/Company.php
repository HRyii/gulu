<?php

namespace web\company\controller;

use core\Controller;
use core\model\Module;
use core\model\Company as com;
use core\model\CompanyUser as CompanyUser;
use core\model\CompanyGroup as CompanyGroup;
use think\Db;
use think\Request;

class Company extends Controller
{
    public function index()
    {
        $company = com::get()->where(['id' =>'1'])->find();
        $companyuser =CompanyUser::get()->where(['company_id' =>'1'])->select();
        $order = Db::table('order')->where('company_id', 1)->select();
        foreach ($order as $key => $value) {
            $user = Db::table('corp_user')->where('id',$value['user_id'])->find();
            $order[$key]['username'] = $user['username'];
            $order[$key]['uid'] = $user['id'];
            $order_bill = Db::table('user_bill')->where(['user_id'=>$value['user_id'],'type'=>'2'])->find();
            $orderconent = Db::table('order')->where(['id'=>$order_bill['type_id']])->find();
            $order[$key]['goods_amount']=$orderconent['goods_amount'];
            $order[$key]['subsidy_amount']=$orderconent['subsidy_amount'];
            $order[$key]['pay_amount']=$orderconent['pay_amount'];
            $order[$key]['is_set_meal']=$orderconent['is_set_meal'];
            $order[$key]['type']=$orderconent['type'];
            $order[$key]['update_time']=$orderconent['update_time'];
            if($orderconent['type'] = 2 || $orderconent['type'] = 4){
                $isgroup = Db::table('company_group_user')->where(['user_id'=>$value['user_id']])->find();
                $group = Db::table('company_group')->where(['id'=>$isgroup['group_id']])->find();
                $group_user= Db::table('corp_user')->where('id',$group['create_user_id'])->find();
                $order[$key]['usergroup']=$group_user['username'];
            }
        }
        return $this->view('index',['company'=>$company,'companyuser'=>$companyuser,'order'=>$order]);
    }
    public function group(){
        $company_id = '1';
        $company_group = Db::table('company_group')->where('company_id', 1)->select();
        foreach ($company_group as $key => $value) {
            $user= Db::table('corp_user')->where('id',$value['create_user_id'])->find();
            $company_group[$key]['username'] = $user['username'];
        }
        $company_ids = Db::table('company_group')->where('company_id', 1)->select();
        $company_ids = array_map(function($company) {
            return $company['company_id'];
        }, $company_ids);
        $comuser = Db::table('company_group_user')->alias('cgu')
                                       ->join('corp_user u', "cgu.user_id = u.id", "LEFT")
                                       ->where('cgu.company_id', 'in', $company_ids)
                                       ->select();
        return $this->view('group',['comuser'=>$comuser,'company_group'=>$company_group]);
    }
    public function userlists(){
        $company_id = '1';
        $order = Db::table('order')->where('company_id', 1)->select();
        foreach ($order as $key => $value) {
            $user = Db::table('corp_user')->where('id',$value['user_id'])->find();
            $order[$key]['username'] = $user['username'];
            $order[$key]['uid'] = $user['id'];
            $order_bill = Db::table('user_bill')->where(['user_id'=>$value['user_id'],'type'=>'2'])->find();
            $orderconent = Db::table('order')->where(['id'=>$order_bill['type_id']])->find();
            $order[$key]['goods_amount']=$orderconent['goods_amount'];
            $order[$key]['subsidy_amount']=$orderconent['subsidy_amount'];
            $order[$key]['pay_amount']=$orderconent['pay_amount'];
            $order[$key]['is_set_meal']=$orderconent['is_set_meal'];
            $order[$key]['update_time']=$orderconent['update_time'];
            $order[$key]['create_time']=$orderconent['create_time'];
            $order[$key]['type']=$orderconent['type'];
            if($orderconent['type'] = 2 || $orderconent['type'] = 4){
                $isgroup = Db::table('company_group_user')->where(['user_id'=>$value['user_id']])->find();
                $group = Db::table('company_group')->where(['id'=>$isgroup['group_id']])->find();
                $group_user= Db::table('corp_user')->where('id',$group['create_user_id'])->find();
                $order[$key]['usergroup']=$group_user['username'];
            }
            // var_dump($order);die;
        }
        return $this->view('userlists',['order'=>$order]);
    }
    public function quotalist(){
        $company_id = '1';
        $company_users = Db::table('company_user')->where('company_id', 1)->select();
        foreach ($company_users as $key => $value) {
            $user= Db::table('corp_user')->where('id',$value['user_id'])->find();
            $company_users[$key]['name'] = $user['username'];
        }
        return $this->view('quota_list',['quota'=>$company_users]);
    }
    protected $userid;
    public function quota_edit($userid = null){
        $this->userid = $userid;
        $user = Db::table('corp_user')->where('id', $userid)->find();
        $quota = Db::table('company_user')->where('user_id', $userid)->find();
        $request = Request::instance();
        $form = $request->post();
        if($res =  Db::table('company_user')->where('user_id', $userid)
                                        ->update($form)){
            return $this->redirect('company/company/quotalist')->withSuccess(['text' => '修改成功！']);die;
                                        }
        return $this->view('quota_edit',['user'=>$user,'quota'=>$quota]);
    }
    public function quota_del($userid = null){
        $this->userid = $userid;
        if($userid){
            $res =  Db::table('company_user')->where('user_id', $userid)->delete();
        }else{
            return $this->redirect('company/company/quotalist');die;
        }
    }
    public function company_bill()
    {
        $company_id = '1';
        $bills = Db::table('company_bill')->where(['company_id'=>$company_id,'type'=>'1'])->select();
        foreach ($bills as $key => $value) {
            $user= Db::table('corp_user')->where('id',$value['create_id'])->find();
            $bills[$key]['create_name'] = $user['username'];
            $pay= Db::table('payment')->where('id',$value['payment'])->find();
            $bills[$key]['pay'] = $pay['name'];
        }
        $subsidy = Db::table('company_bill')->where(['company_id'=>$company_id,'type'=>'2'])->select();
        foreach ($subsidy as $k => $v) {
            $user= Db::table('corp_user')->where('id',$v['create_id'])->find();
            $subsidy[$k]['create_name'] = $user['username'];
            $pay= Db::table('payment')->where('id',$v['pay_type'])->find();
            $subsidy[$k]['pay'] = $pay['name'];
        }
        return $this->view('company_bill',['bill'=>$bills,'subsidy'=>$subsidy]);
    }
    public function progress()
    {
        $company = com::get()->where(['id' =>'1'])->find();
        $user = Db::table('corp_user')->where('id',$company['create_user'])->find();
        $company['username'] = $user['username'];
        return $this->view('progress',['company'=>$company]);
    }
    protected $companyid;
    public function company_edit($companyid = null){
        $this->companyid = $companyid;
        $company = Db::table('company')->where('id', $companyid)->find();
        $request = Request::instance();
        $form = $request->post();
        // var_dump($form);die;
        if($res =  Db::table('company')->where('id', $companyid)
                                        ->update($form)){
            return $this->redirect('company/company/quotalist')->withSuccess(['text' => '修改成功！']);die;
                                        }
        return $this->view('company_edit',['user'=>$user,'quota'=>$quota]);
    }
    public function quota()
    {
        return $this->view('quota');
    }
    public function apply()
    {
        return $this->view('apply');
    }
}
