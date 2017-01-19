<?php

namespace web\goods\controller;

use core\Controller;
use core\model\Module;
use think\Db;
use think\Request;
use core\model\GoodsBrand as GoodsBrand;
use module\base\upload\Uploader as Uploader;

class Brand extends Controller
{
    public function Index(Request $request)
    {
        $shop_id='1';
        if ($request->isPost()) {
            $key = $request->post('keyword');
            $where['name'] = array('like','%'.$key.'%');
            $brand = GoodsBrand::where(['name'=>$where['name']])->select();
            if($brand){
                return $this->view('index',['brands'=>$brand,'search'=>'1','keyword'=>$key]);
            }elseif(!$brand){
                $brand = GoodsBrand::where('shop_id',$shop_id)->paginate(5);
                return $this->view('index',['brands'=>$brand,'search'=>'0','keyword'=>$key]);
            }
        }else{
            $brand = GoodsBrand::where('shop_id',$shop_id)->paginate(5);
            return $this->view('index',['brands'=>$brand,'search'=>'3','keyword'=>'']);
        }
    }
    /**
     * @only = goods_brand_create
     */
    public function create(Request $request)
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $data['name'] = $request->post('name');
            $check =Db::table('yele_goods_brand')->where('name',$data['name'])->find();
            if($check['name'] == $data['name']){
                return $this->redirect('goods/Brand/Index')->withError(['text' => '此品牌已经存在，请勿重复添加！']);
            }
            if($request->file('logo')){
                $data['logo'] = '/uploads/'.Uploader::upload($request->file('logo'));
            }
                $data['shop_id']=1;
                $success = GoodsBrand::create($data);
                return $this->redirect('goods/Brand/Index')->withSuccess(['text' => '成功创建品牌']);
        }else{
            return $this->view('create');
        }
    }
    /**
     * @only = goods_brand_delete
     */
    public function delete($id)
    {
        $result = GoodsBrand::get($id);
        $affected = $result -> delete();
        return $this->redirect('Brand/Index')->withSuccess(['text' => '成功删除品牌']);
    }
    /**
     * @only = goods_brand_update
     */
    public function update(Request $request)
    {
        $id = $request->get('id');
        $result = GoodsBrand::get($id)->getData();
        if ($request->isPost()) {
            if($request->file('logo')){
                $data['logo'] = '/uploads/'.Uploader::upload($request->file('logo'));
            }
            $data['name'] = $request->post('name');
            $where['id'] = $id ;
            $success = GoodsBrand::update($data,$where);
            return $this->redirect('goods/Brand/Index')->withSuccess(['text' => '成功修改品牌']);
        }else{
            return $this->view('update',['brand'=>$result]);
        }
    }
}
