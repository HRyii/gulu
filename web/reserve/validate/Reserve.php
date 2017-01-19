<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/14
 * Time: 15:55
 */

namespace web\reserve\validate;

use think\Validate;

class Reserve extends Validate
{
    protected $rule = [
        'customer_cellphone'    =>  'require|number|length:11',
        'service_id'            =>  'require',
//        'reserver_id'           =>  'require',
        'label_num'             =>  'require',
        'expires'               =>  'require',
        'source'                =>  'require'
        //'source_id'                =>  'require'
    ];

    protected $message = [
        'customer_cellphone.require'    =>  '客户手机号必须',
        'customer_cellphone.number'    =>  '手机号必须是数字',
        'customer_cellphone.length'    =>  '手机号必须是11位',
        'service_id'            =>  '服务员必须',
//        'reserver_id'           =>  '存酒员必须',
        'label_num'             =>  '存酒贴二维码必须',
        'expires'               =>  '过期时间必须',
        'source'                =>  '台号必须'
        //'source_id'                =>  '台号必须'
    ];
}