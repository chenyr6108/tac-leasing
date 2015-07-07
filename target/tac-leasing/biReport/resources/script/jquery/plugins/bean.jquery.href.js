(function($){
	$.href = function(arg){
		
		function execute(p,strParam){
			if(strParam){
				var arrParams = strParam.split("&");
				for(var i=0;i<arrParams.length;i+=1){
					if(arrParams[i].indexOf(p+"=")===0){
						return arrParams[i].split("=")[1];
					}else if(arrParams[i]==p){
						return "";
					}
				}
			}
		}
		
		if(arg.indexOf("#")==0){
			return execute(arg.substring(1),location.href.split("#")[1]);
		}else{
			return execute(arg,location.href.split("#")[0].split("?")[1]);
		}
		return null;
	};
})($);