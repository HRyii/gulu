<?php

namespace web\api\controller\goods;

use think\Request;
use core\ApiController;
use module\goods\service\Brand as BrandService;

class Brand extends ApiController
{
    /**
     * @only = goods_brand_delete
     */
     public function delete(Request $request)
     {
         if ($request->isPost()) {
             //TODO:验证
            //  var_dump($request->isPost());die;
             BrandService::delete($request->post('id/a'));
             return $this->json(['code' => 0, 'text' => 'success'])
                         ->withSuccess(['text' => '成功删除品牌']);
         }
     }
}
