//获取银行下的账号信息
function showbankno() {
	var bankname = $("#search_bankname").val();
	$.ajax({url:"../servlet/defaultDispatcher", type:"POST", data:"__action=decompose.queryBankNo&search_bankname=" + bankname, datatype:"json", success:backshowbankno});
}
function backshowbankno(callback) {
	eval("map=" + callback);
	var map = map;
	var item = map.bankNoList;
	eval("arraylist=" + item);
	var arraylist = arraylist;
	var html = "<option value='\u5168\u90e8'>\u5168\u90e8</option>";
	for (var i = 0; i < arraylist.length; i++) {
		var bank = arraylist[i];
		html += "<option value='" + bank.ACCOUNT_NO + "'>" + bank.ACCOUNT_NO + "</option>";
	}
	$("#search_bankno").html(html);
}
//来款搜索
function selectincome() {
	var startmoney = $("#search_startmoney").val();
	var endmoney = $("#search_endmoney").val();
	var reg = /^(-  ¦\+)?\d+(\.\d+)?$/;
	if (startmoney != null && startmoney != "") {
		if (!reg.test(startmoney)) {
			alert("\u975e\u6cd5\u6570\u5b57\uff01\uff01\uff01");
			$("#search_startmoney").focus();
			return false;
		}
	}
	if (endmoney != null && endmoney != "") {
		if (!reg.test(endmoney)) {
			alert("\u975e\u6cd5\u6570\u5b57\uff01\uff01\uff01");
			$("#search_endmoney").focus();
			return false;
		}
	}
	$("#form1").submit();
}
//制作分解单时弹出层
function showCustInfo() {
	var decomposeStatuss = $("input[name='decompose_status']");
	var decomposeLocked = $("input[name='income_locked']");
	  var chk_value =[];   
	  $('input[name="decompose_status"]:checked').each(function(){   
	   chk_value.push($(this).val());   
	  });   
	  if(chk_value.length==0){
	  	alert("请选择一条记录.");
	  	return false;}	
					  	
					  		
	var opposingNames = $("input[name='opposing_name']");
	var incomeIds = $("input[name='income_id']");
	var opposingDates = $("input[name='opposing_date']");
	var fiinids = $("input[name='fiin_id']");
	
	for (i = 0; i < decomposeStatuss.length; i++) {
		var decomposeStatus;
		if (decomposeStatuss[i].checked == true) {
			decomposeStatus = decomposeStatuss[i].value;
			var select_income_id = fiinids[i].value;
			//alert(select_income_id);
			//decomposeLockeds = decomposeLocked[i].value;
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=checkDecompose.getLockedByFiinid&select_income_id='+select_income_id,
				dataType:'json',
				success:function(dataBack){ 
					var incomeMap=dataBack.incomeLocked;
					alertinfo = incomeMap.LOCKED;
					//alert(alertinfo);
					if(alertinfo==1){
						alert("本数据处于被锁定状态，不能进行分解！");
						$("#tanchu1").dialog("close");
						return false;
					}
				}
			});		
			
			if (decomposeStatus == 4) {
				alert("\u6b64\u6765\u6b3e\u5236\u4f5c\u7684\u5206\u89e3\u5355\u5df2\u7ecf\u63d0\u4ea4\u8d22\u52a1\uff0c\u4e0d\u80fd\u518d\u505a\u5206\u89e3\uff01");
				return false;
			} else {
				if (decomposeStatus == 5) {
					alert("\u6b64\u6765\u6b3e\u5236\u4f5c\u7684\u5206\u89e3\u5355\u8d22\u52a1\u5df2\u7ecf\u786e\u8ba4\uff0c\u4e0d\u80fd\u518d\u505a\u5206\u89e3\uff01");
					return false;
				} else {
					if (decomposeStatus == 6) {
						alert("\u6b64\u6765\u6b3e\u5df2\u7ecf\u88ab\u8f6c\u51fa\uff0c\u4e0d\u80fd\u518d\u505a\u5206\u89e3\uff01");
						return false;
					} else {
						if (decomposeStatus == 7) {
							alert("\u8be5\u7b14\u6765\u6b3e\u5df2\u7ecf\u5f62\u6210\u4e1a\u52a1\u5916\u6b3e\uff0c\u4e0d\u80fd\u5206\u89e3\uff01");
							return false;
						} else {
							$("#decompose_opposingname").html("<a href='javascript:showOpposingName(\"" + opposingNames[i].value + "\")'>" + opposingNames[i].value + "</a>");
							$("#select_income_id").val(incomeIds[i].value);
							$("#opposing_date").val(opposingDates[i].value);
							$("#tanchu1").dialog({modal:true, autoOpen:false, width:500});
							$("#tanchu1").dialog("open");
						}
					}
				}
			}
		}
	}
	 
}

