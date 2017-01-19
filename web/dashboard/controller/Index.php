<?php

namespace web\dashboard\controller;

use core\Controller;

class Index extends Controller
{

    public function index()
    {
        return $this->view();
    }
}
