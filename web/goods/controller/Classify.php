<?php

namespace web\goods\controller;

use core\Controller;
use core\model\Module;
use think\Db;
use think\Request;
use core\model\GoodsClass as GoodsClass;
use module\goods\service\GoodsClass as ClassService;
use core\ApiController;

class Classify extends Controller
{
    public function Index(ClassService $classService)
    {
        $list = $classService->list();
        return $this->view('index',['class'=>$list]);
    }
    /**
     * @only = goods_classify_create
     */
    public function create(Request $request)
    {
        if ($request->isPost()) {
            $data= $request->post();
            $check =Db::table('yele_goods_class')->where('name',$request->post('name'))->find();
            if(empty($data['sort'])){
                $data['sort'] = 0;
            }
            if(empty($data['name'])){
                return $this->redirect('goods/classify/Index')->withError(['text' => '添加失败，分类名称不能为空！']);
            }elseif($check){
                return $this->redirect('goods/classify/Index')->withError(['text' => '此分类已经存在，请勿重复添加！']);
            }else{
                if(!$request->post('pid')){
                    $data['shop_id'] = 1 ;
                    $data['pid'] = $request->get('id');
                    if (!$data['pid']) {
                        $data['pid'] = 0;
                    }
                    $success = GoodsClass::create($data);
                    return $this->redirect('goods/classify/Index')->withSuccess(['text' => '成功修改分类']);
                }else{
                    $data['shop_id'] = 1 ;
                    $success = GoodsClass::create($data);
                    return $this->redirect('goods/classify/Index')->withSuccess(['text' => '成功修改分类']);
                }
            }
        }else{
            $category = GoodsClass::all(function($query){
                                                $query->order('sort', 'asc');
            });
            $list = arrToTree($category);
            $lists = self::merge_menu($list);
            return $this->view('create',['category'=>$lists]);
        }
    }
    /**
     * @only = goods_classify_update
     */
    public function update(Request $request)
    {
        $request = Request::instance();
        if($request->isGet()){
                $id = $request->get('id');
                $checkOut = GoodsClass::get($id)->getData();
                $category = GoodsClass::all(function($query){
                                                    $query->order('sort', 'asc');
                });
                $list = arrToTree($category);
                $lists = self::merge_menu($list);
            return $this->view('update', ['category'=>$lists,'result'=>$checkOut]);
        }elseif ($request->isPost()) {
                $data = $request->post();
                $over = GoodsClass::get($request->post('pid'));
                $check =Db::table('yele_goods_class')->where('name',$request->post('name'))->find();
                if(empty($data['pid'])){
                    return $this->redirect('goods/classify/Index')->withError(['text' => '修改失败，上级分类不能为空！']);
                }elseif(empty($data['name'])){
                    return $this->redirect('goods/classify/Index')->withError(['text' => '修改失败，分类名称不能为空！']);
                }elseif(empty($data['sort'])){
                    $data['sort'] = 0;
                }elseif($check){
                    return $this->redirect('goods/classify/Index')->withError(['text' => '此分类已经存在，请勿重复添加！']);
                }
                if($over['pid'] == 0){
                    $where['id'] = $over['id'];
                    $data['pid'] = 0;
                    $success = GoodsClass::update($data,$where);
                    return $this->redirect('goods/classify/Index')->withSuccess(['text' => '成功修改分类']);
                }elseif(!($request->post('pid') == $request->get('id'))){
                    //改变原来编辑记录
                    $tripled = GoodsClass::get($request->get('id'));
                    $tripled_success = Db::table('yele_goods_class')
                                            ->where('id',$request->get('id'))
                                            ->update(['pid'=>$request->post('pid'),
                                                      'name'=>$request->post('name'),
                                                      'display'=>$request->post('display'),
                                                      'sort'=>$request->post('sort')]);
                    //改变新的pid记录
                    $post['id'] = $request->post('pid');
                    $change_success = Db::table('yele_goods_class')
                                            ->where('id',$request->post('id'))
                                            ->update(['pid'=>$tripled['pid']]);
                    return $this->redirect('goods/classify/Index')->withSuccess(['text' => '成功修改分类']);
                }else{
                    $where['id'] = $request->get('id');
                    $tripled = GoodsClass::get($request->get('id'));
                    $data['pid'] = $tripled['pid'];
                    $success = GoodsClass::update($data,$where);
                    return $this->redirect('goods/classify/Index')->withSuccess(['text' => '成功修改分类']);
                }
        }
    }
    // 递归重组权限配置列表
    static function merge_menu($list, $pid = 0, $level = 1)
    {
        $html='';
        foreach ($list as $v) {
            if ($v['pid'] == $pid) {
                if ($v['child']) {
                    $html.= "<li>";
                    $html.= "<span><div class='radio i-checks'>";
                    if(empty($_GET['id'])){
                        $html.="<input type='radio' value='{$v['id']}' name='pid'>";
                    }elseif($_GET['id']){
                        $where['id'] = $_GET['id'];
                        $checkOut = GoodsClass::get($where)->getData();
                        if($checkOut['pid'] == 0 && $v['id'] == $_GET['id']){
                            $html.="<input type='radio' value='{$v['id']}' name='pid' style='display:none' checked>";
                        }elseif ($v['id'] == $_GET['id']){
                            $html.="<input type='radio' value='{$v['id']}' name='pid' checked>";
                        }else{
                            if($checkOut['pid'] ==0){
                                $html.="";
                            }else{
                                $html.="<input type='radio' value='{$v['id']}' name='pid'>";
                            }
                        }
                    }
                    // <i class='icon-plus-sign'></i><i class='icon-minus-sign'></i>
                    $html.="<i class='icon-plus-sign'></i> {$v['name']}</div></span>";
                    $html.= '<ul>';
                    $html.= self::merge_menu($v['child'],$v['id'],$level+1);
                    $html.= "</ul></li>";
                } else {
                    $html.= "<li><span><div class='radio i-checks'>";
                    if(empty($_GET['id'])){
                        $html.="<input type='radio' value='{$v['id']}' name='pid'>";
                    }elseif($_GET['id']){
                        $where['id'] = $_GET['id'];
                        $checkOut = GoodsClass::get($where)->getData();
                        if($checkOut['pid'] == 0 && $v['id'] == $_GET['id']){
                            $html.="<input type='radio' value='{$v['id']}' name='pid' style='display:none' checked>";
                        }elseif ($v['id'] == $_GET['id']){
                            $html.="<input type='radio' value='{$v['id']}' name='pid' checked>";
                        }else{
                            if($checkOut['pid'] ==0){
                                $html.="";
                            }else{
                                $html.="<input type='radio' value='{$v['id']}' name='pid'>";
                            }
                        }
                    }
                    $html.="<i class='icon-minus-sign'></i> {$v['name']}</div></span></li>";
                }
            }
        }
        return $html;
    }
}
