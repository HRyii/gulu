<?php

namespace module\account\service;

use think\Db;
use think\Cache;
use core\model\User as UserModel;

class User
{
    const DISABLED = 0;
    const ENABLED = 1;

    /**
     * 根据$id获取用户
     * @param integer $id
     * @return core\model\User
     */
    public static function account($id)
    {
        return UserModel::with('roles')->find($id);
    }

    /**
     * 获取用户列表
     * @param integer|null $perPage
     * @return array
     */
    public static function all($perPage = null)
    {
        $model = UserModel::with('roles');
        if ($perPage !== null) {
            return $model->paginate($perPage);
        }
        return $model->all();
    }

    /**
     * 用户名是否已存在
     * @param string $username
     * @return boolean
     */
    public static function exists($username)
    {
        $exists = UserModel::get(['username' => $username]);
        return $exists === null ? false : true;
    }

    /**
     * 创建一个账号
     * @param array $user
     * @return integer|null
     */
    public static function create($user)
    {
        $model = new UserModel;
        $model->username = $user['username'];
        $model->password = password_hash($user['password'], PASSWORD_BCRYPT);
        //TODO:可配置
        isset($user['enabled']) && $model->enabled = $user['enabled'];
        $id = $model->save();

        if ($id) {
            $model->roles()->sync(isset($user['roles']) ? $user['roles'] : []);
            return $id;
        } else {
            return null;
        }
    }

    /**
     * 重置密码
     * @param integer $id
     * @param array $user
     * @return integer
     */
    public static function reset($id, $user)
    {
        //TODO:验证
        return self::update($id, ['password' => $user['password']]);
    }

    /**
     * 更新账号信息
     * @param integer $id
     * @param array $user
     * @return integer
     */
    public static function update($id, $user)
    {
        $model = UserModel::get($id);
        if (! $model) {
            abort(404, sprintf("User [%s] was not found!", $id));
        }

        isset($user['password']) && $model->password = password_hash($user['password'], PASSWORD_BCRYPT);
        isset($user['enabled']) && $model->enabled = $user['enabled'];
        $model->roles()->sync(isset($user['roles']) ? $user['roles'] : []);

        Cache::clear('permissions');

        if (! $model->profile) {
            isset($user['profile']) && $model->profile()->save($user['profile']);
        } else {
            isset($user['profile']) && $model->profile->save($user['profile']);
        }

        return $model->save();
    }

    /**
     * 开启账户
     * @param integer $id
     * @return integer
     */
    public static function enable($id)
    {
        return self::update($id, ['enabled' => self::ENABLED]);
    }

    /**
     * 禁用用户
     * @param integer $id
     * @return integer
     */
    public static function disable($id)
    {
        //TODO:登出该用户
        return self::update($id, ['enabled' => self::DISABLED]);
    }

    /**
     * 更新用户密码
     * @param integer $id
     * @param string $password
     * @return integer
     */
    public static function password($id, $password)
    {
        return self::update($id, ['password' => $password]);
    }

    /**
     * 更新用户角色
     * @param integer $id
     * @param array $roles
     * @return integer
     */
    public static function roles($id, $roles)
    {
        return self::update($id, ['roles' => $roles]);
    }

    /**
     * 删除用户
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
            Db::table('gulu_user_role')->where('user_id', 'in', $id)->delete();
            return UserModel::destroy($id, $soft);
        });
    }
}
