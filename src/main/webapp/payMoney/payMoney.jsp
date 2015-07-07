<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<jsp:useBean id="now4" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>
<script type="text/javascript">
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
} );

function DateDiff(asStartDate,asEndDate){

    var miStart=Date.parse(asStartDate.replace(/\-/g,'/'));

    var miEnd=Date.parse(asEndDate.replace(/\-/g,'/'));

    return (miEnd-miStart)/(1000*24*3600);

} 
    
    function payMoneyPass(id,custName,leascode,backState,credit_id)
    {   //var pay_Date=$("#datebegin").val();
		//var nowDate=new Date().format("yyyy-MM-dd");
		//if(pay_Date<nowDate){
			//alert("请选择今天之后的日期作为实际支付日");
			//$("#datebegin").val("") ;
			//$("#datebegin").focus() ;
			//return false ;
		//}		
        var FINANCECONTRACT_DATE=$("#FINANCECONTRACT_DATE_S").val();
    	//location.href='${ctx }/servlet/defaultDispatcher?__action=payMoney.updatePayMoneyPass&ID='+id+'&leascode='+leascode+'&Num='+backState+'&custName='+custName+'&CREDIT_ID='+credit_id+'&pay_Date='+pay_Date+'&FINANCECONTRACT_DATE='+FINANCECONTRACT_DATE;
    	$("#ID").val(id);
    	$("#leascode").val(leascode);
    	$("#Num").val(backState);
    	$("#custName").val(custName);
    	$("#CREDIT_ID").val(credit_id);
    	$("#pay_Date").val(pay_Date);
    	$("#FINANCECONTRACT_DATE").val(FINANCECONTRACT_DATE);
    	$("#passPayMoney").submit();
	}
	
	function payMoneyBack(id,FSS_ID,CREDIT_ID)
    {
    	location.href='${ctx }/servlet/defaultDispatcher?__action=payMoney.updatePayMoneyBack&CREDIT_ID='+CREDIT_ID+'&FSS_ID='+FSS_ID+'&ID='+id;
    
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

function bankSeleChange()
{
	
	var bankManage=document.getElementById("banksName").value;
	var strs = bankManage.split(",");
	for(var i = 0; i < strs.length; i++) {
		if(i==0)
		{
			document.getElementById("pccba_id").value=strs[i];
		}
 		else if(i==1)
 		{
 			document.getElementById("bank_name").value=strs[i];
 		}
 		else
 		{
 			document.getElementById("bank_account").value=strs[i];
 			document.getElementById("banksAccount").value=strs[i];
 		}
	}
}

</script>
<body>
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backMoney.createPayMoneyManager" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${s_employeeId }">
	
	<input type="hidden" name="CREDIT_ID" value="${payMoney.CREDIT_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;付款凭证</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td >预订支付日：      <fmt:formatDate value='${payMoney.EXPECTEDDATE }' pattern='yyyy-MM-dd'/></td>
				<td >财务合同成立日：<c:if test="${payMoney.FINANCECONTRACT_DATE != null && payMoney.FINANCECONTRACT_DATE != ''}"><input type="hidden" value="${payMoney.FINANCECONTRACT_DATE }" name="FINANCECONTRACT_DATE" id="FINANCECONTRACT_DATE_S"/>${payMoney.FINANCECONTRACT_DATE }</c:if></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>实际支付日：      <input type="text" style="height:25px" name="pay_Date" value="<fmt:formatDate value="${now4}" pattern="yyyy-MM-dd" />" readonly="readonly"/> </td>
				<td colspan="2" align="right"> 申请日期：        <input type="text" style="height:25px" name="application_date" readonly="readonly" value="<fmt:formatDate value='${payMoney.APPLICATION_DATE }' pattern='yyyy-MM-dd'/>"/> </td>
			</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="100px">请款单位：</td>
			<td>${payMoney.BACKCOMP }</td>
		</tr>

		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 开户行及账号</td>
			<td>${payMoney.BANK_NAME },${payMoney.BANK_ACCOUNT }  支付方式：${payMoney.FLAG }</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td  rowspan="14"></td></tr>
		<tr id="3"  class="ui-widget-content jqgrow ui-row-ltr"><td>承租人：${payMoney.CUST_NAME }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>合同号：${payMoney.LEASE_CODE }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>购买总额： <fmt:formatNumber  value="${payMoney.LEASE_TOPRIC1 }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>其他支出： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>应付总额（成本）： <fmt:formatNumber value="${payMoney.PAYCOUNT+0.00 }" type="currency" /><input type="hidden" name="paycount" id="paycount" value="${payMoney.PAYCOUNT+0.00 }"><c:set var="isPay" value="0" scope="page"></c:set><c:forEach items="${payDw }" var="payDw" varStatus="status"><c:set var="isPay" value="${isPay+payDw.PAY_MONEY }" scope="page"></c:set></c:forEach></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付预付款：<input type="hidden" name="payed" id="payed" value="${isPay }"> <fmt:formatNumber value="${payMoney.PAYED }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>已付应付款： <fmt:formatNumber value="${payMoney.PAYED }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>本次付款额： <fmt:formatNumber value='${payMoney.PAY_MONEY }' type='currency' />           剩余未付款：<input type="hidden" name="leftpay" id="leftpay" value=""> <fmt:formatNumber value="${(payMoney.PAYCOUNT-payMoney.PAYED-payMoney.PAY_MONEY)<0.0000000001 ? 0:(payMoney.PAYCOUNT-payMoney.PAYED-payMoney.PAY_MONEY) }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>税金：       <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE }" type="currency" /> 入我司（代收款）</td></tr>
		<!-- <tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC }" type="currency" />   入我司</td></tr> -->
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC}" type="currency" />   入我司  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMPRICE}" type="currency" />  入我司税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE}" type="currency" />  我司入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAG}" type="currency" />  我司入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAGRATE}" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>               入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AG}" type="currency" />   入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AGRATE}" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>用于平均抵冲金额：  <fmt:formatNumber value="${payMoney.PLEDGE_AVE_PRICE }" type="currency" />        	用于期末退还金额： <fmt:formatNumber value="${payMoney.PLEDGE_BACK_PRICE } " type="currency" />        用于最后抵冲金额/期数： <fmt:formatNumber value="${payMoney.PLEDGE_LAST_PRICE }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>手续费： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" >
			<td>实际支付金额 </td>
			<td>RMB： <fmt:formatNumber value='${payMoney.PAY_MONEY }' type='currency' />  <!--<c:choose><c:when test="${payMoney.STATE==3 }"><fmt:formatNumber value="${payMoney.PAYED+payMoney.PAY_MONEY }" type="currency" /></c:when><c:otherwise><fmt:formatNumber value="${payMoney.PAYED }" type="currency" /></c:otherwise></c:choose> -->                 <span id="euqipTo"></span></td>
			<!-- <script type="text/javascript">document.getElementById("euqipTo").innerHTML=atoc(<c:choose><c:when test="${payMoney.STATE==3 }">${payMoney.PAYED+payMoney.PAY_MONEY }</c:when><c:otherwise>${payMoney.PAYED }</c:otherwise></c:choose>);</script> -->
			<script type="text/javascript">document.getElementById("euqipTo").innerHTML=atoc(${payMoney.PAY_MONEY });</script>
		</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>类型</td>
			<td>处理人</td>
			<td>处理时间</td>
			<td>备注</td>
		</tr>
		<c:forEach var="item" items="${auditRe}">
			<tr class="ui-widget-content jqgrow ui-row-ltr" >
				<td>${item.LOG_TITLE} </td>
				<td>${item.USER_NAME} </td>
				<td>${item.CREATE_DATE} </td>
				<td>${item.MEMO} </td>
			</tr>
		</c:forEach>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" >
				<div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="通过" onclick="payMoneyPass('${payMoney.ID }','${payMoney.CUST_NAME }','${payMoney.LEASE_CODE }','${payMoney.BACKSTATE }','${payMoney.CREDIT_ID }')"></input><input class="ui-state-default ui-corner-all" type="button" value="驳回" onclick="payMoneyBack('${payMoney.ID }','${FSS_ID }','${payMoney.CREDIT_ID }')"></input><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div>
			</td>
		<tr>
	</table>
	</div>
	</div>
	</div>
</form>
<form action="${ctx }/servlet/defaultDispatcher?__action=payMoney.updatePayMoneyPass" method="post" id="passPayMoney">
<input type="hidden" id="ID" name="ID" value=""/>
<input type="hidden" id="leascode" name="leascode" value=""/>
<input type="hidden" id="Num" name="Num" value=""/>
<input type="hidden" id="custName" name="custName" value=""/>
<input type="hidden" id="CREDIT_ID" name="CREDIT_ID" value=""/>
<input type="hidden" id="pay_Date" name="pay_Date" value=""/>
<input type="hidden" id="FINANCECONTRACT_DATE" name="FINANCECONTRACT_DATE" value=""/>
</form>
</body>
</html>