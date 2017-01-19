<?php

namespace core;

use think\response\Redirect;
use InvalidArgumentException;

class RedirectResponse extends Redirect
{
    public function __construct($data = '', $code = 302, array $header = [], array $options = [])
    {
        parent::__construct($data, $code, $header, $options);
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

    /**
     * 记住当前地址，作为稍后的跳转地址
     * @param void
     * @return core\RedirectResponse
     */
    public function remember()
    {
        parent::remember();
        return $this;
    }

    /**
     * 跳转到已定义的地址
     * @param void
     * @return core\RedirectResponse
     */
    public function restore()
    {
        parent::restore();
        return $this;
    }
}
