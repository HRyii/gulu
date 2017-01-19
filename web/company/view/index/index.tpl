{extend name="../core/view/common/page.tpl" /}
{block name="content"}
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-3">
                <div class="widget style1">
                    <div class="row">
                        <div class="col-xs-4 text-center">
                            <!-- <i class="fa fa-dollar fa-5x"></i> -->
                            <img src="/img/icons/bal.png" alt="" width="100%">
                        </div>
                        <div class="col-xs-8 text-right">
                            <span> 公司余额 </span>
                            <h2 class="font-bold">&yen; {$company->balance}</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="widget style1 navy-bg">
                    <div class="row">
                        <div class="col-xs-4">
                            <i class="fa fa-users fa-5x"></i>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span> 员工人数 </span>
                            <h2 class="font-bold">{$userCounts}</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="widget style1 lazur-bg">
                    <div class="row">
                        <div class="col-xs-4">
                            <i class="fa fa-bell fa-4x"></i>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span> 新消息 </span>
                            <h2 class="font-bold">0</h2>
                            <h2 class="font-bold"></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="widget lazur-bg no-padding red-bg">
                    <div class="p-m">
                        <h1 class="m-xs" style="margin:4px;">&yen; {$companyuser['total']}</h1>

                        <h3 class="font-bold no-margins" style="font-size:14px;">
                            员工补贴支出
                        </h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="m-t-sm">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div id="container" style="min-width:400px;height:400px"></div>
                                    <div class="col-md-4" style="display:none;">
                                        <ul class="stat-list m-t-lg">
                                            <li>
                                                <h2 class="no-margins">2,346</h2>
                                                <small>总订单</small>
                                                <div class="progress progress-mini">
                                                    <div class="progress-bar" style="width: 48%;"></div>
                                                </div>
                                            </li>
                                            <li>
                                                <h2 class="no-margins ">4,422</h2>
                                                <small>最近一个月订单</small>
                                                <div class="progress progress-mini">
                                                    <div class="progress-bar" style="width: 60%;"></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>公司信息</h5>
                        </div>
                        <div class="ibox-content com">
                            <p><i class="fa fa-circle-thin"></i> 公司编号：<span>{$company->number}</span></p>
                            <p><i class="fa fa-send-o"></i> 公司全称：<span>{$company->name}</span></p>
                            <p><i class="fa fa-send-o"></i> 所属地区：<span>{$company->districtname}</span></p>
                            <p><i class="fa fa-map-marker"></i> 公司地址：<span>{$company->address}</span></p>
                            <p><i class="fa fa-group"></i> 公司人数：<span>{$company->people} 人</span></p>
                            <p><i class="fa fa-user"></i> 负责人姓名：<span>{$company->charger}</span></p>
                            <p><i class="fa fa-mobile"></i> 负责人手机号码：<span>{$company->charger_phone}</span></p>
                            <p><i class="fa fa-key"></i> 公司营业执照号：<span>{$company->business_number}</span></p>
                            <p><i class="fa fa-calendar-check-o"></i> 送餐时间：<span>{$company->delivery_time}</span></p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row" style="display:none;">
                <div class="col-sm-6">
                    <div class="widget navy-bg no-padding">
                        <div class="p-m">
                            <h1 class="m-xs">&yen; 1,540</h1>

                            <h3 class="font-bold no-margins">
                            年收入
                        </h3>
                            <small>项目年收入</small>
                        </div>
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="flot-chart1"></div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="widget lazur-bg no-padding">
                        <div class="p-m">
                            <h1 class="m-xs">&yen; 210,660</h1>

                            <h3 class="font-bold no-margins">
                            月收入
                        </h3>
                            <small>项目年收入</small>
                        </div>
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="flot-chart2"></div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="widget yellw-bg no-padding">
                        <div class="p-m">
                            <h1 class="m-xs">&yen; 50,992</h1>

                            <h3 class="font-bold no-margins">
                            半年收入
                        </h3>
                            <small>市场销售额</small>
                        </div>
                        <div class="flot-chart">
                            <div class="flot-chart-content" id="flot-chart3"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>员工消费列表</h5>
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
<style>
    .widget.style1 h2 {
        font-size: 35px;
    }

    .ibox-content {
        background-color: #ffffff;
        color: inherit;
        padding: 15px 14px 9px 16px;
        border-color: #e7eaec;
        -webkit-border-image: none;
        -o-border-image: none;
        border-image: none;
        border-style: solid solid none;
        border-width: 1px 0px;
    }

    .m-t-md {
        margin-top: 80px;
    }
    td,
    th {
        text-align: center;
    }

    .com p {
        line-height: 30px;
    }
    .page-heading,.highcharts-credits,.highcharts-legend-item,.highcharts-legend{
        display: none;
    }
</style>
{css href="/css/plugins/iCheck/custom.css"}
{css href="/css/plugins/chosen/chosen.css"}
{css href="/css/plugins/toastr/toastr.min.css"}
{css href="/js/plugins/layer/skin/layer.css"}
{/block}
{/* TODO: 合并js */}
{block name="js"}
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/jquery-ui-1.10.4.min.js"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>
<!-- iCheck -->
<script src="/js/plugins/iCheck/icheck.min.js"></script>
<!-- Jvectormap -->
<script src="/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- Flot -->
<script src="/js/plugins/flot/jquery.flot.js"></script>
<script src="/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="/js/plugins/flot/jquery.flot.resize.js"></script>
<!-- ChartJS-->
<script src="/js/plugins/chartJs/Chart.min.js"></script>
<!-- Peity -->
<script src="/js/plugins/peity/jquery.peity.min.js"></script>
<!-- Peity demo -->
<script src="/js/demo/peity-demo.js"></script>
<script src="/js/plugins/highcharts/highcharts.js"></script>
<script src="/js/plugins/highcharts/exporting.js"></script>
<script>
$(function () {
    $('#container').highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: '近一周员工订餐表'
        },
        subtitle: {
            text: '{$company->name}'
        },
        xAxis: [{
            categories: ['昨天', ' 今日', '上周', '本周', '本月'],
            crosshair: true
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: '',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: '',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 100,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#333'
        },
        series: [{
            name: '订单数',
            type: 'column',
            yAxis: 1,
            data: [{$chart['yesterday']}, {$chart['today']}, {$chart['lastweek']}, {$chart['week']}, {$chart['month']}],
            tooltip: {
                valueSuffix: ''
            }
        }, {
            name: '订单数',
            type: 'spline',
            data: [{$chart['yesterday']}, {$chart['today']}, {$chart['lastweek']}, {$chart['week']}, {$chart['month']}],
            tooltip: {
                valueSuffix: ''
            }
        }]
    });
});

</script>
{/block}