//制作结清单时弹出层
function showRecpInfo() {
	
	var decomposeStatuss = $("input[name='decompose_status']");

	  var chk_value =[];   
	  $('input[name="decompose_status"]:checked').each(function(){   
	   chk_value.push($(this).val());   
	  });   
	  if(chk_value.length==0){
	  	alert("请选择一条记录.");
	  	return false;}	
	  	
	  		
	var opposingNames = $("input[name='opposing_name']");
	var incomeIds = $("input[name='income_id']");
	for (i = 0; i < decomposeStatuss.length; i++) {
		var decomposeStatus;
		if (decomposeStatuss[i].checked == true) {
			decomposeStatus = decomposeStatuss[i].value;
			if (decomposeStatus == 4) {
				alert("\u6b64\u6765\u6b3e\u5236\u4f5c\u7684\u5206\u89e3\u5355\u5df2\u7ecf\u63d0\u4ea4\u8d22\u52a1\uff0c\u4e0d\u80fd\u518d\u505a\u5206\u89e3\uff01");
				return false;
			} else {
				if (decomposeStatus == 5) {
					alert("\u6b64\u6765\u6b3e\u5236\u4f5c\u7684\u5206\u89e3\u5355\u8d22\u52a1\u5df2\u7ecf\u786e\u8ba4\uff0c\u4e0d\u80fd\u518d\u505a\u5206\u89e3\uff01");
					return false;
				} else {
					if (decomposeStatus == 6) {
						alert("\u6b64\u6765\u6b3e\u5df2\u7ecf\u88ab\u8f6c\u51fa\uff0c\u4e0d\u80fd\u518d\u505a\u5206\u89e3\uff01");
						return false;
					} else {
						if (decomposeStatus == 7) {
							alert("\u8be5\u7b14\u6765\u6b3e\u5df2\u7ecf\u5f62\u6210\u4e1a\u52a1\u5916\u6b3e\uff0c\u4e0d\u80fd\u5206\u89e3\uff01");
							return false;
						} else {
							$("#select_income_id1").val(incomeIds[i].value);
							$("#recpDiv").dialog({modal:true, autoOpen:false, width:500});
							$("#recpDiv").dialog("open");
						}
					}
				}
			}
		}
	}
}
//弹出备注信息层
function showRemarkDiv(fiin_id, operate_flag, remark) {
	$("#select_incomeid").val(fiin_id);
	if (operate_flag == "0") {
		$("#operate_remark").val("");
		$("#remark_operate").html("\u6dfb\u52a0\u5907\u6ce8");
		$("#operate_remark").attr("readonly", "");
		$("#button_flag").html("<input type='button' value='\u786e&nbsp;\u5b9a' class='ui-state-default ui-corner-all' onclick='updateRemark()'><input type='button' value='\u5173&nbsp;\u95ed' onclick='closeDialog(\"remarkdiv\");' class='ui-state-default ui-corner-all'>");
	}
	if (operate_flag == "1") {
		$("#operate_remark").val(remark);
		$("#remark_operate").html("\u67e5\u770b\u5907\u6ce8");
		$("#operate_remark").attr("readonly", "readonly");
		$("#button_flag").html("<input type='button' value='\u5173&nbsp;\u95ed' onclick='closeDialog(\"remarkdiv\");' class='ui-state-default ui-corner-all'>");
	}
	if (operate_flag == "2") {
		$("#operate_remark").val(remark);
		$("#remark_operate").html("\u4fee\u6539\u5907\u6ce8");
		$("#operate_remark").attr("readonly", "");
		$("#button_flag").html("<input type='button' value='\u786e&nbsp;\u5b9a' class='ui-state-default ui-corner-all' onclick='updateRemark()'><input type='button' value='\u5173&nbsp;\u95ed' onclick='closeDialog(\"remarkdiv\");' class='ui-state-default ui-corner-all'>");
	}
	$("#remarkdiv").dialog({modal:true, autoOpen:false, width:500});
	$("#remarkdiv").dialog("open");
}
//修改来款资金备注
function updateRemark() {
	var select_incomeid = $("#select_incomeid").val();
	var operate_remark = $("#operate_remark").val();
	$.ajax({url:"../servlet/defaultDispatcher", type:"post", data:"__action=decompose.updateOperateRemark&select_incomeid=" + select_incomeid + "&operate_remark=" + operate_remark, dataType:"json", success:backupdateRemark});
}
//修改来款资金备注的回调函数
function backupdateRemark(callback) {
	alert(callback.updateresult);
	$("#remarkdiv").dialog("close");
	window.location.reload();
}
// 关闭层
function closeDialog(msg) {
	$("#"+msg).dialog("close");
}


