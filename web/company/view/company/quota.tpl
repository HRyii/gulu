{include file="company/header" /}
<style>
    .radio input[type=radio] {
        margin-top: 0;
        margin-left: -16px;
    }
</style>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">默认设置</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">个人设置</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                                <strong>设置每日补贴金额</strong>
                                <form method="get" class="form-horizontal">
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期一补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="mon_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期二补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="tue_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期三补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="wed_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期四补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="thu_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期五补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="fri_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期六补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="sat_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期日补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="sun_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit" style="width: 100px;">保存设置</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                                <strong>设置指定员工补贴金额</strong>
                                <form method="get" class="form-horizontal">
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">人员姓名</label>
                                        <div class="radio i-checks">
                                            <div class="checkbox i-checks">
                                                <label>
                                                  <input type="checkbox" value=""> <i></i> 小明</label>
                                                <label>
                                                      <input type="checkbox" value=""> <i></i> 小明</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期一补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="mon_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期二补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="tue_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期三补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="wed_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期四补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="thu_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期五补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="fri_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期六补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="sat_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">星期日补贴金额：</label>
                                        <div class="col-sm-5">
                                            <span class="ipt-box"><input class="ipt" type="text" id="account" name="sun_subsidy"></span><span class="gapl" style="margin-left:5px;">元</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit" style="width: 100px;">保存设置</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {include file="company/footer" /}
    <script>
        $(document).ready(function() {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>

</html>
