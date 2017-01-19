{include file="company/header" /}
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
        margin-top: 55px;
    }

    td,
    th {
        text-align: center;
    }

    .com p {
        line-height: 21px;
    }
</style>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-3">
                <div class="widget style1">
                    <div class="row">
                        <div class="col-xs-4 text-center">
                            <i class="fa fa-trophy fa-5x"></i>
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
                            <i class="fa fa-cloud fa-5x"></i>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span> 今日温度 </span>
                            <h2 class="font-bold">26'C</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="widget style1 red-bg">
                    <div class="row">
                        <div class="col-xs-4">
                            <i class="fa fa-bell fa-4x"></i>
                        </div>
                        <div class="col-xs-8 text-right">
                            <span> 新消息 </span>
                            <h2 class="font-bold">260</h2>
                            <h2 class="font-bold"></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="widget lazur-bg no-padding">
                    <div class="p-m">
                        <h1 class="m-xs" style="margin:4px;">&yen; 210,660</h1>

                        <h3 class="font-bold no-margins" style="font-size:14px;">
                            月支出
                        </h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div>
                            <span class="pull-right text-right">
                                        <small>在过去的一个月销售的平均值：<strong>{$company->name}</strong></small>
                                            <br>
                                            所有销售： 162,862
                                        </span>
                            <h3 class="font-bold no-margins">
                                        半年收入利润率
                                    </h3>
                            <small>市场部</small>
                        </div>

                        <div class="m-t-sm">

                            <div class="row">
                                <div class="col-md-8">
                                    <div>
                                        <canvas id="lineChart" height="175" width="463" style="width: 463px; height: 175px;"></canvas>
                                    </div>
                                </div>
                                <div class="col-md-4">
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

                        <div class="m-t-md">
                            <small class="pull-right">
                                        <i class="fa fa-clock-o"> </i>
                                        2015.02.30更新
                                    </small>
                            <small>
                                        <strong>说明：</strong> 本期销售额比上期增长了23%。
                                    </small>
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
                            <p><i class="fa fa-send-o"></i> 所属地区：<span>{$company->district_id}</span></p>
                            <p><i class="fa fa-map-marker"></i> 公司地址：<span>{$company->address}</span></p>
                            <p><i class="fa fa-group"></i> 公司人数：<span>{$company->people} 人</span></p>
                            <p><i class="fa fa-user"></i> 公司负责人：<span>{$company->charge}</span></p>
                            <p><i class="fa fa-mobile"></i> 公司负责人手机号码：<span>{$company->charge_phone}</span></p>
                            <p><i class="fa fa-key"></i> 公司营业执照号：<span>{$company->business_number}</span></p>
                            <p><i class="fa fa-calendar-check-o"></i> 送餐时间：<span>11:30-13:00</span></p>
                            <p><i class="fa fa-cog"></i> 送餐方式：<span>盒装</span></p>
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
        <script>
            $(document).ready(function() {


                var d1 = [
                    [1262304000000, 6],
                    [1264982400000, 3057],
                    [1267401600000, 20434],
                    [1270080000000, 31982],
                    [1272672000000, 26602],
                    [1275350400000, 27826],
                    [1277942400000, 24302],
                    [1280620800000, 24237],
                    [1283299200000, 21004],
                    [1285891200000, 12144],
                    [1288569600000, 10577],
                    [1291161600000, 10295]
                ];
                var d2 = [
                    [1262304000000, 5],
                    [1264982400000, 200],
                    [1267401600000, 1605],
                    [1270080000000, 6129],
                    [1272672000000, 11643],
                    [1275350400000, 19055],
                    [1277942400000, 30062],
                    [1280620800000, 39197],
                    [1283299200000, 37000],
                    [1285891200000, 27000],
                    [1288569600000, 21000],
                    [1291161600000, 17000]
                ];

                var data1 = [{
                    label: "数据1",
                    data: d1,
                    color: '#17a084'
                }, {
                    label: "数据2",
                    data: d2,
                    color: '#127e68'
                }];
                $.plot($("#flot-chart1"), data1, {
                    xaxis: {
                        tickDecimals: 0
                    },
                    series: {
                        lines: {
                            show: true,
                            fill: true,
                            fillColor: {
                                colors: [{
                                    opacity: 1
                                }, {
                                    opacity: 1
                                }]
                            },
                        },
                        points: {
                            width: 0.1,
                            show: false
                        },
                    },
                    grid: {
                        show: false,
                        borderWidth: 0
                    },
                    legend: {
                        show: false,
                    }
                });

                var lineData = {
                    labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月"],
                    datasets: [{
                        label: "示例数据",
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: [65, 59, 40, 51, 36, 25, 40]
                    }, {
                        label: "示例数据",
                        fillColor: "rgba(26,179,148,0.5)",
                        strokeColor: "rgba(26,179,148,0.7)",
                        pointColor: "rgba(26,179,148,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(26,179,148,1)",
                        data: [48, 48, 60, 39, 56, 37, 30]
                    }]
                };

                var lineOptions = {
                    scaleShowGridLines: true,
                    scaleGridLineColor: "rgba(0,0,0,.05)",
                    scaleGridLineWidth: 1,
                    bezierCurve: true,
                    bezierCurveTension: 0.4,
                    pointDot: true,
                    pointDotRadius: 4,
                    pointDotStrokeWidth: 1,
                    pointHitDetectionRadius: 20,
                    datasetStroke: true,
                    datasetStrokeWidth: 2,
                    datasetFill: true,
                    responsive: true,
                };


                var ctx = document.getElementById("lineChart").getContext("2d");
                var myNewChart = new Chart(ctx).Line(lineData, lineOptions);

            });
        </script>
</body>

</html>
