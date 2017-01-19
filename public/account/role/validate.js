$(function() {
    var pass = {
        name: false,
        display_name: false
    };

    function showHelpBlock($input, text, type)
    {
        var $form = $input.parent().parent();
        if ($form.hasClass('form-group')) {
            $form.addClass('has-' + type);
        }

        if ($input.next() && $input.next().hasClass('help-block')) {
            $input.next().text(text);
        } else {
            $input.after("<span class='help-block'>" + text + "</span>");
        }
    }

    function clearHelpBlock($input, type)
    {
        var $form = $input.parent().parent();
        if ($form.hasClass('has-' + type)) {
            $form.removeClass('has-' + type);
        }

        if ($input.next() && $input.next().hasClass('help-block')) {
            $input.next().remove();
        }
    }

    function enableSubmit()
    {
        $("button[type='submit']").attr('disabled', false);
    }

    function disableSubmit()
    {
        $("button[type='submit']").attr('disabled', true);
    }

    function allPass()
    {
        return pass.name && pass.display_name;
    }

    $("input[name='name']").on('focusout', function() {
        if ($(this).val().length === 0) {
            showHelpBlock($(this), '角色标识必填', 'error');
            pass.name = true;
            return ;
        }

        if (/^[a-z_]{1,30}$/.test($(this).val()) === false) {
            showHelpBlock($(this), '非法角色标识(只能是小写字母+下划线)', 'error');
            pass.name = true;
            return ;
        }

        clearHelpBlock($(this), 'error');
        pass.name = true;
        allPass() ? enableSubmit() : disableSubmit();
    });

    $("input[name='display_name']").on('focusout', function() {
        if ($(this).val().length === 0) {
            showHelpBlock($(this), '角色名称必填', 'error');
            pass.display_name = false;
            return ;
        }

        clearHelpBlock($(this), 'error');
        pass.display_name = true;
        allPass() ? enableSubmit() : disableSubmit();
    });

    $("form").on('submit', function(e) {
        if (! allPass()) {
            e.preventDefault();
        }
    });
});
