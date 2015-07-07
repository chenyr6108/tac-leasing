(function($){
	$.autoWindows = function(callback){
		if(callback){
			
			if(!$._autoWidnows_callbacks_)
				$._autoWidnows_callbacks_={};
			$._autoWidnows_callbacks_[callback]=callback;
			
			var __AutoWindow_lastResizeTime_;//针对IE，上次刷新窗口时间
			
			function AutoWindowUpdate(){};
			
			function refreshWindows(){
				//IE特殊处理
				if($.browser.msie){
					if(__AutoWindow_lastResizeTime_){
						var now=new Date();
						if((now-__AutoWindow_lastResizeTime_)<200){
							__AutoWindow_lastResizeTime_=now;
							return ;
						}
					}
					__AutoWindow_lastResizeTime_=new Date();
				}
				if($.browser.msie){
					setTimeout(function(){
						for(var key in AutoWindowUpdate){
							AutoWindowUpdate[key]();
						}
					}, 500);
				}else
					for(var key in AutoWindowUpdate){
						AutoWindowUpdate[key]();
					}
			}
			
			AutoWindowUpdate=$._autoWidnows_callbacks_;
			
			window.onresize = $._autoWidnows_ = function() {
				refreshWindows();
			};
		}else{
			if($._autoWidnows_)$._autoWidnows_();
		}
		return $;
	};
})($);