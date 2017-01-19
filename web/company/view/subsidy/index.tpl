{extend name="../core/view/common/page.tpl" /}
{block name="title"}员工每日补贴金额列表{/block}
{block name="right-header"}
<!-- <div class="title-action">
    <a href="{:url('company/subsidy/usercreate')}" class="btn btn-info">员工各人配额设置</a>
    <a href="{:url('company/subsidy/companyset')}" class="btn btn-info">默认公司配额设置</a>
    <a href="{:url('company/subsidy/companyset')}" class="btn btn-danger">员工每日补贴金额列表</a>
</div> -->
{/block}
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
                    <div class="ibox-title">
                        <h5>员工每日补贴金额列表</h5>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-hover table-bordered gulu-subsidy-list">
                            <thead>
                                <tr>
                                    <th>人员姓名</th>
                                    <th>星期一补贴金额(元)</th>
                                    <th>星期二补贴金额(元)</th>
                                    <th>星期三补贴金额(元)</th>
                                    <th>星期四补贴金额(元)</th>
                                    <th>星期五补贴金额(元)</th>
                                    <th>星期六补贴金额(元)</th>
                                    <th>星期日补贴金额(元)</th>
                                    <th>是否关闭补贴</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $quota as $key =>$user }
                                <tr>
                                    <td>{$user['name']}</td>
                                    <td>{$user['mon_subsidy']}</td>
                                    <td>{$user['tue_subsidy']}</td>
                                    <td>{$user['wed_subsidy']}</td>
                                    <td>{$user['thu_subsidy']}</td>
                                    <td>{$user['fri_subsidy']}</td>
                                    <td>{$user['sat_subsidy']}</td>
                                    <td>{$user['sun_subsidy']}</td>
                                    <td>
                                        <div class="switch" style=" width: 60px; margin: 0 auto;">
                                            <div class="onoffswitch" style="width:60px;">
                                                <input type="checkbox" data-id="{$user['id']}"  class="onoffswitch-checkbox" id="example{$key}" name="enable" {if condition="$user['enable'] == 1"}checked{/if}>
                                                <label class="onoffswitch-label" for="example{$key}">
                                                    <span class="onoffswitch-inner"></span>
                                                    <span class="onoffswitch-switch"></span>
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="{:url('company/subsidy/update', ['id' =>$user['id'] ])}" class="btn btn-sm btn-success"><i class="fa fa-paste"></i><span class="bold">&nbsp;编辑</span></a>
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
    {css href="/css/plugins/toastr/toastr.min.css"}
    {css href="/css/plugins/switchery/switchery.css"}
    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
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
{js href="/js/plugins/switchery/switchery.js"}
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
