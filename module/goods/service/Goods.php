<?php

namespace module\goods\service;

use think\Db;
use think\Cache;
use core\model\Goods as GoodsModel;

class Goods
{
    /**
     * 获取用户列表
     * @param integer|null $perPage
     * @return array
     */
    public static function all($perPage = null)
    {
        $model = new GoodsModel;
        if ($perPage !== null) {
            return $model->paginate($perPage);
        }
        return $model->all();
    }
    /**
     * 删除商品
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
            Db::table('yele_goods')->where('id', 'in', $id)->update(['display'=>1]);
            return GoodsModel::destroy($id, $soft);
        });
    }
    /**
     * 下架
     * @param integer $id
     * @return integer
     */
    public static function status($id)
    {
        return self::update($id, ['status' => '1']);
    }

    /**
     * 上架
     * @param integer $id
     * @return integer
     */
    public static function downstatus($id)
    {
        //TODO:登出该用户
        return self::update($id, ['status' => '0']);
    }
}
