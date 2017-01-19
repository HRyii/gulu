<?php

namespace web\api\controller\goods;

use think\Request;
use core\ApiController;
use module\goods\service\Unit as UnitService;

class Unit extends ApiController
{
    /**
     * @only = goods_store_delete
     */
     public function delete(Request $request)
     {
         if ($request->isPost()) {
             //TODO:验证
            //  var_dump($request->isPost());die;
             UnitService::delete($request->post('id/a'));
             return $this->json(['code' => 0, 'text' => 'success'])
                         ->withSuccess(['text' => '成功删除商品单位']);
         }
     }
}
