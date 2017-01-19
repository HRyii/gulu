{extend name="../core/view/common/page.tpl" /}

{block name="css"}
    <link href="/css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
    <link href="/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <link href="/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

    <style>
        /*清除浮动*/
        .goods_num :after {clear:both;content:'.';display:block;width: 0;height: 0;visibility:hidden;}/*==for FF/chrome/opera/IE8==*/
    </style>
{/block}


{block name="content"}
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>录入存酒信息 </h5>
            </div>
            <div class="ibox-content">
                <form method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户姓名</label>

                        <div class="col-sm-10 col-md-3">
                            <input type="text" class="form-control" name="customer_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户电话</label>

                        <div class="col-sm-10 col-md-3">
                            <input type="text" class="form-control" name="customer_cellphone">
                        </div>
                    </div>

                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">台号</label>

                        <div class="col-sm-10 col-md-3">
                            <input type="text" class="form-control" name="source">
                        </div>
                    </div>

                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">服务员</label>

                        <div class="col-sm-2">
                            <select class="form-control m-b " name="service_id">
                                <option value="0">请选择服务员</option>
                                {foreach $serviceData as $key => $value}
                                    <option value="{$value.id}">{$value.username}</option>
                                {/foreach}

                            </select>

                        </div>
                    </div>

                    <table
                            id="table"
                            data-toggle="table"
                            data-mobile-responsive="true"
                            data-pagination="true"
                            data-icon-size="outline"
                    >
                        <thead>
                        <tr>
                            <!--<th data-field="id">ID</th>-->
                            <th data-field="goods_name">商品名称</th>
                            <th data-field="goods_unit">商品单位</th>
                            <th data-field="goods_count">商品数量</th>
                            <th data-field="goods_percent">剩余百分比</th>
                            <th data-field="remark">备注</th>
                            <th data-field="action">操作</th>
                        </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>

                    <div class="add_goods">
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#add">添加酒品</button>
                            </div>
                        </div>
                    </div>


                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">过期时间</label>

                        <div class="col-sm-10">
                            <label class="checkbox-inline">
                                <input type="radio" value="30" id="inlineCheckbox1" name="days">1个月</label>
                            <label class="checkbox-inline">
                                <input type="radio" value="60" id="inlineCheckbox2" name="days">2个月</label>
                            <label class="checkbox-inline">
                                <input type="radio" value="90" id="inlineCheckbox3" name="days">3个月</label>
                        </div>
                    </div>

                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">存酒贴二维码</label>

                        <div class="col-sm-10 col-md-3">
                            <input type="text" class="form-control" name="label_num">
                        </div>
                    </div>

                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button class="btn btn-primary" type="submit">确认</button>
                        </div>
                    </div>
                    <input type="hidden" name="goods_id">
                    <input type="hidden" name="goods_name">
                    <input type="hidden" name="goods_unit">
                    <input type="hidden" name="goods_count">
                    <input type="hidden" name="goods_percent">
                    <input type="hidden" name="remark">
                </form>
            </div>
        </div>
    </div>

    <!--add modal -->
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加商品</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">酒品</label>

                        <div >
                            <select class="form-control goods_id">
                                <option value="0">请选择酒品</option>
                                {foreach $goodsData as $key => $value}
                                    <option value="{$value.id}">{$value.goods_name}</option>
                                {/foreach}

                            </select>
                        </div>
                    </div>

                    <div class="form-group goods_num">
                        <label class="col-sm-2 control-label">数量</label>

                        <div >
                            <button style="float:left;" type="button"
                                    class="btn btn-outline glyphicon glyphicon-minus"></button>
                            <input type="text" class="form-control goods_count" value="1"
                                   style="width: 50px;float: left;">
                            <button style="float: left;" type="button"
                                    class="btn btn-outline glyphicon glyphicon-plus"></button>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">单位</label>

                        <div >
                            <select class="form-control goods_unit" >
                                <option value="1">瓶</option>
                                <option value="6">半打</option>
                                <option value="12">一打</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">

                        <div >
                           <label class="i-checks">
                                <input type="checkbox" checked="checked" class="is_full"><i></i> 是否整瓶
                           </label>
                        </div>

                    </div>

                     <div class="form-group" >
                         <label class="control-label">剩余百分比</label>

                         <input class="form-control" id="goods_percent" type="text" >

                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>

                        <div >
                            <input type="text" class="form-control remark" >
                        </div>
                    </div>
                    <!--商品 结束-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary confirm_add">确认</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


{/block}

