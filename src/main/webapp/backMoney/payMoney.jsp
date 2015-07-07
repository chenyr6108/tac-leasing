<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript">

$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);	
		//Modify by Michael 2012 06-25 For 修正实际支付日能自行key in Bug
		//$("input[name^='pay_Date']").datepicker($.datepicker.regional['zh-CN']);
		/*
		var s = new Date();
		var vYear = s.getFullYear();
		var vMon = s.getMonth() + 1;
		var vDay = s.getDate();
		var currentTime=vYear+"-"+vMon+"-"+vDay;
		$("input[name^='pay_Date']").val(currentTime);
		*/
		$("#LESSOR_TIME").datepicker($.datepicker.regional['zh-CN']);
		
		$("#CHEQUE_TIME").datepicker($.datepicker.regional['zh-CN']);
		
		//$("#4").hide();
} );


//供应商银行提示
function supl(CREDIT_ID,name,INVOICE_PERSON,num) {
document.getElementById("numType").value=num;
$("#bank_account_check").attr("readonly","");
$("#payByName").attr("readonly","");
if(num==0)
{
	// document.getElementById("bank_name").type="text";
	 document.getElementById("bank_name").style.display='block';
	document.getElementById("bank_name1").type="hidden";
	document.getElementById("bank_name2").type="hidden";
	document.getElementById("bank_name3").type="hidden";
	document.getElementById("bank_name4").type="hidden";
	document.getElementById("bank_name5").type="hidden";
	//document.getElementById("bank_account").type="text";
	//document.getElementById("bank_account1").type="hidden";
}
else if(num==1)
{
	document.getElementById("bank_name1").type="text";
	// document.getElementById("bank_name").type="hidden";
	 document.getElementById("bank_name").style.display="none";
	document.getElementById("bank_name2").type="hidden";
	document.getElementById("bank_name3").type="hidden";
	document.getElementById("bank_name4").type="hidden";
	document.getElementById("bank_name5").type="hidden";
	//document.getElementById("bank_account").type="text";
	//document.getElementById("bank_account1").type="hidden";
}
else if(num==2)
{
	document.getElementById("bank_name2").type="text";
	// document.getElementById("bank_name").type="hidden";
	 document.getElementById("bank_name").style.display="none";
	document.getElementById("bank_name1").type="hidden";
	document.getElementById("bank_name3").type="hidden";
	document.getElementById("bank_name4").type="hidden";
	document.getElementById("bank_name5").type="hidden";
	//document.getElementById("bank_account1").type="text";
	//document.getElementById("bank_account").type="hidden";
}

	document.getElementById("payByName").value="";
	// document.getElementById("bank_name").value="";
	 // document.getElementById("bank_name").style.display="none";
	 $("select[name='bank_name']").empty();
	document.getElementById("bank_name1").value="";
	document.getElementById("bank_name2").value="";
	document.getElementById("bank_name3").value="";
	document.getElementById("bank_account").value="";
	//document.getElementById("bank_account1").value="";
			if(name==INVOICE_PERSON)
			{
				if(num==2)
				{
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.suplByRectId&CREDIT_ID='+CREDIT_ID,
						dataType:'json' ,
						success: initAutoComplete2
				
					});
				}
				else if(num==0)
				{
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.suplByRectIds&CREDIT_ID='+CREDIT_ID,
						dataType:'json' ,
						success: initAutoComplete3
				
					});
				}
				else if(num==1)
				{
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.custByRectId&CREDIT_ID='+CREDIT_ID,
						dataType:'json' ,
						success: initAutoComplete2
				
					});
				}
				
			}
			else
			{
				$("#payByName").val("");
			}
};


function selectCarCredit(num){
	document.getElementById("bank_name").style.display="none";
	document.getElementById("bank_name1").type="hidden";
	document.getElementById("bank_name2").type="hidden";
	document.getElementById("bank_name3").type="hidden";
	
	
	$("#numType").val(num);
	if(num==4){
		document.getElementById("bank_name4").type="text";
		$("#payByName").val("中国银行苏州工业园区支行");
		$("#payByName").attr("readonly","readonly");
		$("#bank_account_check").val("${bankAccount}");
		$("#bank_account_check").attr("readonly","readonly");
		$("#bank_account").val("${bankAccount}");
	}else if(num==5){
		document.getElementById("bank_name5").type="text";
		$("#payByName").val("浙江康达汽车工贸有限公司");
		$("#payByName").attr("readonly","readonly");
		$("#bank_account_check").val("19010501040001484");
		$("#bank_account_check").attr("readonly","readonly");
		$("#bank_account").val("19010501040001484");
	}

	
}

