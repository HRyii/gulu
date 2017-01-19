<?php

namespace core\model;

// use think\Model;
use think\Cache;
use traits\model\SoftDelete;

class User extends Model
{
    //use SoftDelete;

    protected $deleteTime = 'deleted_at';

    public function roles()
    {
        return $this->belongsToMany('Role', 'gulu_user_role', 'role_id', 'user_id');
    }

    public function profile()
    {
        return $this->hasOne('UserProfile', 'user_id', 'id');
    }

    /**
     * 判断用户是否具有某个角色
     * @param string $role
     * @return boolean
     */
    public function is($role)
    {
        return in_array($role, $this->roles()->column('name'));
    }

    /**
     * 判断用户是否不具有某个角色
     * @param string $role
     * @return boolean
     */
    public function isnt($role)
    {
        return ! $this->is($role);
    }

    /**
     * 判断用户是否具有某个角色
     * @param integer $role
     * @return boolean
     */
    public function hasRole($role)
    {
        return in_array($role, $this->roles()->column('id'));
    }

    /**
     * 判断用户是否拥有某个权限，参数中权限之间的关系是或
     * @param array $permissions
     * @return boolean
     */
    public function can($permissions)
    {
        return ! empty(array_intersect($this->retrievePermissions($this->id), $permissions));
    }

    /**
     * 判断用户是否不具备某个权限，如果传递的是权限数组，则权限之间的关系是与
     * @param string|array $permission
     * @return boolean
     */
    public function cant($permission)
    {
        if (is_string($permission)) {
            return ! $this->can([$permission]);
        } else if (is_array($permission)) {
            return empty(array_intersect($this->retrievePermissions($this->id), $permission));
        } else {
            throw new \InvalidArgumentException(
                sprintf("Expect type is string or array, %s given", gettype($permission))
            );
        }
    }

    /**
     * 判断权限是否在缓存中
     * @param integer $id
     * @return mixed|false
     */
    private function permissionsInCache($id)
    {
        return Cache::get('user:' . $this->id . 'permissions');
    }

    /**
     * 缓存住权限
     * @param array $permissions
     * @return void
     */
    private function cachePermissions($permissions)
    {
        Cache::tag('permissions')->set('user:' . $this->id . 'permissions', $permissions);
    }

    /**
     * 获取用户的权限
     * @param integer $id
     * @return array
     */
    protected function retrievePermissions($id)
    {
        if ($this->permissionsInCache($id)) {
            $permissions = $this->retrievePermissionsFromCache($id);
        } else {
            $permissions = $this->retrievePermissionsFromDb($id);
            $this->cachePermissions($permissions);
        }
        return $permissions;
    }

    /**
     * 从缓存中获取用户的所有权限
     * @param array $cacheUser
     * @return array
     */
    protected function retrievePermissionsFromCache($id)
    {
        return Cache::get('user:' . $this->id . 'permissions');
    }

    /**
     * 从数据库中获取用户的所拥有的权限
     * @param int $userId
     * @return array
     */
    protected function retrievePermissionsFromDb($id)
    {
        $permissionsInDb = $this->alias('u')->join([
            ['gulu_user_role ur', 'u.id = ur.user_id'],
            ['gulu_role r', 'ur.role_id = r.id'],
            ['gulu_role_permission rp', 'r.id = rp.role_id'],
            ['gulu_permission p', 'rp.permission_id = p.id'],
        ])->distinct(true)->field('p.name')->where('u.id', '=', $id)->select();

        $permissionsInDb = array_map(function($permission) {
            return $permission->getData('name');
        }, $permissionsInDb);

        return $permissionsInDb;
    }
}
