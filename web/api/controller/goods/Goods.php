<?php

namespace web\api\controller\goods;

use think\Request;
use core\ApiController;
use module\goods\service\Goods as GoodsService;
use core\model\Goods as GoodsModel;
use core\model\GoodsPhoto as GoodsPhoto;



class Goods extends ApiController
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
       * @only = goods_goods_status
       */
      public function status(Request $request)
      {
          if ($request->isPost()) {
              $id = $request->get('id');
              $where['id'] = $id ;
              $changeGoods = GoodsModel::get($id)->getData();
              if ($changeGoods['status'] == 1) {
                 $data['status'] = 2;
                 $success = GoodsModel::update($data,$where);
                 return $this->json(['code' => 0, 'text' => '成功改变商品状态为下架']);
             }else if ($changeGoods['status'] == 2) {
                 $data['status'] = 1;
                 $success = GoodsModel::update($data,$where);
                 return $this->json(['code' => 0, 'text' => '成功改变商品状态为上架']);
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
