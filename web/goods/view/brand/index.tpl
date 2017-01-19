{extend name="../core/view/common/page.tpl" /}
{block name="title"}商品品牌{/block}
{block name="right-header"}
<div class="title-action">
    <a href="{:url('goods/brand/Index')}" class="btn btn-info">返回列表</a>
</div>
{/block}
{block name="content"}
<body class="gray-bg">
    {present name='error'}
    <div class="alert alert-error alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        {$error['text']}
    </div>
    {/present}
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title" style="padding: 16px;min-height: 60px;">
                        <h5>商品品牌列表</h5>
                        <a class="label label-primary pull-right" href="{:url('goods/brand/create')}" style="padding: 11px 8px !important;"><i class="fa fa-pencil-square-o"></i><span class="bold" style="font-weight: 100;">&nbsp;创建</span></a>
                        {if condition="$__user->can(['goods_brand_delete'])"}
                        <button type="button" class="btn btn-sm btn-danger pull-right yele-js-btn-delete-all" disabled style=" padding:7px;margin-left:5px;"><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                        {/if}
                        <form name="searchform" method="post">
                            <div class="input-group" style="width:15%; float:right;">
                                <input type="text" class="form-control" name="keyword" value="{$keyword}" placeholder="请输入品牌关键字"> <span class="input-group-btn"> <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>&nbsp;搜索
                                </button> </span>
                            </div>
                        </form>
                    </div>
                    <div class="ibox-content">
                        {if condition="$search == 1"}
                        <div class="alert alert-success alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            搜索结果如下：
                        </div>
                        {/if}
                        {if condition="$search == 0"}
                        <div class="alert alert-error alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            暂无搜索结果,以下是全部品牌列表
                        </div>
                        {/if}
                        <table class="table table-striped yele-js-brand-list">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="i-checks yele-js-check-all"></input>全选</th>
                                    <th>品牌名称</th>
                                    <th>品牌LOGO</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $brands as $brand }
                                <tr>
                                    <td>
                                    <input type="checkbox"  data-id="{$brand['id']}" class="i-checks yele-js-check"></input>
                                    </td>
                                    <td>{$brand['name']}</td>
                                    <td class="text-navy"><img src="{$brand['logo']}" alt="" class="logo J_preview" data-bimg="{$brand['logo']}" style="width: 80px;"></td>
                                    <td>
                                    <form action="{:url('goods/brand/delete', ['id' => $brand['id']])}" method="post">
                                        <div class="form-group">
                                            {if condition="$__user->can(['goods_brand_update'])"}
                                            <a href="{:url('goods/brand/update', ['id' => $brand['id']])}" class="btn btn-sm btn-success"><i class="fa fa-paste"></i><span class="bold">&nbsp;编辑</span></a>
                                            {/if}
                                            {if condition="$__user->can(['goods_brand_update'])"}
                                            <button type="button" class="btn btn-sm btn-danger yele-js-btn-delete"><i class="fa fa-trash"></i><span class="bold">&nbsp;删除</span></button>
                                            {/if}
                                        </div>
                                    </form>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
                {if condition="!($search == 1)"}{$brands->render()}{/if}
            </div>
        </div>
    </div>
    {/block}
    {/* TODO: 合并CSS */}
    {block name="css"}
    <style>
        td,th {
            text-align: center;
        }
        .logo{
            border-radius: 10%;
        }
        .ibox-title .label {
            background-color: #d1dade;
            color: #5e5e5e;
            font-size: 10px;
            font-weight: 600;
            padding: 9px 8px !important;
            text-shadow: none;
        }
    .form-group {
         margin-bottom: 0;
    }
    .table {
    width: 100%;
    max-width: 100%;
     margin-bottom: 0;
    }
    .alert-error {
        color: #f9f9f9;
        background-color: #ed5565;
        border-color: #ed5565;
    }
    </style>
        {css href="/css/plugins/iCheck/custom.css"}
        {css href="/css/plugins/chosen/chosen.css"}
        {css href="/css/plugins/toastr/toastr.min.css"}
        {css href="/js/plugins/layer/skin/layer.css"}
    {/block}
    {/* TODO: 合并js */}
    {block name="js"}
    {js href="/js/plugins/iCheck/icheck.min.js"}
    {js href="/js/plugins/chosen/chosen.jquery.js"}
    {js href="/js/plugins/toastr/toastr.min.js"}
    {js href="/js/plugins/layer/layer.min.js"}
    {js href="app.js"}
    {js href="admin.js"}
    {/block}
