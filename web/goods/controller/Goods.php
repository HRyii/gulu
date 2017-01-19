<?php

namespace web\goods\controller;

use core\Controller;
use core\model\Module;
use think\Db;
use think\Request;
use core\model\Goods as GoodsModel;
use core\model\GoodsBrand as GoodsBrand;
use core\model\GoodsClass as GoodsClass;
use core\model\GoodsPhoto as GoodsPhoto;
use core\model\GoodsStore as GoodsStore;
use core\model\GoodsUnit as GoodsUnit;
use module\base\upload\Uploader as Uploader;
use module\goods\service\Goods as GoodsService;

class Goods extends Controller
{
    public function Index(Request $request)
    {
        $shop_id='1';
        $where['display'] = 1;
        $GoodsBrand = GoodsBrand::all();
        $GoodsStore = GoodsStore::all();
        $GoodsUnit = GoodsUnit::all();
        if ($request->isPost()) {
            $where = $request->post();
            if($request->post('name')){
                $where['name'] = array('like','%'.$request->post('name').'%');
            }
            $where['display'] = 1;
            $where['shop_id'] = $shop_id;
            // var_dump(array_filter($where));die;
            if(!($where == '')){
                $Goods = GoodsModel::where(array_filter($where))->select();
                if ($Goods) {
                    foreach ($Goods as $key => $value) {
                    //    $Goods[$key]['category'] = $value->category->name;
                       $Goods[$key]['store'] = $value->store->name;
                       $where['good_id'] = $value['id'];
                       $Photo = new  GoodsPhoto;
                       $result = $Photo -> where(['good_id'=>$where['good_id'],
                                                  'main'=>1]) -> find();
                       $Goods[$key]['main'] = $result['path'];
                    }
                    return $this->view('index',['Goods'=>$Goods,
                                                 'search'=>'1',
                                                 'name'=>$request->post('name'),
                                                 'GoodsBrand'=>$GoodsBrand,
                                                 'GoodsStore'=>$GoodsStore,
                                                 'GoodsUnit'=>$GoodsUnit,
                                                 'where'=>$where]);
                }elseif (!$Goods) {
                    $Goods = GoodsModel::where(['display'=>1,'shop_id'=>$shop_id])->paginate(10);
                    foreach ($Goods as $key => $value) {
                    //    $Goods[$key]['category'] = $value->category->name;
                       $Goods[$key]['store'] = $value->store->name;
                       $where['good_id'] = $value['id'];
                       $Photo = new  GoodsPhoto;
                       $result = $Photo -> where(['good_id'=>$where['good_id'],
                                                  'main'=>1]) -> find();
                       $Goods[$key]['main'] = $result['path'];
                    }
                    return $this->view('index',['Goods'=>$Goods,
                                                 'search'=>'0',
                                                 'name'=>$request->post('name'),
                                                 'GoodsBrand'=>$GoodsBrand,
                                                 'GoodsStore'=>$GoodsStore,
                                                 'GoodsUnit'=>$GoodsUnit,
                                                 'where'=>$where]);
                }
            }
        }else{
            $where = array('name'=>'',
                           'brand_id'=>'0',
                           'store_id'=>'0',
                           'show'=>'4',
                           'status'=>'4',
                           'display'=>'1');
            $Goods = GoodsModel::where(['display'=>1,'shop_id'=>$shop_id])->paginate(10);
            foreach ($Goods as $key => $value) {
            //    $Goods[$key]['category'] = $value->category->name;
               $Goods[$key]['store'] = $value->store->name;
               $where['good_id'] = $value['id'];
               $Photo = new  GoodsPhoto;
               $result = $Photo -> where(['good_id'=>$where['good_id'],
                                          'main'=>1]) -> find();
               $Goods[$key]['main'] = $result['path'];
            }
            return $this->view('index',['Goods'=>$Goods,
                                         'search'=>'3',
                                         'name'=>'',
                                         'GoodsBrand'=>$GoodsBrand,
                                         'GoodsStore'=>$GoodsStore,
                                         'GoodsUnit'=>$GoodsUnit,
                                         'where'=>$where]);
        }
    }
    /**
     * @only = goods_goods_recycle
     */
    public function Recycle(Request $request)
    {
        $shop_id='1';
        $where['display'] = 2;
        $GoodsBrand = GoodsBrand::all();
        $GoodsStore = GoodsStore::all();
        $GoodsUnit = GoodsUnit::all();
        if ($request->isPost()) {
            $where = $request->post();
            if($request->post('name')){
                $where['name'] = array('like','%'.$request->post('name').'%');
            }
            $where['display'] = 2;
            $where['shop_id'] = $shop_id;
            if(!($where == '')){
                $Goods = GoodsModel::where(array_filter($where))->select();
                if ($Goods) {
                    foreach ($Goods as $key => $value) {
                    //    $Goods[$key]['category'] = $value->category->name;
                       $Goods[$key]['store'] = $value->store->name;
                       $where['good_id'] = $value['id'];
                       $Photo = new  GoodsPhoto;
                       $result = $Photo -> where(['good_id'=>$where['good_id'],
                                                  'main'=>1]) -> find();
                       $Goods[$key]['main'] = $result['path'];
                    }
                    return $this->view('recycle',['Goods'=>$Goods,
                                                 'search'=>'1',
                                                 'name'=>$request->post('name'),
                                                 'GoodsBrand'=>$GoodsBrand,
                                                 'GoodsStore'=>$GoodsStore,
                                                 'GoodsUnit'=>$GoodsUnit,
                                                 'where'=>$where]);
                }elseif (!$Goods) {
                    $Goods = GoodsModel::where(['display'=>2,'shop_id'=>$shop_id])->paginate(10);
                    foreach ($Goods as $key => $value) {
                    //    $Goods[$key]['category'] = $value->category->name;
                       $Goods[$key]['store'] = $value->store->name;
                       $where['good_id'] = $value['id'];
                       $Photo = new  GoodsPhoto;
                       $result = $Photo -> where(['good_id'=>$where['good_id'],
                                                  'main'=>1]) -> find();
                       $Goods[$key]['main'] = $result['path'];
                    }
                    return $this->view('recycle',['Goods'=>$Goods,
                                                 'search'=>'0',
                                                 'name'=>$request->post('name'),
                                                 'GoodsBrand'=>$GoodsBrand,
                                                 'GoodsStore'=>$GoodsStore,
                                                 'GoodsUnit'=>$GoodsUnit,
                                                 'where'=>$where]);
                }
            }
        }else{
            $where = array('name'=>'',
                           'brand_id'=>'0',
                           'store_id'=>'0',
                           'show'=>'4',
                           'status'=>'4');
            $Goods = GoodsModel::where(['display'=>2,'shop_id'=>$shop_id])->paginate(10);
            foreach ($Goods as $key => $value) {
            //    $Goods[$key]['category'] = $value->category->name;
               $Goods[$key]['store'] = $value->store->name;
               $where['good_id'] = $value['id'];
               $Photo = new  GoodsPhoto;
               $result = $Photo -> where(['good_id'=>$where['good_id'],
                                          'main'=>1]) -> find();
               $Goods[$key]['main'] = $result['path'];
            }
            return $this->view('recycle',['Goods'=>$Goods,
                                         'search'=>'3',
                                         'name'=>'',
                                         'GoodsBrand'=>$GoodsBrand,
                                         'GoodsStore'=>$GoodsStore,
                                         'GoodsUnit'=>$GoodsUnit,
                                         'where'=>$where]);
        }
    }
    /**
     * @only = goods_goods_restore
     */
    public function restore($id)
    {
        $result = GoodsModel::get($id);
        $form['display'] = '1';
        $delGoods = GoodsModel::update($form,['id' => $id]);
        return $this->redirect('Goods/Index')->withSuccess(['text' => '成功恢复商品']);
    }
    /**
     * @only = goods_goods_create
     */
    public function create(Request $request)
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $form = $request->post();
            $check =Db::table('yele_goods')->where('name',$request->post('name'))->find();
            if(empty($form['name'])){
                return $this->redirect('goods/goods/create')->withError(['text' => '品牌名字不能为空！']);
            }elseif($check){
                return $this->redirect('goods/goods/Index')->withError(['text' => '此品牌已经存在，请勿重复添加！']);
            }
            $form['shop_id'] = 1;
            $addGoods = GoodsModel::create($form);
            $GoodsId = $addGoods->getData('id');
            $data['name'] = $request->post('name');
            if ($request->file()) {
                if($main = $request->file('main')){
                    $main_files = Uploader::upload($main);
                    $main_photo['path'] = '/uploads/'.$main_files;
                    $main_photo['good_id'] = $GoodsId;
                    $main_photo['main'] = 1;
                    $addPhoto = GoodsPhoto::create($main_photo);
                }
                if($files = request()->file('image')){
                    foreach ($files as $k => $v) {
                        $image[] = Uploader::upload($v);
                        $files['path'] = $image;
                    }
                    foreach ($files['path'] as $kk => $vv) {
                        $photo['path'] = '/uploads/'.$vv;
                        $photo['good_id'] = $GoodsId;
                        $photo['main'] = 0;
                        $addPhoto = GoodsPhoto::create($photo);
                    }
                }
            }
            return $this->redirect('goods/goods/Index')->withSuccess(['text' => '成功创建商品']);
        }else{
            $GoodsBrand = GoodsBrand::all();
            $category = GoodsClass::all(function($query){
                                                $query->order('sort', 'asc');
            });
            $list = arrToTree($category);
            $lists = self::merge_menu($list);
            $GoodsStore = GoodsStore::all();
            $GoodsUnit = GoodsUnit::all();
            return $this->view('create',['GoodsBrand'=>$GoodsBrand,
                                         'GoodsClass'=>$lists,
                                         'GoodsStore'=>$GoodsStore,
                                         'GoodsUnit'=>$GoodsUnit]);
        }
    }
    /**
     * @only = goods_goods_update
     */
    public function update(Request $request)
    {
        $id = $request->get('id');
        if ($request->isPost()) {
            $form = $request->post();
            $where['id'] = $id ;
            $addGoods = GoodsModel::update($form,$where);
            if ($request->file()) {
                if($main = $request->file('main')){
                    $delwhere['good_id'] = $id;
                    $delwhere['main'] = 1;
                    $result = GoodsPhoto::get($delwhere);
                    if($result){
                        $affected = $result -> delete();
                    }
                    $main_files = Uploader::upload($main);
                    $main_photo['path'] = '/uploads/'.$main_files;
                    $main_photo['good_id'] = $id;
                    $main_photo['main'] = 1;
                    $addPhoto = GoodsPhoto::create($main_photo);
                }
                if($files = request()->file('image')){
                    foreach ($files as $k => $v) {
                        $image[] = Uploader::upload($v);
                        $files['path'] = $image;
                    }
                    foreach ($files['path'] as $kk => $vv) {
                        $photo['path'] = '/uploads/'.$vv;
                        $photo['good_id'] = $id;
                        $photo['main'] = 0;
                        $addPhoto = GoodsPhoto::create($photo);
                    }
                }
            }
            return $this->redirect('goods/goods/Index')->withSuccess(['text' => '成功修改商品']);
        }else{
            $where['good_id'] = $id;
            $newPhoto = new GoodsPhoto();
            $checkPhoto = $newPhoto -> where(['good_id'=>$id,'main'=>1]) -> find() ;
            $CommodityPhoto = $newPhoto -> where(['good_id'=>$id,'main'=>0]) -> select() ;
            $result = GoodsModel::get($id)->getData();
            $category = GoodsClass::all(function($query){
                                                $query->order('sort', 'asc');
            });
            $list = arrToTree($category);
            $lists = self::merge_menu($list);
            $GoodsBrand = GoodsBrand::all();
            $GoodsStore = GoodsStore::all();
            $GoodsUnit = GoodsUnit::all();
            return $this->view('update',['goods'=>$result,
                                         'GoodsBrand'=>$GoodsBrand,
                                         'GoodsClass'=>$lists,
                                         'GoodsStore'=>$GoodsStore,
                                         'GoodsUnit'=>$GoodsUnit,
                                         'MainPhoto'=>$checkPhoto,
                                         'CommodityPhoto'=>$CommodityPhoto]);
        }
    }
    /**
     * @only = goods_goods_delete
     */
    public function delete($id)
    {
        $result = GoodsModel::get($id);
        $form['display'] = '2';
        $delGoods = GoodsModel::update($form,['id' => $id]);
        return $this->redirect('Goods/Index')->withSuccess(['text' => '成功删除商品']);
    }
    /**
     * @only = goods_goods_del
     */
    public function del($id)
    {
        $result = GoodsModel::get($id);
        $affected = $result -> delete();
        return $this->redirect('Goods/Index')->withSuccess(['text' => '成功彻底删除商品']);
    }
    /**
     * @only = goods_goods_status
     */
    public function status(Request $request)
    {
        # code...
    }
    // 递归重组权限配置列表
    static function merge_menu($list, $pid = 0, $level = 1)
    {
        $html='';
        foreach ($list as $v) {
            if ($v['pid'] == $pid) {
                if ($v['child']) {
                    $html.= "<li>";
                    $html.= "<span>";
                    $html.="<div class='radio i-checks'>";
                    if(!$_GET){
                        $html.="<input type='radio' value='{$v['id']}' name='class_id' class='i-checks yele-js-check'></input>";
                    }else{
                        $where['id'] = $_GET['id'];
                        $checkOut = GoodsModel::get($where)->getData();
                        if($checkOut['class_id'] == $v['id']){
                            $html.="<input type='radio' checked value='{$v['id']}' name='class_id' class='i-checks yele-js-check'></input>";
                        }else{
                            $html.="<input type='radio' value='{$v['id']}' name='class_id' class='i-checks yele-js-check'></input>";
                        }
                    }
                    $html.="<i class='icon-plus-sign'></i> {$v['name']}</div></span>";
                    $html.= '<ul>';
                    $html.= self::merge_menu($v['child'],$v['id'],$level+1);
                    $html.= "</ul></li>";
                } else {
                    $html.= "<li><span><div class='radio i-checks'>";
                    if(!$_GET){
                        $html.="<input type='radio' value='{$v['id']}' name='class_id' class='i-checks yele-js-check'></input>";
                    }else{
                        $where['id'] = $_GET['id'];
                        $checkOut = GoodsModel::get($where)->getData();
                        if($checkOut['class_id'] == $v['id']){
                            $html.="<input type='radio' checked value='{$v['id']}' name='class_id' class='i-checks yele-js-check'></input>";
                        }else{
                            $html.="<input type='radio' value='{$v['id']}' name='class_id' class='i-checks yele-js-check'></input>";
                        }
                    }
                    $html.="<i class='fa fa-minus-square'></i> {$v['name']}</div></span> </li>";
                }
            }
        }
        return $html;
    }
}
