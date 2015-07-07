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
function closeAddSupplLinkRecord(){
	closeDialog(AddSupplLinkRecord)
}

function showDivAddSupplRecord(){
	var suppl_id = $.trim($("#suppl_id").val());
	 var param ={"__action":"supplier.querySupplLinkerInfo","suppl_id":suppl_id};
	$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success : function(json){
				var supplierLinker = json.supplierLinker;
				$("#Record_LINK_CUSTOMER").val(supplierLinker[0].NAME);
	if(supplierLinker.length > 1){
		for( var i =0;i<supplierLinker.length;i++){
			$("#Record_LINK_MAN").empty();
			$("#Record_LINK_MAN").append("<option value="+ supplierLinker[i].CULM_ID +" >"+ supplierLinker[i].LINK_NAME + "");
		}
	}else{
		$("#Record_LINK_MAN").empty();
		$("#Record_LINK_MAN").append("<option value="+ supplierLinker[0].CULM_ID +" >"+ supplierLinker[0].LINK_NAME + "");
	}
			},
			error: function(){
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！")
			}
		
	});
	
	showDialogbyName ('AddSupplLinkRecord');
}

function showDivAddSupplLinkCompetitor(){
	
	showDialogbyName ('AddSupplLinkCompetitor')
}

function  queryInfoSupplier(){
	var suppl_id = $.trim($("#suppl_id").val());
	 var param ={"__action":"supplier.querySupplLinkerInfo","suppl_id":suppl_id};
	$.ajax({
			type:"POST",
			data:param,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success : function(json){
				var supplierLinker = json.supplierLinker;
				return supplierLinker;
			},
			error: function(){
				alert(1)
			}
		
	});
	
}


//添加联系记录
function submitAddSupplLinkRecord() {
	
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
	
	var suppl_id = $.trim($("#suppl_id").val());
	var Record_LINK_PRINCIPAL = $.trim($("#Record_LINK_PRINCIPAL").val());
	var Record_LINK_THEME = $.trim($("#Record_LINK_THEME").val());
	var Record_LINK_DETAILS = $.trim($("#Record_LINK_DETAILS").val());
	var Record_LINK_DATE = $.trim($("#Record_LINK_DATE").val());
	var Record_LINK_MAN = $.trim($("#Record_LINK_MAN").val());
	var SELLOPPORTUNITY = $.trim($("#Record_SELLOPPORTUNITY").val());
	var Record_LINK_TYPE = $.trim($("#Record_LINK_TYPE").val());
	var Record_LINK_MEMO = $.trim($("#Record_LINK_MEMO").val());
	var Record_LINK_MAN_TEXT=$.trim($("#Record_LINK_MAN").find("option:selected").text());
	var LINK_TYPE=$.trim($("#Record_LINK_TYPE").find("option:selected").text());
	
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
	
	var param = {"suppl_id":suppl_id,
		"LINK_PRINCIPAL":Record_LINK_PRINCIPAL,"LINK_THEME":Record_LINK_THEME,
		"LINK_DETAILS":Record_LINK_DETAILS,"LINK_DATE":Record_LINK_DATE,
		"LINK_MEMO":Record_LINK_MEMO,"TYPE":Record_LINK_TYPE,"SELLOPPORTUNITY":SELLOPPORTUNITY,"CULM_ID":Record_LINK_MAN,
		"INTENT":$("#INTENT").val(),"IMPORTANT_RECORD":$("#IMPORTANT_RECORD").val(),"FROM_TIME":FROM_TIME,"TO_TIME":TO_TIME,		
		"__action":"supplier.createSupplLinkRecord"
	};
	
	$("#divAddSupplLinkman").css("z-index",0);
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(databack){
			$("#LinkRecordst").click();  
			 closeAddSupplLinkRecord(); 
			var cord= databack.supplLinkRecord;
		var ind = $("input[name='count']");
		var le = ind.length+1;
			 
			$("#SupplLinkRecord1").append("<tr style='text-align: center;' id='LinkRecord_"+cord.CULR_ID+"' class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align: center;'>"+le+"</td><td style='text-align: center;'>"+cord.LINK_DATE+"</td><td style='text-align: center;'>"+cord.FROM_TIME+"</td><td style='text-align: center;'>"+cord.TO_TIME+"</td><td style='text-align: center;'>"+cord.LINK_PRINCIPAL+"</td><td style='text-align: center;'>"+cord.INTENTDESCR+"</td><td style='text-align: center;'>"+cord.IMPORTANTDESCR+"</td><td style='text-align: center;'>"+cord.LINK_DETAILS+"</td></tr>");
			 alert("操作成功。");
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			
			$("#closeSupplLinkmanBut").click();
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
			data:{"CULR_ID":id,"__action":"supplier.deleteLinkrecord"},
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
