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

class Bill extends Controller
{
    public function index()
    {
        $user['create_user'] = $this->user()->id;
        $company = CompanyModel::get($user);
        $where['company_id'] = $company['id'];
        $where['type'] = 1;
        $bills = CompanyBill::all($where);
        foreach ($bills as $key => $value) {
            $w['id'] = $value['create_id'];
            $user= CorpUser::get($w);
            $bills[$key]['create_name'] = $user['username'];
            $pay= Db::table('payment')->where('id',$value['payment'])->find();
            $bills[$key]['pay'] = $pay['name'];
        }
        $two['company_id'] = $company['id'];
        $two['type'] = 2;
        $subsidy = CompanyBill::all($two);
        foreach ($subsidy as $k => $v) {
            $w['id'] = $value['create_id'];
            $user= CorpUser::get($w);
            $subsidy[$k]['create_name'] = $user['username'];
            $pay= Db::table('payment')->where('id',$v['payment'])->find();
            $subsidy[$k]['pay'] = $pay['name'];
        }
        return $this->view('index',['bill'=>$bills,'subsidy'=>$subsidy]);
    }
}
