<?php

namespace core\model;

use think\Model as MModel;

class CompanyUser extends MModel
{
    public function users()
    {
        return $this->hasMany('company_user', 'company_id');
    }

}
