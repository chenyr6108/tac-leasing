//联系记录 日期
$(function(){
	$("#Record_LINK_DATE").datepicker($.datepicker.regional['zh-CN']);
	$("#CARELINK_DATE").datepicker($.datepicker.regional['zh-CN']);
	$("#ExLINK_DATE").datepicker($.datepicker.regional['zh-CN']);
	$("#COMPTLINK_DATE").datepicker($.datepicker.regional['zh-CN']);
	
})

//显示联系人的弹出层
 function showDialogbyName (divName) {
	
	$('#'+divName).dialog({
		modal:true,
		autoOpen: false	,
		width:660,
	});
	$('#'+divName).dialog('open');	
}

//弹出层关闭按钮
function closeDialog(msg){
	$(msg).dialog('close');
}
//关闭函数
function closeAddCustLinkRecord(){
	closeDialog(AddCustLinkRecord)
}
function closeAddCustLinkcare(){
	closeDialog(AddCustLinkManCare)
}
function closeAddCustLinkExpense(){
	closeDialog(AddCustLinkExpense)
}
function closeAddCustLinkCompetitor(){
	closeDialog(AddCustLinkCompetitor)
}

function showDivAddCustLinkRecord(){
	/*var cust_id = $.trim($("#cust_id").val());
	 var param ={"__action":"customerlink.queryCustomerInfo","cust_id":cust_id};
	$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success : function(json){
				var cust = json.cust;
				$("#Record_LINK_CUSTOMER").val(cust[0].cust_name);
	if(cust.length > 1){
		for( var i =0;i<cust.length;i++){
			$("#Record_LINK_MAN").empty();
			$("#Record_LINK_MAN").append("<option value="+ cust[i].CULM_ID +" >"+ cust[i].LINK_NAME + "");
		}
	}else{
		$("#Record_LINK_MAN").append("<option value="+ cust[0].CULM_ID +" >"+ cust[0].LINK_NAME + "");
	}
	
			},
			error: function(){
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！")
			}
		
	});*/
	
	showDialogbyName ('AddCustLinkRecord');
}

function showDivAddCustLinkCompetitor(){
	
	showDialogbyName ('AddCustLinkCompetitor')
}
function showDivAddCustLinkExpense(){
		var cust_id = $.trim($("#cust_id").val());
	 var param ={"__action":"customerlink.queryCustomerInfo","cust_id":cust_id};
	$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success : function(json){
				
				var cust = json.cust;
				$("#CARELINK_CUSTOMER").val(cust[0].cust_name);
	
			},
			error: function(){
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！")
			}
		
	});
	
	showDialogbyName ('AddCustLinkExpense')
}

function showDivAddCustLinkManCare(){
		var cust_id = $.trim($("#cust_id").val());
	 var param ={"__action":"customerlink.queryCustomerInfo","cust_id":cust_id};
	$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success : function(json){
				var cust = json.cust;
				$("#CARELINK_CUSTOMER").val(cust[0].cust_name);
	if(cust.length > 1){
		for( var i =0;i<cust.length;i++){
			$("#CARELINK_MAN").empty();
			$("#CARELINK_MAN").append("<option value="+ cust[i].CULM_ID +" >"+ cust[i].LINK_NAME + "");
		}
	}else{
		$("#CARELINK_MAN").append("<option value="+ cust[0].CULM_ID +" >"+ cust[0].LINK_NAME + "");
	}
	
			},
			error: function(){
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！")
			}
		
	});
	
	showDialogbyName ('AddCustLinkManCare')
}
//ajax 查询客户与联系人信息
//__action=  customerlink.queryCustomerInfo&cust_id=883
//__action":"customerlink.createCustLinkRecord"
function  queryInfoCustomer(){
	var cust_id = $.trim($("#cust_id").val());
	 var param ={"__action":"customerlink.queryCustomerInfo","cust_id":cust_id};
	$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success : function(json){
				var cust = json.cust;
				return cust;
			},
			error: function(){
				alert(1)
			}
		
	});
	
}


