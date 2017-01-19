<?php

namespace module\base\breadcrumb;

use think\View;

class Breadcrumb
{
    private $breadcrumbs = null;

    public function __construct($breadcrumbs)
    {
        $this->breadcrumbs = $breadcrumbs;
    }

    public function render()
    {
        return (new View)->fetch(__DIR__ . '/breadcrumb.tpl', ['breadcrumbs' => $this->breadcrumbs]);
    }

    public function append($text, $url)
    {
        $this->breadcrumbs[] = ['text' => $text, 'url' => $url];
        return $this;
    }
}
