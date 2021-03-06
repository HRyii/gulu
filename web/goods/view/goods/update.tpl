{extend name="../core/view/common/page.tpl" /}
{block name="title"}修改商品
<ol class="breadcrumb" style="font-size:14px; margin-top:10px;">
            <li><a href="/goods/goods/index">商品列表</a></li>
            <li><strong>修改商品</strong></li>
        </ol>
{/block}
{block name="right-header"}
<div class="title-action">
    <a href="{:url('goods/goods/Index')}" class="btn btn-info">返回列表</a>
</div>
{/block}
{block name="content"}
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">商品基本信息</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">商品图设置</a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">库存及定价</a>
                        </li>
                    </ul>
                    <form method="post" class="form-horizontal" enctype="multipart/form-data" id="commentForm">
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                    <strong>商品基本信息</strong>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品名称</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" name="name" value="{$goods['name']}" required="" aria-required="true">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品编号</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" name="no" value="{$goods['no']}" required="" aria-required="true">
                                        </div>
                                    </div>

                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品分类</label>
                                        <div class="col-sm-4">
                                            <div class="tree well yele-js-classify-list" style="padding: 0;background-color:#fff;min-height:0 !important;">
                                                <ul style="padding: 0px;border: 1px #fff solid;">
                                                    {$GoodsClass}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品品牌</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="brand_id" data-placeholder="选择商品品牌">
                                                {foreach $GoodsBrand as $GoodsBrand}
                                                    <option name="brand_id" {if condition="$goods['brand_id']== $GoodsBrand['id']"}selected{/if} value="{$GoodsBrand['id']}">{$GoodsBrand['name']}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品状态</label>
                                        <div class="radio i-checks">
                                            <label>
                                                    <input type="radio" value="1" {if condition="$goods['status']== 1"}checked=""{/if} name="status" > <i></i> 上架
                                                </label>
                                            <label>
                                                    <input type="radio" value="2" {if condition="$goods['status']== 2"}checked=""{/if} name="status"> <i></i> 下架
                                                </label>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">是否可见</label>
                                        <div class="radio i-checks">
                                            <div class="radio i-checks">
                                                <label>
                                                      <input type="radio" value="3" name="show" {if condition="$goods['show']== 3"}checked=""{/if}> <i></i> 营销与顾客</label>
                                                <label>
                                                     <input type="radio" value="1" name="show" {if condition="$goods['show']== 1"}checked=""{/if}> <i></i> 营销</label>
                                                <label>
                                                      <input type="radio" value="2" name="show" {if condition="$goods['show']== 2"}checked=""{/if}> <i></i> 顾客</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">排序</label>
                                        <div class="col-sm-4">
                                            <input type="number" class="form-control" name="sort" value="{$goods['sort']}">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品描述</label>
                                        <div class="col-sm-10">
                                            <textarea class="summernote" name="content">{$goods['content']}
                                            </textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                    <strong>商品主配图设置</strong>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品主图</label>
                                        <div class="col-sm-4 yele-js-update-list">
                                            {if condition="$MainPhoto['id']"}
                                            <div class="img_border" style="float: left;padding: 5px;">
                                                <form action="{:url('goods/goods/delphoto', ['id' => $MainPhoto['id']])}" method="post" style="float: ringht;margin-left:10px;">
                                                   <div class="close yele-js-btn-delphoto-all" >+</div>
                                                    <img data-id="{$MainPhoto['id']}" src="{$MainPhoto['path']}" class="J_preview main" data-bimg="{$MainPhoto['path']}" alt="">
                                                </from>
                                            </div>
                                            {/if}
                                            <input type="file" class="form-control" name="main">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品配图</label>
                                        <div class="col-sm-4 yele-js-update-list">
                                            {foreach $CommodityPhoto as $photo}
                                            <div class="img_border" style="float: left;padding: 5px;">
                                                <form action="{:url('goods/goods/delphoto', ['id' => $photo['id']])}" method="post" style="float: ringht;margin-left:10px;">
                                                   <div class="close yele-js-btn-delphoto-all" >+</div>
                                                    <img data-id="{$photo['id']}" src="{$photo['path']}" class="J_preview" data-bimg="{$photo['path']}" alt="">
                                                </from>
                                            </div>
                                            {/foreach}
                                            <input type="file" class="form-control" name="image[]" /> <br>
                                            <input type="file" class="form-control" name="image[]" /> <br>
                                            <input type="file" class="form-control" name="image[]" /> <br>
                                            <input type="file" class="form-control" name="image[]" /> <br>
                                            <input type="file" class="form-control" name="image[]" /> <br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-3" class="tab-pane">
                                <div class="panel-body">
                                    <strong>库存及定价</strong>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">销售单位</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="sale_unit" data-placeholder="选择单位">
                                                {foreach $GoodsUnit as $GoodsUnit}
                                                    <option name="store_id" value="{$GoodsUnit['id']}" {if condition="$goods['sale_unit']== $GoodsUnit['id']"}selected{/if}>{$GoodsUnit['name']}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">市场价格</label>
                                        <div class="col-sm-4">
                                            <input type="number" class="form-control" name="market_price" value="{$goods['market_price']}" placeholder="例如：200" required="" aria-required="true">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">本店价格</label>
                                        <div class="col-sm-4">
                                            <input type="number" class="form-control" name="sell_price" value="{$goods['sell_price']}" placeholder="例如：200" required="" aria-required="true">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">所属仓库</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="store_id" data-placeholder="选择所属仓库">
                                                {foreach $GoodsStore as $GoodsStore}
                                                    <option name="store_id" value="{$GoodsStore['id']}" {if condition="$goods['store_id']== $GoodsStore['id']"}selected{/if}>{$GoodsStore['name']}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">库存数量</label>
                                        <div class="col-sm-4">
                                            <input type="number" class="form-control" name="store_nums" value="{$goods['store_nums']}" placeholder="例如：99" required="" aria-required="true">
                                        </div>
                                    </div>
                                </div>
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
    {/block}
    {/* TODO: 合并CSS */}
    {block name="css"}
    <style>
    .nav{
        margin-bottom: 0px !important;
    }
    .breadcrumb{
        background-color: #fff !important;
    }
    .radio{
        padding-left: 0 !important;
    }
    input[type="file"]{
        padding: 6px !important;
        border-radius: 3px !important;
        margin-bottom: 10px !important;
    }
    select{
        border-radius: 3px !important;
    }
    input[type="text"],input[type="number"]{
        padding: 16px !important;
        border-radius: 3px !important;
    }
    .radio label{
        float: left !important;
    }
    .ibox-content{
        border: 0;
    }
    .tree{
            border: 1px solid #e5e6e7  !important;
    }
    .tree li span {
        border: 0px solid #e5e6e7 !important;
    }
    .wrapper-content {
        padding: 10px !important;
    }
    .modal-backdrop{
        display: none;
    }
    .modal{
        border: 0 !important;
        width: auto !important;
        background: none !important;
        left: 10% !important;
    }
    .note-editor .form-group{
        padding: 10px !important;
    }
    .note-editor .note-editable {
        padding: 30px !important;
    }
    .close{
        -webkit-transform: rotate(-30deg);
        transform: rotate(-30deg);
        position: relative;
        right: -11px;
        top: 8px;
        font-size: 18px;
        background-color: #828282;
        border-radius: 30px;
        width: 20px;
        height: 20px;
        text-align: center;
        border: 1px solid #555;
        line-height: 15px;
    }
    .J_preview{
        width: 100%;
    }
    </style>
        {css href="/css/plugins/toastr/toastr.min.css"}
        {css href="/css/bootstrap.min.css"}
        {css href="/css/font-awesome.css"}
        {css href="/css/animate.css"}
        {css href="/css/style.css"}
        {css href="/css/plugins/summernote/summernote.css"}
        {css href="/css/plugins/summernote/summernote-bs3.css"}
        {css href="/css/plugins/iCheck/custom.css"}
        {css href="/css/plugins/chosen/chosen.css"}
        {css href="/js/plugins/jquerytree/css/bootstrap.min.css"}
        {css href="/js/plugins/jquerytree/css/style.css"}
    {/block}
    {/* TODO: 合并js */}
    {block name="js"}
        {js href="/js/plugins/toastr/toastr.min.js"}
        {js href="/js/plugins/validate/jquery.validate.min.js"}
        {js href="/js/plugins/validate/messages_zh.min.js"}
        {js href="/js/demo/form-validate-demo.js"}
        {js href="/js/plugins/iCheck/icheck.min.js"}
        {js href="/js/plugins/chosen/chosen.jquery.js"}
        {js href="/js/plugins/layer/layer.min.js"}
        {js href="/js/plugins/summernote/summernote.min.js"}
        {js href="/js/plugins/summernote/summernote-zh-CN.js"}
        {js href="/js/content.js?v=1.0.0"}
        {js href="/js/bootstrap.js?v=1.0.0"}
        {js href="/js/jquery.min.js?v=1.0.0"}
        {js href="app.js"}
        <script>
            $(document).ready(function () {

                $('.summernote').summernote({
                    lang: 'zh-CN'
                });

            });
            var edit = function () {
                $("#eg").addClass("no-padding");
                $('.click2edit').summernote({
                    lang: 'zh-CN',
                    focus: true
                });
            };
            var save = function () {
                $("#eg").removeClass("no-padding");
                var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
                $('.click2edit').destroy();
            };
        </script>
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
