{extend name="../core/view/common/page.tpl" /}

{block name="css"}
    <link href="/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
{/block}


{block name="content"}
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>取酒列表</h5>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <div class="example">
                        <table
                                data-toggle="table"
                                data-mobile-responsive="true"
                                data-pagination="true"
                                data-icon-size="outline"
                                data-search="true"
                        >
                            <thead>
                            <tr>
                                <th data-field="Tid">ID</th>
                                <th data-field="destination">取酒台号</th>
                                <th data-field="service_name">服务员姓名</th>
                                <th data-field="reserver_name">存酒员姓名</th>
                                <th data-field="label_num">二维码编号</th>
                                <th data-field="status_zh">状态</th>
                                <th data-field="created_at">创建时间</th>
                                <th data-field="updated_at">修改时间</th>
                                <th data-field="action">操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            {if $reserveData}
                            {foreach $reserveData as $key=>$item}
                                <tr>
                                    <td>{$key+1}</td>
                                    <td>{$item.destination}</td>
                                    <td>{$item.service_name}</td>
                                    <td>{$item.reserver_name ? $item.reserver_name : ''}</td>
                                    <td>{$item.label_num}</td>
                                    <td>{$item.status_zh}</td>
                                    <td>{$item.created_at}</td>
                                    <td>{$item.updated_at}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-xs btn-outline detail"
                                                data-toggle="modal" data-target="#modalTable" data-id="{$item.reserve_id}">商品清单
                                        </button>
                                        {if $item.status == 1}
                                            <button type="button" class="btn btn-primary btn-xs btn-outline take" data-id="{$item.id}" data-toggle="modal" data-target="#confirm">确认取酒
                                            </button>
                                        {/if}

                                    </td>
                                </tr>
                            {/foreach}
                            {/if}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--tabl modal -->
    <div class="modal fade" id="modalTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">商品清单</h4>
                </div>
                <div class="modal-body">
                    <table id="table"
                           data-toggle="table"
                           data-height="299"
                    >
                        <thead>
                        <tr>
                            <th data-field="id">ID</th>
                            <th data-field="goods_name">商品名称</th>
                            <th data-field="goods_unit">商品单位</th>
                            <th data-field="goods_count">商品数量</th>
                            <th data-field="goods_percent">剩余百分比</th>
                            <th data-field="remark">备注</th>
                        </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- confirm modal-->
    <div class="modal inmodal" id="confirm" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">确认取酒</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">存酒员</label>

                        <div >
                            <select class="form-control" name="reserver_id">
                                <option value="0">请选择存酒员</option>
                                {foreach $reserverData as $key => $value}
                                    <option value="{$value.id}">{$value.username}</option>
                                {/foreach}

                            </select>

                        </div>
                    </div>



                    <input type="hidden" value="" name="id">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary confirm_take">确认</button>
                </div>
            </div>
        </div>
    </div>
    <!-- confirm modal-->


{/block}

{block name="js"}
    <!-- Bootstrap table -->
    <script src="/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <script>
        var $table = $('#table');
        $(function () {
            /**
             * 弹窗表格
             */
            $('#modalTable').on('shown.bs.modal', function () {
                $table.bootstrapTable('resetView');
            });

            /**
             *  填充弹窗的商品详情数据
             */
            $('.detail').on('click', function () {
                var id = $(this).data('id');

                $('#table tbody').empty();  //清空原来的数据

                $.get("{:url('Reserve/reserveDetail')}", {id:id}, function (returnData) {
                    //console.log(returnData);
                    var unit_zh = {$unit_zh};
                    var html = '';
                    $.each(returnData, function (k, v) {

                        html += '<tr>'
                                + '<td>' + (k + 1) + '</td>'
                                + '<td>' + v.goods_name + '</td>'
                                + '<td>' + unit_zh[v.goods_unit] + '</td>'
                                + '<td>' + v.goods_count + '</td>'
                                + '<td>' + v.goods_percent*100 + '%</td>'
                                + '<td>' + v.remark + '</td>'
                                + '</tr>'
                    })
                    $('#table tbody').append(html);
                }, 'json');
            })


            /**
             * 取酒,获取取酒id
             */
            $('.take').on('click', function () {
                var id = $(this).data('id');
                $('[name="id"]').val(id);
            })

            /**
             * 确认取酒，更改取酒状态
             */
            $('.confirm_take').on('click', function () {
                var reserver_id = $('[name="reserver_id"]').val();
                var id = $('[name="id"]').val();

                if(reserver_id == false){
                    alert('存酒员不能为空');return;
                }

                $.post('{:url('Take/takeConfirm')}',{reserver_id:reserver_id,id:id}, function (returnData) {
                    alert(returnData['info']);
                    if(returnData['status']){
                        location.href = "{:url('Take/takeList')}";
                    }
                })
            })
        });
    </script>
{/block}