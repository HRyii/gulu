<?php

use Phinx\Migration\AbstractMigration;

class CreateRolePermissionTable extends AbstractMigration
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
        $table = $this->table('role_permission', ['id' => false, 'primary_key' => ['role_id', 'permission_id']]);
        $table->addColumn('role_id', 'integer')
              ->addColumn('permission_id', 'integer')
              ->create();
    }
}