function initAutoComplete2(data) { 
	dataList = data.dw; 
	$("#payByName").val(dataList[0].NAME);
	var numType=$("#numType").val();
	if(numType==0)
	{
		$("#bank_name").autocomplete(dataList, optionsssssNo);
		$("#bank_name").result(function(event, data, formatted) {
				if(data!=null){
					$("#bank_account").val(data.BANK_ACCOUNT); 
					
				}	
			}); 
	}
	else if(numType==1)
	{
		$("#bank_name1").autocomplete(dataList, optionsssssNo);
		$("#bank_name1").result(function(event, data, formatted) {
				if(data!=null){
					$("#bank_account").val(data.BANK_ACCOUNT); 
					
				}	
			}); 
	}
	else if(numType==2)
	{	
		$("#bank_name2").autocomplete(dataList, optionsssssNo);
		$("#bank_name2").result(function(event, data, formatted) {
				if(data!=null){
					$("#bank_account").val(data.BANK_ACCOUNT); 
					
				}	
			}); 
	}	
	
		
} 


function initAutoComplete4(data) { 

	 $("select[name='bank_name']").empty();
	dataList = data.dws; 
	var numType=$("#numType").val();
	if(numType==0)
	{
	
		// $("#bank_name").autocomplete(dataList, optionsssssNo2);
		
		
		$("#bank_name").append("<option value=''>--请选择--</option>");
		for(i=0;i<dataList.length;i++){
   				$("#bank_name").append("<option value="+dataList[i].PCCBA_ID+">"+dataList[i].BANK_NAME+"</option>");
        	}
		 
	}
	
}


var optionsssssNo2 = {
	minChars : 1,
	max : 20,
	mustMatch: true,
	matchContains: true,
	formatItem : function(row, i, max) {
		if (row.BANK_ACCOUNT != null && row.BANK_ACCOUNT.length > 0) {
		 // $("#bank_name").append("<OPTION VALUE='"+row.BANK_NAME +"'>"+ row.BANK_NAME+"</OPTION>");
		$("#bank_account").val(row.BANK_NAME); 
		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.PCCBA_ID + " " + row.BANK_NAME;
	},
	formatResult : function(row) {
		return row.BANK_NAME;
	}
};
 

var optionsssss = {
	minChars : 1,
	max : 20,
	mustMatch: true,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.BANK_NAME;
		if (row.BANK_ACCOUNT != null && row.BANK_ACCOUNT.length > 0) {
			rs += "【" + row.BANK_ACCOUNT + "】";
		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.PCCBA_ID + " " + row.BANK_NAME;
	},
	formatResult : function(row) {
		return row.BANK_NAME;
	}
	
};

var optionsssssNo = {
	minChars : 1,
	max : 20,
	mustMatch: true,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.BANK_NAME;
		if (row.BANK_ACCOUNT != null && row.BANK_ACCOUNT.length > 0) {
			rs += "【" + row.BANK_ACCOUNT + "】";
		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.PCCBA_ID + " " + row.BANK_NAME;
	},
	formatResult : function(row) {
		return row.BANK_NAME;
	}
};



function initAutoComplete3(data) { 
	dataList = data.dw; 
	var numType=$("#numType").val();
	if(numType==0)
	{
		$("#payByName").autocomplete(dataList, optionsssssNo1);
		
		$("#payByName").result(function(event, data, formatted) {
				
				
				$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.suplBySuplIds&supl_id='+data.ID,
						dataType:'json' ,
						success: initAutoComplete4
				
					});
				
			}); 
	}
} 

var optionsssssNo1 = {
	minChars : 1,
	max : 20,
	mustMatch: false,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.NAME ;
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.ID + " " + row.NAME;
	},
	formatResult : function(row) {
		return row.NAME;
	}
};

