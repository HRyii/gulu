{extend name="../core/view/common/page.tpl" /}

{block name="title"}
    {if condition="isset($role)"}
    角色详情
    {else /}
    新建角色
    {/if}
{/block}

{block name="right-header"}
<div class="title-action">
    <a href="{:url('account/role/index')}" class="btn btn-info">返回列表</a>
</div>
{/block}

{block name="content"}
<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>
            {if condition="isset($role)"}
            {$role->display_name}详情
            {else /}
            新建角色
            {/if}
        </h5>
        <div class="ibox-tools">
        </div>
    </div>
    <div class="ibox-content">
        <div class="panel blank-panel">

            <div class="panel-heading">
                <div class="panel-options">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#basic"><i class="fa fa-user"></i>基础信息</a>
                        </li>
                        {if condition="$__user->can(['account_role_perm_assign'])"}
                        <li><a data-toggle="tab" href="#perms"><i class="fa fa-key"></i>权限配置</a></li>
                        {/if}
                    </ul>
                </div>
            </div>

            <div class="panel-body">
                <form class="form-horizontal" action="{if condition='isset($role)'}{:url('account/role/update', ['id' => $role->id])}{else /}{:url('account/role/create')}{/if}" method="post">
                    <div class="tab-content">
                        <div id="basic" class="tab-pane active">
                            <div class="form-group {if condition="isset($error['name'])"}has-error{/if}">
                                <label class="col-sm-2 control-label">角色标识</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="只能为小写字母和下划线" {if condition="!isset($role)"}name="name"{/if} value="{if condition='isset($role)'}{$role->name}{/if}" {if condition="isset($role)"}disabled{/if}>
                                    {if condition="isset($error['name'])"}
                                    <span class="help-block">{$error['name']}</span>
                                    {/if}
                                </div>
                            </div>
                            <div class="form-group {if condition="isset($error['display_name'])"}has-error{/if}">
                                <label class="col-sm-2 control-label">角色名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="display_name" value="{if condition='isset($role)'}{$role->display_name}{/if}">
                                    {if condition="isset($error['display_name'])"}
                                    <span class="help-block">{$error['display_name']}</span>
                                    {/if}
                                </div>
                            </div>
                            <div class="form-group {if condition="isset($error['description'])"}has-error{/if}">
                                <label class="col-sm-2 control-label">角色描述</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" name="description" rows="8" cols="80">{if condition="isset($role)"}{$role->description}{/if}</textarea>
                                    {if condition="isset($error['description'])"}
                                    <span class="help-block">{$error['description']}</span>
                                    {/if}
                                </div>
                            </div>
                        </div>
                        {if condition="$__user->can(['account_role_perm_assign'])"}
                        <div id="perms" class="tab-pane">
                            <div class="panel-body">
                                <div class="panel-group" id="accordion">
                                    {foreach $modules as $module}
                                        {assign name="modulePerms" value="$module->permissions()->column('gulu_permission.name')" /}
                                        {if condition="!empty($modulePerms)"}
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-{$module->id}">{$module->name}</a>
                                                </h5>
                                            </div>
                                            <div id="collapse-{$module->id}" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>
                                                                    {if condition="!isset($role) || !$role->is('admin')"}
                                                                    <input type="checkbox" class="i-checks yele-js-check-all-perms"></input>全选
                                                                    {/if}
                                                                </th>
                                                                <th>名称</th>
                                                                <th>所属菜单</th>
                                                                <th>所属模块</th>
                                                                <th>详细</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            {foreach $module->permissions()->select() as $permission}
                                                            <tr>
                                                                <td><input type="checkbox" name="permissions[]" value="{$permission->id}" {if condition="isset($role) and $role->is('admin')"}disabled{/if} class="i-checks" {if condition="isset($role) and $role->hasPermission($permission->id)"}checked{/if}></input></td>
                                                                <td title="{$permission->display_name}">{$permission->display_name}</td>
                                                                <td>{$permission->menu->name}</th>
                                                                <td>{$permission->menu->module->name}</th>
                                                                <td><a class="yele-js-perm-desc" data-description="{$permission->description}">查看</a></td>
                                                            </tr>
                                                            {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        {/if}
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                        {/if}
                        <div class="hr-line-dashed"></div>
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div>
    </div>
</div>
{/block}

{block name="css"}
    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
    {css href="/js/plugins/layer/skin/layer.css"}
{/block}

{block name="js"}
    {js href="/js/plugins/iCheck/icheck.min.js"}
    {js href="/js/plugins/chosen/chosen.jquery.js"}
    {js href="/js/plugins/layer/layer.min.js"}
    {js href="validate.js"}
    {js href="app.js"}
{/block}
