<?php

namespace core\behavior;

use ReflectionMethod;
use think\Request;
use core\RedirectResponse;
use web\account\service\Auth;

class Authorization
{
    public function run(&$call)
    {
        $request = Request::instance();
        $action = new ReflectionMethod($call[0], $call[1]);
        $docComment = $action->getDocComment();

        $match = preg_match(
            '#@(?P<directive>noauth|only|except)(\h?=\h?(?P<perms>[a-zA-Z_\-,]+))?#', $docComment, $matches
        );

        if ($match) {
            switch ($matches['directive']) {
                case "noauth":
                    return;
                case "only":
                    return $this->only($this->permissions($matches['perms']));
                case "except":
                    return $this->except($this->permissions($matches['perms']));
            }
        } else {
            $this->only([implode('_', [
                strtolower($request->module()),
                strtolower($request->controller()),
                strtolower($request->action()),
            ])]);
            return ;
        }
        $this->abort();
    }

    private function only($perms)
    {
        $can = Auth::user()->can($perms);
        if (! $can) {
            $this->abort();
        }
    }

    private function except($perms)
    {
        $cant = Auth::user()->cant($perms);
        if ($cant) {
            $this->abort();
        }
    }

    private function abort()
    {
        abort(403, "Forbidden!");
    }

    private function permissions($str)
    {
        return explode(',', $str);
    }
}
