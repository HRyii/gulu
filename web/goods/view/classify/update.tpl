{extend name="../core/view/common/page.tpl" /}
{block name="title"}商品分类
<ol class="breadcrumb" style="font-size:14px; margin-top:10px;">
            <li><a href="/goods/classify/index">商品分类列表</a></li>
            <li><strong>修改分类</strong></li>
        </ol>
{/block}
{block name="right-header"}
<div class="title-action">
    <a href="{:url('goods/classify/Index')}" class="btn btn-info">返回列表</a>
</div>
{/block}
{block name="css"}
{css href="/css/bootstrap.min.css"}
{css href="/css/font-awesome.css"}
{css href="/css/plugins/iCheck/custom.css"}
{css href="/css/animate.css"}
{css href="/css/style.css"}
{css href="/css/plugins/datapicker/datepicker3.css"}
{css href="/css/plugins/markdown/bootstrap-markdown.min.css"}
<style>
    td,
    th {
        text-align: center;
    }

    .logo {
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
                    <h5>修改分类 <small></small></h5>
                </div>
                <div class="ibox-content">
                    <form action="{:url('goods/Classify/update',['id' => $result['id']])}" method="post" class="form-horizontal" id="commentForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">上级分类</label>
                            <div class="col-sm-4 control-select">
                                <div class="tree well yele-js-classify-list" style="padding: 0;background-color:#fff;">
                                    <ul style="margin: 0px 0px 10px 15px;">
                                        {$category}
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">分类名称</label>
                            <div class="col-sm-4">
                                <input type="text" placeholder="请输入分类名称" class="form-control" name="name" value="{$result['name']}" required="" aria-required="true">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">排序</label>
                            <div class="col-sm-4">
                                <input type="text" placeholder="请输入排序" class="form-control" name="sort"  value="{$result['sort']}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否显示</label>
                            <div class="radio i-checks">
                                <label>
                                  <input type="radio" value="1" name="display" {if condition="$result['display'] == 1"}checked=""{/if}> <i></i> 是
                              </label>
                                <label>
                                  <input type="radio" value="0" {if condition="$result['display'] == 0"}checked=""{/if} name="display"> <i></i> 否
                              </label>
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
{/* TODO: 合并CSS */}
{block name="css"}
<style>
.breadcrumb{
    background-color: #fff !important;
}
.radio{
    padding-left: 0 !important;
}
input[type="text"]{
    padding: 18px !important;
    border-radius: 3px !important;
}
.radio label{
    float: left !important;
}
.ibox-content{
    border: 0;
}
.tree{
        border: 1px solid #ccc !important;
}
</style>
    {css href="/css/plugins/iCheck/custom.css"}
    {css href="/css/plugins/chosen/chosen.css"}
    {css href="/css/plugins/toastr/toastr.min.css"}
    {css href="/js/plugins/jquerytree/css/bootstrap.min.css"}
    {css href="/js/plugins/jquerytree/css/style.css"}
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
    <script>
    $(function(){

        $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '');

        $('.tree li.parent_li > span').on('click', function (e) {

            var children = $(this).parent('li.parent_li').find(' > ul > li');

            if (children.is(":visible")) {

                children.hide('fast');

                $(this).attr('title', '').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');

            } else {

                children.show('fast');

                $(this).attr('title', '').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');

            }

            e.stopPropagation();

        });
    // $('.tree li.parent_li > span').trigger("click");
    });
    </script>
{/block}
