<?php

use Phinx\Seed\AbstractSeed;

class ShelfSeeder extends AbstractSeed
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
        $this->insert('reserve_shelf',[
            [
                'name' => 'A1',
            ],
            [
                'name' => 'A2',
            ],
            [
                'name' => 'B1',
            ],
            [
                'name' => 'B2',
            ],
        ]);

    }
}