//点击承租人会将承租人信息显示在输入框中
function showOpposingName(opposingname) {
	$("#decomposeCustName").val(opposingname);
}
//正常结清
function normalSettle() {
	$("#__action1").val("decompose.queryRecpNormalSettleInfo");
	var select_income_id = $("#select_income_id1").val();
	var cust_code = $("#cust_code1").val();
	var recp_code = $("#recp_code").val();
	var action = $("#__action1").val();
	window.location.href = "../servlet/defaultDispatcher?__action=" + action + "&cust_code=" + cust_code + "&recp_code=" + recp_code + "&select_income_id=" + select_income_id + "&ficb_flag=1";
}
//提前结清
function aheadSettle() {
	$("#__action1").val("decompose.queryRecpAheadSettleInfo");
	var select_income_id = $("#select_income_id1").val();
	var cust_code = $("#cust_code1").val();
	var recp_code = $("#recp_code").val();
	if(cust_code == null || cust_code =='' || recp_code==null || recp_code == ''){
		alert("请按空格键点击提示弹出支付表信息") ;
		$("decomposeRecpCode").val("") ;
		return false ;
	}
	var action = $("#__action1").val();
	window.location.href = "../servlet/defaultDispatcher?__action=" + action + "&cust_code=" + cust_code + "&recp_code=" + recp_code + "&select_income_id=" + select_income_id + "&ficb_flag=3";
}
//承租人提示
$(function () {
	//initInput("#decompose_rentername");
	// 加载数据, 并在回调函数中用返回的数据初始化autocomplete
	$.ajax({type:"post", url:"../servlet/defaultDispatcher", data:"__action=decompose.queryCustInfo", dataType:"json", success:initAutoComplete});
});
//支付表信息提示
$(function () {
	//initInput("#decompose_rentername");
	// 加载数据, 并在回调函数中用返回的数据初始化autocomplete
	$.ajax({type:"post", url:"../servlet/defaultDispatcher", data:"__action=decompose.queryRecpCodeInfo", dataType:"json", success:initAutoComplete1});
});
function showCustDecompose() {
	var custInfo = $("#decomposeCustName").val();
}
function incomeAllClean(){
	document.getElementById("incomeAllClean1").disabled=true;
	document.getElementById("incomeAllClean2").disabled=true;
    var cardFlag=$("#cardFlag").val();
    
    $("#progressbar").dialog({
    	closeOnEscape:false, modal:true, autoOpen:false,
    	open:function(event,ui) {$(".ui-dialog-titlebar-close").hide();$(".ui-resizable-se").hide();},
	});
    $("#progressbar").dialog("open");
	 $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=decompose.incomeAllClean',
        dataType: 'json',
        success: function(callback){
    	$("#progressbar").dialog("close");
        alert(callback.returnStr);
              window.location.href="../servlet/defaultDispatcher?__action=decompose.showAllIncomeInfo&cardFlag="+cardFlag;
        	//$.ajax({
			//	type:"POST",
			//	data: '__action=decompose.showAllIncomeInfoAjax',
			//	url:"../servlet/defaultDispatcher",
			//	dataType:"json",
			//	success:function(callback){
			//	},
			//	error:function(callback){
			//		alert("网络错误，请稍后重试！");
			//		return ;
			//	}
			//	});
           
        },
        error:function(callback){
					alert("网络错误，请稍后重试！");
					return ;
				}
    });
}

