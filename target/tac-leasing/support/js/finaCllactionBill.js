function submitFinaId(){
     var finaId=$.trim($("#finaId").val());
	 var flag = true;
	 
	 if(valueIsNotNull(by('finaId'))){
		if(flag){
			$.ajax({
			type: 'post',
			url: '../servlet/defaultDispatcher ',
			data: {'__action':'supportPaylist.delFinaCllaction','select_income_id':finaId},
			dataType: "json",
				success : function(data){
					var s = data.msg;
					alert(s);
				}
			});
		}
	 }
}