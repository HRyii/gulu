{extend name="../core/view/common/page.tpl" /}

{block name="title"}角色列表{/block}

{block name="content"}
<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5></h5>
        <div class="ibox-tools">

        </div>
    </div>
    <div class="ibox-content">
        <div class="row">
            <div class="col-md-12">
                {if condition="$__user->can(['account_role_delete'])"}
                <button type="button" class="btn btn-sm btn-danger pull-right yele-js-btn-delete-all" disabled><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                {/if}
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped yele-js-roles-list">
                <thead>
                    <tr>
                        <th><input type="checkbox" class="i-checks yele-js-check-all"></input>全选</th>
                        <td>角色名称</th>
                        <th>动作</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $roles as $role}
                    <tr>
                        <td>{if condition="!$role->is('admin')"}<input type="checkbox" data-id="{$role->id}" class="i-checks yele-js-check"></input>{/if}</td>
                        <td>{$role->display_name}</td>
                        <td>
                            <form action="{:url('account/role/delete', ['id' => $role->id])}" method="post">
                                <div class="form-group">
                                    {/* 如果该角色是超级用户且登录用户为超级用户或者角色为非超级用户但登录用户可以更新角色信息的时候 */}
                                    {if condition="($role->is('admin') and $__user->is('admin')) or ((!$role->is('admin')) and $__user->can(['account_role_update']))"}
                                    <a href="{:url('account/role/show', ['id' => $role->id])}" class="btn btn-sm btn-success"><i class="fa fa-paste"></i><span class="bold">&nbsp;编辑</span></a>
                                    {/if}
                                    {/* 如果该角色为非超级用户并且登录用户有删除的权限 */}
                                    {if condition="!$role->is('admin') and $__user->can(['account_role_delete'])"}
                                    <button type="button" class="btn btn-sm btn-danger yele-js-btn-delete"><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                                    {/if}
                                </div>
                            </form>
                        </td>
                    </tr>
                    {/foreach}
                    {/* 如果登录用户有创建角色的权限 */}
                    {if condition="$__user->can(['account_role_create'])"}
                    <tr>
                        <td></td>
                        <td></td>
                        <td><a href="{:url('account/role/create')}" class="btn btn-sm btn-primary"><i class="fa fa-user-plus"></i><span class="bold">&nbsp;新建</span></a></td>
                    </tr>
                    {/if}
                </tbody>
            </table>
        </div>
        <div class="">
            {$roles->render()}
        </div>
    </div>
</div>
{/block}

{/* TODO: 合并CSS */}
{block name="css"}
    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
    {css href="/js/plugins/layer/skin/layer.css"}
{/block}

{/* TODO: 合并js */}
{block name="js"}
    {js href="/js/plugins/iCheck/icheck.min.js"}
    {js href="/js/plugins/chosen/chosen.jquery.js"}
    {js href="/js/plugins/layer/layer.min.js"}
    {js href="app.js"}
{/block}
