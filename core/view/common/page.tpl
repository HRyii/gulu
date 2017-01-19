<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>咕噜公司后台 - {block name="title"}{/block}</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min.css" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="/css/plugins/jsTree/style.min.css" rel="stylesheet">

    {block name="css"}
    <style>
    /*body,a,p,h1,span,ul,li,h1, h2, h3, h4, h5, h6{
         font-family: "Microsoft YaHei" ! important;
    }*/
    </style>
    {/block}
    <script>
    (function(T, h, i, n, k, P, a, g, e) {
        g = function() {
            P = h.createElement(i);
            a = h.getElementsByTagName(i)[0];
            P.src = k;
            P.charset = "utf-8";
            P.async = 1;
            a.parentNode.insertBefore(P, a)
        };
        T["ThinkPageWeatherWidgetObject"] = n;
        T[n] || (T[n] = function() {
            (T[n].q = T[n].q || []).push(arguments)
        });
        T[n].l = +new Date();
        if (T.attachEvent) {
            T.attachEvent("onload", g)
        } else {
            T.addEventListener("load", g, false)
        }
    }(window, document, "script", "tpwidget", "//widget.thinkpage.cn/widget/chameleon.js"))
</script>
<script>
    tpwidget("init", {
        "flavor": "bubble",
        "location": "WS02MNW64CP6",
        "geolocation": "enabled",
        "position": "top-right",
        "margin": "10px 10px",
        "language": "auto",
        "unit": "c",
        "theme": "chameleon",
        "uid": "UDB4C98013",
        "hash": "ba82acf34fefa2627d744b0035716dc6"
    });
    tpwidget("show");
</script>
<style>
    .tpwthwidt .weakText_2-k5eHK {
        display: none;
    }
</style>
</head>

<body class="gray-bg">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-sm-4">
            <h2>{block name="title"}{/block}</h2>
            {present name="breadcrumbs"}
                {$breadcrumbs}
            {/present}
        </div>
        <div class="col-sm-8">
            {block name="right-header"}{/block}
        </div>
    </div>

    <div class="wrapper wrapper-content">
        {include file="../core/view/common/notification.tpl" /}
        {block name='content'}
        {/block}
    </div>

    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jsTree plugin javascript -->
    <script src="/js/plugins/jsTree/jstree.min.js"></script>

    {block name="js"}
    {js href="/js/plugins/iCheck/icheck.min.js"}
    <script>
        $(document).ready(function() {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
    {/block}
</body>
</html>
