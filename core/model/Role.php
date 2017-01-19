<?php

namespace core\model;

// use think\Model;

class Role extends Model
{
    public function users()
    {
        return $this->belongsToMany('User', 'gulu_user_role', 'user_id', 'role_id');
    }

    public function hasPermission($perm)
    {
        return in_array($perm, $this->permissions()->column('id'));
    }

    public function permissions()
    {
        return $this->belongsToMany('Permission', 'gulu_role_permission', 'permission_id', 'role_id');
    }

    public function is($role)
    {
        return $this->getData('name') === $role;
    }

    public function isnt($role)
    {
        return ! ($this->getData('name') === $role);
    }
}
