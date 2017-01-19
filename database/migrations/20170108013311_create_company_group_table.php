<?php

use Phinx\Migration\AbstractMigration;

class CreateCompanyGroupTable extends AbstractMigration
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
        $table = $this->table('company_group');
        $table->addColumn('name','string',['limit' => 50,'comment' => '组名'])
              ->addColumn('create_user_id','integer',['limit' => 10,'comment' => '用户id'])
              ->addColumn('company_id','integer',['limit' => 10,'comment' => '公司id'])
              ->addColumn('create_time','integer',['limit' => 10,'comment' => '创建时间'])
            ->create();
    }
}