function judgeWriteBackSubmit(){
		var select_income_id=$("#fiin_id").val();
		var remarkcontex=$("#requirereson").val();
		if(remarkcontex==null||remarkcontex==""){
			alert("请填写审批意见");
		}else{
        		if(confirm("确认申请整单冲红？")){       			
        			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.requrieBillCanWriteBack&red_type=3&select_income_id='+select_income_id+'&requirereson='+remarkcontex,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if(callback.updateRedtype=="success"){							
							alert("整单冲红申请成功！");
							window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.queryCanWriteBackBills";
						}else{
							alert("整单冲红申请失败，请重试！");
						}
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
					});      			
        		}
        } 
}

//Add by Michael 2011 12/28 增加弹出罚息明细----------
function showDunDetail(recp_code){
	$.ajax({
		type:"POST",
		data: '__action=decompose.showDunDetail&RECP_CODE='+recp_code,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(databack){
			var tt=databack.writeBackDetails.length;
			var totalSprice=0.0;
			var memos="";
			var strOPPOSING_DATE="";
			var divStr="<div style='display: none;' id='dunDetailDiv'><div class='zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all' id='maindun'><div class='zc_grid_body jqgrowleft'>";
				divStr+="<div class='ui-state-default ui-jqgrid-hdiv'><table id='dunDetailTableID' cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'>";
				divStr+="<tr class='ui-widget-content jqgrow ui-row-ltr'><td>支付表号</td><td>期数</td><td>支付日</td><td>来款日</td><td>应付金额</td><td>实付金额</td><td>逾期金额</td><td>逾期天数</td><td>罚息</td></tr>";		
			for(var i=0;i<tt;i++){
				totalSprice+=parseFloat(databack.writeBackDetails[i].FINE);
				strOPPOSING_DATE=databack.writeBackDetails[i].OPPOSING_DATE;
				if(strOPPOSING_DATE==null){
					strOPPOSING_DATE="无";
				}
				memos+="<tr class='ui-widget-content jqgrow ui-row-ltr'>";
				memos+="<td>"+databack.writeBackDetails[i].RECP_CODE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].PERIOD_NUM+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].PAY_DATE+"</td>";
				memos+="<td>"+strOPPOSING_DATE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].MONTH_PRICE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].REAL_PRICE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].DUN_PRICE+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].DUN_DAY+"</td>";
				memos+="<td>"+databack.writeBackDetails[i].FINE+"</td>";
				memos+="</tr>";
			}
			divStr+=memos;			
			divStr+="<tr class='ui-widget-content jqgrow ui-row-ltr'><td colspan='9' style='text-align: center;'>总计："+totalSprice.toFixed(2)+"</td></tr>";
			divStr+="</table></div></div></div></div>";
			$("#dunDetailTableID").html(divStr);
		},
		error:function(databack){
			alert("网络错误，请稍后重试！");
			return ;
		}
	});
	$("#dunDetailDiv").dialog({
		modal:true,
		autoOpen: false,
		width: 600
	});
	$("#dunDetailDiv").dialog('open');
}
//--------------------------------------------------------------------------------------------

