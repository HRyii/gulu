<?php

use Phinx\Seed\AbstractSeed;

class ModuleSeeder extends AbstractSeed
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeders is available here:
     * http://docs.phinx.org/en/latest/seeding.html
     */
    public function run()
    {
        $table = $this->table('module');
        $table->insert([
            [
                'id' => 1,
                'name' => '账号管理',
                'display_name' => 'account',
                'url' => '',
                'icon' => '',
            ],
        ]);
    }
}
