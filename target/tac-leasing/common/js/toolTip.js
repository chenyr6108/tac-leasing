(function($){
	    jQuery.fn.extend({
	        showTip:function(settings) {
	            var defaultOptions = {tipInfo:$(this).attr("title"), isAnimate:false};
	            var panel = '<div class="chart-panel">' +
							'<div class="chart-spanBG"></div>'+
							'<div class="chart-span">'+
							'<div class="container">' +
							'<div class="ctn"></div>' +
							'</div>' +
							'<div class="shadow"></div>' +
							'</div>'+
							'</div>';
							
	            $(this).each(function() {
	            	
	                //初始化配置信息,与运算
	                var options = jQuery.extend(defaultOptions,settings);
	                if(!options.tipInfo) {
	                    return;
	                }
	                $(this).removeAttr("title");
	                $(this).mouseover(function() {
	                    //设置提示信息最小宽度为163
	                    var oToolTip = $(panel);
	                    $(oToolTip).find('.ctn').append(options.tipInfo);
	                    //添加淡入效果
	                    if(options.isAnimate) {
	                        $(oToolTip).fadeIn(1000);
	                    } else {
	                    	$(oToolTip).show();
	                    }
	                    $(this).after(oToolTip);
	                    //计算提示信息的top、left和width 
	                    var position = $(this).position();
	                    var width = $(this).width();
	                    var oTipTop = position.top;
	                    var oTipLeft = position.left + width +5;
	                    $(oToolTip).css("top" , oTipTop + "px").css("left" , oTipLeft + "px");
	                    $(this).mouseout(function() {
	                        $(oToolTip).remove();
	                    });
	                });
	            });
	            return this;
			}
	    });
	})(jQuery);