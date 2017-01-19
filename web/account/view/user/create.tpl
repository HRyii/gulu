{extend name="../core/view/common/page.tpl" /}

{block name="title"}新建账号{/block}

{block name="right-header"}
<div class="title-action">
    <a href="{:url('account/user/index')}" class="btn btn-info">返回列表</a>
</div>
{/block}

{block name="content"}
<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>新建账号</h5>
        <div class="ibox-tools">
        </div>
    </div>
    <div class="ibox-content">
        <form class="form-horizontal" action="{:url('account/user/create')}" method="post">
            <div class="form-group {if condition="isset($error['username'])"}has-error{/if}">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    {/* TODO:用户名已存在 */}
                    <input type="text" name="username" class="form-control" placeholder="用于登录商家后台">
                    {if condition="isset($error['username'])"}
                    <span class="help-block">{$error['username']}</span>
                    {/if}
                </div>
            </div>
            <div class="form-group {if condition="isset($error['password'])"}has-error{/if}">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" name="password" class="form-control" placeholder="">
                    {if condition="isset($error['password'])"}
                    <span class="help-block">{$error['password']}</span>
                    {/if}
                </div>
            </div>
            <div class="form-group {if condition="isset($error['password_confirm'])"}has-error{/if}">
                <label class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-10">
                    <input type="password" name="password_confirm" class="form-control" placeholder="">
                    {if condition="isset($error['password_confirm'])"}
                    <span class="help-block">{$error['password_confirm']}</span>
                    {/if}
                </div>
            </div>
            <div class="form-group {if condition="isset($error['enabled'])"}has-error{/if}">
                <label class="col-sm-2 control-label">账号状态</label>
                <div class="col-sm-10">
                    <select name="enabled" class="form-control">
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                    {if condition="isset($error['enabled'])"}
                    <span class="help-block">{$error['enabled']}</span>
                    {/if}
                </div>
            </div>
            <div class="form-group {if condition="isset($error['roles'])"}has-error{/if}">
                <label class="col-sm-2 control-label">角色分配</label>
                <div class="col-sm-10">
                    <select data-placeholder="为该账号分配角色" name="roles[]" class="form-control chosen-select" multiple>
                        {foreach $roles as $role}
                        <option value="{$role->id}">{$role->display_name}</option>
                        {/foreach}
                    </select>
                    {if condition="isset($error['roles'])"}
                    <span class="help-block">{$error['roles']}</span>
                    {/if}
                </div>
            </div>
            {if condition="isset($error['__token__'])"}
            <div class="form-group has-error">
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <span class="help-block">
                        {$error['__token__']}
                    </span>
                </div>
            </div>
            {/if}
            <div class="hr-line-dashed"></div>
            <input type="hidden" name="__token__" value="{$Request.token}">
            <button type="submit" class="btn btn-primary">新建</button>
        </form>
    </div>
</div>
{/block}

{block name="css"}
    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
    {css href="/css/plugins/toastr/toastr.min.css"}
    {css href="/js/plugins/layer/skin/layer.css"}
{/block}

{block name="js"}
    {js href="/js/plugins/iCheck/icheck.min.js"}
    {js href="/js/plugins/chosen/chosen.jquery.js"}
    {js href="/js/plugins/toastr/toastr.min.js"}
    {js href="/js/plugins/layer/layer.min.js"}
    {js href="app.js"}
    {js href="validate.js"}
{/block}
