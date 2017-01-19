<?php

namespace core\model;

class UserProfile extends Model
{
    public function setBirthdayAttr($birthday)
    {
        if ($birthday === '') {
            return '1970-01-01';
        } else {
            return $birthday;
        }
    }
}