function insertPayMoney(maxValue)
    {
    	
    var form = document.addForm;
     var pay_Date = $.trim($(":input[name='expecteddate']").val());
    if (pay_Date.length <1) {
        alert("请先到报告管理中进行预估拨款日！");
        return false;
    }
    
	/* var startDate = $("#START_DATE").val();
	if(startDate!="" && startDate>pay_Date){
		alert("乘用车委贷起租日不得晚于预计支付日.");
		return false;
	} */
	
    
    var pay_Date = $.trim($(":input[name='LESSOR_TIME']").val());
    if (pay_Date.length <1) {
        alert("请填写合同签订日！");
        return false;
    }
   
    if($("#express").val()==""){
    	alert("请填写快递方式！");
    	return false;
    }
    
    var pay_Date = $.trim($(":input[name='payByName']").val());
    if (pay_Date.length <1) {
        alert("请填写请款单位！");
        return false;
    }
    
     var numType=$.trim($(":input[name='numType']").val());
    if(numType==0)
    {
    	 var pay_Date = $.trim($(":input[name='bank_name']").val());
    	if (pay_Date.length <1) {
        	alert("请填写开户行！");
        	return false;
    	}
    }
    else  if(numType==1)
    {
    	 var pay_Date = $.trim($(":input[name='bank_name1']").val());
    	if (pay_Date.length <1) {
        	alert("请填写开户行！");
        	return false;
    	}
    }
    
    if($("#pay_way").val()=='1') {
	    var cheque_Date = $.trim($(":input[name='CHEQUE_TIME']").val());
	    if (cheque_Date.length <1) {
	        alert("请填写 支票开立日！");
	        return false;
	    }
    }

    var bank_name="";
    if(document.getElementById("backtype2").checked){
    	bank_name= $.trim($(":input[name='bank_names']").val());
   }else if(document.getElementById("backtype3").checked){
	   bank_name= $.trim($(":input[name='bank_name1']").val());
   }
    $("#bank_name_text").val(bank_name);
	
    if(numType==0 || numType==1)
    {
       	//Add by Michael 2012 09-17 增加double Check 银行账号-----------------------------------
    	   var bank_account_check=$.trim($(":input[name='bank_account_check']").val());
    	   var pay_Date = $.trim($(":input[name='bank_account']").val());
    	   if (bank_account_check.length <1){
 		 	alert("请填写开户账号！");
 		 	return false;
    	   }else if(bank_account_check!=pay_Date){
    		   if(document.getElementById("backtype2").checked){
 	   		 	alert("输入开户账号与供应商管理中维护账号不一致！请联系市场推广课确认！");
 			 	return false;
    		   }else if(document.getElementById("backtype3").checked){
 	   		 	alert("输入开户账号与报告中公司沿革中维护的银行账号不一致！请联系此案业务经办确认！");
 			 	return false;
    		   }
    	   }
   	//------------------------------------------------------------------------------------- 
    }
    
    var pay_money= $.trim($(":input[name='pay_money']").val());
    var values=pay_money.replace(/[￥,]/g, '');
     document.getElementById("pay_money").value=values;
     
    	var _payMoney = parseCurrency($("#pay_money").val());
    	if(maxValue<_payMoney){
 		alert("本次付款额错误");
 		return false;
    	}
    	document.getElementById("buttonAdd").disabled=true;
    	
    	// Add by Michael 2013 01-09  增加银行黑名单检查
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:{__action:'backMoney.checkBlackBank',
				BANK_NAME:bank_name},
			dataType:'json',
			success: function(dataBack){ 
				if(dataBack.count>0){
					alert("该开户银行或分行不存在，请再确认！");
					return false;
				}else{
					// Add by Michael 2012 11-15 申请拨款时检查是否是首拨款，如果是首拨款一定要检查是否keyin 检核表		
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.checkFirstPayMoney&CREDIT_ID='+form.CREDIT_ID.value,
						dataType:'json',
						success: function(dataBack){ 
							if(dataBack.checkFirstPayMoney==false){
								alert("请先Keyin检核表资料！");
								return false;
							}else{
						    	$.ajax({
						    		type:"post",
						    		url:"../servlet/defaultDispatcher",
						    		data:"__action=backMoney.checkAdvanceMachineGrantPrice&LEASE_CODE="+form.LEASE_CODE.value+"&pay_money="+form.pay_money.value+"&CREDIT_ID="+form.CREDIT_ID.value+"&SUPLNAME="+form.payByName.value,
						    		dataType:"json",
						    		success: function(callback)	{
						    			dw=callback.strReturnStr;
						    			if(dw != ""){
						    				alert(dw);
						    				document.getElementById("buttonAdd").disabled=false;
						    				return false;
						    			}else{
						    				$("#ADVANCE_FLAG").val(callback.advanceMachine);
						    			    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyManager");
						    			    $("#addForm").submit();
						    			}
						    		},	
						    	}); 
							}
						}
					});
					
				}
			}
			});	
}
      
