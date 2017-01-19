{extend name="../core/view/common/page.tpl" /}
{block name="title"}商品仓库
<ol class="breadcrumb" style="font-size:14px; margin-top:10px;">
            <li><a href="/goods/store/index">商品仓库列表</a></li>
            <li><strong>添加仓库</strong></li>
        </ol>
{/block}
{block name="right-header"}
<div class="title-action">
    <a href="{:url('goods/store/Index')}" class="btn btn-info">返回列表</a>
</div>
{/block}
{block name="css"}
<style>
    td,th {
        text-align: center;
    }
    .logo{
        width: 50px;
        border-radius: 50%;
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
                    <h5>添加仓库 <small></small></h5>
                </div>
                <div class="ibox-content">
                    <form action="{:url('goods/store/create')}" method="post" class="form-horizontal" id="commentForm">
                      <div class="form-group">
                          <label class="col-sm-2 control-label">仓库名称</label>
                        <div class="col-sm-4">
                          <input type="text" placeholder="请输入仓库名称" class="form-control" name="name" required="" aria-required="true">
                        </div>
                      </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">保存内容</button>
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
