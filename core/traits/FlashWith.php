<?php

namespace core\traits;

use think\Session;

trait FlashWith
{
    public function with($name, $value = null)
    {
        if (is_array($name)) {
            foreach ($name as $key => $val) {
                Session::flash($key, $val);
            }
        } else {
            Session::flash($name, $value);
        }
        return $this;
    }

    public function __call($name, $params)
    {
        $prefix = substr($name, 0, 4);
        if ($prefix === 'with') {
            $session = strtolower(substr($name, 4));
            return $this->with($session, $params[0]);
        }

        throw new InvalidArgumentException(sprintf("[%s] method was not found", $name));
    }
}
