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

    $(".gulu-js-btn-delete").on("click", function() {
        var $that = $(this);
        layer.confirm("确定删除?", {shade: false}, function() {
            $that.parent().submit();
        });
    });

    $(".gulu-js-company-list").on("change", "select[name='status']", function() {
        var $that = $(this);
        $.post('/api/goods.goods/status?id=' + $that.data('id'), {status: $that.val()}, function(res) {
            if (res.code === 0) {
                toastr.success(res.text);
            }
        }, 'json');
    });

    $(".i-checks.gulu-js-check-all").on("ifChanged", function(event) {
        if ($(this).is(':checked')) {
            $(".i-checks.gulu-js-check").iCheck("check");
        } else {
            $(".i-checks.gulu-js-check").iCheck("uncheck");
        }
    });

    var id = [];
    $(".gulu-js-company-list").on("ifChanged", ".i-checks.gulu-js-check", function() {
        if ($(this).is(':checked')) {
            id.push($(this).data('id'));
        } else {
            id.splice(id.indexOf($(this).data('id')), 1);
        }
        if (id.length > 0) {
            $(".gulu-js-btn-delete-all").attr('disabled', false).children("span").text(' 删除所选(' + id.length +　')');
        } else {
            $(".gulu-js-btn-delete-all").attr('disabled', true).children("span").text(' 删除');
        }
    });

    $(".gulu-js-btn-delete-all").on("click", function() {
        layer.confirm("确定删除?", {shade: false}, function() {
            $.post('/api/goods.Goods/delete', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/company/corporate/set';
                }
            }, 'json');
        });
    });
    $(".gulu-js-btn-del-all").on("click", function() {
        layer.confirm("确定永久删除?", {shade: false}, function() {
            $.post('/api/goods.Goods/del', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/company/corporate/set';
                }
            }, 'json');
        });
    });
    $(".gulu-js-btn-check").on("click", function() {
        var $that = $(this);
        layer.confirm("确定审核?", {shade: false}, function() {
            $that.parent().parent().submit();
        });
    });
});
$(".gulu-js-update-list .gulu-js-btn-delphoto-all").on("click", function() {
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
