<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/13
 * Time: 14:50
 */

namespace web\reserve\model;


use web\reserve\controller\Constant;

class Reserve extends DbBase
{
    //自动写入
    protected $insert = [
        'status'    =>  Constant::Reverse_Status_NotConfirm,
        'valid'     =>  Constant::Reverse_Enable,
    ];

    //自动更新时间戳
    protected $autoWriteTimestamp = 'timestamp';
    protected $createTime = 'created_at';
    protected $updateTime = 'updated_at';

    public function detail()
    {
        return $this->hasMany('reserve_detail');
    }
}