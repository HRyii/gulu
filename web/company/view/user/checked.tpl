{extend name="../core/view/common/page.tpl" /}
{block name="title"}人员列表{/block}
{block name="content"}
<body class="gray-bg">
    {present name='error'}
    <div class="alert alert-error alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        {$error['text']}
    </div>
    {/present}
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title" style="padding: 16px;min-height: 60px;">
                        <h5>人员列表</h5>
                        <button type="button" class="btn btn-sm btn-info pull-right gulu-js-btn-checked-all" disabled style=" padding:7px;margin-left:5px;"><i class="fa fa-trash"></i><span class="bold">&nbsp;审核</span></button>
                        <button type="button" class="btn btn-sm btn-danger pull-right gulu-js-btn-delete-all" disabled style=" padding:7px;margin-left:5px;"><i class="fa fa-trash" ></i><span class="bold">&nbsp;删除</span></button>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-hover table-bordered gulu-user-list">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="i-checks gulu-js-check-all"></input>全选</th>
                                    <th>人员姓名</th>
                                    <th>加入时间</th>
                                    <th>通过时间</th>
                                    <th>是否通过</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $quota as $user }
                                <tr>
                                    <td>
                                    <input type="checkbox"  data-id="{$user['id']}" class="i-checks gulu-js-check"></input>
                                    </td>
                                    <td>{$user['name']}</td>
                                    <td>{:date('Y-m-d',$user['apply_time'])}</td>
                                    <td>{:date('Y-m-d',$user['pass_time'])}</td>
                                    <td class="footable-visible footable-last-column">{if condition="($user['status'] == 0)"}<a style="    color: #ed5565;"><i class="fa fa-close text-navy" style="color: #ed5565;"></i> 不通过</a>{else/} <a><i class="fa fa-check text-navy"></i> 通过</a>{/if}</td>
                                    <td>
                                        <form action="{:url('company/user/check', ['id' => $user['id']])}" method="post" >
                                            {if condition="($user['status'] == 0)"}
                                            <button type="button" class="btn btn-sm btn-info gulu-js-btn-checked"><i class="fa fa-check-circle"></i><span class="bold">&nbsp;审核</span></button>
                                            {/if}
                                        </form>
                                        <form action="{:url('company/user/delete', ['id' => $user['id']])}" method="post">
                                            <button type="button" class="btn btn-sm btn-danger gulu-js-btn-delete"><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                                        </form>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
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
    <style>
        input{
            padding-left: 10px;
        }
        .ipt-box{
            float: left;
        }
        .gapl{
            margin-left: 5px;
            float: left;
            height: 30px;
            line-height: 30px;
        }
        td,th{
            text-align: center !important;
        }
    </style>
    {/block}
{/* TODO: 合并js */}
{block name="js"}
{js href="/js/plugins/validate/jquery.validate.min.js"}
{js href="/js/plugins/validate/messages_zh.min.js"}
{js href="/js/demo/form-validate-demo.js"}
{js href="/js/plugins/iCheck/icheck.min.js"}
{js href="/js/plugins/chosen/chosen.jquery.js"}
{js href="/js/plugins/toastr/toastr.min.js"}
{js href="/js/plugins/layer/layer.min.js"}
{js href="app.js"}
{js href="admin.js"}
{/block}
