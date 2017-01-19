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
                            <span class="block m-t-xs"><strong class="font-bold">{$__user->username}</strong></span>
                            <span class="text-muted text-xs block">
                                {assign name="roles" value="$__user->roles()->select()"}
                                {if condition="!empty($roles)"}
                                    {$roles[0]->display_name}
                                {else /}
                                    尚未赋予角色
                                {/if}
                                <b class="caret"></b>
                            </span>
                        </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                        </li>
                        <li><a class="J_menuItem" href="profile.html">个人资料</a>
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
                {assign name="modulePerms" value="$module->permissions()->column('gulu_permission.name')" /}
                {if condition="empty($modulePerms) or $__user->can($modulePerms)"}
                <li>
                    <a class="J_menuItem" href="{$module->url}">
                        <i class="fa fa-{$module->icon}"></i>
                        <span class="nav-label">{$module->display_name}</span>
                        {if condition="!empty($module->menus()->select())"}
                        <span class="fa arrow"></span>
                        {/if}
                    </a>
                    {/* 由于前端框架的原因未能实现无限级分类 */}
                    {/* TODO:性能优化 */}
                    {assign name="topMostMenus" value="$module->menus()->where('pid', 0)->where('gulu_menu.display', 1)->order('gulu_menu.priority desc')->select()" /}
                    {if condition="!empty($topMostMenus)"}
                    <ul class="nav nav-second-level">
                        {foreach $topMostMenus as $menu}
                            {if condition="$__user->can($menu->permissions()->column('gulu_permission.name'))"}
                            <li>
                                <a class="J_menuItem" href="{$menu->url}">
                                    {$menu->name}
                                    {assign name="menus" value="$menu->menus()->where('gulu_menu.display', 1)->select()" /}
                                    {if condition="!empty($menus)"}
                                    <span class="fa arrow"></span>
                                    {/if}
                                </a>
                                {if condition="!empty($menus)"}
                                <ul class="nav nav-third-level">
                                    {foreach $menus as $menu}
                                        {if condition="$__user->can($menu->permissions()->column('gulu_permission.name'))"}
                                        <li><a class="J_menuItem" href="{$menu->url}">{$menu->name}</a></li>
                                        {/if}
                                    {/foreach}
                                </ul>
                                {/if}
                            </li>
                            {/if}
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
