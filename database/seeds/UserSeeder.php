<?php

use Phinx\Seed\AbstractSeed;
use Faker\Factory as Faker;

class UserSeeder extends AbstractSeed
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
        for ($i = 0; $i < 100; ++$i) {
            $this->insert('user', [
                'username' => $faker->userName,
                'password' => password_hash($faker->password, PASSWORD_BCRYPT)
            ]);
        }
    }
}
