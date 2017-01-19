<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> {css href="/css/bootstrap.min.css" /} {css href="/css/font-awesome.css" /} {css href="/css/animate.css" /} {css href="/css/style.css" /}
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>
</head>

<body class="gray-bg" style="background: #FFD954;">
    <style>
        .btn-primary {
            background-color: #ed5565;
            border-color: #ed5565;
            color: #FFFFFF;
        }
    </style>
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name"><img src="/img/logo.png" alt="" width="80%"></h1>
                <b style="font-size:30px;font-weight:bold;font-family:Microsoft YaHei;color: #010100;">饭时咕噜公司后台系统</b>
            </div>
            <form class="m-t" role="form" action="/account/auth/login" method="post">
                <div class="form-group {present name='error'}has-error{/present}">
                    <input type="username" name="username" class="form-control" placeholder="用户名" required=""> {present name='error'}
                    <span class="help-block">{$error['text']}</span> {/present}
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="密码" required="">
                    <input type="hidden" name="__token__" value="{$Request.token}" />
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
                </p>

            </form>
        </div>
    </div>

    <!-- 全局js -->
    {js href="/js/jquery.min.js"} {js href="/js/bootstrap.min.js"}

</body>

</html>
