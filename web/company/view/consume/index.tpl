{extend name="../core/view/common/page.tpl" /}
{block name="title"}员工消费记录表{/block}
{block name="content"}
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>员工消费记录表</h5>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>人员姓名</th>
                                    <th>总金额</th>
                                    <th>消费金额</th>
                                    <th>补贴金额</th>
                                    <th>消费日期</th>
                                    <th>所在分组</th>
                                    <th>是否团餐</th>
                                    <th>是否自动订餐</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $order as $o }
                                {if condition="($o['user_id']==$o['uid'])"}
                                <tr>
                                    <td>{$o['username']}</td>
                                    <td>{$o['goods_amount']}</td>
                                    <td>{$o['pay_amount']}</td>
                                    <td>{$o['subsidy_amount']}</td>
                                    <td>{:date('Y-m-d',$o['update_time'])}</td>
                                    <td>{if condition="($o['usergroup'])"}{$o['usergroup']}{else/}无分组{/if}</td>
                                    <td>{if condition="($o['usergroup'])"}是{else/}否{/if}</td>
                                    <td>{if condition="!($o['is_set_meal']=='0')"}是{else/}否{/if}</td>
                                </tr>
                                {/if}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    {$order->render()}
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
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <style>
    .dataTables_filter{
        display: none;
    }
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
<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>



<script src="/js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- Data Tables -->
<script src="/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>


<!-- Page-Level Scripts -->
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