function changeDiv()
{
	 var form = document.addForm;
    var tname = $.trim($(":input[name='visit_results']").val());
    if(tname==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}

function changeTr(resul)
{
	if(resul==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}

function check()
{
var account = document.getElementById("bank_account").value;
if(isNaN(account))
{
    alert("格式错误，银行账号应该为数字！");
  document.getElementById("bank_account").value="";
}

}

function bankAccountCheck()
{
	var account = document.getElementById("bank_account_check").value;
	if(isNaN(account))
	{
	    alert("格式错误，银行账号应该为数字！");
	  	document.getElementById("bank_account_check").value="";
	}

}

function check1()
{
var account = document.getElementById("bank_account1").value;
if(isNaN(account))
{
    alert("格式错误，银行账号应该为数字！");
  document.getElementById("bank_account1").value="";
}

}

function changeBank()
{
	var pccb_id=$("#bank_name").val();
	
	$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher",
		data:"__action=backMoney.suplBySuplIdss&pccba_id="+pccb_id,
		dataType:"json",
		success:function(json){

				dw=json.dwss;
				$("#bank_account").val("");
				if(dw!=null)
				{
					$("#bank_names").val(dw.BANK_NAME);
					$("#bank_account").val(dw.BANK_ACCOUNT);
				}
		},
		error:function(){
			
		   }
	     });
}

function radioNull()
{
	document.getElementById("bank_name3").type="text";
	//document.getElementById("bank_name").type="hidden";
	 document.getElementById("bank_name").style.display="none";
	document.getElementById("bank_name1").type="hidden";
	document.getElementById("bank_name2").type="hidden";
	//document.getElementById("bank_account").type="hidden";
	//document.getElementById("bank_account1").type="text";
	
	document.getElementById("payByName").value="";
	//document.getElementById("bank_name").value="";
	document.getElementById("bank_name1").value="";
	document.getElementById("bank_name2").value="";
	document.getElementById("bank_name3").value="";
	document.getElementById("bank_account").value="";
	//document.getElementById("bank_account1").value="";
	
	//$("#bank_account1").removeAttr("readonly") ;
	document.getElementById("numType").value="3";
}


function leftPayUpdate(moneyCount,moneyed)
{
	var payMoney=parseCurrency($("#pay_money").val());
	
	var leftPay=moneyCount-moneyed-payMoney;
	if(leftPay<0){
		alert("本次付款额已超出最大付款额");
		$("#pay_money").val("￥"+format(moneyCount-moneyed));
	}
	var payMoneys=parseCurrency($("#pay_money").val());
	leftPay=moneyCount-moneyed-payMoneys;
	$("#leftpay1").val("￥"+format(leftPay));
	$("#realleftmoney").val("￥"+format(payMoneys));
	document.getElementById("euqipTo").innerHTML=atoc(payMoneys);
	
}


function format(th)
{
	var value=th+"";
	if(value!=null && value!="")
	{
		var str="";
		var len=value.length;
		var d=value.indexOf('.');
		if(d!=-1)
		{
			for(var i=d-1;i>=0;i--)
			{
				str=value.charAt(i)+str;
				if((d-i)%3==0 && i > 0)
				{
					str=','+str;
				}
			}
			var sub=Math.round(new Number("0"+value.substr(d))*100)/100;
			
			if(sub == 0)
			{
				str=str+".00";
			}
			else if(sub.toString().substr(2).length == 1)
			{
				str=str+"."+sub.toString().substr(2)+"0";
			}
			else if(sub.toString().substr(2).length == 2)
			{
				str=str+"."+sub.toString().substr(2);
			}
			else
			{
				str=str+"."+sub.toString().substr(2,4);
			}
		}
		else
		{
			for(var i=len-1;i>=0;i--)
			{
				str=value.charAt(i)+str;
				if((len-i)%3==0 && i>0)
				{
					str=','+str;
				}
			}
			str=str+".00";
		}
		return str;
}
}

