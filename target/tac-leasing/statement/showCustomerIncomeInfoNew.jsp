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
		
		function exportExcel(form) {
			$("#__action").val("statement.exportExcel");
			form.submit();
		}
		
		function exportExcelCustBillForSales(cust_id){
			window.parent.callBirt("birtReport/exportCustomerBills/exportCustBillForSales.rptdesign", "xls", {"cust_id":cust_id});

		}
		
		function exportPDFCustBillForSales(cust_id){
			window.parent.callBirt("birtReport/exportCustomerBills/exportCustBillForSales.rptdesign", "pdf", {"cust_id":cust_id});

		}
		
		</script>
		<title>对账单管理--对账函信息</title>
	</head>

	<body>
		<form name="form1" id="form1" action="../servlet/defaultDispatcher"
			method="post">
			<input type="hidden" name="cust_name" id="cust_name" value="${cust_name }">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="width: 850px;height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;对账单管理--对账函信息</span>
	   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 850px">
            <div class="zc_grid_body jqgrowleft" style="width: 850px">
			<div class="ui-state-default ui-jqgrid-hdiv " style="width: 850px">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 800px">
				<tr class="ui-jqgrid-labels">
					<td  align="left">
					<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;客户：${cust_name }</span>
					</td>
					
				</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 800px">
				<tr class="ui-jqgrid-labels">
					<td colspan="2" align="center">
						<strong><font color="red" >对账函</font></strong>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td valign="top">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 800px" height="340">
							<tr class="ui-jqgrid-labels">
								
								<th height="26" width="50" class="ui-state-default ui-th-ltr zc_grid_head">
									日期
								</th>
								<th width="150" class="ui-state-default ui-th-ltr zc_grid_head">
									说明
								</th>
								<th width="50" class="ui-state-default ui-th-ltr zc_grid_head">
									应收金额
								</th>
								<th width="50" class="ui-state-default ui-th-ltr zc_grid_head">
									来款金额
								</th>
							</tr>
							<c:set var="should_price" value="0" ></c:set>
							<c:set var="income_price" value="0" ></c:set>
						
							<c:forEach items="${paymentList}" var="payment"
								varStatus="status">
									<tr>
										<td height="26" align="center" class="ui-widget-content jqgrow ui-row-ltr">
											<fmt:formatDate pattern="yyyy-MM-dd " type="both" value="${payment.PAY_DATE }"/>&nbsp;
										</td>
						
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											<c:if  test="${payment.MEMO eq 'FINE'}">合同:${payment.LEASE_CODE } 第${payment.PERIOD_NUM}期  <span style="color: red">罚息</span></c:if>
											<c:if  test="${payment.MEMO eq 'RENT' }">合同:${payment.LEASE_CODE } 第${payment.PERIOD_NUM}期  <span style="color: black;font-weight: bold">租金</span></c:if>
											<c:if  test="${payment.MEMO eq 'BANK' }"><span style="color:  #5C9CCC">银行来款</span></c:if>
											<c:if  test="${payment.MEMO eq 'NOFINE'}"><span style="color: red">结清罚息</span></c:if>
										
										</td>
										<c:set var="should_price" value="${should_price+payment.SHOULD_PRICE }" ></c:set>
										<c:set var="income_price" value="${income_price+payment.INCOME_MONEY }" ></c:set>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<fmt:formatNumber value="${payment.SHOULD_PRICE }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<fmt:formatNumber value="${payment.INCOME_MONEY }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
									</tr>
							</c:forEach>
							<tr>
								<td colspan="2" height="26" align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong>总计：</strong>
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${should_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${income_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				<tr class="ui-jqgrid-labels">
					<td align="center">
						<input type="button" name="back" value="返回" onclick="javascript:history.back(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
