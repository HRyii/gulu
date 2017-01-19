<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;
class CreateCompanyGroupUserTable extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function change()
    {
        $table = $this->table('company_group_user');
        $table->addColumn('user_id','integer',['limit' => 10,'comment' => '用户id'])
              ->addColumn('group_id','integer',['limit' => 10,'comment' => '分组id'])
              ->addColumn('company_id','integer',['limit' => 10,'comment' => '公司id'])
              ->addColumn('is_leader','integer',['limit' =>  MysqlAdapter::INT_TINY,'comment' => '是否组长'])
              ->addColumn('create_time','integer',['limit' => 10,'comment' => '通过时间'])
              ->addColumn('status','integer',['limit' =>  MysqlAdapter::INT_TINY,'comment' => '是否同意加入该组，0：未同意，1：同意'])
            ->create();
    }
}
