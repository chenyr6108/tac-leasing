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
		</script>
		<title>对账单管理--对账函信息</title>
	</head>

	<body>
		<c:set property="Map" value="${custMap}" var="cust">
		</c:set>
		<form name="form1" id="form1" action="../servlet/defaultDispatcher"
			method="post">
			<input type="hidden" name="__action" id="__action" value="decompose.handDecompose">
			<input type="hidden" name="cust_code" id="cust_code" value="${cust_code }">
			<input type="hidden" name="cust_name" id="cust_name" value="${cust_name }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="width: 1660px;height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;对账单管理--对账函信息</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 1660px">
            <div class="zc_grid_body jqgrowleft" style="width: 1500px">
			<div class="ui-state-default ui-jqgrid-hdiv " style="width: 1660px">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 1660px">
				<tr class="ui-jqgrid-labels">
					<td colspan="2" align="left">
						客户：${cust_name }&nbsp;<input type="button" value="导出Excel" onclick="exportExcel(this.form)" class="ui-state-default ui-corner-all">
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td colspan="2" align="center">
						<strong><font color="red" >对账函</font></strong>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td valign="top">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 950px">
							<tr class="ui-jqgrid-labels">
								<th height="26" width="180" class="ui-state-default ui-th-ltr zc_grid_head">
									支付表编号
								</th>
								<th width="100" class="ui-state-default ui-th-ltr zc_grid_head">
									应付日期
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									首期款
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									预期租金
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									应付租金
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									保证金均摊
								</th>
								<th width="100" class="ui-state-default ui-th-ltr zc_grid_head">
									应收凭证号
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									实付租金
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									罚息
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
										<td height="26" align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${payment.RECP_CODE }&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${payment.PAY_DATE }&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="first_price" value="${first_price+payment.FIRST_RENT }" ></c:set>
											<fmt:formatNumber value="${payment.FIRST_RENT }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="expect_price" value="${expect_price+payment.EXPECT_RENT }" ></c:set>
											<fmt:formatNumber value="${payment.EXPECT_RENT }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="each_price" value="${each_price+payment.EACH_RENT }" ></c:set>
											<fmt:formatNumber value="${payment.EACH_RENT }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="deposit_price" value="${deposit_price+payment.DEPOSIT_PRICE }" ></c:set>
											<fmt:formatNumber value="${payment.DEPOSIT_PRICE }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${payment.K3SHOULDBILLNO }&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="real_price" value="${real_price+payment.REAL_PRICE }" ></c:set>
											<fmt:formatNumber value="${payment.REAL_PRICE }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											&nbsp;
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
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${first_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${expect_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${each_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${deposit_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${real_price}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
					<td valign="top">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width: 800px">
							<tr class="ui-jqgrid-labels">
								<th height="26" width="100" class="ui-state-default ui-th-ltr zc_grid_head">
									来款日期
								</th>
								<th width="100" class="ui-state-default ui-th-ltr zc_grid_head">
									来款金额
								</th>
								<th width="100" class="ui-state-default ui-th-ltr zc_grid_head">
									来款类型
								</th>
								<th width="160" class="ui-state-default ui-th-ltr zc_grid_head">
									来款附言
								</th>
								<th width="100" class="ui-state-default ui-th-ltr zc_grid_head">
									实收凭证号
								</th>
								<th width="80" class="ui-state-default ui-th-ltr zc_grid_head">
									发票号码
								</th>
								<th width="80" width="10" class="ui-state-default ui-th-ltr zc_grid_head">
									收据号码
								</th>
								<th width="80" width="10" class="ui-state-default ui-th-ltr zc_grid_head">
									分解明细
								</th>
							</tr>
							<c:set var="income_money" value="0" ></c:set>
							<c:forEach items="${incomeList}" var="income"
								varStatus="status">
								<c:if test="${not empty incomeList}">
									<tr>
										<td height="26" align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${income.OPPOSING_DATE }&nbsp;
										</td>
										<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
											<c:set var="income_money" value="${income_money+income.INCOME_MONEY}" ></c:set>
											<fmt:formatNumber value="${income.INCOME_MONEY }"
												type="currency">
											</fmt:formatNumber>&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											<c:choose>
												<c:when test="${income.OPPOSING_TYPE eq '1'}">
													待分解来款
												</c:when>
												<c:otherwise>
													${income.OPPOSING_TYPE }
												</c:otherwise>
											</c:choose>&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${income.OPPOSING_POSTSCRIPT }&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${income.K3REALBILLNO }&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${income.INVOICE_NUM }&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											${income.RECEIPT_NUM }&nbsp;
										</td>
										<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
											<a href="../servlet/defaultDispatcher?__action=checkDecompose.queryDecomposeBillById&operate_flag=3&select_income_id=${income.FIIN_ID }">查看</a>
											&nbsp;
										</td>
									</tr>
								</c:if>
							</c:forEach>
							<tr>
								<td height="26" align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<strong>总计:</strong>
								</td>
								<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
									<strong><fmt:formatNumber value="${income_money}"
										type="currency">
									</fmt:formatNumber></strong>&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="ui-jqgrid-labels">
					<td colspan="2" align="center">
						<input type="button" name="back" value="返回" onclick="javascript:history.back(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
