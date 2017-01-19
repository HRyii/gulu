<?php

namespace web\api\controller\company;

use think\Request;
use core\ApiController;
use core\model\Company as CompanyModel;
use core\model\CompanyUser as CompanyUser;
use core\model\CompanyGroup as CompanyGroup;
use core\model\CompanyGroupUser as CompanyGroupUser;
use core\model\CompanyBill as CompanyBill;
use core\model\Order as OrderModel;
use core\model\CorpUser as CorpUser;
use module\company\service\User as UserService;


class User extends ApiController
{
    /**
     * @only = company_user_checked
     */
    public function checked(Request $request)
     {
         if ($request->isPost()) {
             $id = $request->post();
             $form['status'] = '1';
             $form['pass_time'] = time();
             $where['id'] = array('in',$id['id']);
             if (CompanyUser::update($form,$where)) {
                 return $this->json(['code' => 0, 'text' => 'success'])
                             ->withSuccess(['text' => '成功审核人员为通过状态！']);
             }
         }
     }
     /**
      * @only = company_user_delete
      */
      public function delete(Request $request)
      {
          if ($request->isPost()) {
              //TODO:验证
              var_dump($request->post());die;
              UserService::delete($request->post('id/a'));
              return $this->json(['code' => 0, 'text' => 'success'])
                          ->withSuccess(['text' => '成功删除人员']);
          }
      }
      /**
       * @only = company_user_check
       */
      public function check(Request $request)
      {
          var_dump($request->post());die;
          if ($request->isPost()) {
              $id = $request->post();
              var_dump($request->get());die;
              $form['status'] = '1';
              $where['id'] = array('in',$id['id']);
              if (CompanyUser::update($form,$where)) {
                  return $this->json(['code' => 0, 'text' => 'success'])
                              ->withSuccess(['text' => '成功审核人员为通过状态！']);
              }
          }
      }
      /**
       * @only = company_user_changegroup
       */
      public function changegroup(Request $request)
      {
          if ($request->isPost()) {
              $id = $request->get('id');
              $data['group_id'] = $request->get('changeid');
              $where['id'] = $id;
              $changeGroup = CompanyGroupUser::get($where)->getData();
              $success = CompanyGroupUser::update($data,$where);
             return $this->json(['code' => 0, 'text' => '成功将员工迁移分组!']);
          }
      }
}
