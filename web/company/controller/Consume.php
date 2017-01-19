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
use think\Db;
use think\Request;

class Consume extends Controller
{
    public function index()
    {
        $where['create_user'] = $this->user()->id;
        $company = CompanyModel::get($where);
        $data['company_id'] = $company['id'];
        $companyuser =CompanyUser::get($data);
        $order = OrderModel::where('company_id',$company['id'])->paginate(20);
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
            return $this->view('index',['company'=>$company,'companyuser'=>$companyuser,'order'=>$order]);
        }else{
            return $this->view('index',['company'=>$company,'companyuser'=>$companyuser,'order'=>$order]);
        }
    }
}
