<?php

namespace core\model\relation;

use think\Db;
use think\model\relation\BelongsToMany as BaseRelation;

class BelongsToMany extends BaseRelation
{
    /**
     * 同步建立多对多关系
     * @param array $rels
     * @return int
     */
    public function sync($rels)
    {
        $modelPkValue = $this->parent->{$this->getPk()};

        array_walk($rels, function(&$value, $key) use ($modelPkValue) {
            $value = array_merge(
                [$this->localKey => $modelPkValue],
                [$this->foreignKey => $value]
            );
        });

        return Db::transaction(function() use ($modelPkValue, $rels) {
            Db::table($this->middle)->where($this->localKey, $modelPkValue)->delete();
            return Db::table($this->middle)->insertAll($rels);
        });
    }
}
