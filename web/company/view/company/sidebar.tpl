<!--左侧导航开始-->
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="nav-close"><i class="fa fa-times-circle"></i>
    </div>
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <span><img alt="image" class="img-circle" src="img/profile_small.jpg" /></span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="clear">
                            <span class="block m-t-xs"><strong class="font-bold">Beaut-zihan</strong></span>
                            <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                        </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                        </li>
                        <li><a class="J_menuItem" href="profile.html">个人资料</a>
                        </li>
                        <li><a class="J_menuItem" href="contacts.html">联系我们</a>
                        </li>
                        <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="account/auth/logout">安全退出</a>
                        </li>
                    </ul>
                </div>
                <div class="logo-element"><img src="/img/logo.png" alt="" width="95%">
                </div>
            </li>
            <li>

            {foreach $modules as $module}
                {if condition="$Think.config.app_debug || $__user->can($module->permissions()->column('name'))"}
                <li>
                    <a class="J_menuItem" href="{$module->url}">
                        <i class="fa fa-{$module->icon}"></i>
                        <span class="nav-label">{$module->name}</span>
                        {if condition="!empty($module->menus())"}
                        <span class="fa arrow"></span>
                        {/if}
                    </a>
                    {/* 由于前端框架的原因未能实现无限级分类 */}
                    {if condition="!empty($module->menus()->where('pid', 0)->select())"}
                    <ul class="nav nav-second-level">
                        {foreach $module->menus()->where('pid', 0)->select() as $menu}
                        <li>
                            <a class="J_menuitem" href="{$menu->url}">
                                {$menu->name}
                                {if condition="!empty($menu->menus())"}
                                <span class="fa arrow"></span>
                                {/if}
                            </a>
                            {if condition="!empty($menu->menus())"}
                            <ul class="nav nav-third-level">
                                {foreach $menu->menus() as $menu}
                                <li><a class="J_menuitem" href="{$menu->url}">{$menu->name}</a></li>
                                {/foreach}
                            </ul>
                            {/if}
                        </li>
                        {/foreach}
                    </ul>
                    {/if}
                </li>
                {/if}
            {/foreach}

        </ul>
    </div>
</nav>
<!--左侧导航结束-->
