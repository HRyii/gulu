<?php

namespace core\model;

use think\Model as MModel;
use Hashids\Hashids;

class Company extends MModel
{
    private static $hashids = null;
    public function __construct($data = [])
    {
        parent::__construct($data);
        if (self::$hashids === null) {
            self::$hashids = new Hashids('this is my salt', 4, '23456789abcdefghjkmnpqrstuvwxyz');
        }
    }

    public function district()
    {
        return $this->belongsTo('District', 'district_id', 'id');
    }

    public function getNumberAttr($number)
    {
        return $this->district->area_code . $number;
    }

    public function setNumberAttr($number)
    {
        return self::$hashids->encode($number);
    }
}
