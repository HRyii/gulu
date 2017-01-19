{include file="company/header" /}
<style>
 .radio input[type=radio]{
    margin-top: 0;
    margin-left: -16px;
 }
 input{
     padding-left: 5px;
 }
 </style>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="tabs-container">
                    <div class="tab-content">
                        <div id="tab-2" class="tab-pane active">
                            <div class="panel-body">
                                <strong>设置指定员工补贴金额</strong>
                                <form method="post" class="form-horizontal">
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">人员姓名</label>
                                      <div class="radio i-checks">
                                          <label>
                                              <input type="radio" value="{$user['id']}" name="user_id" checked=""> <i></i> {$user['username']}
                                          </label>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期一补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="mon_subsidy" value="{$quota['mon_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期二补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="tue_subsidy" value="{$quota['tue_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期三补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="wed_subsidy" value="{$quota['wed_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期四补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="thu_subsidy" value="{$quota['thu_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期五补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="fri_subsidy" value="{$quota['fri_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期六补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="sat_subsidy" value="{$quota['sat_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期日补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="sun_subsidy" value="{$quota['sun_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
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
</body>

</html>
