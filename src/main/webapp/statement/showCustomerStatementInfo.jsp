<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/decompose.js"></script>
		<script type="text/javascript" src="goodDrag.js"></script>
		<script type="text/javascript">
		$(function() {
			goodDrag('chanchu2', 'chanchu1',false);
		});
		
		function showCustIncomeList(cust_code){
			$("#showIncomeListTable"+cust_code).toggle(function(){
            	$(this).load("../servlet/defaultDispatcher?__action=statement.queryCustIncomeInfo&cust_code=" + cust_code );
			});     
		}
		</script>
		<title>对账单管理--对账单信息</title>
	</head>

	<body>
		<c:set property="Map" value="${custMap}" var="cust">
		</c:set>
		<form name="form1" id="form1" action="../servlet/defaultDispatcher"
			method="post">
			<input type="hidden" name="__action" id="__action" value="decompose.handDecompose">
			<input type="hidden" name="cust_code" id="cust_code" value="${cust_code }">
			<input type="hidden" name="cust_name" id="cust_name" value="${cust_name }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="width: 800px;height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;对账单管理--客户对账单信息</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 800px">
            <div class="zc_grid_body jqgrowleft" style="width: 800px">
			<div class="ui-state-default ui-jqgrid-hdiv " style="width: 800px">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 800px">
				<tr class="ui-jqgrid-labels">
					<td valign="top">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 800px">
							<tr class="ui-jqgrid-labels">			
								<th colspan="6" class="ui-state-default ui-th-ltr zc_grid_head">
									客户：${cust_name }&nbsp;&nbsp;&nbsp;&nbsp; 
								</th>								
							</tr>						
							<tr class="ui-jqgrid-labels">
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									支付表号
								</th>		
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									应付日期
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									应付租金
								</th>	
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									实付租金
								</th>
						
								<th width="50" class="ui-state-default ui-th-ltr zc_grid_head">
									期数
								</th>
								<th width="100" class="ui-state-default ui-th-ltr zc_grid_head">
									分解项目
								</th>
							</tr>
							<c:set var="first_price" value="0" ></c:set>
							<c:set var="each_price" value="0" ></c:set>
							<c:set var="real_price" value="0" ></c:set>
							<c:forEach items="${paymentList}" var="payment"
								varStatus="status">
								<c:if test="${not empty paymentList}">
									<tr>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${payment.RECP_CODE }&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${payment.PAY_DATE }&nbsp;
										</td>							
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="each_price" value="${each_price+payment.EACH_RENT }" ></c:set>
											<fmt:formatNumber value="${payment.EACH_RENT }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>									
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="real_price" value="${real_price+payment.REAL_PRICE }" ></c:set>
											<fmt:formatNumber value="${payment.REAL_PRICE }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>									
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${payment.RECD_PERIOD}&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${payment.FICB_ITEM }&nbsp;
										</td>
									</tr>
								</c:if>
							</c:forEach>
							<tr>
								<td height="26" align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<strong>总计：</strong>
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${each_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
			
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${real_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>

								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td align="center">
						<input type="button" name="incomeList" onclick="showCustIncomeList('${cust_code }');" value="客户来款信息" class="ui-state-default ui-corner-all"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="back" value="返回" onclick="javascript:history.back(-1);" class="ui-state-default ui-corner-all">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="print" onclick="javascript:window.print();" value="打印" class="ui-state-default ui-corner-all"/>
					</td>
				</tr>
				<tr>
					<td align="center" >
						<div id="showIncomeListTable${cust_code}" align="center"
							style="display: none; width: 97%">
							<img src="${ctx }/images/loading.gif">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