function judgeWriteBack(select_income_id){
	$.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=checkDecompose.judgeBillCanWriteBack&select_income_id='+select_income_id,
        dataType: 'json',
        success: function(outputMap){
        	//alert(outputMap.returnStr);
        	if(outputMap.returnStrnew=="havemorecollbills"){
        		alert("本次要冲红的分解单以后的期次有过还款，不能进行冲红！");
        		return false;
        	}/* else if(outputMap.returnStrnew=="incomeMoneyBigThenDesposeMoney") {
        		alert("来款金额大于销帐的金额,不是整单冲红,不给冲红！");
        		return false;
        	}*/
        	if(outputMap.returnStr=="no"){
        	$.ajax({
					type:"POST",
					data: '__action=checkDecompose.findAllMemosByFiinId&select_income_id='+select_income_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						var memos="";
						var tt=databack.writeBackMemos.length;
						for(var i=0;i<tt;i++){
							var cishu=i+1;
							var requireremark=databack.writeBackMemos[i].REQUIREREMARK;
							
							var responseremark=databack.writeBackMemos[i].RESPONSEREMARK;
							if(responseremark==null){
								responseremark="无";
							}
							memos+="<div name='newrows' style='text-align:center'><table cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'><tr  class='ui-state-default ui-th-ltr zc_grid_head'>"
								+"<td style='text-align:left'  width='30%'>第"+cishu+"次申请理由:</td><td>"+requireremark+"</td></tr>"
								+"<tr class='ui-state-default ui-th-ltr zc_grid_head'><td style='text-align:left'  width='50%'>第"+cishu+"次审批意见:</td><td>"+responseremark+"</td></tr>"
								+"</table></div>";
							
						}
						$("#historyss").html(memos);
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
        	    $("#data1").append("<tr class='ui-state-default ui-th-ltr zc_grid_head'><td colspan='2' style='text-align:center'><input type='hidden' name='fiin_id' id='fiin_id' value='"+select_income_id+"'></td>");
        		
        		$("#requirereasondiv").dialog({
					modal:true,
					autoOpen: false,
					width: 600
				});
				$("#requirereasondiv").dialog('open');
        		/*
        		if(confirm("确认申请整单冲红？")){
        			
        			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.requrieBillCanWriteBack&red_type=3&select_income_id='+select_income_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if(callback.updateRedtype=="success"){							
							alert("整单冲红申请成功！");
							window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.queryCanWriteBackBills";
						}else{
							alert("整单冲红申请失败，请重试！");
						}
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
					});      			
        		} */ 
        	}else if(outputMap.returnStr=="havelocked"){
        		alert("本笔来款已经申请过冲红操作，或者已经被锁定，不能再次申请！");
        	}else if(outputMap.returnStr=="nowritebill"){
        		alert("本笔来款的还未生产分解单！");
        	}else if(outputMap.returnStr=="yes"||outputMap.returnStr=="noconfirmyes"){
        		alert("本笔来款的待分解来款已经再次分解，不能进行整单冲红！");
        	}else if(outputMap.returnStr=="jieqingyes"){
        		alert("本笔来款的支付表还款后又经进行过结清，不能进行整单冲红！");
        	}else if(outputMap.returnStr=="fenjiehoujieqing"){
        		alert("本笔来款分解的支付表已经进行过结清，不能进行整单冲红！");
        	}
        	//alert(outputMap.returnStr);
        },
        error:function(callback){
					alert("网络错误，请稍后重试！");
					return ;
		}
    });
}


