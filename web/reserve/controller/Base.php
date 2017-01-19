<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/12
 * Time: 12:03
 */

namespace web\reserve\controller;

use think\Request;
use core\Controller;

class Base extends Controller
{
    protected $dataReturn = array(
        'status'    =>  0,
        'info'      =>  '操作失败',
        'data'      =>  ''
    );

    //商品单位的中文
    public $unit_zh = array(
        '1' =>  '瓶',
        '6' =>  '半打',
        '12' =>  '打',
    );

}