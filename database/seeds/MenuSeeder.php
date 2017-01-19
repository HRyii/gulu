<?php

use Phinx\Seed\AbstractSeed;

class MenuSeeder extends AbstractSeed
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
        $table = $this->table('menu');
        $table->insert([
            [
                'id' => 1,
                'module_id' => 1,
                'name' => '账号列表',
                'url' => '',
            ],
            [
                'id' => 2,
                'module_id' => 1,
                'name' => '角色列表',
                'url' => '',
            ],
        ]);
    }
}
