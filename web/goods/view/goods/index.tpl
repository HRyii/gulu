{extend name="../core/view/common/page.tpl" /}
{block name="title"}商品列表{/block}
{block name="right-header"}
<div class="title-action">
    <a href="{:url('goods/goods/Index')}" class="btn btn-info">返回列表</a>
    <a href="{:url('goods/goods/Recycle')}" class="btn btn-info">回收站</a>
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
                        <h5>商品商品列表</h5>
                        {if condition="$__user->can(['goods_goods_create'])"}
                        <a class="label label-primary pull-right" href="{:url('goods/goods/create')}" style="padding: 11px 8px !important;"><i class="fa fa-pencil-square-o"></i><span class="bold" style="font-weight: 100;">&nbsp;创建</span></a>
                        {/if}
                        {if condition="$__user->can(['goods_goods_delete'])"}
                        <button type="button" class="btn btn-sm btn-info pull-right yele-js-btn-delete-all" disabled style=" padding:7px;margin-left:5px;"><i class="fa fa-cart-plus"></i><span class="bold">&nbsp;回收站</span></button>
                        {/if}
                        {if condition="$__user->can(['goods_goods_restore'])"}
                        <button type="button" class="btn btn-sm btn-danger pull-right yele-js-btn-del-all" disabled style=" padding:7px;margin-left:5px;"><i class="fa fa-trash" ></i><span class="bold">&nbsp;彻底删除</span></button>
                        {/if}
                    </div>
                    <div class="search col-sm-12">
                        <form name="searchform" method="post" class="form-horizontal" style="padding: 18px;">
                            <div>
                                <span style="float:left;line-height:40px;">&nbsp;&nbsp;选择品牌&nbsp;&nbsp;</span>
                                <select class="form-control brandd" name="brand_id" data-placeholder="选择商品品牌">
                                    <option name="store_id" value="">选择品牌</option>
                                    {foreach $GoodsBrand as $GoodsBrand}
                                        <option name="brand_id" value="{$GoodsBrand['id']}" {if condition="$where['brand_id']== $GoodsBrand['id']"}selected{/if}>{$GoodsBrand['name']}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div>
                                <span style="float:left;line-height:40px;">&nbsp;&nbsp;选择仓库&nbsp;&nbsp;</span>
                                <select class="form-control brandd" name="store_id" data-placeholder="选择仓库">
                                    <option name="store_id" value="">选择仓库</option>
                                    {foreach $GoodsStore as $GoodsStore}
                                        <option name="store_id" value="{$GoodsStore['id']}" {if condition="$where['store_id']== $GoodsStore['id']"}selected{/if}>{$GoodsStore['name']}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div>
                                <span style="float:left;line-height:40px;">&nbsp;&nbsp;可见性&nbsp;&nbsp;</span>
                                <select class="form-control brandd" name="show">
                                    <option name="show" value="">选择可见</option>
                                    <option name="show" value="1" {if condition="$where['show']== 1"}selected{/if}>顾客</option>
                                    <option name="show" value="2" {if condition="$where['show']== 2"}selected{/if}>营销</option>
                                    <option name="show" value="3" {if condition="$where['show']== 3"}selected{/if}>营销与顾客</option>
                                </select>
                            </div>
                            <div>
                                <span style="float:left;line-height:40px;">&nbsp;&nbsp;状态&nbsp;&nbsp;</span>
                                <select class="form-control status" name="status">
                                    <option name="status" value="">所有</option>
                                    <option name="status" value="1" {if condition="$where['status']== 1"}selected{/if}>上架</option>
                                    <option name="status" value="2" {if condition="$where['status']== 2"}selected{/if}>下架</option>
                                </select>
                            </div>
                            <div class="input-group" style="width:20%;padding-left:10px;">
                                <input type="text" class="form-control" name="name" value="{$name}" placeholder="请输入商品关键字"> <span class="input-group-btn"> <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>&nbsp;搜索
                                </button> </span>
                            </div>
                        </form>
                    </div>
                    <div class="ibox-content">
                        {if condition="($search == 1)"}
                        <div class="alert alert-success alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            搜索结果如下：
                        </div>
                        {/if}
                        {if condition="($search == 0)"}
                        <div class="alert alert-error alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            暂无搜索结果,以下是全部商品列表
                        </div>
                        {/if}
                        <table class="table table-striped yele-js-goods-list yele-js-restore-list">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="i-checks yele-js-check-all"></input>全选</th>
                                    <th>商品主图</th>
                                    <th>商品名称</th>
                                    <th>所属仓库</th>
                                    <th>单价</th>
                                    <th>库存</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $Goods as $Good }
                                <tr>
                                    <td>
                                    <input type="checkbox"  data-id="{$Good['id']}" class="i-checks yele-js-check"></input>
                                    </td>
                                    <td class="text-navy"><img src="{$Good['main']}" class="logo J_preview" data-bimg="{$Good['main']}" style="width: 80px;"></td>
                                    <td>{$Good['name']}</td>
                                    <td>{$Good['store']}</td>
                                    <td>{$Good['sell_price']}</td>
                                    <td>{$Good['store_nums']}</td>
                                    <td>
                                        {if condition="$__user->can(['goods_goods_status'])"}
                                        <select name="status" data-id="{$Good['id']}">
                                            <option value="1" {if condition="$Good['status'] == 1"}selected{/if}>上架</option>
                                            <option value="2" {if condition="$Good['status'] == 2"}selected{/if}>下架</option>
                                        </select>
                                        {else /}
                                            {if condition="$Good->status == 1"}上架{else /}下架{/if}
                                        {/if}
                                    </td>
                                    <td style="margin: 0 auto;width: 280px;">
                                    <div style="margin: 0 auto;">
                                        {if condition="$__user->can(['goods_goods_del'])"}
                                        <form action="{:url('goods/goods/del', ['id' => $Good['id']])}" method="post" style="float: right;margin-left:10px;">
                                            <div class="form-group">
                                                <button type="button" class="btn btn-sm btn-danger yele-js-btn-del"><i class="fa fa-trash"></i><span class="bold">&nbsp;彻底删除</span></button>
                                            </div>
                                        </form>
                                        {/if}
                                        <form action="{:url('goods/goods/delete', ['id' => $Good['id']])}" method="post" style="float: right;">
                                            <div class="form-group">
                                                {if condition="$__user->can(['goods_goods_update'])"}
                                                <a href="{:url('goods/goods/update', ['id' => $Good['id']])}" class="btn btn-sm btn-success"><i class="fa fa-paste"></i><span class="bold">&nbsp;编辑</span></a>
                                                {/if}
                                                {if condition="$__user->can(['goods_goods_delete'])"}
                                                <button type="button" class="btn btn-sm btn-info yele-js-btn-delete" style="margin-left:5px;"><i class="fa fa-cart-plus"></i><span class="bold">&nbsp;回收站</span></button>
                                                {/if}
                                            </div>
                                        </form>
                                    </div>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
                {if condition="!($search == 1)"}{$Goods->render()}{/if}
            </div>
        </div>
    </div>
    {/block}
    {/* TODO: 合并CSS */}
    {block name="css"}
    <style>
    .search{
        border: 1px solid #ffbe7a;
        zoom: 1;
        background: #fffced;
    }
    .brand{
        width:90px;line-height:30px;padding-right: 0px;padding-left: 0px;text-align:center;color: #fff;font-size: 13px;
    }
    .brandd{
        width:6%;padding-right: 0px;padding-left: 0px;float: left;text-align: center;
    }
    .status{
        width:4%;padding-right: 0px;padding-left: 0px;float: left;text-align: center;
    }
        td,th {
            text-align: center;
        }
        .logo{
            border-radius: 10%;
        }
        .ibox-title .label {
            background-color: #1c84c6;
            color: #fff;
            font-size: 10px;
            font-weight: 1;
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
