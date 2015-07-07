<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>报价管理</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/paylistLink.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/paylistIrrMonthPrice.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/paylistLink.js"></script>


<script type="text/javascript">
var baseRate = ${baseRateJson};


	
</script>
</head>

<body>	
<form action="../servlet/defaultDispatcher" name="payForm" id="payForm"  method="post">
	<input type="hidden" name="__action" value="">
	<input type="hidden" name="SCHEME_ID" value="${schema.ID }">
	<input type="hidden" name="TAX_PLAN_CODE" value="${schema.TAX_PLAN_CODE }">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 900px">
           	<div class="zc_grid_body jqgrowleft" style="width: 900px">
        <div class="ui-state-default ui-jqgrid-hdiv " style="width: 900px">
			<table id="equipmentTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 900px">
				<tr width="900">
					<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="5">
						<strong>承租人：</strong><font color="red">&nbsp;*</font><input name="CUST_NAME" size="30" value="${schema.CUST_NAME }">
					</td>
				</tr>	
				<tr>
					<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户购买意向</strong>
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
						相关操作：
					</td>
				</tr>
				<tr>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head" width="10%">
						<strong>厂牌</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="10%">
						<strong>产品名称</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="5%">
						<strong> 数量</strong>
					</th>
					<th align="center" class="ui-state-default ui-th-ltr zc_grid_head"  width="5%">
						<strong>供应商</strong>
					</th>					
					<th align="center"  class="ui-state-default ui-th-ltr zc_grid_head" width="6%">
						操作
					</th>
				</tr>
				<c:forEach items="${equipmentList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="TYPE_NAME"  size="30" value="${item.TYPE_NAME }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="KIND_NAME"  size="30" value="${item.KIND_NAME }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="AMOUNT"  size="30" value="${item.AMOUNT }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;<input type="text" name="SUPL_NAME"  size="30" value="${item.SUPL_NAME }" />
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							&nbsp;
						</td>
					</tr>
				</c:forEach>
			</table>
	
	<table width="900" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="wuzd">
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
				<b>&nbsp;&nbsp;融资租赁方案</b>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				融资租赁总价值<font color="red">&nbsp;*</font>
			</td>
			<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LEASE_ALLPRIC" id="LEASE_ALLPRIC" value="<fmt:formatNumber value="${schema.LEASE_TOPRIC }" type="currency" />"
					class="input_right" style="width: 130px;">
				<select name="IS_TAX" style="display: none;">
					<option value="0" >含税</option>
					<option value="1" >未税</option>
				</select>
			</td>
		 
			<td    class="ui-widget-content jqgrow ui-row-ltr">
				概算成本（RZE）
			</td>
			<td style="text-align: left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PAY_LEASE_RZE" id="PAY_LEASE_RZE" readonly="readonly"
					value="<fmt:formatNumber value="${schema.LEASE_RZE }" type="currency" />"
					class="input_right" style="width: 130px;">
			</td>
		</tr>
		<tr>
			<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
				租赁期数<font color="red">&nbsp;*</font>
			</td>
			<td width="25%"style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="updateYearInterest();changeFieldPay('PAY_LEASE_PERIOD',this);"
					name="PAY_LEASE_PERIOD" id="PAY_LEASE_PERIOD"
					value="${schema.LEASE_PERIOD }" style="width: 60px;">
			</td>
			<td width="17%"    class="ui-widget-content jqgrow ui-row-ltr">
				租赁周期<font color="red">&nbsp;*</font>
			</td>
			<td width="43%"   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="PAY_LEASE_TERM" id="PAY_LEASE_TERM"
					onchange="changeFieldPay('PAY_LEASE_TERM',this);">
					<option value="1"
						<c:if test="${schema.LEASE_TERM eq 1 }">selected="selected"</c:if>>
						月份
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				首期租金<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE_PERCENT',this);"
					name="PAY_HEAD_HIRE_PERCENT" id="PAY_HEAD_HIRE_PERCENT"
					value="${empty schema.HEAD_HIRE_PERCENT ? 0 : schema.HEAD_HIRE_PERCENT }" style="width: 60px;">
				%
				<input type="text" onchange="changeFieldPay('PAY_HEAD_HIRE',this);"
					name="PAY_HEAD_HIRE" id="PAY_HEAD_HIRE" class="input_right"
					style="width: 130px;"
					value="<fmt:formatNumber value="${empty schema.HEAD_HIRE ? 0 : schema.HEAD_HIRE }" type="currency" />">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input style="display: none;" type="text" name="TOTAL_VALUEADDED_TAX" id="TOTAL_VALUEADDED_TAX" value="<fmt:formatNumber value="${empty schema.TOTAL_VALUEADDED_TAX ? 0 : schema.TOTAL_VALUEADDED_TAX }" type="currency" />"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				保证金<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE_RATE',this);"
					name="PAY_PLEDGE_PRICE_RATE" id="PAY_PLEDGE_PRICE_RATE"
					value="${schema.PLEDGE_PRICE_RATE }" style="width: 60px;">
				%
				<input type="text" onchange="changeFieldPay('PAY_PLEDGE_PRICE',this);"
					name="PAY_PLEDGE_PRICE" id="PAY_PLEDGE_PRICE"
					value="<fmt:formatNumber value="${schema.PLEDGE_PRICE }" type="currency" />"
					class="input_right" style="width: 130px;">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
		
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
		<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于一次抵冲租金
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PAY_PLEDGE_AVE_PRICE" id="PAY_PLEDGE_AVE_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_AVE_PRICE?0:schema.PLEDGE_AVE_PRICE }" />" style="text-align: right">
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于期末退还金额
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PAY_PLEDGE_BACK_PRICE" id="PAY_PLEDGE_BACK_PRICE" onchange="paylistchangeRZE();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_BACK_PRICE?0:schema.PLEDGE_BACK_PRICE }" />" style="text-align: right">
					</td>
				</tr>
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						用于最后抵冲金额/期数
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="PAY_PLEDGE_LAST_PRICE" id="PAY_PLEDGE_LAST_PRICE" onchange="paylistchangeRZE();paylistchangePledgeRealPrice();"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.PLEDGE_LAST_PRICE?0:schema.PLEDGE_LAST_PRICE }" />" style="text-align: right">
						<input type="text" name="PAY_PLEDGE_LAST_PERIOD" id="PAY_PLEDGE_LAST_PERIOD" size="8"
							value="${empty schema.PLEDGE_LAST_PERIOD?0:schema.PLEDGE_LAST_PERIOD }" style="text-align: center;">
					</td>
					<!-- Modify by Michael 2012 4-19 隐藏收入时间 -->
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						延迟拨款期数<!-- 	收入时间 -->
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
						<select name="PAY_DEFER_PERIOD" id="PAY_DEFER_PERIOD">
							<option value="0" <c:if test="${empty schema.DEFER_PERIOD and schema.DEFER_PERIOD eq 0}"> selected="selected"</c:if>>0</option>
							<c:forEach var="i" begin="1" end="2" step="1">
							  <option value="${i }" <c:if test="${not empty schema.DEFER_PERIOD and schema.DEFER_PERIOD == i}"> selected="selected"</c:if>>${i}</option>
							</c:forEach>
						</select>					
						<input type="hidden" name="PAY_PLEDGE_PERIOD" size="8" id="PAY_PLEDGE_PERIOD"
							value="${empty schema.PLEDGE_PERIOD?0:schema.PLEDGE_PERIOD }" style="text-align: center;">
					</td>
				</tr>
			<input type="hidden" name="PLEDGE_AVG_PRICE" id="PLEDGE_AVG_PRICE"
					value="<fmt:formatNumber value="${empty schema.PLEDGE_AVG_PRICE?0:schema.PLEDGE_AVG_PRICE }"  pattern='#,##0.00' />"
					class="input_right" style="width: 130px;">			
				<tr>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						设备留购款<font color="red">&nbsp;*</font>
					</td>
					<td  class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="STAYBUY_PRICE" id="STAYBUY_PRICE" 
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty schema.STAYBUY_PRICE?0:schema.STAYBUY_PRICE }" />" style="text-align: right">
					</td>
					<td   class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${schema.TAX_PLAN_CODE eq '7' or empty schema.TAX_PLAN_CODE}">
				佣金
			</c:if>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
			<c:if test="${schema.TAX_PLAN_CODE eq '7' or empty schema.TAX_PLAN_CODE }">
				${schema.SALES_PAY }
			</c:if>
			</td>
				</tr>			
			<tr>
				<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
					<font color="RED"><b>管理费收入(影响TR计算)</b></font>
				</td>
				<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
					<font color="RED"><b>非管理费收入(不影响TR计算)</b></font>
				</td>
			</tr>	
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
					
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="paylistchangeRZE();"
										 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE1" >
									</td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="paylistchangeRZE();"
									 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE1" >
								</td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
							 value="${empty item.FEE?0:item.FEE }" style="text-align: right" feeListRZE="feeListRZE2">
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr">
								<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
								 value="${empty item.FEE?0:item.FEE }"  style="text-align: right" feeListRZE="feeListRZE2">
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->
				
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				支付方式<font color="red">&nbsp;*</font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<select name="PAY_PAY_WAY" id="PAY_PAY_WAY" onchange="changeFieldPay('PAY_PAY_WAY',this);">
					<c:forEach items="${payWays}" var="item">
						<option value="${item.CODE }"
							<c:if test="${ schema.PAY_WAY eq item.CODE }"> selected="selected"</c:if>>
							${item.FLAG }
						</option>
					</c:forEach>
				</select>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b>客户TR</b></font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
			<input type="hidden" name="TR_RATE" id="TR_RATE" value="<fmt:formatNumber value="${schema.TR_RATE }" pattern="##0.000"/>">
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b>实际TR</b></font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<b>&nbsp;&nbsp;<fmt:formatNumber value="${schema.TR_IRR_RATE }" pattern="##0.000"></fmt:formatNumber>&nbsp;</b>%
				<input type="hidden" name="TR_IRR_RATE" id="TR_IRR_RATE" value="<fmt:formatNumber value="${schema.TR_IRR_RATE }" pattern="##0.000"/>">
			</td>
		</tr>
		<c:set value="0" var="RATE_DIFF"></c:set>
		<c:forEach items="${paylist.paylines }" var="item111" varStatus="status">
			<c:set value="${RATE_DIFF + item111.PV_PRICE}" var="RATE_DIFF"></c:set>
		</c:forEach>
		
		<c:set value="0" var="REN_PRICE"></c:set>
		<c:forEach items="${paylist.paylines }" var="item222" varStatus="status">
			<c:set value="${REN_PRICE + item222.REN_PRICE}" var="REN_PRICE"></c:set>
		</c:forEach>
		<c:set value="0" var="SALES_TAX"></c:set>
		<c:forEach items="${paylist.paylines }" var="item333" varStatus="status">
			<c:set value="${SALES_TAX + item333.SALES_TAX}" var="SALES_TAX"></c:set>
		</c:forEach>
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				<font color="RED"><b>利差</b></font>
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				<!-- Modify by Michael 2012 1/5 增加利差 -->
					<b><input type="text" name="RATE_DIFF" id="RATE_DIFF"
					value="<fmt:formatNumber value="${schema.RATE_DIFF }" type="currency" maxFractionDigits="0" />"
					class="input_right" style="width: 130px;" readonly="readonly"></b>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
			<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</tr>
			<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				税费测算方案<font color="red">&nbsp;*</font>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;" colspan="3">
				<select name="PAY_TAX_PLAN_CODE" id="PAY_TAX_PLAN_CODE">
						<c:forEach items="${taxPlanList}" var="item">
							<option value="${item.CODE }"
								<c:if test="${ schema.TAX_PLAN_CODE eq item.CODE }"> selected="selected"</c:if>>${item.FLAG }
							</option>
						</c:forEach>
				</select>
			</td>
		</tr>	
		<tr>
			<td colspan="4">
				<table id="irrMonthPriceTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
							<b>&nbsp;&nbsp;融资租赁方案测算方式一</b>
						</td>
						<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
							&nbsp;
						</td>
					</tr>
					<c:forEach var="item" items="${schema.irrMonthPaylines}" varStatus="status">
						<tr>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								应付租金<font color="red">&nbsp;*</font>
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text"  name="PAY_IRR_MONTH_PRICE" class="input_right"
									style="width: 130px;"
									value="<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />">
							</td>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								对应期次
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								第<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);">
									<c:forEach begin="1" end="${schema.LEASE_PERIOD}" var="item1" step="1">
										<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
									</c:forEach></select>期
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
							
								<span name="delSpan"
										<c:if test="${status.count ne fn:length(schema.irrMonthPaylines)}">style="display: none;"</c:if>
									></span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
				<table id="ValueAddedTax" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="display: none;">
					<c:forEach var="item" items="${schema.irrMonthTaxPaylines}" varStatus="status">
						<tr>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								含税应付租金<font color="red">&nbsp;*</font>
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text"  name="PAY_IRR_TAX_MONTH_PRICE" class="input_right"
									style="width: 130px;"
									value="<fmt:formatNumber value="${item.MONTH_PRICE_TAX}" type="currency" />" readonly="readonly">
							</td>
							<td   class="ui-widget-content jqgrow ui-row-ltr">
								对应期次
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
								第<input type="text" name="PAY_IRR_TAX_MONTH_PRICE_START" value="${item.IRR_MONTH_PRICE_START}" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_TAXMONTH_PRICE_END">
									<c:forEach begin="1" end="${schema.LEASE_PERIOD}" var="item1" step="1">
										<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
									</c:forEach></select>期
							</td>
							<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>			
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" colspan="4">
				合同利率：<fmt:formatNumber value="${schema.YEAR_INTEREST }" pattern="#0.000" />%&nbsp;&nbsp;
				未税年平息率：${schema.WEISHUI }<input id="weishui" type="hidden">&nbsp;&nbsp;
				含税年平息率：${schema.HANSHUI }&nbsp;&nbsp;
				<c:if test="${schema.TAX_PLAN_CODE  eq '4'}">
				增值税进销项差额：${schema.CHA }&nbsp;&nbsp;
				进项增值税：${schema.JINXIANG }
				</c:if>
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" colspan="4">
				备注：${schema.REMARK }
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;<input type="button" name="sub2" onclick="history.go(-1);" value="返回" class="ui-state-default ui-corner-all" style="cursor:pointer;">
			</td>
		</tr>		
	</table>

	<center>
	<input type="hidden" name="REN_PRICE" id="REN_PRICE" value="<fmt:formatNumber value="${REN_PRICE }" type="currency" maxFractionDigits="0" />"	class="input_right" style="width: 130px;" readonly="readonly">
	<input type="hidden" name="SALES_TAX" id="SALES_TAX" value="<fmt:formatNumber value="${SALES_TAX }" type="currency" maxFractionDigits="0" />"	class="input_right" style="width: 130px;" readonly="readonly">
	</center>
</div>
</div>
</div>
</form>
</body>
</html>