//添加联系记录
function submitAddCustLinkRecord() {
	//验证时间大小
	if(parseInt($("#TO_HOUR").val())<parseInt($("#FROM_HOUR").val())) {
		alert("开始时间应该小于结束时间!");
		return;
	} else if(parseInt($("#TO_HOUR").val())==parseInt($("#FROM_HOUR").val())) {
		if(parseInt($("#FROM_MIN").val())!=0) {
			alert("开始时间应该小于结束时间!");
			return;
		} else {
			if(parseInt($("#TO_MIN").val())==0) {
				alert("开始时间应该小于结束时间!");
				return;
			}
		}
	}
	var cust_id = $.trim($("#cust_id").val());
	var Record_LINK_PRINCIPAL = $.trim($("#Record_LINK_PRINCIPAL").val());
	var Record_LINK_THEME = $.trim($("#Record_LINK_THEME").val());
	var Record_LINK_DETAILS = $.trim($("#Record_LINK_DETAILS").val());
	var Record_LINK_DATE = $.trim($("#Record_LINK_DATE").val());
	var Record_LINK_MAN = $.trim($("#Record_LINK_MAN").val());
	var SELLOPPORTUNITY = $.trim($("#Record_SELLOPPORTUNITY").val());
	var Record_LINK_TYPE = $.trim($("#Record_LINK_TYPE").val());
	var Record_LINK_MEMO = $.trim($("#Record_LINK_MEMO").val());
	
/*	if (Record_LINK_PRINCIPAL == ''){
		alert("请输入联系记录的负责人！");
		return ;
	}
	if (Record_LINK_THEME == ''){
		alert("请输入联系记录的主题！");
		return ;
	}
	if (Record_LINK_DATE == ''){
		alert("请输入联系记录的日期！");
		return ;
	}*/
	if (Record_LINK_DETAILS == ''){
		alert("请输入联系记录的内容！");
		return ;
	}
	
	var FROM_TIME=$("#FROM_HOUR").val()+":"+$("#FROM_MIN").val();
	var TO_TIME=$("#TO_HOUR").val()+":"+$("#TO_MIN").val();
	var param = {"CUST_ID":cust_id,
		"LINK_PRINCIPAL":Record_LINK_PRINCIPAL,"LINK_THEME":Record_LINK_THEME,
		"LINK_DETAILS":Record_LINK_DETAILS,"LINK_DATE":Record_LINK_DATE,
		"LINK_MEMO":Record_LINK_MEMO,"TYPE":Record_LINK_TYPE,"SELLOPPORTUNITY":SELLOPPORTUNITY,"CULM_ID":Record_LINK_MAN,
		"INTENT":$("#INTENT").val(),"IMPORTANT_RECORD":$("#IMPORTANT_RECORD").val(),"FROM_TIME":FROM_TIME,"TO_TIME":TO_TIME,
		"__action":"customerlink.createCustLinkRecord"
	};
	
	$("#divAddCustLinkman").css("z-index",0);
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(databack){
			$("#LinkRecordst").click();  
			 closeAddCustLinkRecord(); 
			var cord= databack.custLinkRecord;
	//		var ind = document.getElementById(CustLinkRecord1).lastChild.firstChild;
		var ind = $("input[name='count']");
		var le = ind.length+1;
		if(Record_LINK_TYPE == 1){ var LINK_TYPE = "日常沟通"};
		if(Record_LINK_TYPE == 0){ var LINK_TYPE = "客户巡视"};
			 
			$("#CustLinkRecord1").append("<tr id='LinkRecord_"+cord.CULR_ID+"' class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center;'>"+le+"&nbsp;</td><td style='text-align:center;'>"+cord.LINK_DATE+"&nbsp;</td><td style='text-align:center;'>"+cord.FROM_TIME+"&nbsp;</td><td style='text-align:center;'>"+cord.TO_TIME+"&nbsp;</td><td style='text-align:center;'>"+Record_LINK_PRINCIPAL+"&nbsp;</td><td style='text-align:center;'>"+cord.INTENTDESCR+"&nbsp;</td><td style='text-align:center;'>"+cord.IMPORTANTDESCR+"&nbsp;</td><td style='text-align:center;'>"+Record_LINK_DETAILS+"</td></tr>");
			 alert("操作成功。");
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			
			$("#closeCustLinkmanBut").click();
			return ;
		}
	
	});
}
//删除联系记录
function deleteLinkRecord(id){
	var msg = "您确定要删除此条联系记录吗？";
	if (confirm(msg)){
		
		$.ajax({
			type:"POST",
			data:{"CULR_ID":id,"__action":"customerlink.deleteLinkrecord"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.result == 1){
					alert("操作已成功！");
				
					$("#LinkRecord_"+id).remove();
					
					return;
				} else {
					alert("操作失败，请稍后刷新页面重试或联系系统管理员！");
					
					return;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！");
				
				return ;
			}
		});
	}

}



