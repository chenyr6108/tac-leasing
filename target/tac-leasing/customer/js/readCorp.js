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
	$("#LinkRecord_reset").click();
	closeDialog(AddCustLinkRecord)
}
function closeAddCustLinkcare(){
	$("#Linkcare_reset").click();
	closeDialog(AddCustLinkManCare);
}
function closeAddCustLinkExpense(){
	$("#LinkExpense_reset").click();
	closeDialog(AddCustLinkExpense)
}

function showDivAddCustLinkRecord(){
	showDialogbyName ('AddCustLinkRecord')
}

function showDivAddCustLinkExpense(){
	showDialogbyName ('AddCustLinkExpense')
}

function showDivAddCustLinkManCare(){
	showDialogbyName ('AddCustLinkManCare')
}

//查看联系记录
function readLinkRecord(id) {
	
	

	var param = {"CULR_ID":id,
		"__action":"customerlink.readCustLinkRecord"
	};
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(databack){
			$("#Record_LINK_PRINCIPAL").append(databack.custLinkRecord.LINK_PRINCIPAL);
			$("#Record_LINK_DATE").append(databack.custLinkRecord.LINK_DATE);
			$("#Record_LINK_THEME").append(databack.custLinkRecord.LINK_THEME);
			$("#Record_LINK_MAN").append(databack.custLinkRecord.LINK_NAME);
			
			if(databack.custLinkRecord.TYPE == 0){ 	$("#Record_LINK_TYPE").append("客户巡视");}
			if(databack.custLinkRecord.TYPE == 1){ 	$("#Record_LINK_TYPE").append("日常沟通"); }
			
			$("#Record_LINK_DETAILS").append(databack.custLinkRecord.LINK_DETAILS);
			$("#Record_LINK_MEMO").append(databack.custLinkRecord.LINK_MEMO);
			
			showDivAddCustLinkRecord();
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			
			return ;
		}
	
	});
}
//查看客户关怀
function readLinkManCare(id) {

	var param = {"CULC_ID":id,
		"__action":"customerlink.readCustLinkcare"
	};
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(databack){
			$("#LINK_PRINCIPAL_CARE").append(databack.custLinkcare.LINK_PRINCIPAL);
			$("#LINK_DATE_CARE").append(databack.custLinkcare.LINK_DATE);
			$("#LINK_THEME_CARE").append(databack.custLinkcare.LINK_THEME);
			$("#LINK_NAME_CARE").append(databack.custLinkcare.LINK_NAME);
			
			$("#CARELINK_DETAILS").append(databack.custLinkcare.LINK_DETAILS);
			$("#CARELINK_MEMO").append(databack.custLinkcare.LINK_MEMO);
			
			showDivAddCustLinkManCare();
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			
			return ;
		}
	
	});
}
//查看费用
function readLinkExpense(id) {

	var param = {"CULE_ID":id,
		"__action":"customerlink.readCustLinkExpense"
	};
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(databack){
			
			$("#ExLINK_PRINCIPAL").append(databack.custLinkExpense.LINK_PRINCIPAL);
			$("#ExLINK_DATE").append(databack.custLinkExpense.LINK_DATE);
			$("#ExLINK_PURPOSE").append(databack.custLinkExpense.LINK_PURPOSE);
			
 			if(databack.custLinkExpense.LINK_TYPE == 1){ 	$("#ExLINK_TYPE").append("餐饮");}
			if(databack.custLinkExpense.LINK_TYPE == 2){ 	$("#ExLINK_TYPE").append("交通"); }
			if(databack.custLinkExpense.LINK_TYPE == 3){ 	$("#ExLINK_TYPE").append("住宿"); }
			if(databack.custLinkExpense.LINK_TYPE == 4){ 	$("#ExLINK_TYPE").append("通讯"); }
			if(databack.custLinkExpense.LINK_TYPE == 5){ 	$("#ExLINK_TYPE").append("礼品"); }
			if(databack.custLinkExpense.LINK_TYPE == 6){ 	$("#ExLINK_TYPE").append("办公"); }
			if(databack.custLinkExpense.LINK_TYPE == 7){ 	$("#ExLINK_TYPE").append("其他"); }
			
			$("#ExLINK_MONEY").append(databack.custLinkExpense.LINK_MONEY);
			
			 	$("#ExINVOICE_CODE").append(databack.custLinkExpense.INVOICE_CODE);
		 
				if(databack.custLinkExpense.CURRENCY == 0){ 	$("#ExCURRENCY").append("人民币");}
			if(databack.custLinkExpense.CURRENCY == 1){ 	$("#ExCURRENCY").append("美元"); }
			
			$("#ExpenseHANDLE_MAN").append(databack.custLinkExpense.HANDLE_MAN);
			$("#ExLINK_MEMO").append(databack.custLinkExpense.LINK_MEMO);
			
			showDivAddCustLinkExpense();
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			
			return ;
		}
	
	});
}