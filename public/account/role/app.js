$(document).ready(function() {
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
    $(".chosen-select").chosen({
    });

    $(".yele-js-roles-list").on("click", ".yele-js-btn-delete", function() {
        var $that = $(this);
        layer.confirm("确定删除?", {shade: false}, function() {
            $that.parent().parent().submit();
        });
    })
    $(".i-checks.yele-js-check-all-perms").on("ifChanged", function(event) {
        var $table = $(this).parent().parent().parent().parent().parent();
        if ($(this).is(':checked')) {
            $table.find("input[name='permissions[]']").iCheck('check');
        } else {
            $table.find("input[name='permissions[]']").iCheck('uncheck');
        }
    });

    $(".i-checks.yele-js-check-all").on("ifChanged", function(event) {
        if ($(this).is(':checked')) {
            $(".i-checks.yele-js-check").iCheck("check");
        } else {
            $(".i-checks.yele-js-check").iCheck("uncheck");
        }
    });

    var id = [];
    $(".yele-js-roles-list").on("ifChanged", ".i-checks.yele-js-check", function() {
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
            $.post('/api/account.role/delete', {id: id}, function(res) {
                if (res.code === 0) {
                    document.location.href = '/account/role/index';
                }
            }, 'json');
        });
    });

    $("#perms").on("click", "a.yele-js-perm-desc", function() {
        var desc = $(this).data('description');
        layer.open({
            type: 1,
            shade: false,
            title: false,
            content: "<div style='min-width: 200px;min-height:100px;'>" +  desc + "</div>"
        });
    });
});
