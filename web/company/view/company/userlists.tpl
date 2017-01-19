{include file="company/header" /}
<style>
    td,
    th {
        text-align: center;
    }
</style>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>消费记录</h5>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-hover table-bordered">
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
                                    <td>{if condition="($o['usergroup'])"}"{$o['usergroup']}"的分组{else/}无分组{/if}</td>
                                    <td>{if condition="($o['usergroup'])"}是{else/}否{/if}</td>
                                    <td>{if condition="!($o['is_set_meal']=='0')"}是{else/}否{/if}</td>
                                </tr>
                                {/if}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
{include file="company/footer" /}
</body>

</html>
