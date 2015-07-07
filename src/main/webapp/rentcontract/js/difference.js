$(document).ready(function () {  
	PageLoad('#customerInfo tr');
	TabLoad('#equipments tr');
	PageLoad('#schemaInfo tr');
	TabLoad('#insure tr');
	TabLoad('#otherprice tr');
});

function PageLoad(obj){
	$(obj).each(function(i) {
		if(i>1){
			var text = $('td:eq(3)',this).text();
			if($.trim(text)=='ALLRIGHT'){
				
				$(this).hide();
			}else if($.trim(text)=='A正确'){
				$(this.cells[2]).css("background-color","#FFC864");
			}else if($.trim(text)=='B正确'){
				$(this.cells[1]).css("background-color","#FFC864");
			}else{
				$(this.cells[1]).css("background-color","#FFC864");
				$(this.cells[2]).css("background-color","#FFC864");
			} 
		}
	});
}

function TabLoad(obj){
	var text=$(obj+":eq(1) td:eq(0)").html();
	if($.trim(text)=='A正确'||$.trim(text)=='B正确'){
		$(obj+":eq(1) td:eq(0)").css("background-color","#FFC864");
	}else{
		
	}
}