function writeBacksome(select_income_id){
				$.ajax({
					type:"POST",
					data: '__action=checkDecompose.findAllMemosByFiinId&select_income_id='+select_income_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						var memos="";
						var tt=databack.writeBackMemos.length;
						for(var i=0;i<tt;i++){
							var cishu=i+1;
							var requireremark=databack.writeBackMemos[i].REQUIREREMARK;
							
							var responseremark=databack.writeBackMemos[i].RESPONSEREMARK;
							if(responseremark==null){
								responseremark="无";
							}
							memos+="<div  style='text-align:center'><table cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'><tr  class='ui-state-default ui-th-ltr zc_grid_head'>"
								+"<td style='text-align:left'  width='30%'>第"+cishu+"次申请理由:</td><td>"+requireremark+"</td></tr>"
								+"<tr class='ui-state-default ui-th-ltr zc_grid_head'><td style='text-align:left'  width='50%'>第"+cishu+"次审批意见:</td><td>"+responseremark+"</td></tr>"
								+"</table></div>";
							
						}
						$("#historyss2").html(memos);
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
        		$("#data12").append("<tr class='ui-state-default ui-th-ltr zc_grid_head'><td colspan='2' style='text-align:center'><input type='hidden' name='fiin_id' id='fiin_id' value='"+select_income_id+"'></td>");
        		
        		$("#requirereasondiv2").dialog({
					modal:true,
					autoOpen: false,
					width: 600
				});
				$("#requirereasondiv2").dialog('open');
}
function writeBacksomeSubmit(){
		var select_income_id=$("#fiin_id").val();
		var remarkcontex=$("#requirereson2").val();
		if(remarkcontex==null||remarkcontex==""){
			alert("请填写审批意见");
		}else{
				if(confirm("确认申请分项冲红？")){
        			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.requrieBillCanWriteBack&red_type=2&select_income_id='+select_income_id+'&requirereson='+remarkcontex,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if(callback.updateRedtype=="success"){							
							alert("分项冲红申请成功！");
							window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.queryCanWriteBackBills";
						}else if(callback.updateRedtype=="havelocked"){
							alert("本笔来款已经申请过冲红操作，或者已经被锁定，不能再次申请！");
						}else{
							alert("分项冲红申请失败，请重试！");
						}
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
					});
			}else{
			} 
	}       			
}
function writeBackAllPass(select_income_id){
      			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.findAllMemosByFiinId&select_income_id='+select_income_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						var memos="";
						var tt=databack.writeBackMemos.length;
						for(var i=0;i<tt;i++){
							var cishu=i+1;
							var requireremark=databack.writeBackMemos[i].REQUIREREMARK;
							
							var responseremark=databack.writeBackMemos[i].RESPONSEREMARK;
							if(responseremark==null){
								responseremark="无";
							}
							memos+="<div name='newrows' style='text-align:center'><table cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'><tr  class='ui-state-default ui-th-ltr zc_grid_head'>"
								+"<td style='text-align:left'  width='30%'>第"+cishu+"次申请理由:</td><td>"+requireremark+"</td></tr>"
								+"<tr class='ui-state-default ui-th-ltr zc_grid_head'><td style='text-align:left'  width='50%'>第"+cishu+"次审批意见:</td><td>"+responseremark+"</td></tr>"
								+"</table></div>";
							
						}
						$("#historyss").html(memos);
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
      			
      			$("#data1").append("<tr class='ui-state-default ui-th-ltr zc_grid_head'><td colspan='2' style='text-align:center'><input type='hidden' name='fiin_id' id='fiin_id' value='"+select_income_id+"'></td>");
        		 
        		$("#reasonanswerdiv").dialog({
					modal:true,
					autoOpen: false,
					width: 600
				});
				$("#reasonanswerdiv").dialog('open');
}

function writeBackAllPassSubmit(){
		var select_income_id=$("#fiin_id").val();
		var remarkcontex=$("#responseanswer").val();
		if(remarkcontex==null||remarkcontex==""){
			alert("请填写审批意见");
		}else{
			if(confirm("确认通过此来款的冲红申请？")){
        			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.responseBillCanWriteBack&red_type=1&select_income_id='+select_income_id+'&responseanswer='+remarkcontex,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if(callback.updateRedtype=="success"){							
							alert("整单冲红审批已通过！");
							window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.queryResQuireWriteBackBills";
						}else if(callback.updateRedtype=="havelocked"){
							alert("本笔来款已经被锁定，或者已经申请过冲红操作，不能再次申请！");
						}else{
							alert("整单冲红审批，请重试！");
						}
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
					}); 
			}else{
			}    
		}   			
}

