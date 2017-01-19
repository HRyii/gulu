<?php

use Phinx\Migration\AbstractMigration;

class InsertUserTable extends AbstractMigration
{
    public function up()
    {
        $now = date("Y-m-d H:i:s");

        $this->insert('user', [
            'username' => 'dev',
            'password' => password_hash('dev', PASSWORD_BCRYPT)
        ]);
        $this->insert('role', [
            [
                'id' => 1,
                'name' => 'admin',
                'display_name' => '超级管理员',
                'description' => '运维人员',
            ],
            [
                'id' => 2,
                'name' => 'op',
                'display_name' => '运维人员',
                'description' => '运维人员',
            ],
            [
                'id' => 3,
                'name' => 'tech',
                'display_name' => '技术支持',
                'description' => '技术支持',
            ],
        ]);
        $this->insert('user_role', [
            [
                'user_id' => 1,
                'role_id' => 1,
            ],
        ]);
        $this->insert('module', [
            [
                'id' => 1,
                'name' => '仪表板',
                'display_name'=> '仪表板',
                'url' => 'dashboard/index/index',
                'icon' => 'dashboard',
                'priority' => 1000,
                'display' => 1,
            ],
            [
                'id' => 2,
                'name' => '账号管理',
                'display_name'=> '账号管理',
                'url' => '',
                'icon' => 'users',
                'priority' => 800,
                'display' => 1,
            ],
            [
                'id' => 3,
                'name' => '公司后台',
                'display_name'=> '公司后台',
                'url' => '',
                'icon' => 'company',
                'priority' => 800,
                'display' => 1,
            ],
            [
                'id' => 4,
                'name' => '公司管理',
                'display_name'=> '公司管理',
                'url' => '',
                'icon' => 'company',
                'priority' => 800,
                'display' => 1,
            ],
            [
                'id' => 5,
                'name' => '人员管理',
                'display_name'=> '人员管理',
                'url' => '',
                'icon' => 'company',
                'priority' => 800,
                'display' => 1,
            ],
            [
                'id' => 9,
                'name' => '配额设置',
                'display_name'=> '配额设置',
                'url' => '',
                'icon' => 'company',
                'priority' => 800,
                'display' => 1,
            ],
            [
                'id' => 7,
                'name' => '消费记录',
                'display_name'=> '消费记录',
                'url' => 'company/consume/Index',
                'icon' => 'company',
                'priority' => 800,
                'display' => 1,
            ],
            [
                'id' => 12,
                'name' => '公司财务管理',
                'display_name'=> '公司财务管理',
                'url' => '',
                'icon' => 'company',
                'priority' => 800,
                'display' => 1,
            ],
        ]);
        $this->insert('permission', [
            [
                'id' => 2,
                'menu_id' => 1,
                'name' => 'account_user_create',
                'display_name'=> '创建账号',
                'description' => '创建账号',
            ],
            [
                'id' => 3,
                'menu_id' => 1,
                'name' => 'account_user_update',
                'display_name'=> '更新账号',
                'description' => '更新账号',
            ],
            [
                'id' => 4,
                'menu_id' => 1,
                'name' => 'account_user_delete',
                'display_name'=> '删除账号',
                'description' => '删除账号',
            ],
            [
                'id' => 5,
                'menu_id' => 1,
                'name' => 'account_user_reset',
                'display_name' => '重置用户账号密码',
                'description' => '重置用户账号密码',
            ],
            [
                'id' => 6,
                'menu_id' => 1,
                'name' => 'account_user_enable',
                'display_name' => '启用或停用用户账号',
                'description' => '启用或停用用户账号',
            ],
            [
                'id' => 7,
                'menu_id' => 1,
                'name' => 'account_user_role_assign',
                'display_name' => '为账号分配角色',
                'description' => '为账号分配角色',
            ],
            [
                'id' => 8,
                'menu_id' => 2,
                'name' => 'account_role_create',
                'display_name' => '创建新角色',
                'description' => '创建新角色',
            ],
            [
                'id' => 9,
                'menu_id' => 2,
                'name' => 'account_role_update',
                'display_name' => '更新角色',
                'description' => '更新角色',
            ],
            [
                'id' => 10,
                'menu_id' => 2,
                'name' => 'account_role_perm_assign',
                'display_name' => '为角色分配权限',
                'description' => '为角色分配权限',
            ],
            [
                'id' => 11,
                'menu_id' => 2,
                'name' => 'account_role_delete',
                'display_name' => '删除角色',
                'description' => '删除角色',
            ],
            [
                'id' => 12,
                'menu_id' => 3,
                'name' => 'company_account',
                'display_name'=> '注册账号',
                'description' => '注册公司账号'
            ],
            [
                'id' => 13,
                'menu_id' => 4,
                'name' => 'company_corporate_apply',
                'display_name'=> '申请公司',
                'description' => '申请公司，填写公司资料'
            ],
            [
                'id' => 14,
                'menu_id' => 4,
                'name' => 'company_corporate_set',
                'display_name'=> '配餐地址及方式设置',
                'description' => '公司配餐地址及方式设置'
            ],
            [
                'id' => 15,
                'menu_id' => 4,
                'name' => 'company_corporate_changeset',
                'display_name'=> '修改配餐地址及方式设置',
                'description' => '修改公司配餐地址及方式设置'
            ],
            [
                'id' => 16,
                'menu_id' => 10,
                'name' => 'company_subsidy_companyset',
                'display_name'=> '配额设置',
                'description' => '默认配额设置'
            ],
            [
                'id' => 17,
                'menu_id' => 11,
                'name' => 'company_subsidy_changeset',
                'display_name'=> '修改配额设置',
                'description' => '修改默认配额设置'
            ],
            [
                'id' => 18,
                'menu_id' => 10,
                'name' => 'company_subsidy_usercreate',
                'display_name'=> '员工各人配额设置',
                'description' => '员工各人配额设置'
            ],
            [
                'id' => 19,
                'menu_id' => 10,
                'name' => 'company_subsidy_update',
                'display_name'=> '修改员工各人配额设置',
                'description' => '修改员工各人配额设置'
            ],
            [
                'id' => 20,
                'menu_id' => 10,
                'name' => 'company_subsidy_index',
                'display_name'=> '每日补贴金额列表',
                'description' => '每日补贴金额列表'
            ],
            [
                'id' => 21,
                'menu_id' => 10,
                'name' => 'company_subsidy_userdelete',
                'display_name'=> '删除员工各人配额设置',
                'description' => '删除员工各人配额设置'
            ],
            [
                'id' => 22,
                'menu_id' => 7,
                'name' => 'company_user_group',
                'display_name'=> '人员分组显示',
                'description' => '人员分组显示'
            ],
            [
                'id' => 23,
                'menu_id' => 7,
                'name' => 'company_consume_index',
                'display_name'=> '人员消费记录',
                'description' => '人员消费记录'
            ],
            [
                'id' => 24,
                'menu_id' => 16,
                'name' => 'company_bill_setfinancer',
                'display_name'=> '公司财务人员账号设置',
                'description' => '公司财务人员账号设置'
            ],
            [
                'id' => 25,
                'menu_id' => 3,
                'name' => 'company_index_index',
                'display_name'=> '公司主页',
                'description' => '公司主页'
            ],
            [
                'id' => 26,
                'menu_id' => 14,
                'name' => 'company_bill_index',
                'display_name'=> '公司资金流水',
                'description' => '公司资金流水'
            ],
            [
                'id' => 27,
                'menu_id' => 15,
                'name' => 'company_bill_pay',
                'display_name'=> '公司充值',
                'description' => '公司充值'
            ],
            [
                'id' => 28,
                'menu_id' => 3,
                'name' => 'company_corporate_checked',
                'display_name'=> '审核公司',
                'description' => '审核公司'
            ],
            [
                'id' => 29,
                'menu_id' => 8,
                'name' => 'company_user_checked',
                'display_name'=> '人员审核',
                'description' => '人员审核'
            ],
        ]);
        $this->insert('role_permission', [
            [
                'role_id' => 1,
                'permission_id' => 2,
            ],
            [
                'role_id' => 1,
                'permission_id' => 3,
            ],
            [
                'role_id' => 1,
                'permission_id' => 4,
            ],
            [
                'role_id' => 1,
                'permission_id' => 5,
            ],
            [
                'role_id' => 1,
                'permission_id' => 6,
            ],
            [
                'role_id' => 1,
                'permission_id' => 7,
            ],
            [
                'role_id' => 1,
                'permission_id' => 8,
            ],
            [
                'role_id' => 1,
                'permission_id' => 9,
            ],
            [
                'role_id' => 1,
                'permission_id' => 10,
            ],
            [
                'role_id' => 1,
                'permission_id' => 11,
            ],
            [
                'role_id' => 1,
                'permission_id' => 12,
            ],
            [
                'role_id' => 1,
                'permission_id' => 13,
            ],
            [
                'role_id' => 1,
                'permission_id' => 14,
            ],
            [
                'role_id' => 1,
                'permission_id' => 15,
            ],
            [
                'role_id' => 1,
                'permission_id' => 16,
            ],
            [
                'role_id' => 1,
                'permission_id' => 17,
            ],
            [
                'role_id' => 1,
                'permission_id' => 18,
            ],
            [
                'role_id' => 1,
                'permission_id' => 19,
            ],
            [
                'role_id' => 1,
                'permission_id' => 20,
            ],
            [
                'role_id' => 1,
                'permission_id' => 21,
            ],
            [
                'role_id' => 1,
                'permission_id' => 22,
            ],
            [
                'role_id' => 1,
                'permission_id' => 23,
            ],
            [
                'role_id' => 1,
                'permission_id' => 24,
            ],
            [
                'role_id' => 1,
                'permission_id' => 25,
            ],
            [
                'role_id' => 1,
                'permission_id' => 26,
            ],
            [
                'role_id' => 1,
                'permission_id' => 27,
            ],
            [
                'role_id' => 1,
                'permission_id' => 28,
            ],
            [
                'role_id' => 1,
                'permission_id' => 29,
            ],
            [
                'role_id' => 1,
                'permission_id' => 30,
            ],
            [
                'role_id' => 1,
                'permission_id' => 31,
            ],
            [
                'role_id' => 1,
                'permission_id' => 32,
            ],
            [
                'role_id' => 1,
                'permission_id' => 33,
            ],
            [
                'role_id' => 1,
                'permission_id' => 34,
            ],
            [
                'role_id' => 1,
                'permission_id' => 35,
            ],
            [
                'role_id' => 1,
                'permission_id' => 36,
            ],
            [
                'role_id' => 1,
                'permission_id' => 37,
            ],
            [
                'role_id' => 1,
                'permission_id' => 38,
            ],
            [
                'role_id' => 1,
                'permission_id' => 39,
            ],
            [
                'role_id' => 1,
                'permission_id' => 40,
            ],
            [
                'role_id' => 1,
                'permission_id' => 41,
            ],
            [
                'role_id' => 1,
                'permission_id' => 42,
            ],
            [
                'role_id' => 1,
                'permission_id' => 43,
            ],
            [
                'role_id' => 1,
                'permission_id' => 44,
            ],
            [
                'role_id' => 1,
                'permission_id' => 45,
            ],
            [
                'role_id' => 1,
                'permission_id' => 46,
            ],

        ]);
        $this->execute("SET FOREIGN_KEY_CHECKS=0");
        $this->insert('menu', [
            [
                'id' => 1,
                'pid' => 0,
                'module_id' => 2,
                'name' => '账号列表',
                'url' => 'account/user/index',
                'priority' => 1000,
            ],
            [
                'id' => 2,
                'pid' => 0,
                'module_id' => 2,
                'name' => '角色列表',
                'url' => 'account/role/index',
                'priority' => 800,
            ],
            [
                'id' => 3,
                'pid' => 0,
                'module_id' => 4,
                'name' => '公司主页',
                'url' => 'company/index/index',
                'priority' => 800,
            ],
            [
                'id' => 4,
                'pid' => 0,
                'module_id' => 4,
                'name' => '申请公司',
                'url' => 'company/Corporate/apply',
                'priority' => 800,
            ],
            [
                'id' => 5,
                'pid' => 0,
                'module_id' => 5,
                'name' => '审核公司列表',
                'url' => 'company/Corporate/check',
                'priority' => 800,
            ],
            [
                'id' => 7,
                'pid' => 0,
                'module_id' => 5,
                'name' => '人员分组',
                'url' => 'company/user/group',
                'priority' => 800,
            ],
            [
                'id' => 8,
                'pid' => 0,
                'module_id' => 5,
                'name' => '人员审核',
                'url' => 'company/user/check',
                'priority' => 800,
            ],
            [
                'id' => 10,
                'pid' => 0,
                'module_id' => 9,
                'name' => '员工各人配额设置',
                'url' => 'company/subsidy/index',
                'priority' => 800,
            ],
            [
                'id' => 11,
                'pid' => 0,
                'module_id' => 9,
                'name' => '默认公司配额设置',
                'url' => 'company/subsidy/companyset',
                'priority' => 800,
            ],
            [
                'id' => 14,
                'pid' => 0,
                'module_id' => 12,
                'name' => '资金流水',
                'url' => 'company/bill/index',
                'priority' => 800,
            ],
            [
                'id' => 15,
                'pid' => 0,
                'module_id' => 12,
                'name' => '公司充值',
                'url' => 'company/bill/pay',
                'priority' => 800,
            ],
            [
                'id' => 16,
                'pid' => 0,
                'module_id' => 12,
                'name' => '公司财务人员设置',
                'url' => 'company/bill/setfinancer',
                'priority' => 800,
            ],
        ]);
        $this->execute("SET FOREIGN_KEY_CHECKS=1");
    }

    public function down()
    {
        $this->execute("delete FROM user");
        $this->execute("delete FROM user_role");
        $this->execute("delete FROM permission");
        $this->execute("delete FROM role_permission");
        $this->execute("delete FROM module");
        $this->execute("delete FROM menu");
    }
}