function showTr4(e){
	if($(e).val() == "1"){
		$("#4").show();
	} else {
		$("#4").hide();
	}
}

function changeExpress(val){
	if(val=='其他'){
		$("#express").val("");
		$("#express").show();
	}else{
		$("#express").val(val);
		$("#express").hide();
	}
}

function showUpdateEstimatesPayDate(credit_id, type){
	var url = "${ctx }/servlet/defaultDispatcher";
	var param = {__action : "creditReport.getEstimatesPayDate", "credit_id" : credit_id};
	$.getJSON(url, param, function (data){
		$("#showUpdateEstimatesPayDateWin").dialog({modal:true, autoOpen:false, width:600});
		if(data != null){
			$("#estimates_credit_id").val(credit_id);
			$("#estimates_num").text(data.ESTIMATES_PAY_DATE_NUM);
			$("#estimates_num_last").text(5 - data.ESTIMATES_PAY_DATE_NUM);
			$("#estimates_pay_date").val(data.ESTIMATES_PAY_DATE);
			$("#estimates_pay_date_reason").val(data.ESTIMATES_PAY_DATE_REASON);
			$("#estimates_pay_date_log").html("");
			var logList = data.log;
			if(logList.length > 0){
				for(var i = 0 ; i < logList.length; i ++){
					var td1 = $("<td>").text(logList[i].ESTIMATES_PAY_DATE_NUM);
					var td2 = $("<td>").text(logList[i].ESTIMATES_PAY_DATE);
					var td3 = $("<td>").css("whiteSpace", "pre-wrap").text(logList[i].ESTIMATES_PAY_DATE_REASON);
					var td4 = $("<td>").text(logList[i].CREATE_TIME);
					var td5 = $("<td>").text(logList[i].CREATE_BY);
					$("<tr>").append(td1)
						.append(td2)
						.append(td3)
						.append(td4)
						.append(td5)
						.appendTo($("#estimates_pay_date_log"));
				}
			} else {
				var td = $("<td>");
				td.attr("colspan", 5).text("无记录。").css("textAlign", "center").css("color", "red");
				$("<tr>").append(td).appendTo($("#estimates_pay_date_log"));
			}
		} else {
			$("#estimates_credit_id").val("");
			$("#estimates_num").text(0);
			$("#estimates_num_last").text(5);
			$("#estimates_pay_date").val("");
			$("#estimates_pay_date_reason").val("");
			$("#estimates_pay_date_log").html("");
			var td = $("<td>");
			td.attr("colspan", 5).text("无记录。").css("textAlign", "center").css("color", "red");
			$("<tr>").append(td).appendTo($("#estimates_pay_date_log"));
		}
		if(type == "show"){
			$("#showUpdateEstimatesPayDateWin").find("input").attr("disabled", true);
			$("#showUpdateEstimatesPayDateWin").find("input[type='button']").hide();
		} else {
			$("#showUpdateEstimatesPayDateWin").find("input").attr("disabled", false);
			$("#showUpdateEstimatesPayDateWin").find("input[type='button']").show();
		}
		$("#showUpdateEstimatesPayDateWin").dialog("open");
	});
}
</script>
<body onLoad="supl('${payMoney.CREDIT_ID }','${payMoney.NAME }','${payMoney.INVOICE_PERSON }','2')">
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyManager" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${s_employeeId }">
	<input type="hidden" id="numType" name="numType" value="0">
	<input type="hidden" name="state" value="0">
	<input type="hidden" name="backState" id="backState" value="0">
	<input type="hidden" name="CREDIT_ID" id="CREDIT_ID" value="${payMoney.CREDIT_ID }">
	<input type="hidden" name="bank_names"  id="bank_names">
	<input type="hidden" name="bank_name_text"  id="bank_name_text">
	<input type="hidden" name="LEASE_CODE"  id="LEASE_CODE" value="${payMoney.LEASE_CODE }">
	<input type="hidden" name="ADVANCE_FLAG"  id="ADVANCE_FLAG" value="0">
	<input type="hidden" name="isSalesDesk"  id="isSalesDesk" value="${isSalesDesk }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;设备请款凭证(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr" style="height: 23px;">
				<td colspan="3" style="height: 23px; line-height: 23px;">
					预计支付日：<a href="javaScript:void(0)" onclick="showUpdateEstimatesPayDate('${payMoney.CREDIT_ID }', 'show');">${payMoney.ESTIMATES_PAY_DATE }</a>
					<input type="hidden" style="height:25px" name="expecteddate" id="datebegin" value="${payMoney.ESTIMATES_PAY_DATE }"/>
					<%-- <input type="text" style="height:25px" name="expecteddate" id="datebegin" value="<fmt:formatDate value='${payMoney.EXPECTEDDATE }' pattern='yyyy-MM-dd'/>" readonly="readonly"/> --%>
					<%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					前次预计支付日：${expectedDate } --%>
				</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td><!-- 实际支付日： -->申请日期：      <input type="text" style="height:25px" readonly="readonly" name="application_date" value="<fmt:formatDate value='${payMoney.TIME }' pattern='yyyy-MM-dd'/>"/><input type="hidden" style="height:25px" name="pay_Date"  readonly="readonly" value=""/>   
				合同签订日<font color='red'>*</font>  <input type="text" style="height:25px" readonly="readonly" name="LESSOR_TIME" id="LESSOR_TIME" value="<fmt:formatDate value='${payMoney.LESSOR_TIME }' pattern='yyyy-MM-dd'/>"/>
				<input type="hidden" style="height:25px" readonly="readonly" name="LESSOR_TIME_HIDDEN" value="<fmt:formatDate value='${payMoney.LESSOR_TIME }' pattern='yyyy-MM-dd'/>"/>
					快递方式：<font color='red'>*</font><select onclick="changeExpress(this.value)">
						<c:forEach var="item" items="${express}">
							<option value="${item.CODE}" <c:if test="${defaultExpress eq item.CODE}">selected="selected"</c:if>>${item.FLAG}</option>
						</c:forEach>
					</select>
					<input name="express" id="express" value="${defaultExpress}" type="hidden">
					快递付款方式：<font color='red'>*</font><select name="express_pay_way">
						<c:forEach var="item" items="${express_pay_way }">
							<option value="${item.CODE}" <c:if test="${item.CODE eq 2 }">selected="selected"</c:if>>${item.FLAG}</option>
						</c:forEach>
					</select>
				
				</td>
				<td colspan="2" align="right">
						
				</td>
			</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="100px">请款单位：</td>
			<td><input type="text" name="payByName" id="payByName" width="25px" <c:if test="${payMoney.NAME eq payMoney.INVOICE_PERSON }">value="${payMoney.INVOICE_PERSON }"</c:if> <c:if test="${payMoney.NAME!=payMoney.INVOICE_PERSON }">value=""</c:if> >  &nbsp; <font color='red'>*</font>  &nbsp;&nbsp; <!-- <input type="radio" name="backtype" id="backtype1" checked="checked" onclick="supl('${payMoney.CREDIT_ID }','${payMoney.NAME }','${payMoney.INVOICE_PERSON }','2')"  value="0">发票人 -->
			<input type="radio"  name="backtype" id="backtype2" onclick="supl('${payMoney.CREDIT_ID }','1','1','0')"  value="1">供应商 
			<input type="radio" name="backtype" id="backtype3"  value="2" onclick="supl('${payMoney.CREDIT_ID }','1','1','1')">承租人
			 <!--<input type="radio" name="backtype" id="backtype4"  value="3" onclick="radioNull()">制造商  <input type="radio" name="backtype" id="backtype5"  value="4" onclick="radioNull()">其他 -->
			  <c:if test="${isCar}"><input type="radio" name="backtype" id="backtype5"  value="4" onclick="selectCarCredit(4)">中国银行苏州工业园区支行</c:if>
			  <c:if test="${isCarBack}"><input type="radio" name="backtype" id="backtype5" value="5"  onclick="selectCarCredit(5)">浙江康达汽车工贸有限公司</c:if>
			 </td>
		</tr>
		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 开户行</td>
			<!-- Add by Michael 2012 09-17 增加double Check 银行账号  -->
			<td>
			<input type="hidden" readonly="readonly" name="bank_name4" id="bank_name4" value="${bankName}">
			<input type="hidden" readonly="readonly" name="bank_name5" id="bank_name5" value="中国农业银行杭州大关支行">
			<input type="text" readonly="readonly" name="bank_name2" onkeyup="mask(this)" id="bank_name2">
			<select name="bank_name" onchange="changeBank()" style="width:135px;float:left;" id="bank_name" display="block" width="100px"></select>
			<input type="text" name="bank_name1" onkeyup="mask(this)" id="bank_name1"><input type="text" name="bank_name3" id="bank_name3"> <font color='red'>*</font> <input type="hidden" name="pccba_id" id="pccba_id" value="${ispccbaId }">   &nbsp;&nbsp;账号：<font color="red">(请手动输入)</font><input type="text" name="bank_account_check" id="bank_account_check" size="30" value="">&nbsp;&nbsp;<input type="hidden" name="bank_account" id="bank_account"  readonly="readonly" value="" onBlur="check()"><!-- <input type="hidden" readonly="readonly" name="bank_account1" id="bank_account1" value="" onBlur="check1()"> -->  <font color='red'>*</font>    
			支付方式：<select  disabled="disabled">
			<c:forEach items="${psTypeList}" var="psTypeList">
			<option value="${psTypeList.CODE}" <c:if test="${psTypeList.CODE eq APPROPRIATION_WAY }">selected="selected"</c:if>>${psTypeList.FLAG}</option>
			</c:forEach>
			</select>
			<input type="hidden" id="pay_way" name="pay_way" value="${APPROPRIATION_WAY}">							
			</td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${APPROPRIATION_WAY ne 1}">style="display:none"</c:if>>
			<td>背书人：</td>
			<td>第一背书人：<input type="text" name="endorser_1" value="${ENDORSER_1}" readonly="readonly"/>;第二背书人：<input type="text" name="endorser_2" value="${ENDORSER_2}" readonly="readonly"/>
			支票开立日:<font color='red'>*</font>  <input type="text" style="height:25px" readonly="readonly" name="CHEQUE_TIME" id="CHEQUE_TIME" value="<fmt:formatDate value='${CHEQUE_TIME }' pattern='yyyy-MM-dd'/>"/></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td  rowspan="14">&nbsp;</td></tr>
		<tr id="3"  class="ui-widget-content jqgrow ui-row-ltr"><td>承租人：${payMoney.CUST_NAME }<input type="hidden" name="CUST_NAME" value="${payMoney.CUST_NAME }"/></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>合同号：${payMoney.LEASE_CODE }<input type="hidden" name="LEASE_CODE" value="${payMoney.LEASE_CODE }"/></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>购买总额： <fmt:formatNumber value="${payMoney.LEASE_TOPRIC1 }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>其他支出： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>应付总额（成本）： <fmt:formatNumber value="${payMoney.LEASE_TOPRIC - TOTAL}" type="currency" /><input type="hidden" name="paycount" id="paycount" value="<fmt:formatNumber value='${payMoney.LEASE_TOPRIC }' type='currency' /> "><c:set var="isPay" value="0" scope="page"></c:set><c:forEach items="${payDw }" var="payDw" varStatus="status"><c:set var="isPay" value="${isPay+payDw.PAY_MONEY }" scope="page"></c:set></c:forEach></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付预付款：<input type="hidden" name="payed" id="payed" value="${isPay }"> <fmt:formatNumber value="${isPay }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付应付款： <fmt:formatNumber value="${isPay }" type="currency" /></td></tr>
		<!-- <tr class="ui-widget-content jqgrow ui-row-ltr"><td>本次付款额：<input type="text" name="pay_money" id="pay_money" value=" <fmt:formatNumber value='${payMoney.LEASE_TOPRIC - payMoney.PLEDGE_ENTER_MCTOAG - payMoney.PLEDGE_ENTER_AG -isPay }' type='currency' />">  <font color='red'>*</font>         剩余未付款：<input type="hidden" name="leftpay" id="leftpay" value=""> <fmt:formatNumber value="${(payMoney.LEASE_TOPRIC - payMoney.PLEDGE_ENTER_MCTOAG - payMoney.PLEDGE_ENTER_AG - isPay)<0.000000001 ? 0:(payMoney.LEASE_TOPRIC - payMoney.PLEDGE_ENTER_MCTOAG - payMoney.PLEDGE_ENTER_AG - isPay) }" type="currency" /></td></tr>-->
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>本次付款额：<input type="text" name="pay_money" id="pay_money" onchange="leftPayUpdate('${payMoney.LEASE_TOPRIC }','${TOTAL }')" value=" <fmt:formatNumber value='${payMoney.LEASE_TOPRIC+0.00-TOTAL }' type='currency' />">  <font color='red'>*</font>         剩余未付款：<input type="hidden" name="leftpay" id="leftpay" value=""> <input type="text" readonly="readonly" name="leftpay1" id="leftpay1" value="<fmt:formatNumber value='0' type='currency' />"></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>税金：       <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE }" type="currency" /> 入我司（代收款）</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC}" type="currency" />   入我司  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMPRICE}" type="currency" />  入我司税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE}" type="currency" />  我司入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAG}" type="currency" />  我司入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAGRATE}" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>               入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AG}" type="currency" />   入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AGRATE}" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>用于平均抵冲金额：  <fmt:formatNumber value="${payMoney.PLEDGE_AVE_PRICE }" type="currency" />        	用于期末退还金额： <fmt:formatNumber value="${payMoney.PLEDGE_BACK_PRICE } " type="currency" />        用于最后抵冲金额/期数： <fmt:formatNumber value="${payMoney.PLEDGE_LAST_PRICE }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>手续费： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<!-- 2012/02/27 Yang Yun 增加费用明细. -->
		<c:forEach items="${feeList }" var="fee">
			<tr class="ui-widget-content jqgrow ui-row-ltr" >
				<td>${fee.FEE_NAME }</td>
				<td>${fee.FEE }</td>
			</tr>
		</c:forEach>
		<tr class="ui-widget-content jqgrow ui-row-ltr" >
			<td>实际支付金额 </td>
			<td>RMB： <input type="text" readonly="readonly" name="realleftmoney" id="realleftmoney" value="<fmt:formatNumber value="${payMoney.LEASE_TOPRIC+0.00-TOTAL }" type="currency" />"/>                   <span id="euqipTo"></span></td>
			<script type="text/javascript">document.getElementById("euqipTo").innerHTML=atoc(${payMoney.LEASE_TOPRIC+0.00-TOTAL });</script>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注：</td>
			<td><textarea name="remart" rows="5" cols="150"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr" >
				<div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="提交" onclick="insertPayMoney('${payMoney.LEASE_TOPRIC-isPay}')"></input><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div>
			</td>
		<tr>
	</table>
	</div>
	</div>
	</div>
