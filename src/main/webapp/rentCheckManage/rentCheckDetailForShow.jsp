<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<html>
<head>
<script type="text/javascript" >

</script>
</head>
<body>
	<center>
		<form name="checkPayForm" id="checkPayForm" method="POST"  action="../servlet/defaultDispatcher?__action=rentContract.createRentCheckPayLines">
			<br>
			<table width="800" cellpadding="0" cellspacing="0" border="0"
				align="center">
				<tr>
					<td>
						<div
							class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
							style="height: 30px">
							<span class="ui-jqgrid-title"
								style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;支票支付明细</span>
						</div>
						<div
							class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
							id="main">
							<div class="zc_grid_body jqgrowleft">
								<table cellspacing="0" cellpadding="0" border="0"
									class="ui-jqgrid-htable zc_grid_title" id="checkPayTab">
									<tr style="height: 30px">
										<td style="text-align: left;" colspan="9" class="ui-widget-content jqgrow ui-row-ltr">客户名称：${CUST_NAME }</td>
									</tr>	
									<tr style="height: 30px">
										<td style="text-align: left;" colspan="9" class="ui-widget-content jqgrow ui-row-ltr">合同号：${LEASE_CODE }</td>&nbsp;&nbsp;<%-- 增加支票</b>&nbsp;<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addCheckPayDetail();">添加 --%>
									</tr>																		
									<tr>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">租金期数</td>
										<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">租金金额</td>
										<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">出票人</td>				
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">出票日期</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">支票号码</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">金额</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">备注</td>
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">业管确认</td>	
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">财务确认</td>																																	
									</tr>
									<input type="hidden" id="credit_id" name="credit_id" value="${credit_id }" />
									<input type="hidden" id="TYPE" name="TYPE" value="${TYPE }" />
									<input type="hidden" id="LEASE_TERM" name="LEASE_TERM" value="${schemeMap.LEASE_TERM }" />
									<c:choose>
										<c:when test="${not empty checkManagePayLines}">
											<c:forEach items="${checkManagePayLines }" var="item"
													varStatus="status">
													<input type="hidden" id="IDS" name="IDS" value="${item.ID}" />
													<input type="hidden" id="MONTH_PRICE_TAX" name="MONTH_PRICE_TAX" value="${item.MONTH_PRICE_TAX}" />
													<tr>
														<td style="text-align: center"
															class="ui-widget-content jqgrow ui-row-ltr">第${item.PERIOD_NUM}期&nbsp;<input type="hidden" id="PERIOD_NUM" name="PERIOD_NUM" value="${item.PERIOD_NUM}" /><input type="hidden" id="ID" name="ID" value="${item.ID}" /></td>
														<td style="text-align: right; height: 24px;"
															class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber
																value="${item.MONTH_PRICE_TAX }" type="currency" />&nbsp;</td>
														<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr">${item.DRAWER}&nbsp;</td>							
														<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><c:choose><c:when test="${item.CHECK_OUT_DATE eq '1900-01-01'}"></c:when><c:otherwise>${item.CHECK_OUT_DATE}</c:otherwise></c:choose>&nbsp;</td>
														<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr">${item.CHECK_NUM}&nbsp;</td>
														<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><c:choose><c:when test="${empty item.CHECK_NUM}"></c:when><c:otherwise>${item.CHECK_MONEY}</c:otherwise></c:choose>&nbsp;</td>
														<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><c:choose><c:when test="${empty item.CHECK_NUM}"></c:when><c:otherwise>${item.MEMO}</c:otherwise></c:choose>&nbsp;</td>
														<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="checkbox" NAME="check_ids" id="check_ids" value="${item.ID}" style="width:100%;" <c:if test="${not empty item.HW_CHECK_STATE and item.HW_CHECK_STATE eq 1}">checked</c:if> disabled></td>
														<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="checkbox" NAME="check_ids" id="check_ids" value="${item.ID}" style="width:100%;" <c:if test="${not empty item.FINANCE_CHECK_STATE and item.FINANCE_CHECK_STATE eq 1}">checked</c:if> disabled></td>
													</tr>
												</c:forEach>
										</c:when> 
										<c:otherwise>
											<tr>
												<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr" colspan="9">无支票录入数据！&nbsp;</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>