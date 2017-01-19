<?php

namespace module\account\service;

use think\Db;
use think\Cache;
use core\model\Role as RoleModel;

class Role
{
    /**
     * 根据id获取一个角色模型实例
     * @param integer $id
     * @return core\model\Role
     */
    public static function role($id)
    {
        return RoleModel::get($id);
    }

    /**
     * 获取模型实例列表
     * @param string $name
     * @param integer|null $perPage
     * @return array
     */
    public static function allExcept($name, $perPage = null)
    {
        if ($perPage === null) {
            return RoleModel::where('name', '<>', $name)->select();
        }
        return RoleModel::where('name', '<>', $name)->paginate($perPage);
    }

    /**
     * 获取模型实例列表
     * @param integer|null $perPage
     * @return array
     */
    public static function all($perPage = null)
    {
        if ($perPage === null) {
            return RoleModel::all();
        }
        return RoleModel::paginate($perPage);
    }

    /**
     * 创建一个角色
     * @param array $role
     * @return integer|null
     */
    public static function create($role)
    {
        $model = new RoleModel;

        isset($role['name']) && $model->name = $role['name'];
        isset($role['display_name']) && $model->display_name = $role['display_name'];
        isset($role['description']) && $model->description = $role['description'];
        $id = $model->save();

        if ($id) {
            $model->permissions()->sync(isset($role['permissions']) ? $role['permissions'] : []);
            return $id;
        } else {
            return null;
        }
    }

    /**
     * 更新一个角色
     * @param integer $id
     * @param array $role
     * @return integer
     */
    public static function update($id, $role)
    {
        $model = RoleModel::get($id);

        if (! $model) {
            abort(404,  sprintf("Role [%s] was not found!", $id));
        }

        isset($role['display_name']) && $model->display_name = $role['display_name'];
        isset($role['description']) && $model->description = $role['description'];
        isset($role['permissions']) && $model->permissions()->sync($role['permissions']);

        Cache::clear('permissions');

        return $model->save();
    }

    /**
     * 更新角色的权限
     * @param integer $id
     * @param array $permissions
     * @return integer
     */
    public static function permissions($id, $permissions)
    {
        return $this->update($id, ['permissions' => $permissions]);
    }

    /**
     * 删除角色
     * @param array|integer $id
     * @return integer
     */
    public static function delete($id, $soft = false)
    {
        if (is_integer($id)) {
            $id = [$id];
        }
        return Db::transaction(function() use ($id, $soft) {
            Db::table('gulu_user_role')->where('role_id', 'in', $id)->delete();
            return RoleModel::destroy($id, $soft);
        });
    }
}
