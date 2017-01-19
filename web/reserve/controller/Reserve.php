<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/13
 * Time: 10:56
 */

namespace web\reserve\controller;

use core\model\Role;
use core\model\User;
use think\Request;
use web\reserve\model\Goods;
use web\reserve\model\ReserveDetail;
use web\reserve\model\Reserve as ReserveModel;
use web\reserve\model\ReserveShelf;
use web\reserve\model\Table;

class Reserve extends Base
{

    public function __construct()
    {
        parent::__construct();
        $this->user = new User();
        $this->goods = new Goods();
        $this->table = new Table();
        $this->role = new Role();
        $this->reserve = new ReserveModel();
        $this->reserveDetail = new ReserveDetail();
    }

    public $status_zh = array(
        1   =>  '未确认',
        2   =>  '已确认',
        3   =>  '已使用',
        4   =>  '已过期',
    );

    /**
     * 录入存酒信息
     *
     */
    public function reserveInput()
    {
        //1、获取服务员列表
        $data = Role::get(['name'=>'service'])->users;
        $assignData['serviceData'] = $data;

        //2、获取酒品列表
        $data = $this->goods->getAll('','id,goods_name');
        $assignData['goodsData'] = $data['data'];

        //3、获取台列表
//        $data = $this->table->getAll('','id,table_name');
//        $assignData['tableData'] = $data['data'];

        //4、接收数据生成存酒记录
        $request = Request::instance();
        if($request->isPost()){

            $postData = $request->post();

            //生成唯一存酒编号
            $postData['code'] = $this->getCode();
            //过期日期
            $postData['expires'] = date('Y-m-d',strtotime('+'.$postData['days'].'days'));
            $result = $this->reserve->add($postData,true);

            //插入存酒详情表
            if($result['status']){

                $postData['goods_id'] = explode(',',$postData['goods_id']);
                $postData['goods_name'] = explode(',',$postData['goods_name']);
                $postData['goods_unit'] = explode(',',$postData['goods_unit']);
                $postData['goods_count'] = explode(',',$postData['goods_count']);
                $postData['goods_percent'] = explode(',',$postData['goods_percent']);
                $postData['remark'] = explode(',',$postData['remark']);

                for($i=0;$i<count($postData['goods_id']);$i++){
                    $goodsData[$i]['reserve_id'] = $result['data'];
                    $goodsData[$i]['goods_id'] = $postData['goods_id'][$i];
                    $goodsData[$i]['goods_name'] = $postData['goods_name'][$i];
                    $goodsData[$i]['goods_unit'] = $postData['goods_unit'][$i];
                    $goodsData[$i]['goods_count'] = $postData['goods_count'][$i];
                    $goodsData[$i]['goods_percent'] = $postData['goods_percent'][$i];
                    $goodsData[$i]['remark'] = $postData['remark'][$i];
                }

                $data = $this->reserveDetail->addAll($goodsData);
            }else{
                return json($result);
            }
            return json($data);
        }

        $assignData['unit_zh'] = json_encode($this->unit_zh);

        return $this->view('', $assignData);
    }

    /**
     * 存酒列表
     */
    public function reserveList(){
        $data = $this->reserve->getAll();
        $reserveData = $data['data'];

        //组装id
        if($reserveData){
            foreach ($reserveData as $item) {
                $serviceID[] = $item['service_id'];
                $reserverID[] = $item['reserver_id'];
                $shelfID[] = $item['shelf_id'];
            }
            $serviceName = User::where('id','in',$serviceID)->column('id,username');    //获取服务员姓名
            if($reserverID && $shelfID){
                $reserverName = User::where('id','in',$reserverID)->column('id,username');    //获取存酒员姓名
                $shelfName = ReserveShelf::where('id','in',$shelfID)->column('id,name');    //获取服务员姓名
            }
            //组装数据
            foreach ($reserveData as $item) {
                $item['service_name'] = $serviceName[$item['service_id']];
                if(!empty($item['reserver_id'])) {

                    $item['reserver_name'] = $reserverName[$item['reserver_id']];
                    $item['shelf_name'] = $shelfName[$item['shelf_id']];
                }
                $item['status_zh'] = $this->status_zh[$item['status']];

            }
        }

        $assignData['reserveData'] = $reserveData;

        //存酒员列表
        $assignData['reserverData'] = Role::get(['name'=>'reserver'])->users;
        $assignData['serviceData'] = Role::get(['name'=>'service'])->users;

        //货架号列表
        $assignData['shelfData'] = ReserveShelf::all();
        $assignData['unit_zh'] = json_encode($this->unit_zh);

        return $this->view('',$assignData);
    }

    /**
     * 商品清单
     */
    public function reserveDetail(){
        $id = Request::instance()->get('id');
        $detailData = ReserveModel::get($id)->detail;   //获取商品详情数据
        return json($detailData);
    }

    /**
     * 输入货架号和存酒员，确认存酒
     */
    public function confirm(){

        $request = Request::instance();
        $postData = $request->post();
        $postData['status'] = Constant::Reverse_Status_Confirm; //改变存酒状态为已确认
        $data = $this->reserve->edit($postData);
        return $data;
    }

    /**
     * 生成唯一存酒编号
//     * @param $num 存酒贴二维码编号
     * @return string
     */
    protected function getCode(){
        return 'yele'.time();
    }

    /**
     * 打印
     */
    public function reservePrint(){
        $request = Request::instance();
        $id = $request->get('id');
        $assignData['reserveData'] = ReserveModel::get($id);
        $assignData['reserveData']['days'] = round((strtotime($assignData['reserveData']['expires'])-time())/24/3600);

        $assignData['detailData'] = $assignData['reserveData']->detail;   //获取商品详情数据
        return $this->view('',$assignData);
    }
}