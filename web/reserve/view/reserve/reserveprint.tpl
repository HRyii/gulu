{extend name="../core/view/common/page.tpl" /}

{block name="css"}
{/block}


{block name="content"}
     <div class="row">
                <div class="col-sm-12">
                    <div class="ibox-content p-xl">
                        <div class="row">
                            <div class="col-sm-6">
                                <!-- <address>
                                            <strong>北京百度在线网络技术有限公司</strong><br>
                                            北京市海淀区上地十街10号<br>
                                            <abbr title="Phone">总机：</abbr> (+86 10) 5992 8888
                                        </address> -->
                            </div>

                            <div class="col-sm-6 text-right">
                                <h4>二维码编号：</h4>
                                <h4 class="text-navy">{$reserveData.label_num}</h4>
                                <address>
                                            <strong>{$reserveData.customer_name}</strong><br>
                                            <abbr title="Phone">手机号：</abbr> {$reserveData.customer_cellphone}
                                        </address>
                                <p>
                                    <span><strong>日期：</strong> {$reserveData.created_at}</span>
                                </p>
                                <p>
                                	<span><strong>过期日期：</strong> {$reserveData.expires}</span>
                                </p>
                            </div>
                        </div>

                        <div class="table-responsive m-t">
                            <table class="table invoice-table">
                                <thead>
                                    <tr>
                                        <th>商品名</th>
                                        <th>单位</th>
                                        <th>数量</th>
                                        <th>百分比</th>
                                        <th>备注</th>
                                    </tr>
                                </thead>
                                <tbody>
                                {foreach $detailData as $value}
                                    <tr>
                                        <td>
                                            <div><strong>{$value.goods_name}</strong>
                                            </div>
                                        </td>
                                        <td>{$value.goods_unit}</td>
                                        <td>{$value.goods_count}</td>
                                        <td>{$value['goods_percent']*100}%</td>
                                        <td>{$value.remark}</td>
                                    </tr>
                                  {/foreach}
                                </tbody>
                            </table>
                        </div>
                        <!-- /table-responsive -->

                        <div class="text-right">
                            <button class="btn btn-primary print">打印</button>
                        </div>

                        <div class="well m-t"><strong>注意：</strong> 请在{$reserveData['days']}日内取酒，否则小票会失效。
                        </div>
                    </div>
                </div>
            </div>
{/block}

{block name='js'}
	<script>
		$('.print').on('click',function () {
			// document.body.innerHTML = $('.wrapper-content').html();
			window.print();
		})
		
	</script>
{/block}