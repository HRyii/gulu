<?php

namespace web\company\controller;

use core\Controller;
use core\model\Module;
use core\model\Company as CompanyModel;
use core\model\CompanyUser as CompanyUser;
use core\model\CompanyGroup as CompanyGroup;
use core\model\CompanyGroupUser as CompanyGroupUser;
use core\model\CompanyBill as CompanyBill;
use core\model\UserBill as UserBill;
use core\model\Order as OrderModel;
use core\model\CorpUser as CorpUser;
use core\model\District as District;
use think\Db;
use think\Request;

class index extends Controller
{
    public function index()
    {
        $where['create_user'] = $this->user()->id;
        $company = CompanyModel::get($where);
        $district = District::get($company['district_id'])->getData();
        $company['districtname'] =$district['name'];
        $data['company_id'] = $company['id'];
        $companyuser =CompanyUser::all($data);
        $mon =CompanyUser::get($data)->sum('mon_subsidy');
        $tue =CompanyUser::get($data)->sum('tue_subsidy');
        $wed =CompanyUser::get($data)->sum('wed_subsidy');
        $thu =CompanyUser::get($data)->sum('thu_subsidy');
        $fri =CompanyUser::get($data)->sum('fri_subsidy');
        $sat =CompanyUser::get($data)->sum('sat_subsidy');
        $sun =CompanyUser::get($data)->sum('sun_subsidy');
        $companyuser['total'] = +($mon + $tue + $wed + $thu + $fri + $sat +  $sun);
        $companyUserCounts =CompanyUser::count();
        $order = OrderModel::where('company_id',$company['id'])->paginate(5);
        //本日
        $today['begin'] = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $today['end'] = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
        $today['map']= array('between',array($today['begin'],$today['end']));
        $chart['today'] = OrderModel::where(['company_id'=>$company['id'],'status'=>7,'create_time'=>$today['map']])->count();
        //昨日
        $yesterday['begin'] = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
        $yesterday['end'] = mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        $yesterday['map']= array('between',array($yesterday['begin'],$yesterday['end']));
        $chart['yesterday']=OrderModel::where(['company_id'=>$company['id'],'status'=>7,'create_time'=>$yesterday['map']])->count();
        //本周
        $week['begin'] = mktime(0,0,0,date('m'),date('d')-date('w')+1,date('Y'));
        $week['end'] = mktime(23,59,59,date('m'),date('d')-date('w')+7,date('Y'));
        $week['map']= array('between',array($week['begin'],$week['end']));
        $chart['week']=OrderModel::where(['company_id'=>$company['id'],'status'=>7,'create_time'=>$week['map']])->count();
        //上周
        $lastWeek['begin'] = mktime(0,0,0,date('m'),date('d')-date('w')+1-7,date('Y'));
        $lastWeek['end'] = mktime(23,59,59,date('m'),date('d')-date('w')+7-7,date('Y'));
        $lastWeek['map']= array('between',array($lastWeek['begin'],$lastWeek['end']));
        $chart['lastweek']=OrderModel::where(['company_id'=>$company['id'],'status'=>7,'create_time'=>$lastWeek['map']])->count();
        //本月
       $month['begin'] = mktime(0,0,0,date('m'),1,date('Y'));
       $month['end'] = mktime(23,59,59,date('m'),date('t'),date('Y'));
       $month['map']= array('between',array($month['begin'],$month['end']));
       $chart['month']=OrderModel::where(['company_id'=>$company['id'],'status'=>7,'create_time'=>$month['map']])->count();
        if ($order) {
            foreach ($order as $key => $value) {
                $userWhere['id'] = $value['user_id'];
                $user = CorpUser::get($userWhere);
                $order[$key]['username'] = $user['username'];
                $order[$key]['uid'] = $user['id'];
                $BillWhere['type'] = 2 ;
                $BillWhere['user_id'] = $value['user_id'];
                $orderBill = UserBill::get($BillWhere);
                $w['id']=$orderBill['type_id'];
                $orderconent =OrderModel::get($data);
                $order[$key]['conent']=$orderconent;
                if($orderconent['type'] = 2 || $orderconent['type'] = 4){
                    $isWhere['user_id'] = $value['user_id'];
                    $isgroup = CompanyGroupUser::get($isWhere);
                    $groupWhere['id'] = $isgroup['group_id'];
                    $group = CompanyGroup::get($groupWhere);
                    $groupUserWhere['id'] = $group['create_user_id'];
                    $groupUser= CorpUser::get($groupUserWhere);
                    $order[$key]['usergroup']=$group['name'];
                }
            }
            return $this->view('index',['company'=>$company,'companyuser'=>$companyuser,'order'=>$order,'userCounts'=>$companyUserCounts,'chart'=>$chart]);
        }else{
            return $this->view('index',['company'=>$company,'companyuser'=>$companyuser,'order'=>$order,'userCounts'=>$companyUserCounts,'chart'=>$chart]);
        }
    }
}
