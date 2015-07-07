(function($){
	$.fn.superdialog = function(config){
		var supBaseWindow = window;
		while(true){
			if(supBaseWindow.parent==supBaseWindow)
				break;
			supBaseWindow = supBaseWindow.parent;
		}
		return supBaseWindow.dialog(config,this);
	};
})($);