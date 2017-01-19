<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/14
 * Time: 14:00
 */

namespace web\reserve\controller;

use core\model\User;
use core\model\Role;
use think\Request;
use web\reserve\model\Goods;
use web\reserve\model\Reserve;
use web\reserve\model\ReserveTake as TakeModel;


class Take extends Base
{
    public function __construct()
    {
        parent::__construct();
        $this->user = new User();
        $this->goods = new Goods();
        //$this->table = new Table();
        $this->reserve = new Reserve();
        $this->take = new TakeModel();
    }

    public $status_zh = array(
        1   =>  '未取酒',
        2   =>  '已取酒',
    );

    /**
     * 录入取酒信息
     */
    public function takeInput(){

        //接收数据生成取酒记录
        $request = Request::instance();
        $postData = $request->post();
        $postData['reserver_id'] = 0;   //TODO:还没有存酒员
        $data = $this->take->add($postData);
        return $data;
    }

    /**
     * 取酒列表
     */
    public function takeList(){
        $data = $this->take->getAll();
        $takeData = $data['data'];

        //组装id
        if($takeData) {
            foreach ($takeData as $item) {
                $serviceID[] = $item['service_id'];
                $reserverID[] = $item['reserver_id'];
                $reserveID[] = $item['reserve_id'];
            }

            $serviceName = User::where('id', 'in', $serviceID)->column('id,username');    //获取服务员姓名
            if ($reserverID) {
                $reserverName = User::where('id', 'in', $reserverID)->column('id,username');    //获取存酒员姓名
            }
            $labelNum = Reserve::where('id', 'in', $reserveID)->column('id,label_num');   //获取二维码编号

            //组装数据
            foreach ($takeData as $item) {
                $item['service_name'] = $serviceName[$item['service_id']];
                if (!empty($item['reserver_id'])) {
                    $item['reserver_name'] = $reserverName[$item['reserver_id']];
                }
                $item['status_zh'] = $this->status_zh[$item['status']];
                $item['label_num'] = $labelNum[$item['reserve_id']];
            }
        }
        $assignData['reserveData'] = $takeData;

        //存酒员列表
        $assignData['reserverData'] = Role::get(['name'=>'reserver'])->users;

        $assignData['unit_zh'] = json_encode($this->unit_zh);

        return $this->view('',$assignData);
    }


    /**
     * 选择存酒员，取酒
     */
    public function takeConfirm(){
        $request = Request::instance();
        $postData = $request->post();
        $postData['status'] = Constant::ReverseTake_Status_Take; //改变取酒状态为已确认
        $data = $this->take->edit($postData);

        if($data['status']){    //更改存酒状态为已使用，记录变为不可用
            $reserveID = TakeModel::where('id',$postData['id'])->value('reserve_id');
            $result = $this->reserve->edit([
                    'id'        =>  $reserveID,
                    'status'    =>  Constant::Reverse_Status_Used,
                    'valid'    =>  Constant::Reverse_Disable,
                ]);
            return $result;
        }else{
            return $data;
        }
    }


}
