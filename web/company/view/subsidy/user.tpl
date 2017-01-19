{extend name="../core/view/common/page.tpl" /}
{block name="title"}员工各人配额设置{/block}
{block name="right-header"}
<!-- <div class="title-action">
    <a href="{:url('company/subsidy/usercreate')}" class="btn btn-danger">员工各人配额设置</a>
    <a href="{:url('company/subsidy/companyset')}" class="btn btn-info">默认公司配额设置</a>
</div> -->
{/block}
{block name="content"}
<body class="gray-bg">
    {present name='error'}
    <div class="alert alert-error alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        {$error['text']}
    </div>
    {/present}
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
                                      <div class="icheck i-checks">
                                          {foreach $companyUser as $user}
                                          <label style="margin-left:10px;margin-top: 6px;">
                                              <input type="checkbox" value="{$user['user_id']}" name="user_id"> <i></i> {$user['username']}
                                          </label>
                                          {/foreach}
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期一补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="mon_subsidy" value="{$company['mon_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期二补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="tue_subsidy" value="{$company['tue_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期三补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="wed_subsidy" value="{$company['wed_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期四补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="thu_subsidy" value="{$company['thu_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期五补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="fri_subsidy" value="{$company['fri_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期六补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="sat_subsidy" value="{$company['sat_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
                                      </div>
                                  </div>
                                  <div class="hr-line-dashed"></div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">星期日补贴金额：</label>
                                      <div class="col-sm-5">
                                          <span class="ipt-box"><input class="ipt" type="text" id="account" name="sun_subsidy" value="{$company['sun_subsidy']}"></span><span class="gapl" style="margin-left:5px;">元</span>
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
    {/block}
    {/* TODO: 合并CSS */}
    {block name="css"}
    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
    {css href="/css/plugins/toastr/toastr.min.css"}
    {css href="/js/plugins/layer/skin/layer.css"}
    <style>
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
{/block}
