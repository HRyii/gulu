<?php

use Phinx\Seed\AbstractSeed;
use Faker\Factory as Faker;

class PermissionSeeder extends AbstractSeed
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
        $faker = Faker::create();
        $table = $this->table('permission');
        $table->insert([
            [
                'name' => 'view-account-list',
                'display_name' => '查看账号列表',
                'description' => $faker->sentence,
            ],
        ]);
    }
}