//添加客户关怀
function submitAddCustLinkcare() {
	var cust_id = $.trim($("#cust_id").val());
	var CARELINK_PRINCIPAL = $.trim($("#CARELINK_PRINCIPAL").val());
	var CARELINK_THEME = $.trim($("#CARELINK_THEME").val());
	var CARELINK_DETAILS = $.trim($("#CARELINK_DETAILS").val());
	var CARELINK_DATE = $.trim($("#CARELINK_DATE").val());
	var CARELINK_MAN = $.trim($("#CARELINK_MAN").val());
	var CARELINK_MEMO = $.trim($("CARELINK_MEMO").val());
	
	if (CARELINK_PRINCIPAL == ''){
		alert("请输入联系记录的负责人！");
		return ;
	}
	if (CARELINK_THEME == ''){
		alert("请输入联系记录的主题！");
		return ;
	}
	if (CARELINK_DATE == ''){
		alert("请输入联系记录的日期！");
		return ;
	}
	if (CARELINK_DETAILS == ''){
		alert("请输入联系记录的内容！");
		return ;
	}
	
	var param = {"CUST_ID":cust_id,
		"LINK_PRINCIPAL":CARELINK_PRINCIPAL,"LINK_THEME":CARELINK_THEME,
		"LINK_DETAILS":CARELINK_DETAILS,"LINK_DATE":CARELINK_DATE,
		"LINK_MEMO":CARELINK_MEMO,"CULM_ID":CARELINK_MAN,
		"__action":"customerlink.createCustLinkcare"
	};
	
	$("#AddCustLinkManCare").css("z-index",0);
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			$("#Linkcare_reset").click()    
			 closeAddCustLinkcare()
 // forcountNum		
 var ind = $("input[name='forcountNum']");
		var le = ind.length;
 var cord= callback.custLinkcare;
 $("#LinkCaretable1").append("<tr id='CustLinkmancare_"+cord.CULC_ID+"' class='ui-widget-content jqgrow ui-row-ltr'><td>"+le+"</td><td>"+CARELINK_THEME+"</td><td>"+CARELINK_DATE+"</td><td >"+CARELINK_PRINCIPAL+"</td><td>"+CARELINK_DETAILS+"</td><td><a href='javascript:void(0)' onclick=\"deleteLinkcare('"+cord.CULC_ID+"')\">删除</a> </td></tr>");	 
			  alert("操作成功。");
			  
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			
			
			return ;
		}
	
	});
}
//删除客户关怀
function deleteLinkcare(id){
	var msg = "您确定要删除此条客户关怀记录吗？";
	if (confirm(msg)){
		
		$.ajax({
			type:"POST",
			data:{"CULC_ID":id,"__action":"customerlink.deleteLinkcare"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.result == 1){
					alert("操作已成功！");
				
					$("#CustLinkmancare_"+id).remove();
					
					return;
				} else {
					alert("操作失败，请稍后刷新页面重试或联系系统管理员！");
					
					return;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！");
				
				return ;
			}
		});
	}

}

