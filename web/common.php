<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
//将数组转化为树形数组 子集在['child']下
function arrToTree($data,$pid_name='pid',$pid=0){
	$array=array();
	foreach ($data as $v){
		if($v[$pid_name]==$pid ){
			$v['child']=arrToTree($data,$pid_name,$v['id']);
			$array[]=$v;
		}
	}
	return $array;
}
