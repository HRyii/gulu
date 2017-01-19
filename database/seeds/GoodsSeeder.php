<?php

use Phinx\Seed\AbstractSeed;

class GoodsSeeder extends AbstractSeed
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
        $this->insert('goods',[
            [
                'goods_name' => '哈啤',
            ],
            [
                'goods_name' => '哈力高',
            ],
            [
                'goods_name' => '红酒',
            ],
            [
                'goods_name' => '白酒',
            ],
        ]);
    }
}
