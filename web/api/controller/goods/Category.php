<?php

namespace web\api\controller\goods;

use think\Request;
use core\ApiController;
use module\goods\service\GoodsClass as CategoryService;

class Category extends ApiController
{
    /**
     * @only = goods_classify_delete
     */
     public function delete(Request $request)
     {
         if ($request->isPost()) {
             //TODO:验证
            //  var_dump($request->isPost());die;
             CategoryService::delete($request->post('id/a'));
             return $this->json(['code' => 0, 'text' => 'success'])
                         ->withSuccess(['text' => '成功删除仓库']);
         }
     }
    /**
     * @only = goods_classify_create
     */
     public function get_category(Request $request)
     {
        //  获取分类
         $request = Request::instance();
         if (Request::instance()->isAjax()){
             if($request->post('type')=='get_id'){
                 $id=$request->post('id');
                 $content=Db::table('yele_goods_class')->where(array('pid'=>$id))->select();
                 return $this->json(['status'=>1,'text'=>'操作成功!','content'=>$content]);
             }
         }
     }
}
