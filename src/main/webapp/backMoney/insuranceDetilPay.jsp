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
} );

//供应商银行提示
function supl(CREDIT_ID,name,INVOICE_PERSON,num) {
document.getElementById("payByName").value="";
	document.getElementById("bank_name").value="";
	document.getElementById("bank_account").value="";
			if(name==INVOICE_PERSON)
			{
				if(num==0 || num==2)
				{
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=backMoney.suplByRectId&CREDIT_ID='+CREDIT_ID,
						dataType:'json' ,
						success: initAutoComplete2
				
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


function initAutoComplete2(data) { 
	dataList = data.dw; 
	$("#payByName").val(dataList[0].NAME);
	$("#bank_name").autocomplete(dataList, optionsssss);
	$("#bank_name").result(function(event, data, formatted) {
				if(data!=null){
					$("#bank_account").val(data.BANK_ACCOUNT); 
					
				}	
			}); 	
} 

var optionsssss = {
	minChars : 1,
	max : 20,
	mustMatch: false,
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


    
    function insertPayMoney()
    {
    var form = document.addForm;
   
    var pay_Date = $.trim($(":input[name='payByName']").val());
    if (pay_Date.length <1) {
        alert("请填写请款单位！")
        return false;
    }
    
     var pay_Date = $.trim($(":input[name='bank_name']").val());
    if (pay_Date.length <1) {
        alert("请填写开户行！")
        return false;
    }
    
     var pay_Date = $.trim($(":input[name='bank_account']").val());
    if (pay_Date.length <1) {
        alert("请开户账号！")
        return false;
    }
    
    var pay_Date = $.trim($(":input[name='pay_Date']").val());
    if (pay_Date.length <1) {
        alert("请填写实际支付时间！")
        return false;
    }
  
  	var application_date = $.trim($(":input[name='application_date']").val());
    if (application_date.length <1) {
        alert("请填写实际支付时间！")
        return false;
    }
    
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyManager");
    $("#addForm").submit();
    
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

function radioNull()
{
	document.getElementById("payByName").value="";
	document.getElementById("bank_name").value="";
	document.getElementById("bank_account").value="";
}



</script>
<body onLoad="supl('${payMoney.CREDIT_ID }','${payMoney.NAME }','${payMoney.INVOICE_PERSON }','2')">
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyManager" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${s_employeeId }">
	<input type="hidden" name="state" value="0">
	<input type="hidden" name="backState" id="backState" value="3">
	<input type="hidden" name="CREDIT_ID" id="CREDIT_ID" value="${payMoney.CREDIT_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;付款凭证(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td colspan="3">预订支付日：      <input type="text" style="height:25px" name="start_date" id="rect_code" value="<fmt:formatDate value='${payMoney.START_DATE }' pattern='yyyy-MM-dd'/>" readonly="readonly"/></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>实际支付日：      <input type="text" style="height:25px" name="pay_Date" id="datebegin" value="<fmt:formatDate value='${payMoney.TIME }' pattern='yyyy-MM-dd'/>"/>   </td>
				<td colspan="2" align="right"> 申请日期：      <input type="text" style="height:25px" name="application_date" id="dateend" value="<fmt:formatDate value='${payMoney.TIME }' pattern='yyyy-MM-dd'/>"/> </td>
			</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="100px">请款单位：</td>
			<td><input type="text" name="payByName" id="payByName" width="25px" <c:if test="${payMoney.NAME eq payMoney.INVOICE_PERSON }">value="${payMoney.INVOICE_PERSON }"</c:if> <c:if test="${payMoney.NAME!=payMoney.INVOICE_PERSON }">value=""</c:if> >  &nbsp; <input type="radio" name="backtype" checked="checked" onclick="supl('${payMoney.CREDIT_ID }','${payMoney.NAME }','${payMoney.INVOICE_PERSON }','2')"  value="0">发票人<input type="radio" name="backtype" onclick="supl('${payMoney.CREDIT_ID }','1','1','0')"  value="0">供应商 <input type="radio" name="backtype"  value="1" onclick="supl('${payMoney.CREDIT_ID }','1','1','1')">承租人 <input type="radio" name="backtype"  value="2" onclick="radioNull()">制造商 <input type="radio" name="backtype"  value="3" onclick="radioNull()">其他</td>
		</tr>

		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 开户行及账号</td>
			<td><input type="text" name="bank_name" id="bank_name"><input type="hidden" name="pccba_id" id="pccba_id" value="${ispccbaId }">    &nbsp;&nbsp;<input type="text" name="bank_account" id="bank_account" value="${isbankAccount }" onBlur="check()">      支付方式：<select name="pay_way"><c:forEach items="${psTypeList}" var="psTypeList"><option value="${psTypeList.DATA_ID}">${psTypeList.FLAG}</option></c:forEach></select></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td  rowspan="13">&quot;</td></tr>
		<tr id="3"  class="ui-widget-content jqgrow ui-row-ltr"><td>承租人：${payMoney.CUST_NAME }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>合同号：${payMoney.LEASE_CODE }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>保险费总额： <fmt:formatNumber value="${payMoney.PAYINSURANCE }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>其他支出： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>应付保险费总额（成本）： <fmt:formatNumber value="${payMoney.PAYINSURANCE+0.00 }" type="currency" /><input type="hidden" name="paycount" id="paycount" value="${payMoney.PAYINSURANCE+0.00 }"></td></tr><c:set var="isPay" value="0" scope="page"></c:set><c:forEach items="${payDw }" var="payDw" varStatus="status"><c:set var="isPay" value="${isPay+payDw.PAY_MONEY }" scope="page"></c:set></c:forEach>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付预付款：<input type="hidden" name="payed" id="payed" value="${isPay }"> <fmt:formatNumber value="${isPay }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付应付款： <fmt:formatNumber value="${isPay }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>本次付款额：<input type="text" name="pay_money" id="pay_money" value=" <fmt:formatNumber value='${payMoney.PAYINSURANCE+0.00-isPay }' type='currency' />">  <font color='red'>*</font>         剩余未付款：<input type="hidden" name="leftpay" id="leftpay" value=""> <fmt:formatNumber value="${payMoney.PAYINSURANCE+0.00-isPay }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>税金：       <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE }" type="currency" /> 入我司（代收款）</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC }" type="currency" />   入我司</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>               入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AG}" type="currency" />   入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AGRATE}" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>用于平均抵冲金额：  <fmt:formatNumber value="${payMoney.PLEDGE_AVE_PRICE }" type="currency" />        	用于期末退还金额： <fmt:formatNumber value="${payMoney.PLEDGE_BACK_PRICE } " type="currency" />        用于最后抵冲金额/期数： <fmt:formatNumber value="${payMoney.PLEDGE_LAST_PRICE }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>手续费： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" >
			<td>实际支付金额 </td>
			<td>RMB： <fmt:formatNumber value="${isPay }" type="currency" />                   <span id="euqipTo"></span></td>
			<script type="text/javascript">document.getElementById("euqipTo").innerHTML=atoc(${isPay });</script>
		</tr>
		<tr>
			<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr" >
				<div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="提交" onclick="insertPayMoney()"></input><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div>
			</td>
		<tr>
	</table>
	</div>
	</div>
	</div>
</form>
</body>
</html>