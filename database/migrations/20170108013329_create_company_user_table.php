<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;
class CreateCompanyUserTable extends AbstractMigration
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
        $table = $this->table('company_user');
        $table->addColumn('user_id','integer',['limit' => 10,'comment' => '用户id'])
              ->addColumn('company_id','integer',['limit' => 10,'comment' => '公司id'])
              ->addColumn('apply_time','integer',['limit' => 10,'comment' => '申请时间'])
              ->addColumn('pass_time','integer',['limit' => 10,'comment' => '通过时间'])
              ->addColumn('status','integer',['limit' => MysqlAdapter::INT_TINY,'comment' => '审核状态 0审核中 1审核通过'])
              ->addColumn('mon_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期一补贴金额'])
              ->addColumn('tue_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期二补贴金额'])
              ->addColumn('wed_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期三补贴金额'])
              ->addColumn('thu_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期四补贴金额'])
              ->addColumn('fri_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期五补贴金额'])
              ->addColumn('sat_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期六补贴金额'])
              ->addColumn('sun_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期日补贴金额'])
            ->create();
    }
}
