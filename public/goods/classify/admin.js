$(document).ready(function(){
    $('.J_cate_select').on('change', function(){
        value=$(this).val();
        if(value){
            $('.cont').html('');
            get_id(value);
        }
    });
    function get_id(id){
        $.ajax({
            type: "POST",
            url: '{:url('goods/classify/create')}',
            data: {
                'type':'get_id',
                'id':id,
            },
            dataType: "json",
            success : function(data){
                html='';
                content=data.data;
                alert(data);
                html+='<option value="" selected="selected">请选择</option>';
                for (i in content)
                {
                    html+='<option name="energy_id" value="'+content[i]['id']+'">&nbsp;'+content[i]['content']+'&nbsp;&nbsp;&nbsp;</option>';
                }
                $('.cont').html(html);
            }
         });
        }
});
//显示大图
;(function($){
	$.fn.preview = function(){
		var w = $(window).width();
		var h = $(window).height();

		$(this).each(function(){
			$(this).hover(function(e){
				// if(/.png$|.gif$|.jpg$|.bmp$|.jpeg$/.test($(this).attr("data-bimg"))){
					$("body").append("<div id='preview'><img src='"+$(this).attr('data-bimg')+"' style='max-width:400px;max-height:400px'/></div>");
				// }
				var show_x = $(this).offset().left + $(this).width();
				var show_y = $(this).offset().top;
				var scroll_y = $(window).scrollTop();
				$("#preview").css({
					position:"absolute",
					padding:"4px",
					border:"1px solid #f3f3f3",
					backgroundColor:"#eeeeee",
					top:show_y + "px",
					left:show_x + "px",
					zIndex:1000
				});
				$("#preview > div").css({
					padding:"5px",
					backgroundColor:"white",
					border:"1px solid #cccccc"
				});
				if (show_y + 230 > h + scroll_y) {
					$("#preview").css("bottom", h - show_y - $(this).height() + "px").css("top", "auto");
				} else {
					$("#preview").css("top", show_y + "px").css("bottom", "auto");
				}
				$("#preview").fadeIn("fast")
			},function(){
				$("#preview").remove();
			})
		});
	};
})(jQuery);
