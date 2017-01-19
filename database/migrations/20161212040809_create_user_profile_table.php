<?php

use Phinx\Migration\AbstractMigration;

class CreateUserProfileTable extends AbstractMigration
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
        $table = $this->table('user_profile', ['id' => false, 'primary_key' => 'user_id']);
        $table->addColumn('user_id', 'integer')
              ->addColumn('name', 'string', ['limit' => 20, 'default' => ''])
              ->addColumn('cellphone', 'string', ['limit' => 11, 'default' => ''])
              ->addColumn('wechat', 'string', ['limit' => 50, 'default' => ''])
              ->addColumn('qq', 'string', ['limit' => 15, 'default' => ''])
              ->addColumn('avatar', 'string', ['limit' => 255, 'default' => ''])
              ->addColumn('identify', 'string', ['limit' => 255, 'default' => ''])
              ->addColumn('gender', 'enum', ['values' => ['男', '女']])
              ->addColumn('birthday', 'date', ['default' => '1970-01-01'])
              ->addTimestamps()
              ->create();
    }
}
