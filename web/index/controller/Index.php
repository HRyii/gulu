<?php

namespace web\index\controller;

use core\Controller;
use core\model\Module;

class Index extends Controller
{

    /**
     * @noauth
     */
    public function index()
    {
        //TODO:排序提到php里做
        $modules = Module::where('gulu_module.display', 1)->order('gulu_module.priority desc')->select();
        return $this->view('index', compact('modules'));
    }
}
