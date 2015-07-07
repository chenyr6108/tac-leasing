<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/dun/js/dunTaskManage.js"></script>
		<title>逾期明细</title> 
	</head>
	<body>  
			<div id="dunDetailDiv" title="您当前的位置:租金明细">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="maindun">
	           <div class="zc_grid_body jqgrowleft">
				<div class="">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<c:choose>
				<c:when test="${not empty dunDetailList || not empty dunUnPayList}">
			<tr valign="top">
			<td>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<c:forEach items="${dunDetailList}" var="itemi" begin="0" end="1" step="1">
					 <c:set value="${itemi.CUST_NAME}" var="varCustName"></c:set>	
					 <c:set value="${itemi.RECP_CODE}" var="varRecpCode"></c:set>
					</c:forEach>
					<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="10">
						承租人：${CUST_NAME}&nbsp;&nbsp;支付表：${RECP_CODE}&nbsp;&nbsp;还款明细
					</th>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>编号</td>
					<!--
					<td>支付表号</td>
					<td>承租人</td>
					-->
					<td style="text-align: center;">期数</td>
					<td style="text-align: center;">支付日</td>
					<td style="text-align: center;">应付金额</td>
					<td style="text-align: center;">来款日</td>
					<td style="text-align: center;">实付金额</td>
					<td style="text-align: center;">未付金额</td>
					<td style="text-align: center;">逾期金额</td>
					<td style="text-align: center;">逾期天数</td>
					<td style="text-align: center;">罚息</td>
				</tr>
				<c:set value="0" var="var33"></c:set>
				<c:forEach items="${dunDetailList}" var="item" varStatus="status">	
				<c:if test="${ item.FINE >0}">
					<c:set value="${var33+item.FINE}" var="var33"></c:set>	
				</c:if>
						
				<tr  class='ui-widget-content jqgrow ui-row-ltr'>
				<td>${status.count }</td>
				
					<c:if test="${item.isFirst }">
						<c:forEach items="${periodNumList }" var="periodNum" >
							<c:if test="${periodNum.PERIOD_NUM == item.PERIOD_NUM}">
								<c:if test="${hide!=item.PERIOD_NUM}">
								<td rowspan='${periodNum.ROWS}' style="text-align: center ; font-weight: bold;">${item.PERIOD_NUM}</td>
								</c:if>
								<c:if test="${hide==item.PERIOD_NUM}">
									<td rowspan='${periodNum.ROWS+1}' style="text-align: center ; font-weight: bold;">${item.PERIOD_NUM}</td>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${item.isFirst }">
						<c:forEach items="${periodNumList }" var="periodNum" >
							<c:if test="${periodNum.PERIOD_NUM == item.PERIOD_NUM}">
								<c:if test="${hide!=item.PERIOD_NUM}">
									<td rowspan='${periodNum.ROWS}' style="text-align: center ;">${item.PAY_DATE}</td>
								</c:if>
								<c:if test="${hide==item.PERIOD_NUM}">
									<td rowspan='${periodNum.ROWS + 1 }' style="text-align: center ;">${item.PAY_DATE}</td>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${item.isFirst }">
						<c:forEach items="${periodNumList }" var="periodNum" >
							<c:if test="${periodNum.PERIOD_NUM == item.PERIOD_NUM}">
								<c:if test="${hide==item.PERIOD_NUM}">
									<td rowspan='${periodNum.ROWS + 1}' style="text-align: right;">${item.MONTH_PRICE}</td>
								</c:if>
							<c:if test="${hide!=item.PERIOD_NUM}">
									<td rowspan='${periodNum.ROWS}' style="text-align: right;">${item.MONTH_PRICE}</td>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
				<td style="text-align: center;">${item.OPPOSING_DATE}&nbsp;</td>
				<td style="text-align: right;">${item.REAL_PRICE}</td>
				<c:if test="${item.DUN_PRICE <=0}">
					<td style="text-align: right;">0.00</td>
				</c:if>
				<c:if test="${item.DUN_PRICE >0}">
					<td style="text-align: right;">${item.DUN_PRICE}</td>
				</c:if>
				
				<td style="text-align: right;">
					<c:if test="${item.DUN_DAY >0}">${item.REAL_PRICE}</c:if>
					<c:if test="${item.DUN_DAY <= 0}">0.00</c:if>
				</td>
				
				<td style="text-align: right;">
				
				<c:if test="${item.DUN_DAY >=0}">${item.DUN_DAY}</c:if>
				<c:if test="${item.DUN_DAY < 0}">0</c:if>
				</td>
				<td style="text-align: right;">
				<c:if test="${item.FINE >=0}"><fmt:formatNumber value="${item.FINE}" type="currency" /></c:if>
				<c:if test="${item.DUN_DAY < 0}"><fmt:formatNumber value="0" type="currency" /></c:if>
				</td>
				</tr>
				</c:forEach>
				<c:set value="0" var="unCount"></c:set>
				<c:forEach items="${dunUnPayList}" var="item" varStatus="status">	
				<c:if test="${item.FINE>0}">
					<c:set value="${unCount+item.FINE}" var="unCount"></c:set>	
				</c:if>
					<tr class='ui-widget-content jqgrow ui-row-ltr'>
						<td>${fn:length(dunDetailList)+status.count}</td>
						<c:if test="${hide!=item.PERIOD_NUM}">
							<td style="text-align: center;  font-weight: bold;">${item.PERIOD_NUM}</td>
						</c:if>
						<c:if test="${hide!=item.PERIOD_NUM}">
							<td style="text-align: center;">${item.PAY_DATE}</td>
						</c:if>
				        <c:if test="${hide!=item.PERIOD_NUM}">
				        	<td style="text-align: right;">${item.MONTH_PRICE}</td>
				        </c:if>
				        <td style="text-align: center;">${item.OPPOSING_DATE}&nbsp;</td>
				        <td style="text-align: right;">${item.REAL_PRICE}</td>
				        <td style="text-align: right;">${item.DUN_PRICE}</td>
				        <c:if test="${item.DUN_DAY <= 0}">
				        	<td style="text-align: right;">0.00</td>
				        </c:if>
				        <c:if test="${item.DUN_DAY > 0}">
				        	<td style="text-align: right;">${item.DUN_PRICE}</td>
				        </c:if>
				        <c:if test="${item.DUN_DAY <= 0}">
							<td style="text-align: right;">0</td>
						</c:if>
						 <c:if test="${item.DUN_DAY > 0}">
							<td style="text-align: right;">${item.DUN_DAY}</td>
						</c:if>
						<td style="text-align: right;">
							<c:if test="${item.FINE >=0}"><fmt:formatNumber value="${item.FINE}" type="currency" /></c:if>
							<c:if test="${item.DUN_DAY < 0}"><fmt:formatNumber value="0" type="currency" /></c:if>
						</td>
					</tr>
				</c:forEach>
				<tr>
				<td colspan="10" align="right"><strong>总计：</strong>
				<strong> <fmt:formatNumber value="${var33 +unCount}" type="currency" /></strong></td>
					
				</tr>
			</table>
			
			</td>
			<td>
			<table id="dunDetailTableID" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
						已缴罚息明细
					</th>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>项次</td>
					<td>项目</td>
					<td>金额</td>
					<td>时间</td>
				</tr>
				<c:set value="0" var="var44"></c:set>
				<c:forEach items="${dunInComeMoneyList}" var="item" varStatus="status">	
				<c:set value="${var44+item.REAL_PRICE}" var="var44"></c:set>			
				<tr class='ui-widget-content jqgrow ui-row-ltr'>
				<td>${status.count }</td>				
				<td>${item.FICB_ITEM} </td>
				<td><fmt:formatNumber value="${item.REAL_PRICE}" pattern="#,##0.00"/></td>
				<td>${item.OPPOSING_DATE}</td>
				</tr>
				</c:forEach>
				<tr>
				<td colspan="3" align="right"><strong>总计：</strong></td>
				<td  align="left"><strong><fmt:formatNumber value="${var44 }" type="currency" /></strong></td>
				
				</tr>
				<tr>
				<td colspan="4" align="left"><br/><span style="color: red">*&nbsp;&nbsp;</span><span style="color: black">罚息=（逾期金额*逾期天数*该合同的罚息比）</span></td>
				</tr>
			</table>
			</td>
			</tr>
			</c:when> 
		<c:otherwise>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
					承租人：${CUST_NAME}&nbsp;&nbsp;支付表：${RECP_CODE}&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
			<td style="text-align: center;height: 26px;" colspan="2">无逾期记录！</td>
			</tr>
		</c:otherwise>
		</c:choose>			
			<tr>
			<td style="text-align: center;height: 26px;" colspan="2"></td>
			</tr>
			</table>
			<c:if test="${not empty settlementMap }">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td style="text-align: center;" colspan="10">提前结清信息</td>
				</tr>
				<tr class="ui-state-default ui-th-ltr zc_grid_head">
					<td style="text-align: center;">
						结清本金
					</td>
					<td style="text-align: center;">
						结清本金减免金额
					</td>
					<td style="text-align: center;">
						结清利息
					</td>
					<td style="text-align: center;">
						结清利息减免金额
					</td>
					<td style="text-align: center;">
						结清增值税
					</td>
					<td style="text-align: center;">
						结清增值税减免金额
					</td>
					<td style="text-align: center;">
						结清罚息
					</td>
					<td style="text-align: center;">
						结清罚息减免金额
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: right;"> 
						￥<fmt:formatNumber value="${settlementMap.SHOULD_OWN_PRICE }" pattern="#,##0.00"/>
					</td>
					<td style="text-align: right;">
						￥<fmt:formatNumber value="${settlementMap.SHOULD_OWN_PRICE-settlementMap.PAY_OWN_PRICE }" pattern="#,##0.00"/>
					</td>
					<td style="text-align: right;">
						￥<fmt:formatNumber value="${settlementMap.SHOULD_ACCRUAL_PRICE }" pattern="#,##0.00"/>
					</td>
					<td style="text-align: right;">
						￥<fmt:formatNumber value="${settlementMap.SHOULD_ACCRUAL_PRICE-settlementMap.PAY_ACCRUAL_PRICE }" pattern="#,##0.00"/>
					</td>
					<td style="text-align: right;">
						￥<fmt:formatNumber value="${settlementMap.SHOULD_ADDED_VALUE_TAX }" pattern="#,##0.00"/>
					</td>
					<td style="text-align: right;">
						￥<fmt:formatNumber value="${settlementMap.SHOULD_ADDED_VALUE_TAX-settlementMap.PAY_ADDED_VALUE_TAX }" pattern="#,##0.00"/>
					</td>
					<td style="text-align: right;">
						￥<fmt:formatNumber value="${settlementMap.SHOULD_FINE }" pattern="#,##0.00"/>
					</td>
					<td style="text-align: right;">
						￥<fmt:formatNumber value="${settlementMap.SHOULD_FINE-settlementMap.PAY_FINE }" pattern="#,##0.00"/>
					</td>
				</tr>
			</table>
			</c:if>
			</div>
		</div>
		</div>
	</div>
	</body>
</html>