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



//员工银行提示
function supl(user_name) {
	document.getElementById("bank_name").value="";
	document.getElementById("bank_account").value="";
					$.ajax({
						type:'post',
						url:'../servlet/defaultDispatcher',
						data:'__action=insuranceList.bankByUser_Name&user_name='+user_name,
						dataType:'json' ,
						success: initAutoComplete2
				
					});
			
};


function initAutoComplete2(data) { 
	dataList = data.bankAcount;
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
    
     var pay_Date = $.trim($(":input[name='expecteddate']").val());
    if (pay_Date.length <1) {
        alert("请填写预订支付日！")
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
    
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyBonusManagerNew");
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






</script>
<body onLoad="supl('${bonus_name }')">
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyBonusManagerNew" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${s_employeeId }">
	<input type="hidden" name="state" value="0">
	<input type="hidden" name="backState" id="backState" value="4">
	<input type="hidden" name="conIncu_id" id="con" value="${conIncu_id }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;奖金请款凭证(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td colspan="3">预订支付日：       <input type="text" style="height:25px" name="expecteddate" id="datebegin" value="<fmt:formatDate value='${payMoney.EXPECTEDDATE }' pattern='yyyy-MM-dd'/>" readonly="readonly"/> <font color='red'>*</font></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>实际支付日：      <input type="text" style="height:25px" name="pay_Date"  readonly="readonly" value=""/>   </td>
				<td colspan="2" align="right"> 申请日期：      <input type="text" style="height:25px" name="application_date" readonly="readonly"  value="${times }"/> </td>
			</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="100px">请款员工：</td>
			<td><input type="text" name="payByName" id="payByName" width="50px" value="${bonus_name }" readonly="readonly"> </td>
		</tr>
		
		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 开户行及账号</td>
			<td><input type="text" name="bank_name" id="bank_name">  <font color='red'>*</font><input type="hidden" name="pccba_id" id="pccba_id" value="${ispccbaId }">    &nbsp;&nbsp;<input type="text" name="bank_account" id="bank_account" value="${isbankAccount }" onBlur="check()" readonly="readonly"> <font color='red'>*</font>   支付方式：<select name="pay_way"><c:forEach items="${psTypeList}" var="psTypeList"><option value="${psTypeList.DATA_ID}">${psTypeList.FLAG}</option></c:forEach></select></td>
		</tr>
		
		<tr class="ui-widget-content jqgrow ui-row-ltr" >
			<td>实际支付金额 <input type="hidden" name="pay_money" value="${priceCount }"></td>
			<td>RMB： <fmt:formatNumber value="${priceCount }" type="currency" />                   <span id="euqipTo"></span></td>
			<script type="text/javascript">document.getElementById("euqipTo").innerHTML=atoc(${priceCount });</script>
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