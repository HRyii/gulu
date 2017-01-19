<?php

namespace module\company\service;

use think\Db;
use think\Cache;
use core\model\CompanyUser as CompanyUser;

class User
{
    /**
     * 删除人员
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
            Db::table('gulu_company_user')->where('id', 'in', $id)->delete();
            return CompanyUser::destroy($id, $soft);
        });
    }
}
