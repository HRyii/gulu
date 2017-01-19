<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/14
 * Time: 9:54
 */

namespace web\reserve\model;

use web\reserve\controller\Constant;

class ReserveTake extends DbBase
{
    //自动写入
    protected $insert = ['status'=>Constant::ReverseTake_Status_NotTake];

    //自动更新时间戳
    protected $autoWriteTimestamp = 'timestamp';
    protected $createTime = 'created_at';
    protected $updateTime = 'updated_at';


    public function index()
    {

    }
}