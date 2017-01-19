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

    $(".gulu-user-list").on("click", ".gulu-js-btn-delete", function() {
        var $that = $(this);
        layer.confirm("确定删除?", {shade: false}, function() {
            $that.parent().submit();
        });
    })
    $(".gulu-user-list").on("click", ".gulu-js-btn-checked", function() {
        var $that = $(this);
        layer.confirm("确定审核通过?", {shade: false}, function() {
            $that.parent().submit();
        });
    })
    $(".gulu-user-list").on("change", "input[name='status']", function() {
        var $that = $(this);
        $.post('/api/company.user/status?id=' + $that.data('id'), {status: $that.val()}, function(res) {
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
    $(".gulu-user-list").on("ifChanged", ".i-checks.gulu-js-check", function() {
        if ($(this).is(':checked')) {
            id.push($(this).data('id'));
        } else {
            id.splice(id.indexOf($(this).data('id')), 1);
        }
        if (id.length > 0) {
            $(".gulu-js-btn-checked-all").attr('disabled', false).children("span").text('审核所选(' + id.length +　')');
        } else {
            $(".gulu-js-btn-checked-all").attr('disabled', true).children("span").text('审核');
        }
    });
    $(".gulu-js-btn-checked-all").on("click", function() {
        layer.confirm("确定全部审核通过?", {shade: false}, function() {
            $.post('/api/company.user/checked', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/company/user/checked';
                }
            }, 'json');
        });
    });
    var idd = [];
    $(".gulu-user-list").on("ifChanged", ".i-checks.gulu-js-check", function() {
        if ($(this).is(':checked')) {
            idd.push($(this).data('id'));
        } else {
            idd.splice(idd.indexOf($(this).data('id')), 1);
        }
        if (idd.length > 0) {
            $(".gulu-js-btn-delete-all").attr('disabled', false).children("span").text(' 删除所选(' + idd.length +　')');
        } else {
            $(".gulu-js-btn-delete-all").attr('disabled', true).children("span").text(' 删除');
        }
    });
    $(".gulu-js-btn-delete-all").on("click", function() {
        layer.confirm("确定全部删除?", {shade: false}, function() {
            $.post('/api/company.user/delete', {id: idd}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/company/user/checked';
                }
            }, 'json');
        });
    });
    $(".gulu-js-btn-delete").on("click", function() {
        layer.confirm("确定删除?", {shade: false}, function() {
            $.post('/api/company.user/delete', {id: idd}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/company/user/checked';
                }
            }, 'json');
        });
    });
    $(".gulu-js-group").on("change", "select[name='group_id']", function() {
        var $that = $(this);
        var changeid =$("select[name='group_id']").val();
        $.post('/api/company.user/changegroup?id=' + $that.data('id') + '&changeid=' + changeid, {status: $that.val()}, function(res) {
            if (res.code === 0) {
                toastr.success(res.text);
                window.location.reload();
            }
        }, 'json');
    });
    $(".gulu-js-group").on("click", ".gulu-js-group-checked", function() {
        var $that = $(this);
        layer.confirm("确定审核通过?", {shade: false}, function() {
            $that.parent().submit();
        });
    })
    $(".gulu-js-group").on("click", ".gulu-js-groupuser-delete", function() {
        var $that = $(this);
        layer.confirm("确定删除?", {shade: false}, function() {
            $that.parent().submit();
        });
    })
});
$('.J_preview').preview();