function writeBackAllPassNoAgree(){
		var select_income_id=$("#fiin_id").val();
		var remarkcontex=$("#responseanswer").val();
		if(remarkcontex==null||remarkcontex==""){
			alert("请填写审批意见");
		}else{
			if(confirm("确认不通过此来款的冲红申请？")){
        			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.responseBillCanWriteBackNoAgree&red_type=1&select_income_id='+select_income_id+'&responseanswer='+remarkcontex,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if(callback.updateRedtype=="success"){							
							alert("整单冲红申请已打回！");
							window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.queryResQuireWriteBackBills";
						}else{
							alert("整单冲红申请否决失败，请重试！");
						}
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
					}); 
			}else{
			}    
		}   			
}

function writeBackSomePass(select_income_id){
				$.ajax({
					type:"POST",
					data: '__action=checkDecompose.findAllMemosByFiinId&select_income_id='+select_income_id,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(databack){
						var memos="";
						var tt=databack.writeBackMemos.length;
						
						for(var i=0;i<tt;i++){
							var cishu=i+1;
							var requireremark=databack.writeBackMemos[i].REQUIREREMARK;
							
							var responseremark=databack.writeBackMemos[i].RESPONSEREMARK;
							if(responseremark==null){
								responseremark="无";
							}
							
							memos+="<div name='newrows' style='text-align:center'><table cellspacing='0' cellpadding='0' border='0' class='ui-jqgrid-htable zc_grid_title'><tr  class='ui-state-default ui-th-ltr zc_grid_head'>"
								+"<td style='text-align:left'  width='30%'>第"+cishu+"次申请理由:</td><td>"+requireremark+"</td></tr>"
								+"<tr  class='ui-state-default ui-th-ltr zc_grid_head'><td style='text-align:left'  width='50%'>第"+cishu+"次审批意见:</td><td>"+responseremark+"</td></tr>"
								+"</table>";
							
						}
						$("#historyss2").html(memos);
					},
					error:function(databack){
						alert("网络错误，请稍后重试！");
						return ;
					}
				});
       			$("#data12").append("<tr class='ui-state-default ui-th-ltr zc_grid_head'><td colspan='2' style='text-align:center'><input type='hidden' name='fiin_id' id='fiin_id' value='"+select_income_id+"'></td>");
        		
        		$("#reasonanswerdiv2").dialog({
					modal:true,
					autoOpen: false,
					width: 600
				});
				$("#reasonanswerdiv2").dialog('open');
}

function writeBackSomePassSubmit(){
		var select_income_id=$("#fiin_id").val();
		var remarkcontex=$("#reasonanswer2").val();
		if(remarkcontex==null||remarkcontex==""){
			alert("请填写审批意见");
		}else{
			if(confirm("确认通过此来款的冲红申请？")){
        			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.responseBillCanWriteBack&red_type=0&select_income_id='+select_income_id+'&responseanswer='+remarkcontex,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if(callback.updateRedtype=="success"){							
							alert("分项冲红审批已通过！");
							window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.queryResQuireWriteBackBills";							
						}else if(callback.updateRedtype=="havelocked"){
							alert("本笔来款已经被锁定，或者已经申请过冲红操作，不能再次审批！");
						}else{
							alert("分项冲红审批，请重试！");
						}
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
					});
			}else{
			}  
		}      			
}

function writeBackSomePassNoAgree(){
		var select_income_id=$("#fiin_id").val();
		var remarkcontex=$("#reasonanswer2").val();
		if(remarkcontex==null||remarkcontex==""){
			alert("请填写审批意见");
		}else{
			if(confirm("确认不通过此来款的冲红申请？")){
        			$.ajax({
					type:"POST",
					data: '__action=checkDecompose.responseBillCanWriteBackNoAgree&red_type=0&select_income_id='+select_income_id+'&responseanswer='+remarkcontex,
					url:"../servlet/defaultDispatcher",
					dataType:"json",
					success:function(callback){
						if(callback.updateRedtype=="success"){							
							alert("分项冲红审批已打回！");
							window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.queryResQuireWriteBackBills";							
						}else if(callback.updateRedtype=="havelocked"){
							alert("本笔来款已经被锁定，或者已经申请了冲红操作，不能再次审批！");
						}else{
							alert("分项冲红审批，请重试！");
						}
					},
					error:function(callback){
						alert("网络错误，请稍后重试！");
						return ;
					}
					});
			}else{
			}  
		}      			
}

