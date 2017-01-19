<?php

namespace web\goods\controller;

use core\Controller;
use core\model\Module;
use think\Db;
use think\Request;
use core\model\GoodsStore as GoodsStore;

class Store extends Controller
{
    public function Index(Request $request)
    {
        $shop_id='1';
        if ($request->isPost()) {
            $key = $request->post('keyword');
            $where['name'] = array('like','%'.$key.'%');
            $store = GoodsStore::where(['name'=>$where['name']])->select();
            if($store){
                return $this->view('index',['stores'=>$store,'search'=>'1','keyword'=>$key]);
            }elseif(!$store){
                $store = GoodsStore::where('shop_id',$shop_id)->paginate(10);
                return $this->view('index',['stores'=>$store,'search'=>'0','keyword'=>$key]);
            }
        }else{
            $store = GoodsStore::where('shop_id',$shop_id)->paginate(10);
            return $this->view('index',['stores'=>$store,'search'=>'3','keyword'=>'']);
        }
    }
    /**
     * @only = goods_store_create
     */
    public function create(Request $request)
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $data['name'] = $request->post('name');
            $check =Db::table('yele_goods_store')->where('name',$request->post('name'))->find();
            if(empty($data['name'])){
                return $this->redirect('goods/Store/Index')->withError(['text' => '修改失败，仓库不能为空！']);
            }elseif($check){
                return $this->redirect('goods/Store/Index')->withError(['text' => '此单位已经存在，请勿重复添加！']);
            }else{
                $data['shop_id'] = 1 ;
                $success = GoodsStore::create($data);
                return $this->redirect('goods/Store/Index')->withSuccess(['text' => '成功创建仓库']);
            }
        }else{
            return $this->view('create');
        }
    }
    /**
     * @only = goods_store_update
     */
    public function update(Request $request)
    {
        $id = $request->get('id');
        $result = GoodsStore::get($id)->getData();
        if ($request->isPost()) {
            $data['name'] = $request->post('name');
            $check =Db::table('yele_goods_store')->where('name',$request->post('name'))->find();
            if(empty($data['name'])){
                return $this->redirect('goods/Store/Index')->withError(['text' => '修改失败，仓库不能为空！']);
            }else{
                $where['id'] = $id ;
                $success = GoodsStore::update($data,$where);
                return $this->redirect('goods/Store/Index')->withSuccess(['text' => '成功修改仓库']);
            }
        }else{
            return $this->view('update',['store'=>$result]);
        }
    }
    /**
     * @only = goods_store_delete
     */
    public function delete($id)
    {
        $result = GoodsStore::get($id);
        $affected = $result -> delete();
        return $this->redirect('Store/Index')->withSuccess(['text' => '成功删除仓库']);
    }
}
