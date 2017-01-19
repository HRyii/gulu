<?php

namespace core\model;

class District extends Model
{
    protected $table = 'district';
    public function name()
    {
        return $this->belongsTo('district', 'id');
    }
}
