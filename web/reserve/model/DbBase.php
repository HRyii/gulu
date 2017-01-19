<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2016/12/12
 * Time: 14:06
 */

namespace web\reserve\model;

use think\Model;

class DbBase extends Model
{
    protected $dataReturn = array(
        'status'    =>  0,
        'info'      =>  '操作失败',
        'data'      =>  ''
    );

    public function initialize(){
        parent::initialize();
    }

    /**
     *  add 增
     * @param array $data
     * @param boolean $validate
     * @param string $field 允许插入的字段,默认是全字段
     * @return array
     */
    public function add($data, $validate = false, $field = true)
    {

        if($this->validate($validate)->allowField($field)->save($data)){
            $this->dataReturn['status'] = 1;
            $this->dataReturn['info'] = '操作成功';
            $this->dataReturn['data'] = $this->id;
        }else{
            $this->dataReturn['info'] = $this->getError();
        }
        return $this->dataReturn;
    }

    /**
     *  addAll 增加多条
     * @param array $data
     * @param boolean $validate
     * @param string $field 允许插入的字段,默认是全字段
     * @return array
     */
    public function addAll($data, $validate = false, $field = true)
    {

        if($this->validate($validate)->allowField($field)->saveAll($data)){
            $this->dataReturn['status'] = 1;
            $this->dataReturn['info'] = '操作成功';
        }else{
            $this->dataReturn['info'] = $this->getError();
        }
        return $this->dataReturn;
    }

    /**
     *  edit 改
     * @param array $data
//     * @param array $where
     * @param string $field 允许插入的字段,默认是全字段
     * @return array
     */
    public function edit($data, $field = true)
    {
        if($this->allowField($field)->update($data)){
            $this->dataReturn['status'] = 1;
            $this->dataReturn['info'] = '操作成功';
        }else{
            $this->dataReturn['info'] = $this->getError();
        }
        return $this->dataReturn;
    }

    /**
     *  del 删
     * @param array $where
     * @return array
     */
    public function del($where)
    {
        if($this->destroy($where)){
            $this->dataReturn['status'] = 1;
            $this->dataReturn['info'] = '操作成功';
        }else{
            $this->dataReturn['info'] = $this->getError();
        }
        return $this->dataReturn;
    }

    /**
     *  getOne 查单个
     * @param array $where
     * @param string $field 要查找的字段
     * @return array
     */
    public function getOne($where, $field = '')
    {
        //是否查找某字段
        if($field){
            if($data = $this->where($where)->value($field)){
                $this->dataReturn['status'] = 1;
                $this->dataReturn['info'] = '操作成功';
                $this->dataReturn['data'] = $data;
            }else{
                $this->dataReturn['info'] = '数据不存在';
            }
        }else{
            if($data = $this->get($where)){
                $this->dataReturn['status'] = 1;
                $this->dataReturn['info'] = '操作成功';
                $this->dataReturn['data'] = $data->data;
            }else{
                $this->dataReturn['info'] = '数据不存在';
            }
        }

        return $this->dataReturn;
    }

    /**
     *  getAll 查多个
     * @param array $where
     * @param string $field 要查找的字段
     * @return array
     */
    public function getAll($where = array(), $field = '')
    {
        //是否查找某字段
//        if($field){
//            if($data = $this->where($where)->column($field)){
//                $this->dataReturn['status'] = 1;
//                $this->dataReturn['info'] = '操作成功';
//                $this->dataReturn['data'] = $data;
//            }else{
//                $this->dataReturn['info'] = $this->getError();
//            }
//        }else{
            if($data = $this->where($where)->field($field)->select()){
                $this->dataReturn['status'] = 1;
                $this->dataReturn['info'] = '操作成功';
                $this->dataReturn['data'] = $data;
            }else{
                $this->dataReturn['info'] = $this->getError();
            }
        //}

        return $this->dataReturn;
    }
}