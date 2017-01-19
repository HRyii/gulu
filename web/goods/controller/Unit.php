<?php

namespace web\goods\controller;

use core\Controller;
use core\model\Module;
use think\Db;
use think\Request;
use core\model\GoodsUnit as GoodsUnit;

class Unit extends Controller
{
    public function Index(Request $request)
    {
        $shop_id='1';
        if ($request->isPost()) {
            $key = $request->post('keyword');
            $where['name'] = array('like','%'.$key.'%');
            $unit = GoodsUnit::where(['name'=>$where['name']])->select();
            if($unit){
                return $this->view('index',['units'=>$unit,'search'=>'1','keyword'=>$key]);
            }elseif(!$unit){
                $unit = GoodsUnit::where('shop_id',$shop_id)->paginate(10);
                return $this->view('index',['units'=>$unit,'search'=>'0','keyword'=>$key]);
            }
        }else{
            $unit = GoodsUnit::where('shop_id',$shop_id)->paginate(10);
            return $this->view('index',['units'=>$unit,'search'=>'3','keyword'=>'']);
        }
    }
    /**
     * @only = goods_unit_create
     */
    public function create(Request $request)
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $data['name'] = $request->post('name');
            $check =Db::table('yele_goods_unit')->where('name',$request->post('name'))->find();
            if(empty($data['name'])){
                return $this->redirect('goods/Unit/Index')->withError(['text' => '单位不能为空！']);
            }elseif($check){
                return $this->redirect('goods/Unit/Index')->withError(['text' => '此单位已经存在，请勿重复添加！']);
            }else{
                $data['shop_id']=1;
                $success = GoodsUnit::create($data);
                return $this->redirect('goods/Unit/Index')->withSuccess(['text' => '成功创建单位']);
            }
        }else{
            return $this->view('create');
        }
    }
    /**
     * @only = goods_unit_update
     */
    public function update(Request $request)
    {
        $id = $request->get('id');
        $result = GoodsUnit::get($id)->getData();
        if ($request->isPost()) {
            $where['id'] = $id ;
            $data['name'] = $request->post('name');
            $check =Db::table('yele_goods_unit')->where('name',$request->post('name'))->find();
            if(empty($data['name'])){
                return $this->redirect('goods/Unit/Index')->withError(['text' => '单位不能为空！']);
            }elseif($check['name']){
                return $this->redirect('goods/Unit/Index')->withError(['text' => '此单位已经存在，请勿重复添加！']);
            }
            //TODO:验证
            $success = GoodsUnit::update($data,$where);
            return $this->redirect('goods/Unit/Index')->withSuccess(['text' => '成功创建单位']);
        }else{
            // var_dump($result);die;
            return $this->view('update',['unit'=>$result]);
        }
    }
    /**
     * @only = goods_unit_delete
     */
    public function delete($id)
    {
        $result = GoodsUnit::get($id);
        $affected = $result -> delete();
        return $this->redirect('Store/Index')->withSuccess(['text' => '成功删除仓库']);
    }
}
