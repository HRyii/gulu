{extend name="../core/view/common/page.tpl" /}
{block name="title"}商品分类{/block}
{block name="right-header"}
<div class="title-action">
    <a href="{:url('goods/classify/Index')}" class="btn btn-info">返回列表</a>
</div>
{/block}
{block name="content"}
{present name='error'}
<div class="alert alert-error alert-dismissable">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    {$error['text']}
</div>
{/present}
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
                <div class="ibox-title" style="min-height: 56px;">
                    <h5>商品分类</h5>
                    {if condition="$__user->can(['goods_classify_create'])"}
                    <a class="label label-primary pull-right" href="{:url('goods/classify/create')}" style="padding: 8px 8px !important;background-color: #1ab394;"><i class="fa fa-pencil-square-o"></i><span class="bold" style="font-weight: 100;">&nbsp;创建一级分类</span></a>
                    {/if}
                    {if condition="$__user->can(['goods_classify_delete'])"}
                    <button type="button" class="btn btn-sm btn-danger pull-right yele-js-btn-delete-all" disabled><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                    {/if}
                </div>
                <div style="background-color:#fff;padding:20px;">
                    <p style="color: #555;">
                        <span style="color:#ed5565;font-weight:bold;">提示：</span>
                        <span style="font-size:14px;"><i class='icon-plus-sign'></i> &nbsp;图标表示当前分类有子分类</span>
                        <span style="font-size:14px;"><i class='icon-minus-sign'></i>&nbsp; 图标表示是当前分类无子分类</span>
                    </p>
                </div>
                <div class="tree well yele-js-classify-list" style="border:0;background-color:#fff;">                    <th><input type="checkbox" class="i-checks yele-js-check-all"></input>全选</th>                    <ul>
                    	{$class}
                    </ul>
                </div>
        </div>
    </div>
</div>
{/block}
{/* TODO: 合并CSS */}
{block name="css"}
<style>
.alert-error {
    color: #f9f9f9 !important;
    background-color: #ed5565 !important;
    border-color: #ed5565 !important;
    }
a{
    text-decoration:none;
}
a:active{text-decoration:none !important;}
a:hover{text-decoration:none !important;}
.tree li span {
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
     border: 0px solid #999 !important;
    border-radius: 5px;
    display: inline-block;
    padding: 3px 8px;
    text-decoration: none;
    width: 206px;
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
                // $(this).attr('title', '').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
            } else {
                children.show('fast');
                // $(this).attr('title', '').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
            }
            e.stopPropagation();
        });    $('.tree li.parent_li > span').trigger("click");
    });    </script>
{/block}
