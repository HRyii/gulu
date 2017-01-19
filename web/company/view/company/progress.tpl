{include file="company/header" /}
<style>
    .city {
        width: 20%;
    }

    .company {
        margin-bottom: 15px;
        float: left;
        width: 45%;
        margin-left: 5%;
    }

    .wizard>.steps>ul>li {
        width: 33%;
    }
    .dl-horizontal dt{
        font-size: 14px;
    }
    .dl-horizontal dd{
        font-size: 14px;
    }
    .dl-horizontal dt,.dl-horizontal dd{
        height: 25px;
    line-height: 25px;

    }
</style>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper wrapper-content animated fadeInUp">
                    <div class="ibox">
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="m-b-md">
                                        <a href="{:url('company/company/company_edit', ['companyid' =>$company['id'] ])}" class="btn btn-white btn-xs pull-right">编辑</a>
                                        <h2>公司名称 ： {$company->name}</h2>
                                    </div>
                                    <dl class="dl-horizontal">
                                        <dt>状态：</dt>
                                        <dd><span class="label label-primary" style="font-size: 12px;">{if condition="!($company['status']='0')"}已审核{else/}待审核{/if}</span>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-5">
                                    <dl class="dl-horizontal">
                                        <dt>公司负责人：</dt>
                                        <dd>{$company->charge}</dd>
                                        <dt>公司人数：</dt>
                                        <dd>{$company->people} 人</dd>
                                        <dt>负责人电话：</dt>
                                        <dd>{$company->charge_phone}</dd>
                                        <dt>公司地址：</dt>
                                        <dd>{$company->address}</dd>
                                        <dt>公司营业执照号：</dt>
                                        <dd>{$company->business_number}</dd>
                                    </dl>
                                </div>
                                <div class="col-sm-7" id="cluster_info">
                                    <dl class="dl-horizontal">
                                        <dt>申请时间：</dt>
                                        <dd>{:date('Y-m-d',$company['create_time'])}</dd>
                                        <dt>申请人：</dt>
                                        <dd>{$company->username}</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <dl class="dl-horizontal">
                                        <dt>当前进度</dt>
                                        <dd>
                                            <div class="progress progress-striped active m-b-sm">
                                                <div class="progress-bar" style="width: {if condition="!($company['status']='0')"}100%{else/}50%{/if};"></div>
                                            </div>
                                            <small>当前已完成审核总进度的 <strong>{if condition="!($company['status']='0')"}100%{else/}50%{/if}</strong></small>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
{include file="company/footer" /}
</body>

</html>
