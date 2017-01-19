<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;
class CreateCompanyBillTable extends AbstractMigration
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
        $table = $this->table('company_bill');
        $table->addColumn('company_id','integer',['limit' => 10,'comment' => '公司id'])
              ->addColumn('type','integer',['limit' => MysqlAdapter::INT_TINY,'comment' => '类型：1：充值 2：补贴'])
              ->addColumn('amount','decimal',['limit' => 10,'precision'=>2,'comment' => '金额'])
              ->addColumn('foreign_id','integer',['limit' => 10,'comment' => '对应类型的记录ID'])
              ->addColumn('pay_type','integer',['limit' => 10,'comment' => '支付方式'])
              ->addColumn('balance','decimal',['limit' => 10,'precision'=>2,'comment' => '账户结余'])
              ->addColumn('remark','string',['limit' => 255,'comment' => '备注'])
              ->addColumn('create_id','integer',['limit' => 10,'comment' => '操作人ID'])
              ->addColumn('create_time','integer',['limit' => 10,'comment' => '通过时间'])
            ->create();
    }
}
