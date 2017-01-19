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
            {foreach $company_group as $group }
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <!-- <h5 style="margin-left: 20px;">分组名称：{$group['name']}</h5> -->
                        <h5 style="margin-left: 20px;">分组申请人：{$group['username']}</h5>
                        <h5 style="margin-left: 200px;">申请时间：{:date('Y-m-d',$group['create_time'])}</h5>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>姓名</th>
                                    <th>加入时间</th>
                                    <th>是否通过</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $comuser as $user }
                                {if condition="($user['group_id']==$group['id'])"}
                                <tr>
                                    <td>{$user['username']}</td>
                                    <td class="text-navy">{:date('Y-m-d',$group['create_time'])}</td>
                                    <td class="footable-visible footable-last-column">{if condition="!($user['nickname']='0')"}<a><i class="fa fa-check text-navy"></i> 通过</a>{/if}</td>
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
{include file="company/footer" /}
</body>

</html>
