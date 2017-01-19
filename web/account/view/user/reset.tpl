{extend name="../core/view/common/page.tpl" /}

{block name="title"}重置密码{/block}

{block name="content"}
<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>为[{$account->username}]重置密码</h5>
        <div class="ibox-tools">
        </div>
    </div>
    <div class="ibox-content">
        <form class="form-horizontal" action="{:url('account/user/reset', ['id' => $account->id])}" method="post">
            <div class="form-group">
                <label class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-10">
                    <input type="password" name="password" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-10">
                    <input type="password" name="confirm_password" class="form-control">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <button type="submit" class="btn btn-primary">重置</button>
        </form>
    </div>
</div>
{/block}