</form>
<div style="display:none;" id="showUpdateEstimatesPayDateWin" title="预估拨款日">
			<form action="${ctx }/servlet/defaultDispatcher?__action=creditReport.updateEstimatesPayDate" id="showUpdateEstimatesPayDateForm" method="post">
			<input type="hidden" id="estimates_credit_id" name="credit_id">
			
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div>
						<table class="panel_table">
							<tr>
								<td style="width: 25%">预估次数：</td>
								<td style="width: 25%"><span id="estimates_num"></span></td>
								<td style="width: 25%">剩余次数：</td>
								<td style="width: 25%"><span id="estimates_num_last"></span></td>
							</tr>
							<tr>
								<td>预估拨款日：</td>
								<td colspan="3">
									<input type="text" id="estimates_pay_date" name="estimates_pay_date" class="panel_text" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>备注：</td>
								<td colspan="3">
									<textarea id="estimates_pay_date_reason" name="estimates_pay_date_reason" cols="58" rows="3"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:center;">
									<input type="button" value="保&nbsp;存" onclick="doEstimates();" class="panel_button">
									<input type="button" value="关&nbsp;闭" onclick="$('#showUpdateEstimatesPayDateWin').dialog('close');" class="panel_button">
								</td>
							</tr>
						</table>
						
						<table class="panel_table">
							<tr>
								<th>次数</th>
								<th>预估拨款日</th>
								<th>备注</th>
								<th>时间</th>
								<th>操作人</th>
							</tr>
							<tbody id="estimates_pay_date_log"></tbody>
						</table>
					</div>
				  </div>
		    </div>
		    </form>
		</div>

</body>
</html>