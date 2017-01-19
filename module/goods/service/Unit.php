<?php

namespace module\goods\service;

use think\Db;
use think\Cache;
use core\model\GoodsUnit as GoodsUnit;

class Unit
{
    /**
     * 删除仓库
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
            Db::table('yele_goods_unit')->where('id', 'in', $id)->delete();
            return GoodsUnit::destroy($id, $soft);
        });
    }
}
