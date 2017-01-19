<?php

namespace web\api\controller\company;

use think\Request;
use core\ApiController;
use core\model\Company as CompanyModel;
use core\model\CompanyUser as CompanyUser;
use core\model\CompanyGroup as CompanyGroup;
use core\model\CompanyBill as CompanyBill;
use core\model\Order as OrderModel;
use core\model\CorpUser as CorpUser;

class Subsidy extends ApiController
{
    /**
     * @only = goods_goods_delete
     */
     public function delete(Request $request)
     {
         if ($request->isPost()) {
             $id = $request->post();
            // var_dump($id['id']);die;
             $form['display'] = '2';
             $where['id'] = array('in',$id['id']);
             if (GoodsModel::update($form,$where)) {
                 return $this->json(['code' => 0, 'text' => 'success'])
                             ->withSuccess(['text' => '成功删除商品']);
             }
         }
     }
     /**
      * @only = goods_goods_restore
      */
      public function restore(Request $request)
      {
          if ($request->isPost()) {
              $id = $request->post();
              $form['display'] = '1';
              if (GoodsModel::update($form,['id' =>array('in',$id['id'])])) {
                  return $this->json(['code' => 0, 'text' => 'success'])
                              ->withSuccess(['text' => '成功恢复商品']);
              }
          }
      }
      /**
       * @only = company_subsidy_status
       */
      public function status(Request $request)
      {
          if ($request->isPost()) {
              $id = $request->get('id');
              $where['id'] = $id ;
              $changeUser = CompanyUser::get($id)->getData();
              if ($changeUser['enable'] == 1) {
                 $data['enable'] = 0;
                 $success = CompanyUser::update($data,$where);
                 return $this->json(['code' => 0, 'text' => '成功关闭员工补贴状态']);
             }else if ($changeUser['enable'] == 0) {
                 $data['enable'] = 1;
                 $success = CompanyUser::update($data,$where);
                 return $this->json(['code' => 0, 'text' => '成功开启员工补贴状态']);
             }
          }
      }
      /**
       * @only = goods_goods_del
       */
       public function del(Request $request)
       {
           if ($request->isPost()) {
               //TODO:验证
            //    var_dump($request->post());die;
               GoodsService::delete($request->post('id/a'));
               return $this->json(['code' => 0, 'text' => 'success'])
                           ->withSuccess(['text' => '成功彻底删除商品']);
           }
       }
       /**
        * @only = goods_goods_delphoto
        */
        public function delphoto(Request $request)
        {
            if ($request->isPost()) {
                //TODO:验证
                $where['id'] = $request->post();
                $result = GoodsPhoto::get($where['id']);
                $affected = $result -> delete();
                return $this->json(['code' => 0, 'text' => 'success'])
                            ->withSuccess(['text' => '成功彻底删除商品图片']);
            }
        }
}
