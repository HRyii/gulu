<?php

namespace web\api\controller\goods;

use think\Request;
use core\ApiController;
use module\goods\service\Store as StoreService;

class Store extends ApiController
{
    /**
     * @only = goods_store_delete
     */
     public function delete(Request $request)
     {
         if ($request->isPost()) {
             //TODO:验证
            //  var_dump($request->isPost());die;
             StoreService::delete($request->post('id/a'));
             return $this->json(['code' => 0, 'text' => 'success'])
                         ->withSuccess(['text' => '成功删除仓库']);
         }
     }
}
