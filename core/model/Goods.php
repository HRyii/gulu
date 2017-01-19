<?php

namespace core\model;

class Goods extends Model
{
    public function goods()
    {
        return $this->hasMany('goods', 'goods_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo('GoodsClass','class_id');
    }

    public function brand()
    {
        return $this->belongsTo('GoodsBrand', 'brand_id');
    }

    public function store()
    {
        return $this->belongsTo('GoodsStore', 'store_id');
    }

    public function photo()
    {
        return $this->hasMany('GoodsPhoto','id');
    }
}
