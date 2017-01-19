;(function($) {
    function makeSelectMarkup(options, index, names, selected)
    {
        var $select = $('<select class="form-control" style="width:20%;float:left;">').attr('name', names[index]);

        for (var i = 0; i < options.length; ++i) {
            var id = options[i].id;
            var text = options[i].text;
            var $option = $('<option>').attr('value', id)
            .text(text);

            if ((selected !== undefined && options[i].id === selected[index]) || i === 0) {
                $option.prop('selected', true);
            }
            $select.append($option);
        }

        return $select;
    }

    function removeNextAllNodes($parent, childName)
    {
        var $child = $parent.find('select[name="' + childName + '"]');
        if ($child.length > 0) {
            $child.nextAll().remove();
        }
    }

    function chainedSelect(option, init)
    {
        var $elem = option.elem;
        var pid = option.pid;
        var index = option.index;
        var names = option.names;
        var selected = option.selected;
        var fetchCb = option.fetchCb;

        var options = fetchCb(pid);
        if (options.length === 0) {
            removeNextAllNodes($elem, names[index]);
            return ;
        }

        if (selected === undefined && !init) {
            var $select = makeSelectMarkup(options, index + 1, names, selected);
        } else {
            var $select = makeSelectMarkup(options, index, names, selected);
        }

        if (pid === 0 && selected === undefined) {
            $elem.append($select);
            chainedSelect($.extend(option, {pid: options[0].id, index: index + 1}), init);
        } else if (pid === 0 && selected !== undefined) {
            $elem.append($select);
            if (selected[index + 1] !== undefined) {
                chainedSelect($.extend(option, {pid: selected[index], index: index + 1}), init);
            }
        } else {
            removeNextAllNodes($elem, names[index]);
            $elem.append($select);

            if (selected === undefined) {
                chainedSelect($.extend(option, {pid: options[0].id, index: index + 1}), init);
            } else if (selected !== undefined && selected[index + 1] !== undefined) {
                chainedSelect($.extend(option, {pid: selected[index], index: index + 1}), init);
            } else {
                return ;
            }
        }
    }
    $.fn.chainedSelect = function(config) {
        var $elem = $(this);
        var selected = $elem.attr('data-selected') === undefined ?
                        config.selected : $elem.attr('data-selected').split('-');
        var names = $elem.attr('data-names') === undefined ?
                        config.names : $elem.attr('data-names').split('-');

        var option = {
            elem: $elem,
            names: names,
            selected: selected,
            fetchCb: config.fetchCb
        };

        $elem.on('change', 'select', function() {
            chainedSelect($.extend(option, {pid: +$(this).val(), index: $(this).index()}), false);
        });

        chainedSelect($.extend(option, {pid: 0, index: 0}), true);
    };
})(jQuery);
