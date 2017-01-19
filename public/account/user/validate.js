$(function() {
    var pass = {
        username: false,
        password: false,
        password_confirm: false
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
        return pass.username && pass.password && pass.password_confirm;
    }

    $("input[name='username']").on('focusout', function() {
        if ($(this).val().length === 0) {
            showHelpBlock($(this), '用户名必填', 'error');
            pass.username = true;
            return ;
        }

        if (/^[a-zA-Z0-9\-_]{1,30}$/.test($(this).val()) === false) {
            showHelpBlock($(this), '用户名非法', 'error');
            pass.username = true;
            return ;
        }

        clearHelpBlock($(this), 'error');
        pass.username = true;
        allPass() ? enableSubmit() : disableSubmit();
    });

    $("input[name='password']").on('focusout', function() {
        if ($(this).val().length === 0) {
            showHelpBlock($(this), '密码必填', 'error');
            pass.password = false;
            return ;
        }

        clearHelpBlock($(this), 'error');
        pass.password = true;
        allPass() ? enableSubmit() : disableSubmit();
    });

    $("input[name='password_confirm']").on('focusout', function() {
        if ($(this).val().length === 0) {
            showHelpBlock($(this), '确认密码必填', 'error');
            pass.password_confirm = false;
            return ;
        }

        if ($(this).val() !== $("input[name='password']").val()) {
            showHelpBlock($(this), '两次输入的密码不一致', 'error');
            pass.password_confirm = false;
            return ;
        }

        clearHelpBlock($(this), 'error');
        pass.password_confirm = true;
        allPass() ? enableSubmit() : disableSubmit();
    });

    $("form").on('submit', function(e) {
        if (! allPass()) {
            e.preventDefault();
        }
    });
});
