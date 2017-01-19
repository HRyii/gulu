<?php

namespace module\goods\service;

use think\Db;
use think\Cache;
use core\model\GoodsClass as ClassModel;

class GoodsClass
{
    public function list()
    {
        $classify = ClassModel::all();
        $list = arrToTree($classify);
        // var_dump($list);die;
        return self::merge_menu($list);
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
                    $html.="<input type='checkbox' data-id='{$v['id']}' class='i-checks yele-js-check'></input>";
                    $html.="<i class='icon-plus-sign'></i> {$v['name']}</span>";
                    $html.= "<a href='".url('goods/classify/create', ['id' => $v['id']])."' style='margin-left:10px;'>&nbsp;&nbsp; 添加子分类</a>";
                    $html.="<a>&nbsp;|</a><a href='".url('goods/classify/update', ['id' => $v['id']])."' style='margin-left:10px;'>编辑</a>";
                    $html.= '<ul>';
                    $html.= self::merge_menu($v['child'],$v['id'],$level+1);
                    $html.= "</ul></li>";
                } else {
                    $html.= "<li><span><input type='checkbox' data-id='{$v['id']}' class='i-checks yele-js-check'></input><i class='icon-minus-sign'></i> {$v['name']}</span> <a href='".url('goods/classify/create', ['id' => $v['id']])."' style='margin-left:10px;'>&nbsp;&nbsp;添加子分类</a><a>&nbsp;|</a><a href='".url('goods/classify/update', ['id' => $v['id']])."' style='margin-left:10px;'>编辑</a></li>";
                }
            }
        }
        return $html;
    }
    /**
     * 删除分类
     * @param array|integer $id
     * @param boolean $soft
     * @return integer
     */
    public static function delete($id, $soft = false)
    {
        if (is_integer($id)) {
            $id = [$id];
        }
        return Db::transaction(function() use ($id, $soft) {
            Db::table('yele_goods_class')->where('id', 'in', $id)->delete();
            return ClassModel::destroy($id, $soft);
        });
    }
}
