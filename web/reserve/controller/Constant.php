<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/13
 * Time: 16:55
 */

namespace web\reserve\controller;


class Constant
{
    const Reverse_Status_NotConfirm = 1;    //已申请，未确认
    const Reverse_Status_Confirm = 2;   //已确认
    const Reverse_Status_Used = 3;      //已使用
    const Reverse_Status_Expires = 4;   //已过期

    const Reverse_Enable = 1;   //可用
    const Reverse_Disable = 0;  //不可用

    const ReverseTake_Status_NotTake = 1;   //已申请，未取酒
    const ReverseTake_Status_Take = 2;    //已取酒
    //const ReverseTake_Status_Confirm = 3;   //已确认
}