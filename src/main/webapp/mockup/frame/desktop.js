// 添加模块
function openAddDiv(){
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher?__action=show.selectDiv",
		dataType:"json",
		success:function(dataBack){
			if(dataBack.dicList.length>0){
				$("#table1 td").remove();
				$("#table2 td").remove();
				for(var i=0;i<dataBack.dicList.length;i++){
					var code = dataBack.dicList[i].CODE;
					var flag = dataBack.dicList[i].FLAG;
					if(i <5){
						$("#table1 tr").append("<td style='text-align: center;'><input type='checkbox' value="+code+" name='divName'>"+flag+"</td>");
					}else{
						$("#table2 tr").append("<td style='text-align: center;'><input type='checkbox' value="+code+" name='divName'>"+flag+"</td>");
					}
				}
			} else {
				$("#table1 tr").append("<td style='text-align: center;'>对不起没有可选项目</td>");
			}
			
			$('#addDeskDiv').dialog({
				modal:true,
				autoOpen: false,
				width: 400
			});
			$('#addDeskDiv').dialog('open');
		},
		error:function(){
			alert("加载数据出现错误！");
		}
	});
}

// 关闭弹出层
function closeDialog(msg){
	$(msg).dialog('close');
}

// 判断是页面是否存在
function checkDivName(names){
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher?__action=show.checkDivName&name="+names.value,
		dataType:"json",
		success:function(dataBack){
			if(dataBack.msg != ""){
				alert(dataBack.msg);
				$(names).attr("checked", false);
			}
		}
	});
}

// 判断是否为空
function addDiv(){
	var s = $("input[@name='divName'][checked]");
	if(s.length>0){
		document.form1.submit();
	} else {
		return alert("对不起，您未选取，请选择一项");
	}
}

// 删除DIV
function deleteDIV(obj,idValue) {
     var this_box=$(obj).parent().parent().closest("div").remove();
     var url= "../servlet/defaultDispatcher?__action=show.deleteDiv&name="+idValue;
	 $.getJSON(url);
}