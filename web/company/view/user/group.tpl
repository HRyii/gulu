{extend name="../core/view/common/page.tpl" /}
{block name="title"}人员分组{/block}
{block name="content"}
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            {foreach $companyGroup as $group }
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5 style="margin-left: 20px;">分组申请人：{$group['username']}</h5>
                        <h5 style="margin-left: 150px;">分组名：{$group['name']}</h5>
                        <h5 style="margin-left: 150px;">申请时间：{:date('Y-m-d',$group['create_time'])}</h5>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-hover table-bordered gulu-js-group">
                            <thead>
                                <tr>
                                    <th>姓名</th>
                                    <th>加入时间</th>
                                    <th>是否通过</th>
                                    <th>迁移分组</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $comuser as $user }
                                {if condition="($user['group_id']==$group['id'])"}
                                <tr>
                                    <td>{$user['username']}</td>
                                    <td class="text-navy">{:date('Y-m-d',$group['create_time'])}</td>
                                    <td class="footable-visible footable-last-column">{if condition="($user['status'] == 0)"}<a style="    color: #ed5565;"><i class="fa fa-close text-navy" style="color: #ed5565;"></i> 不通过</a>{else/} <a><i class="fa fa-check text-navy"></i> 通过</a>{/if}</td>
                                    <td>
                                        <select class="" name="group_id" data-id="{$user['id']}">
                                            {foreach $companyGroup as $groups }
                                            <option value="{$groups['id']}" name="group_id" {if condition="$groups['id']== $user['group_id']"}selected{/if}>{$groups['name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                    <td>
                                        <form action="{:url('company/user/groupusercheck', ['id' => $user['id']])}" method="post" >
                                            {if condition="($user['status'] == 0)"}
                                            <button type="button" class="btn btn-sm btn-info gulu-js-group-checked"><i class="fa fa-check-circle"></i><span class="bold">&nbsp;审核</span></button>
                                            {/if}
                                        </form>
                                        <form action="{:url('company/user/delgroupuser', ['id' => $user['id']])}" method="post" >
                                            <button type="button" class="btn btn-sm btn-danger gulu-js-groupuser-delete"><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                                        </form>
                                    </td>
                                </tr>
                                {/if}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
    {/block}
    {/* TODO: 合并CSS */}
    {block name="css"}
    {css href="/css/plugins/toastr/toastr.min.css"}

    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
    {css href="/js/plugins/layer/skin/layer.css"}
    <style>
        th,td{
            text-align: center !important;
        }
    </style>
    {/block}
{/* TODO: 合并js */}
{block name="js"}
{js href="/js/plugins/toastr/toastr.min.js"}
{js href="/js/plugins/validate/jquery.validate.min.js"}
{js href="/js/plugins/validate/messages_zh.min.js"}
{js href="/js/demo/form-validate-demo.js"}
{js href="/js/plugins/iCheck/icheck.min.js"}
{js href="/js/plugins/chosen/chosen.jquery.js"}
{js href="/js/plugins/layer/layer.min.js"}
{js href="app.js"}
{js href="admin.js"}
{/block}
