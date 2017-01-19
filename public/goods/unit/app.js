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

    $(".yele-js-unit-list").on("click", ".yele-js-btn-delete", function() {
        var $that = $(this);
        layer.confirm("确定删除?", {shade: false}, function() {
            $that.parent().parent().submit();
        });
    })

    $(".yele-js-unit-list").on("change", "select[name='enabled']", function() {
        var $that = $(this);
        $.post('/api/account.user/enabled?id=' + $that.data('id'), {enabled: $that.val()}, function(res) {
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
    $(".yele-js-unit-list").on("ifChanged", ".i-checks.yele-js-check", function() {
        if ($(this).is(':checked')) {
            id.push($(this).data('id'));
        } else {
            id.splice(id.indexOf($(this).data('id')), 1);
        }
        if (id.length > 0) {
            $(".yele-js-btn-delete-all").attr('disabled', false).children("span").text(' 删除所选(' + id.length +　')');
        } else {
            $(".yele-js-btn-delete-all").attr('disabled', true).children("span").text(' 删除');
        }
    });

    $(".yele-js-btn-delete-all").on("click", function() {
        layer.confirm("确定删除?", {shade: false}, function() {
            $.post('/api/goods.Unit/delete', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/goods/Unit/index';
                }
            }, 'json');
        });
    });
});
