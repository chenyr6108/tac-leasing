$(function(){
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher?__action=show.checkDesk",
		dataType:"json",
		success:function(dataBack){
			if(dataBack.head==0){
				for(var i=0;i<dataBack.names.length;i++){
					var name = dataBack.names[i];
					if("cust_collet"==name){
						//$("#column_1").append("<div id='cust_collet_outter' class='portlet'></div>");
						//$("#column_1").load("../servlet/defaultDispatcher?__action=show.getCustColletResult");
						$("#column_1").load("../servlet/defaultDispatcher?__action=show."+name+"Result");
					} else if("cust_research"==name){
						//$("#column_2").append("<div id='cust_research_outter'></div>");
						//$("#column_2").load("../servlet/defaultDispatcher?__action=show.getCustResearchResult");
						$("#column_2").load("../servlet/defaultDispatcher?__action=show."+name+"Result");
					}
				}
			} else if(dataBack.head==1) {
				/*for(var i=0;i<dataBack.deskList.length;i++) {
					var column = dataBack.deskList[i].DESK_COLUMN;
					var name = dataBack.deskList[i].DIV_ID;
					if("column_1"==column){
						$.get("../servlet/defaultDispatcher?__action=show."+name+"Result",function(data){
							$("#column_1").append(data);
						});
					} else if("column_2"==column){
						$.get("../servlet/defaultDispatcher?__action=show."+name+"Result",function(data){
							$("#column_2").append(data);
						});
					}
				}*/
				columnMethod(dataBack,0);//修改原先方法,使桌面模块具有排序功能 add ShenQi
			}
		}
	});
});

function columnMethod(dataBack,i) {
	if(i<dataBack.deskList.length) {
		var column=dataBack.deskList[i].DESK_COLUMN;
		var name=dataBack.deskList[i].DIV_ID;
		if("column_1"==column) {
			$.get("../servlet/defaultDispatcher?__action=show."+name+"Result",function(data) {
				$("#column_1").append(data);
				i++;
				columnMethod(dataBack,i);
			});
		}
		if("column_2"==column) {
			$.get("../servlet/defaultDispatcher?__action=show."+name+"Result",function(data) {
				$("#column_2").append(data);
				i++;
				columnMethod(dataBack,i);
			});
		}
	}
}
// 添加模块
function openAddDiv(){
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher?__action=show.selectDiv",
		dataType:"json",
		success:function(dataBack){
			if(dataBack.dicList.length>0){
				$("#table1 tr").remove();
				var count=1;
				var row=1;
				for(var i=0;i<dataBack.dicList.length;i++){
					var code = dataBack.dicList[i].CODE;
					var flag = dataBack.dicList[i].FLAG;
					if((count+1)%2==0) {
						$("#table1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align: left;'><input type='checkbox' value="+code+" name='divName' style='vertical-align: middle;'>"+flag+"</td><td style='text-align: left;'>&nbsp;</td></tr>");
					} else {
						$("#table1 tr").eq(row-1).find("td").eq(1).html("<input type='checkbox' value="+code+" name='divName' style='vertical-align: middle;'>"+flag);
					}
					if(count%2==0) {
						row++;
					}
					count++;
				}
			} else {
				$("#table1 tr").remove();
				$("#table1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align: center;'>对不起没有可选项目</td></tr>");
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
