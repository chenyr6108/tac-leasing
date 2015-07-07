function addPower(msg){
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher?__action=creditReport.selectUserPower&creditId="+msg,
		dataType:"json",
		success:function(dataBack){
				$("#headtr tr").remove();
				if(dataBack.userList.length>0){
					$("#addPower").attr("title","授权管理");
					$("#action").val("creditReport.addPower");
					$("#crId").val(dataBack.credit_id);
					var str = 'trc';
					for(var i=0;i<dataBack.userList.length;i++){
						var user = dataBack.userList[i];
						if(i%5==0 ){
							str= str+i;
							$("#headtr").append("<tr class='ui-widget-content jqgrow ui-row-ltr' id="+str+"></tr>");
						}
						$("#"+str).append("<td><input type='checkbox' value="+user.ID+" name='username'>"+user.NAME+"</td>");
					}
				} else {
					$("#headtr").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align: center;'>对不起没有可选项目</td></tr>");
				}
		
			$('#addPower').dialog({
				modal:true,
				autoOpen: false,
				width: 400
			});
			$('#addPower').dialog('open');
		}
	});
}

function upPower(msg){
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher?__action=creditReport.selectPower&creditId="+msg,
		dataType:"json",
		success:function(dataBack){
				$("#headtr tr").remove();
				if(dataBack.powerList.length>0){
					$("#addPower").attr("title","取消授权");
					$("#action").val("creditReport.upPower");
					$("#crId").val(dataBack.credit_id);
					var str = 'trc';
					for(var i=0;i<dataBack.powerList.length;i++){
						var user = dataBack.powerList[i];
						if(i%5==0 ){
							str= str+i;
							$("#headtr").append("<tr class='ui-widget-content jqgrow ui-row-ltr' id="+str+"></tr>");
						}
						$("#"+str).append("<td><input type='checkbox' value="+user.ID+" name='username'>"+user.NAME+"</td>");
					}
				} else {
					$("#headtr").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align: center;'>对不起没有可选项目</td></tr>");
				}
			$('#addPower').dialog({
				modal:true,
				autoOpen: false,
				width: 400
			});
			$('#addPower').dialog('open');
		}
	});
}
// 判断是否为空
function submitButt(){
	var s = $("input[@name='username'][checked]");
	if(s.length>0){
		document.form2.submit();
	} else {
		return alert("对不起，您未选取，请选择一项");
	}
}
// 关闭弹出层
function closeDialog(msg){
	$("#"+msg).dialog('close');
}