function writeBackBillMakeAll(fiin_id,recp_code,cust_code){
	window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.showAllFiinBillInfo&select_income_id="+fiin_id+"&recp_code="+recp_code+"&cust_code="+cust_code;
}

function writeBackBillMakeSome(fiin_id,recp_code,cust_code){
	window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.showAllFiinBillInfoCheck&select_income_id="+fiin_id+"&recp_code="+recp_code+"&cust_code="+cust_code;
}
//鼠标经过显示层
function mouseOver(e, str){
	
	 var oThis = arguments.callee;
	 if(!str) {
	  oThis.sug.style.visibility = 'hidden';
	  document.onmousemove = null;
	  return;
	 }
	 
	 //
	 if(!oThis.sug){
	  var div = document.createElement('div'), css = 'top:0; left:0; position:absolute; z-index:100; visibility:hidden';
	   div.style.cssText = css;
	   div.setAttribute('style',css);
	  var sug = document.createElement('div'), css= 'font:normal 12px/16px "宋体"; white-space:nowrap; color:#666; padding:3px; position:absolute; left:0; top:0; z-index:10; background:#f9fdfd; border:1px solid #0aa';
	   sug.style.cssText = css;
	   sug.setAttribute('style',css);
	  var dr = document.createElement('div'), css = 'position:absolute; top:3px; left:3px; background:#333; filter:alpha(opacity=50); opacity:0.5; z-index:9';
	   dr.style.cssText = css;
	   dr.setAttribute('style',css);
	  var ifr = document.createElement('iframe'), css='position:absolute; left:0; top:0; z-index:8; filter:alpha(opacity=0); opacity:0';
	   ifr.style.cssText = css;
	   ifr.setAttribute('style',css);
	  div.appendChild(ifr);
	  div.appendChild(dr);
	  div.appendChild(sug);
	  div.sug = sug;
	  document.body.appendChild(div);
	  oThis.sug = div;
	  oThis.dr = dr;
	  oThis.ifr = ifr;
	  div = dr = ifr = sug = null;
	 }
	 var e = e || window.event, obj = oThis.sug, dr = oThis.dr, ifr = oThis.ifr;
	 obj.sug.innerHTML = str;
	 var w = obj.sug.offsetWidth, h = obj.sug.offsetHeight, dw = document.documentElement.clientWidth||document.body.clientWidth; dh = document.documentElement.clientHeight || document.body.clientHeight;
	 var st = document.documentElement.scrollTop || document.body.scrollTop, sl = document.documentElement.scrollLeft || document.body.scrollLeft;
	 var left = e.clientX +sl +17 + w < dw + sl && e.clientX + sl + 15 || e.clientX +sl-8 - w, top = e.clientY + st +17 + h < dh + st && e.clientY + st + 17 || e.clientY + st - 5 - h;
	 obj.style.left = left+ 10 + 'px';
	 obj.style.top = top + 10 + 'px';
	 dr.style.width = w + 'px';
	 dr.style.height = h + 'px';
	 ifr.style.width = w + 3 + 'px';
	 ifr.style.height = h + 3 + 'px';
	 obj.style.visibility = 'visible';

	 document.onmousemove = function(e){
	  var e = e || window.event, st = document.documentElement.scrollTop || document.body.scrollTop, sl = document.documentElement.scrollLeft || document.body.scrollLeft;
	  var left = e.clientX +sl +17 + w < dw + sl && e.clientX + sl + 15 || e.clientX +sl-8 - w, top = e.clientY + st +17 + h < dh + st && e.clientY + st + 17 || e.clientY + st - 5 - h;
	  obj.style.left = left + 'px';
	  obj.style.top = top + 'px';
	 }
}








