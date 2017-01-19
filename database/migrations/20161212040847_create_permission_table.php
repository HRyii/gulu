<?php

use Phinx\Migration\AbstractMigration;

class CreatePermissionTable extends AbstractMigration
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
        $table = $this->table('permission');
        $table->addColumn('menu_id', 'integer')
              ->addColumn('name', 'string', ['limit' => 50])
              ->addColumn('display_name', 'string', ['limit' => 50])
              ->addColumn('description', 'string', ['limit' => 255])
              ->addIndex(['name'], ['unique' => true, 'name' => 'index_unique_name'])
              ->create();
    }
}
