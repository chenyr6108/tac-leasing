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
<script type="text/javascript">
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
} );


    
    function payMoneyPass(id)
    {
    	location.href='${ctx }/servlet/defaultDispatcher?__action=payMoney.updatePayMoneyPass&ID='+id;
    
	}
	
	function payMoneyBack(id)
    {
    	location.href='${ctx }/servlet/defaultDispatcher?__action=payMoney.updatePayMoneyBack&ID='+id;
    
	}
	
	function saveExpectedDate() {
		$("#__action").val("backMoney.saveExpectedDate");
		$("#addForm").submit();
	}
</script>
<body>
<!-- ?__action=backMoney.createPayMoneyManager -->
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${s_employeeId }">
	<input type="hidden" name="__action" id="__action">
	<input type="hidden" name="CREDIT_ID" id="CREDIT_ID" value="${payMoney.CREDIT_ID }">
	<input type="hidden" name="payMoneyId" id="payMoneyId" value="${payMoney.ID }">
	<input type="hidden" name="rect_id" value="${payMoney.RECT_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;付款审批</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
				<td colspan="3">预订支付日：      <input type="text" style="height:25px" name="expecteddate" value="<fmt:formatDate value='${payMoney.EXPECTEDDATE }' pattern='yyyy-MM-dd'/>" id="dateend"/><input type="button" value="保存" class="ui-state-default ui-corner-all" onclick="saveExpectedDate()" style="display: none;"></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>实际支付日：      <input type="text" style="height:25px" name="pay_Date" value="<c:if test='${payMoney.PAY_DATE!=null && payMoney.PAY_DATE!="" && payMoney.PAY_DATE!="1900-01-01 00:00:00.0"}'><fmt:formatDate value='${payMoney.PAY_DATE }' pattern='yyyy-MM-dd'/></c:if>" readonly="readonly"/>   </td>
				<td align="left"> 申请日期：      <input type="text" style="height:25px" name="application_date" value="<fmt:formatDate value='${payMoney.APPLICATION_DATE }' pattern='yyyy-MM-dd'/>" readonly="readonly"/> </td>
				<td align="left">
					快递方式:<input style="height:25px" name="express" id="express" value="${expressinfo.EXPRESS}" disabled="disabled">
					快递付款方式：
					<c:if test="${not empty expressinfo.EXPRESS_PAY_WAY }">
					<select name="express_pay_way" disabled="disabled">
						<c:forEach var="item" items="${express_pay_way}">
							<option value="${item.CODE}" <c:if test="${item.CODE eq expressinfo.EXPRESS_PAY_WAY }">selected="selected"</c:if>>${item.FLAG}</option>
						</c:forEach>
					</select>
					</c:if>
				</td>
			</tr>
	</table>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="100px">请款单位：</td>
			<td>${payMoney.BACKCOMP }      </td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 开户行及账号</td>
			<td>${payMoney.BANK_NAME },${payMoney.BANK_ACCOUNT }  支付方式：${payMoney.FLAG }</td>
		</tr>
		<tr <c:if test="${payMoney.PAY_WAY ne 1}">style="display:none"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
			<td>背书人</td>
			<td>
				第一背书人：${payMoney.ENDORSER_1}  第二背书人：${payMoney.ENDORSER_2}
			</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td  rowspan="12"></td></tr>
		<tr id="3"  class="ui-widget-content jqgrow ui-row-ltr"><td>承租人：${payMoney.CUST_NAME }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>合同号：${payMoney.LEASE_CODE }</td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>购买总额： <fmt:formatNumber value="${payMoney.LEASE_TOPRIC1 }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>其他支出： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>应付总额（成本）： <fmt:formatNumber value="${payMoney.PAYCOUNT+0.00 }" type="currency" /><input type="hidden" name="paycount" id="paycount" value="${payMoney.PAYCOUNT+0.00 }"><c:set var="isPay" value="0" scope="page"></c:set><c:forEach items="${payDw }" var="payDw" varStatus="status"><c:set var="isPay" value="${isPay+payDw.PAY_MONEY }" scope="page"></c:set></c:forEach></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>本次付款额： <fmt:formatNumber value='${payMoney.PAY_MONEY }' type='currency' /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>税金：       <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE }" type="currency" /> 入我司（代收款）</td></tr>
		<!-- <tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC }" type="currency" />   入我司</td></tr> -->
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>扣除：           保证金：  <fmt:formatNumber value="${payMoney.PLEDGE_REALPRIC}" type="currency" />   入我司  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMPRICE}" type="currency" />  入我司税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_CMRATE}" type="currency" />  我司入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAG}" type="currency" />  我司入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_MCTOAGRATE}" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>               入供应商  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AG}" type="currency" />   入供应商税金  <fmt:formatNumber value="${payMoney.PLEDGE_ENTER_AGRATE}" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>用于平均抵冲金额：  <fmt:formatNumber value="${payMoney.PLEDGE_AVE_PRICE }" type="currency" />        	用于期末退还金额： <fmt:formatNumber value="${payMoney.PLEDGE_BACK_PRICE } " type="currency" />        用于最后抵冲金额/期数： <fmt:formatNumber value="${payMoney.PLEDGE_LAST_PRICE }" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr"><td>手续费： <fmt:formatNumber value="0.00" type="currency" /></td></tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" >
			<td>实际支付金额 </td>
			<td>RMB：  <fmt:formatNumber value='${payMoney.PAY_MONEY }' type='currency' /><!--<c:choose><c:when test="${payMoney.STATE==3 }"><fmt:formatNumber value="${payMoney.PAYED+payMoney.PAY_MONEY }" type="currency" /></c:when><c:otherwise><fmt:formatNumber value="${payMoney.PAYED }" type="currency" /></c:otherwise></c:choose>  -->                 <span id="euqipTo"></span></td>
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
				<div align="center"><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></div>
			</td>
		<tr>
	</table>
	</div>
	</div>
	</div>
</form>
</body>
</html>