//添加费用记录
function submitAddCustLinkExpense() {
	var cust_id = $.trim($("#cust_id").val());
	var ExLINK_PRINCIPAL = $.trim($("#ExLINK_PRINCIPAL").val());
	var ExINVOICE_CODE = $.trim($("#ExINVOICE_CODE").val());
	var ExLINK_PURPOSE = $.trim($("#ExLINK_PURPOSE").val());
	var ExLINK_DATE = $.trim($("#ExLINK_DATE").val());
	var ExLINK_MONEY = $.trim($("#ExLINK_MONEY").val());
	var ExpenseHANDLE_MAN = $.trim($("#ExpenseHANDLE_MAN").val());
	var ExLINK_MEMO = $.trim($("#ExLINK_MEMO").val());
	var ExCURRENCY = $.trim($("#ExCURRENCY").val());
	var ExLINK_TYPE = $.trim($("#ExLINK_TYPE").val());
	
	if (ExLINK_PRINCIPAL == ''){
		alert("请输入联系记录的负责人！");
		return ;
	}
	if (ExINVOICE_CODE == ''){
		alert("请输入费用的单据编号！");
		return ;
	}
	if (ExLINK_DATE == ''){
		alert("请输入费用的日期！");
		return ;
	}
	if (ExLINK_PURPOSE == ''){
		alert("请输入费用的用途！");
		return ;
	}
	if (ExLINK_MONEY == ''){
		alert("请输入费用的金额！");
		return ;
	}
	
	if (ExpenseHANDLE_MAN == ''){
		
		alert("请输入费用的经手人！");
		return ;
	}
	
	var param = {"CUST_ID":cust_id,
		"LINK_PRINCIPAL":ExLINK_PRINCIPAL,"INVOICE_CODE":ExINVOICE_CODE,
		"LINK_PURPOSE":ExLINK_PURPOSE,"LINK_DATE":ExLINK_DATE,
		"LINK_MEMO":ExLINK_MEMO,"LINK_MONEY":ExLINK_MONEY,"HANDLE_MAN":ExpenseHANDLE_MAN,"CURRENCY":ExCURRENCY,"LINK_TYPE":ExLINK_TYPE,
		"__action":"customerlink.createCustLinkExpense"
	};
	
	
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			
			$("#LinkExpense_reset").click();
			 closeAddCustLinkExpense();
	 var cord= callback.custLinkExpense;
//statusnumCount
var ind = $("input[name='statusnumCount']");
		var le = ind.length; 
		if(ExLINK_TYPE == 1){ var LINK_TYPE = "餐饮"};
		if(ExLINK_TYPE == 2){ var LINK_TYPE = "交通"};
		if(ExLINK_TYPE == 3){ var LINK_TYPE = "住宿"};
		if(ExLINK_TYPE == 4){ var LINK_TYPE = "通讯"};
		if(ExLINK_TYPE == 5){ var LINK_TYPE = "礼品"};
		if(ExLINK_TYPE == 6){ var LINK_TYPE = "办公"};
		if(ExLINK_TYPE == 7){ var LINK_TYPE = "其他"};
 $("#CuExpense1").append("<tr id='CustLinkExpense"+cord.CULE_ID+"' class='ui-widget-content jqgrow ui-row-ltr'><td class='ui-widget-content jqgrow ui-row-ltr'>"+le+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+ExINVOICE_CODE+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+ExLINK_PURPOSE+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+ExLINK_MONEY+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+LINK_TYPE+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+ExLINK_PRINCIPAL+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+ExLINK_DATE+"</td><td class='ui-widget-content jqgrow ui-row-ltr'><a href='javascript:void(0)' onclick=\"deleteLinkExpense('"+cord.CULE_ID+"')\">删除</a> </td></tr>");	 

			  alert("操作成功。");
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			
			
			return ;
		}
	
	});
}
//删除费用记录
function deleteLinkExpense(id){
	var msg = "您确定要删除此条客户关怀记录吗？";
	if (confirm(msg)) {
	
		$.ajax({
			type: "POST",
			data: {
				"CULE_ID": id,
				"__action": "customerlink.deleteLinkExpense"
			},
			url: "../servlet/defaultDispatcher",
			dataType: "json",
			success: function(callback){
				if (callback.result == 1) {
					alert("操作已成功！");
					
					$("#CustLinkExpense" + id).remove();
					
					return;
				}
				else {
					alert("操作失败，请稍后刷新页面重试或联系系统管理员！");
					
					return;
				}
			},
			error: function(callback){
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！");
				
				return;
			}
		});
	}
}