<?php

use Phinx\Migration\AbstractMigration;
use Phinx\Db\Adapter\MysqlAdapter;
class CreateCompanyTable extends AbstractMigration
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
        $table = $this->table('company');
        $table->addColumn('number', 'string', ['limit' => 20,'comment' => '公司编号'])
              ->addColumn('district_id', 'integer', ['limit' => 10,'comment' => '地区ID'])
              ->addColumn('name', 'string', ['limit' => 50,'comment' => '公司名称'])
              ->addColumn('logo', 'string', ['limit' => 255,'comment' => '公司LOGO'])
              ->addColumn('people', 'integer', ['limit' => 10,'comment' => '公司人数'])
              ->addColumn('charger', 'string', ['limit' => 50,'comment' => '负责人'])
              ->addColumn('charger_phone', 'string', ['limit' =>20,'comment' => '负责人电话'])
              ->addColumn('balance', 'decimal', ['limit' => 10,'precision'=>2,'comment' => '余额'])
              ->addColumn('ratio', 'decimal', ['limit' => 5,'precision'=>2,'comment' => '排序，数字越小越靠前'])
              ->addColumn('business_number', 'string', ['limit' => 50,'comment' => '营业执照号'])
              ->addColumn('business_pic', 'string', ['limit' => 255,'comment' => '营业执照号证件'])
              ->addColumn('address', 'string', ['limit' => 255,'precision'=>2,'comment' => '地址'])
              ->addColumn('delivery_time', 'string', ['limit' => 20,'comment' => '送餐时间如 12:25'])
              ->addColumn('create_user', 'integer', ['limit' =>11,'comment' => '申请人'])
              ->addColumn('create_time', 'timestamp', ['default' => 'CURRENT_TIMESTAMP','comment' => '申请时间'])
              ->addColumn('status','integer',['limit' =>  MysqlAdapter::INT_TINY,'comment' => '公司状态'])
              ->addColumn('display','integer',['limit' =>  MysqlAdapter::INT_TINY,'comment' => '是否被删除'])
              ->addColumn('taketime','timestamp', ['default' => 'CURRENT_TIMESTAMP','comment' => '送餐开始时间'])
              ->addColumn('outtime','timestamp', ['default' => 'CURRENT_TIMESTAMP','comment' => '送餐结束时间'])
              ->addColumn('mon_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期一补贴金额'])
              ->addColumn('tue_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期二补贴金额'])
              ->addColumn('wed_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期三补贴金额'])
              ->addColumn('thu_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期四补贴金额'])
              ->addColumn('fri_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期五补贴金额'])
              ->addColumn('sat_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期六补贴金额'])
              ->addColumn('sun_subsidy','decimal',['limit' => 4,'precision'=>2,'comment' => '星期日补贴金额'])
              ->addColumn('debt_limit','decimal',['limit' => 10,'precision'=>2,'comment' => '员工欠费上限'])
              ->save();
    }
}
