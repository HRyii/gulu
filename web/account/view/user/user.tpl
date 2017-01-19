{extend name="../core/view/common/page.tpl" /}

{block name="title"}账号详情{/block}

{block name="right-header"}
<div class="title-action">
    <a href="{:url('account/user/index')}" class="btn btn-info">返回列表</a>
</div>
{/block}

{block name="content"}
<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>{$account->username}详情</h5>
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
                        <li><a data-toggle="tab" href="#profile"><i class="fa fa-id-card"></i>个人资料</a></li>
                    </ul>
                </div>
            </div>

            <div class="panel-body">
                <form class="form-horizontal" action="{:url('account/user/update', ['id' => $account->id])}" method="post">
                    <div class="tab-content">
                        <div id="basic" class="tab-pane active">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value="{$account->username}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">账号状态</label>
                                <div class="col-sm-10">
                                    <select name="enabled" class="form-control">
                                        <option value="1" {if condition="$account->enabled == 1"}selected{/if}>启用</option>
                                        <option value="0" {if condition="$account->enabled == 0"}selected{/if}>禁用</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色分配</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="为该账号分配角色" name="roles[]" class="form-control chosen-select" multiple>
                                        {foreach $roles as $role}
                                        <option value="{$role->id}" {if condition="$account->hasRole($role->id)"}selected{/if}>{$role->display_name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div id="profile" class="tab-pane">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="profile[name]" value="{$account->profile ? $account->profile->name : ''}" placeholder="真实姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                    <input type="radio" name="profile[gender]" value="男" {if condition="$account->profile and $account->profile->gender === '男'"}checked{/if}><label>男</label>
                                    <input type="radio" name="profile[gender]" value="女" {if condition="$account->profile and $account->profile->gender === '女'"}checked{/if}><label>女</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">生日</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="profile[birthday]" value="{$account->profile ? $account->profile->birthday : ''}" placeholder="1970-01-01">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">手机号码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="profile[cellphone]" value="{$account->profile ? $account->profile->cellphone : ''}" placeholder="11位手机号码">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label class="col-sm-2 control-label">微信</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="profile[wechat]" value="{$account->profile ? $account->profile->wechat : ''}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">QQ</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="profile[qq]" value="{$account->profile ? $account->profile->qq : ''}">
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div>

        </div>
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
{/block}
