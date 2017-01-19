<?php

namespace core\model;

use think\Loader;
use think\Model as BaseModel;
use core\model\relation\BelongsToMany;

class Model extends BaseModel
{
    public function BelongsToMany($model, $table = '', $foreignKey = '', $localKey = '', $alias = [])
    {
        $model      = $this->parseModel($model);
        $name       = Loader::parseName(basename(str_replace('\\', '/', $model)));
        $table      = $table ?: $this->db()->getTable(Loader::parseName($this->name) . '_' . $name);
        $foreignKey = $foreignKey ?: $name . '_id';
        $localKey   = $localKey ?: Loader::parseName($this->name) . '_id';
        return new BelongsToMany($this, $model, $table, $foreignKey, $localKey, $alias);
    }
}
