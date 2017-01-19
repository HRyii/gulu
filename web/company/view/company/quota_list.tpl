{include file="company/header" /}
<style>
    td,
    th {
        text-align: center;
    }
</style>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>员工每日补贴金额列表</h5>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>人员姓名</th>
                                    <th>星期一补贴金额(元)</th>
                                    <th>星期二补贴金额(元)</th>
                                    <th>星期三补贴金额(元)</th>
                                    <th>星期四补贴金额(元)</th>
                                    <th>星期五补贴金额(元)</th>
                                    <th>星期六补贴金额(元)</th>
                                    <th>星期日补贴金额(元)</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $quota as $user }
                                <tr>
                                    <td>{$user['name']}</td>
                                    <td>{$user['mon_subsidy']}</td>
                                    <td>{$user['tue_subsidy']}</td>
                                    <td>{$user['wed_subsidy']}</td>
                                    <td>{$user['thu_subsidy']}</td>
                                    <td>{$user['fri_subsidy']}</td>
                                    <td>{$user['sat_subsidy']}</td>
                                    <td>{$user['sun_subsidy']}</td>
                                    <td><a href="{:url('company/company/quota_edit', ['userid' =>$user['user_id'] ])}" class="label label-primary">编辑</a>&nbsp;<a onclick="confirm()" class="label label-primary" style="background-color: #ed5565;">删除</a></td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
{include file="company/footer" /}
<script>
var id = 0;
var status = 0;
    function confirm(id,status){
        parent.layer.confirm('确定执行这个操作吗', {
            btn: ['是','否'], //按钮
            shade: false //不显示遮罩
        }, function(){
                  $.ajax( {
                    "url": "{:url('company/company/quota_del', ['userid' =>$user['user_id'] ])}",
                    "async": false,
                    "dataType": "json",
                    "success": function (json) {
                    o = json;
                }
             } );
            parent.layer.msg('删除成功！', {icon: 1});
            location.reload();
            }, function(){
            parent.layer.msg('删除失败！', {shift: 6});
            location.reload();
            });
    }
</script>
    <script>
        $(document).ready(function() {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>

</html>
