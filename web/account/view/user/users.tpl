{extend name="../core/view/common/page.tpl" /}

{block name="title"}账号列表{/block}

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
                {if condition="$__user->can(['account_user_delete'])"}
                <button type="button" class="btn btn-sm btn-danger pull-right yele-js-btn-delete-all" disabled><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                {/if}
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped yele-js-accounts-list">
                <thead>
                    <tr>
                        <th><input type="checkbox" class="i-checks yele-js-check-all"></input>全选</th>
                        <th>用户名</th>
                        <th>角色</th>
                        <th>状态</th>
                        <th>动作</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $accounts as $account}
                    <tr>
                        <td>
                            {if condition="!$account->is('admin')"}
                            <input type="checkbox" data-id="{$account->id}" class="i-checks yele-js-check"></input>
                            {/if}
                        </td>
                        <td>{$account->username}</td>
                        <td><?php if (! empty($account->roles()->select())) { echo implode(',', array_map(function($role) { return $role->display_name; }, $account->roles()->select())); } else { echo '无';}?></td>
                        <td>
                            {if condition="!$account->is('admin') and $__user->can(['account_user_enable'])"}
                            <select name="enabled" data-id="{$account->id}">
                                <option value="1" {if condition="$account->enabled == 1"}selected{/if}>启用</option>
                                <option value="0" {if condition="$account->enabled == 0"}selected{/if}>禁用</option>
                            </select>
                            {else /}
                                {if condition="$account->enabled == 1"}启用{else /}禁用{/if}
                            {/if}
                        </td>
                        <td>
                            <form action="{:url('account/user/delete', ['id' => $account->id])}" method="post">
                                <div class="form-group">
                                    {/* 如果登录用户有编辑账号的权限 */}
                                    {if condition="$account->isnt('admin') and $__user->can(['account_user_update'])"}
                                    <a href="{:url('account/user/show', ['id' => $account->id])}" class="btn btn-sm btn-success"><i class="fa fa-paste"></i><span class="bold">&nbsp;编辑</span></a>
                                    {/if}

                                    {/* 如果登录用户有重置账号密码的权限 */}
                                    {if condition="($account->is('admin') and $__user->is('admin')) or ($account->isnt('admin') and $__user->can(['account_user_reset']))"}
                                    <a href="{:url('account/user/reset', ['id' => $account->id])}" class="btn btn-sm btn-warning"><i class="fa fa-key"></i><span class="bold">&nbsp;重置</span></a>
                                    {/if}

                                    {/* 如果登录用户有删除账号的权限 */}
                                    {if condition="!$account->is('admin') and $__user->can(['account_user_delete'])"}
                                    <button type="button" class="btn btn-sm btn-danger yele-js-btn-delete"><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                                    {/if}
                                </div>
                            </form>
                        </td>
                    </tr>
                    {/foreach}
                    {/* 如果登录用户有创建账号的权限 */}
                    {if condition="$__user->can(['account_user_create'])"}
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="{:url('account/user/create')}" class="btn btn-sm btn-primary"><i class="fa fa-user-plus"></i><span class="bold">&nbsp;新建</span></a></td>
                    </tr>
                    {/if}
                </tbody>
            </table>
        </div>
        <div class="">
            {$accounts->render()}
        </div>
    </div>
</div>
{/block}

{/* TODO: 合并CSS */}
{block name="css"}
    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
    {css href="/css/plugins/toastr/toastr.min.css"}
    {css href="/js/plugins/layer/skin/layer.css"}
{/block}

{/* TODO: 合并js */}
{block name="js"}
    {js href="/js/plugins/iCheck/icheck.min.js"}
    {js href="/js/plugins/chosen/chosen.jquery.js"}
    {js href="/js/plugins/toastr/toastr.min.js"}
    {js href="/js/plugins/layer/layer.min.js"}
    {js href="app.js"}
{/block}
