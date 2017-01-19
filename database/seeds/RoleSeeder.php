<?php

use Phinx\Seed\AbstractSeed;
use Faker\Factory as Faker;

class RoleSeeder extends AbstractSeed
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
//        for ($i = 0; $i < 20; ++$i) {
//            $this->insert('role', [
//                'name' => $faker->word,
//                'display_name' => $faker->word,
//                'description' => $faker->word
//            ]);
//        }
        $this->insert('role',[
            [
                'name' => 'service',
                'display_name' => '服务员',
                'description' => '服务员'
            ],
            [
                'name' => 'reserver',
                'display_name' => '存酒员',
                'description' => '存酒员'
            ]
        ]);
    }
}