{block name="js"}

    <!-- Bootstrap table -->
    <script src="/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <script src="/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>

    <script>
        $(function () {

            $("#goods_percent").ionRangeSlider({
                grid: true,
                min: 0,
                max: 1,
                from: 1,
                step: 0.1,
//                disable:true
            });

            var goods_index = 0;
            var goods_id = new Array();
            var goods_name = new Array();
            var goods_unit = new Array();
            var goods_count = new Array();
            var goods_percent = new Array();
            var remark = new Array();
            /**
             * 增加商品
             */
            $('.confirm_add').on('click', function () {
                var unit_zh = {$unit_zh};   //单位的中文

                var id = $('.goods_id').val();
                var name = $('.goods_id :checked').html();
                var count = $('.goods_count').val();
                var unit = $('.goods_unit').val();
                var percent = $('#goods_percent').val();

                if(id == false || count == false || unit == false){
                    alert('商品信息不完整！');return;
                }
                //是整瓶就百分比为1
                if($('.is_full').is(':checked') == true ||  goods_count> 1 ||  goods_unit> 1){

                    percent = 1 ;
                }

                //添加数据
                goods_id[goods_index] = id
                goods_name[goods_index] = name
                goods_unit[goods_index] = unit;
                goods_count[goods_index] = count;
                goods_percent[goods_index] = percent ? percent : 1;
                remark[goods_index] = $('.remark').val();

                var html = '<tr>'
//                        + '<td>' + (goods_index+1) + '</td>'
                        + '<td>' + goods_name[goods_index] + '</td>'
                        + '<td>' + unit_zh[unit] + '</td>'
                        + '<td>' + goods_count[goods_index] + '</td>'
                        + '<td>' + goods_percent[goods_index]*100 + '%</td>'
                        + '<td>' + remark[goods_index] + '</td>'
                        + '<td><button type="button" class="btn btn-primary btn-xs btn-outline delete" data-index="'+goods_index+'" >删除</button></td>'
                        + '</tr>';

                $('.no-records-found').remove();    //移除默认的无数据提醒
                $('#table tbody').append(html);
                goods_index ++ ;
                $('#add').modal('hide');    //隐藏窗口

            })

            /**
             * 删除商品
             */
            $('tbody').on('click','.delete', function () {
                if(confirm('确定要删除改商品?')){

                    $(this).parents('tr').remove();
                    var index = $(this).data('index');

                    //删除当前行的数据
                    goods_id.splice(index,1);
                    goods_name.splice(index,1);
                    goods_unit.splice(index,1);
                    goods_count.splice(index,1);
                    goods_percent.splice(index,1);
                    remark.splice(index,1);
                }else {
                    return false;
                }
            })

            /**
             * 数量减
             */
            $('.glyphicon-minus').click(function () {
                var num = $(this).next('input').val();
                num--;
                $(this).next('input').val(num);
            })

            /**
             * 数量加
             */
            $('.glyphicon-plus').click(function () {
                var num = $(this).prev('input').val();
                num++;
                $(this).prev('input').val(num);
            })

            /**
             * 选择百分比，重置数量
             */
            $('.irs').on('click',function () {
//                var percent = $('#goods_percent').val();
//                if (percent != 1) {
                    $('.is_full').attr('checked',false);    //不是整瓶
                    $('.goods_count').val(1);    //数量1
                    $('.goods_unit').val(1);    //单位瓶
//
//                }else {
//                    $('.is_full').attr('checked',true);
//                }
            })

            /**
             * 不是整瓶,重置数量
             */
            $('.is_full').on('click', function () {
                if(!$(this).is(':checked')){
                    $('.goods_count').val(1);    //数量1
                    $('.goods_unit').val(1);    //单位瓶
                }
            })

            /**
             * 提交
             */
            $('form').submit(function () {
                $('[name="goods_id"]').val(goods_id);
                $('[name="goods_name"]').val(goods_name);
                $('[name="goods_unit"]').val(goods_unit);
                $('[name="goods_count"]').val(goods_count);
                $('[name="goods_percent"]').val(goods_percent);
                $('[name="remark"]').val(remark);

                $.ajax({
                    type:'POST',
                    url:"{:url('reserveInput')}",
                    data:$('form').serialize(),
                    dataType:"json",
                    success: function (returnData) {
                        if(returnData.status){
                            alert('录入成功！');
                            location.href = "{:url('reserveList')}";
                        }else{
                            alert(returnData.info);
                        }
                    }
                });
                return false;
            })
        })
    </script>
{/block}


