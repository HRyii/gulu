<?php

namespace core;

use think\View;
use think\Config;
use think\Loader;
use think\Request;
use think\Session;
use think\Response;

abstract class Controller
{
    protected $breadcrumbs = null;

    /**
     * @var think\View|null
     */
    protected $view = null;

    /**
     * @var think\Request|null
     */
    private $request = null;

    /**
     * 控制器基类构造函数
     * @param think\Request|null $request
     * @return void
     */
    public function __construct(Request $request = null)
    {
        if ($request === null) {
            $request = Request::instance();
        }
        $this->request = $request;
        $this->view    = View::instance(Config::get('template'), Config::get('view_replace_str'));
        $this->initialize();
    }

    protected function initialize()
    {
    }

    /**
     * @param mixed
     * @return mixed
     */
    protected function load()
    {
        $args = func_get_args();
        $method = array_shift($args);
        return call_user_func_array([Loader::class, $method], $args);
    }

    /**
     * 获取已登录用户的模型
     * @param void
     * @return core\model\User|null
     */
    protected function user()
    {
        return $this->request->user();
    }

    /**
     * 加载视图文件
     * @param string $template
     * @param array $vars
     * @param array $replace
     * @param int $code
     * @return think\Response
     */
    protected function view($template = '', $vars = [], $replace = [], $code = 200)
    {
        $vars = $this->afterVarsInjection($vars);
        return Response::create($template, 'view', $code)->replace($replace)->assign($vars);
    }

    /**
     * 注入共享变量
     * @param array $vars
     * @return array
     */
    protected function afterVarsInjection($vars)
    {
        foreach (['error', 'warning', 'info', 'success'] as $shareVar) {
            if (Session::has($shareVar)) {
                $vars = array_merge($vars, [$shareVar => Session::get($shareVar)]);
            }
        }

        $commonVars = ['__user' => $this->user()];

        if ($this->breadcrumbs) {
            $commonVars = array_merge($commonVars, [
                'breadcrumbs' => $this->breadcrumbs->render()
            ]);
        }

        return array_merge($vars, $commonVars);
    }

    /**
     * 渲染视图文件
     * @param string $template 模板文件名或者内容
     * @param array $vars 模板输出变量
     * @param array $replace 替换内容
     * @param array $config 模板参数
     * @param bool $renderContent 是否渲染内容
     * @return string
     * @throws Exception
     */
    protected function render($template, $vars = [], $replace = [], $config = [], $renderContent = false)
    {
        $vars = $this->afterVarsInjection($vars);
        return $this->view->fetch($template, $vars, $replace, $config, $renderContent);
    }

    /**
     * 使用改进的跳转响应来跳转
     * @param array $url
     * @param array $params
     * @param int $code
     * @return core\RedirectResponse
     */
    protected function redirect($url = [], $params = [], $code = 302)
    {
        if (is_integer($params)) {
            $code   = $params;
            $params = [];
        }
        return (new RedirectResponse($url, $code))->params($params);
    }

    /**
     * 判断是否有已定义的跳转地址
     * @param void
     * @return bool
     */
    protected function needRestored()
    {
        return Session::has('redirect_url');
    }

    public function __call($method, $args)
    {
        if (substr($method, 0, 4) === 'load') {
            return call_user_func_array(
                [$this, 'load'],
                array_merge([substr($method, 4)], $args)
            );
        }

        throw new \BadMethodCallException(sprintf("Method [%s] was not defined in controller", $method));
    }
}
