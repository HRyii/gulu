{extend name="../core/view/common/page.tpl" /}
{block name="title"}资金流水
{/block}
 {block name="css"}
<style>
     .radio input[type=radio]{
        margin-top: 0;
        margin-left: -16px;
     }
     .ibox-title {
        border-style: none;
    }
    td,th{
        text-align: center;
    }
 </style>
 {/block}
 {block name="content"}
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">收入</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">支出</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox float-e-margins">
                                            <div class="ibox-title">
                                                <h5>资金明细列表</h5>
                                            </div>
                                            <div class="ibox-content">

                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>入账时间</th>
                                                            <th>充值方式</th>
                                                            <th>收支类型</th>
                                                            <th>入账金额(元)</th>
                                                            <th>备注</th>
                                                            <th>操作人员</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {foreach $bill as $b }
                                                        <tr>
                                                            <td>{:date('Y-m-d',$b['create_time'])}</td>
                                                            <td>{$b['pay']}</td>
                                                            <td>收入</td>
                                                            <td>{$b['amount']}</td>
                                                            <td>{$b['remark']}</td>
                                                            <td>{$b['create_name']}</td>
                                                        </tr>
                                                        {/foreach}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox float-e-margins">
                                            <div class="ibox-title">
                                                <h5>补贴流水表</h5>
                                            </div>
                                            <div class="ibox-content">

                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>入账时间</th>
                                                            <th>充值方式</th>
                                                            <th>收支类型</th>
                                                            <th>入账金额(元)</th>
                                                            <th>备注</th>
                                                            <th>操作人员</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {foreach $subsidy as $s }
                                                        <tr>
                                                            <td>{:date('Y-m-d',$s['create_time'])}</td>
                                                            <td>{$s['pay']}</td>
                                                            <td>支出</td>
                                                            <td>{$s['amount']}</td>
                                                            <td>{$s['remark']}</td>
                                                            <td>{$s['create_name']}</td>
                                                        </tr>
                                                        {/foreach}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}
