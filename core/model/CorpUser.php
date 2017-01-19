<?php

namespace core\model;

use think\Model as MModel;

class CorpUser extends MModel
{
    protected $table = 'corp_user';
    public function User()
    {
        return $this->HasOne('corp_user', 'user_id');
    }
}
