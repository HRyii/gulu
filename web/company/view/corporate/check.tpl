{extend name="../core/view/common/page.tpl" /}
{block name="title"}公司申请列表{/block}
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
                        <h5>公司申请列表</h5>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example gulu-js-company-list">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="i-checks gulu-js-check-all"></input>全选</th>
                                    <th>编号</th>
                                    <th>公司LOGO</th>
                                    <th>公司名称</th>
                                    <th>公司所在地</th>
                                    <th>公司地址</th>
                                    <th>负责人</th>
                                    <th>手机号码</th>
                                    <th>公司人数</th>
                                    <th>营业执照号</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $company as $companys }
                                <tr>
                                    <td>
                                    <input type="checkbox"  data-id="{$companys['id']}" class="i-checks gulu-js-check"></input>
                                    </td>
                                    <td>{$companys['number']}</td>
                                    <td class="text-navy"><img src="{$companys['logo']}" class="logo J_preview" data-bimg="{$companys['logo']}" style="width: 80px;"></td>
                                    <td>{$companys['name']}</td>
                                    <td>{$companys['districtname']}</td>
                                    <td>{$companys['address']}</td>
                                    <td>{$companys['charger']}</td>
                                    <td>{$companys['charger_phone']}</td>
                                    <td>{$companys['people']}</td>
                                    <td>{$companys['business_number']}</td>
                                    <td style="margin: 0 auto;width: 280px;">
                                    <div style="margin: 0 auto;">
                                        {if condition="($companys['status'] == 0)"}
                                        <form action="{:url('company/corporate/checkout', ['id' => $companys['id']])}" method="post">
                                            <div class="form-group">
                                                <button type="button" class="btn btn-sm btn-primary btn-info gulu-js-btn-check" style="margin-left:5px;"><i class="fa fa-check-circle"></i><span class="bold">&nbsp;审核</span></button>
                                            </div>
                                        </form>
                                        {/if}
                                        <form action="{:url('company/corporate/delete', ['id' => $companys['id']])}" method="post">
                                            <button type="button" class="btn btn-sm btn-danger gulu-js-btn-delete"><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                                        </form>
                                    </div>
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
    <style>
    .dataTables_paginate,.dataTables_length,.dataTables_info,.dataTables_filter{
        display: none;
    }
    .search{
        border: 1px solid #ffbe7a;
        zoom: 1;
        background: #fffced;
    }
    .brand{
        width:90px;line-height:30px;padding-right: 0px;padding-left: 0px;text-align:center;color: #fff;font-size: 13px;
    }
    .brandd{
        width:6%;padding-right: 0px;padding-left: 0px;float: left;text-align: center;
    }
    .status{
        width:4%;padding-right: 0px;padding-left: 0px;float: left;text-align: center;
    }
        td,th {
            text-align: center;
        }
        .logo{
            border-radius: 10%;
        }
        .ibox-title .label {
            background-color: #1c84c6;
            color: #fff;
            font-size: 10px;
            font-weight: 1;
            padding: 9px 8px !important;
            text-shadow: none;
        }
        .form-group {
             margin-bottom: 0;
        }
        .table {
        width: 100%;
        max-width: 100%;
         margin-bottom: 0;
        }
        .alert-error {
            color: #f9f9f9;
            background-color: #ed5565;
            border-color: #ed5565;
        }
    </style>
        {css href="/css/plugins/iCheck/custom.css"}
        {css href="/css/plugins/chosen/chosen.css"}
        {css href="/css/plugins/toastr/toastr.min.css"}
        {css href="/js/plugins/layer/skin/layer.css"}
    {/block}
    {/* TODO: 合并js */}
    {block name="js"}
    <script src="/js/plugins/jeditable/jquery.jeditable.js"></script>

    <!-- Data Tables -->
    <script src="/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/js/plugins/dataTables/dataTables.bootstrap.js"></script>
        {js href="/js/plugins/iCheck/icheck.min.js"}
        {js href="/js/plugins/chosen/chosen.jquery.js"}
        {js href="/js/plugins/toastr/toastr.min.js"}
        {js href="/js/plugins/layer/layer.min.js"}
        {js href="app.js"}
        {js href="admin.js"}
        <script>
            $(document).ready(function () {
                $('.dataTables-example').dataTable();

                /* Init DataTables */
                var oTable = $('#editable').dataTable();

                /* Apply the jEditable handlers to the table */
                oTable.$('td').editable('../example_ajax.php', {
                    "callback": function (sValue, y) {
                        var aPos = oTable.fnGetPosition(this);
                        oTable.fnUpdate(sValue, aPos[0], aPos[1]);
                    },
                    "submitdata": function (value, settings) {
                        return {
                            "row_id": this.parentNode.getAttribute('id'),
                            "column": oTable.fnGetPosition(this)[2]
                        };
                    },

                    "width": "90%",
                    "height": "100%"
                });


            });

            function fnClickAddRow() {
                $('#editable').dataTable().fnAddData([
                    "Custom row",
                    "New row",
                    "New row",
                    "New row",
                    "New row"]);

            }
        </script>
    {/block}
