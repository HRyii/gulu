{extend name="../core/view/common/page.tpl" /}
{block name="title"}商品品牌
<ol class="breadcrumb" style="font-size:14px; margin-top:10px;">
            <li><a href="/goods/brand/index">商品品牌</a></li>
            <li><strong>修改商品品牌</strong></li>
        </ol>
{/block}
{block name="right-header"}
<div class="title-action">
    <a href="{:url('goods/brand/Index')}" class="btn btn-info">返回列表</a>
</div>
{/block}
{block name="css"}
<style>
    td,th {
        text-align: center;
    }
    .label {
    color: #fff;
    font-size: 14px;
    font-weight: 600;
    padding: 5px 10px;
    text-shadow: none;
}
.form-group {
     margin-bottom: 0;
}
</style>
{/block}
{block name="content"}
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>修改品牌 <small></small></h5>
                </div>
                <div class="ibox-content">
                    <form action="{:url('goods/brand/update', ['id' => $brand['id']])}" enctype="multipart/form-data" method="post" class="form-horizontal" id="commentForm">
                      <div class="form-group">
                          <label class="col-sm-2 control-label">品牌名称</label>
                        <div class="col-sm-4">
                          <input type="text" placeholder="请输入仓库名称" class="form-control" name="name" value="{$brand['name']}" required="" aria-required="true">
                        </div>
                      </div>
                      <div class="hr-line-dashed"></div>
                      <div class="form-group">
                          <label class="col-sm-2 control-label">品牌LOGO</label>
                        <div class="col-sm-4">
                          <img src="{$brand['logo']}" alt="" class="logo J_preview" data-bimg="{$brand['logo']}" style="width: 100px;margin-bottom:10px;">
                          <input type="file" name="logo">
                        </div>
                      </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary " type="submit"><i class="fa fa-check"></i>&nbsp;提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{/block}
{block name="js"}
    {js href="/js/plugins/validate/jquery.validate.min.js"}
    {js href="/js/plugins/validate/messages_zh.min.js"}
    {js href="/js/demo/form-validate-demo.js"}
{/block}
