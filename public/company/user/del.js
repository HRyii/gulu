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
            $(".yele-js-btn-del-all").attr('disabled', false).children("span").text(' 永久删除所选(' + idd.length +　')');
        } else {
            $(".yele-js-btn-del-all").attr('disabled', true).children("span").text(' 永久删除');
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
$('.J_preview').preview();
