$(function() {
    function getChildOptions(pid)
    {
        return __districts__.filter(function(district) {
            return district.pid === pid;
        });
    }

    $('#cs').chainedSelect({
        fetchCb: getChildOptions
    });
});
