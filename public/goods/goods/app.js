$(document).ready(function() {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "7000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
    $(".chosen-select").chosen({
    });

    $(".yele-js-goods-list").on("click", ".yele-js-btn-delete", function() {
        var $that = $(this);
        layer.confirm("确定删除?", {shade: false}, function() {
            $that.parent().parent().submit();
        });
    })
    $(".yele-js-restore-list").on("click", ".yele-js-btn-restore", function() {
        var $that = $(this);
        layer.confirm("确定恢复?", {shade: false}, function() {
            $that.parent().parent().submit();
        });
    })

    $(".yele-js-goods-list").on("change", "select[name='status']", function() {
        var $that = $(this);
        $.post('/api/goods.goods/status?id=' + $that.data('id'), {status: $that.val()}, function(res) {
            if (res.code === 0) {
                toastr.success(res.text);
            }
        }, 'json');
    });

    $(".i-checks.yele-js-check-all").on("ifChanged", function(event) {
        if ($(this).is(':checked')) {
            $(".i-checks.yele-js-check").iCheck("check");
        } else {
            $(".i-checks.yele-js-check").iCheck("uncheck");
        }
    });

    var id = [];
    $(".yele-js-goods-list").on("ifChanged", ".i-checks.yele-js-check", function() {
        if ($(this).is(':checked')) {
            id.push($(this).data('id'));
        } else {
            id.splice(id.indexOf($(this).data('id')), 1);
        }
        if (id.length > 0) {
            $(".yele-js-btn-delete-all").attr('disabled', false).children("span").text(' 回收所选(' + id.length +　')');
        } else {
            $(".yele-js-btn-delete-all").attr('disabled', true).children("span").text(' 回收');
        }
    });
    var ids = [];
    $(".yele-js-restore-list").on("ifChanged", ".i-checks.yele-js-check", function() {
        if ($(this).is(':checked')) {
            ids.push($(this).data('id'));
        } else {
            ids.splice(ids.indexOf($(this).data('id')), 1);
        }
        if (ids.length > 0) {
            $(".yele-js-btn-restore-all").attr('disabled', false).children("span").text(' 还原所选(' + ids.length +　')');
        } else {
            $(".yele-js-btn-restore-all").attr('disabled', true).children("span").text(' 还原');
        }
    });

    $(".yele-js-btn-delete-all").on("click", function() {
        layer.confirm("确定删除?", {shade: false}, function() {
            $.post('/api/goods.Goods/delete', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/goods/goods/index';
                }
            }, 'json');
        });
    });
    $(".yele-js-btn-restore-all").on("click", function() {
        layer.confirm("确定恢复?", {shade: false}, function() {
            $.post('/api/goods.Goods/restore', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/goods/goods/index';
                }
            }, 'json');
        });
    });
    $(".yele-js-restore-list").on("click", ".yele-js-btn-del", function() {
        var $that = $(this);
        layer.confirm("确定永久删除?", {shade: false}, function() {
            $that.parent().parent().submit();
        });
    })
    var idd = [];
    $(".yele-js-restore-list").on("ifChanged", ".i-checks.yele-js-check", function() {
        if ($(this).is(':checked')) {
            idd.push($(this).data('id'));
        } else {
            idd.splice(idd.indexOf($(this).data('id')), 1);
        }
        if (idd.length > 0) {
            $(".yele-js-btn-del-all").attr('disabled', false).children("span").text(' 彻底删除所选(' + idd.length +　')');
        } else {
            $(".yele-js-btn-del-all").attr('disabled', true).children("span").text(' 彻底删除');
        }
    });
    $(".yele-js-btn-del-all").on("click", function() {
        layer.confirm("确定永久删除?", {shade: false}, function() {
            $.post('/api/goods.Goods/del', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/goods/goods/index';
                }
            }, 'json');
        });
    });
});
$(".yele-js-update-list .yele-js-btn-delphoto-all").on("click", function() {
    var $that = $(this);
    layer.confirm("确定删除图片?", {shade: false}, function() {
        $('.layui-layer').hide();
        var id = $that.siblings('img').data('id');
        $.post('/api/goods.Goods/delphoto', {id: id}, function(res) {
            if (res.code === 0) {
                $that.parent("div").hide();
                $('.layui-layer').hide();
                // alert('成功删除图片！');
            }
        }, 'json');
    });
})
$('.J_preview').preview();
