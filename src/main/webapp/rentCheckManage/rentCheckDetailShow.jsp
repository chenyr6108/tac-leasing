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
									<tr>
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
											class="ui-state-default ui-th-ltr zc_grid_head">支票类别</td>											
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">业管确认</td>	
										<td style="text-align: center;"
											class="ui-state-default ui-th-ltr zc_grid_head">财务确认</td>																																	
									</tr>
									<tr>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="DRAWER" value="${rentCheckDetail.DRAWER}" <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>			
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECKOUT_DATE" class="DATE_SPI" style=" width: 80px; height: 18px;" readonly="readonly" value="<c:choose><c:when test="${rentCheckDetail.CHECK_OUT_DATE eq '1900-01-01'}"></c:when><c:otherwise>${rentCheckDetail.CHECK_OUT_DATE}</c:otherwise></c:choose>" <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">disabled</c:if>>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECK_NUM" value="${rentCheckDetail.CHECK_NUM}" <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="CHECK_MONEY" value="${rentCheckDetail.CHECK_MONEY}" <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><select name="MEMO" id="MEMO" <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">disabled</c:if>>
											<c:forEach items="${memoList}" var="item1">
														<option value="${item1.FLAG }" <c:if test="${item1.FLAG eq rentCheckDetail.MEMO}">selected="selected"</c:if>>
															${item1.FLAG }
														</option>
											</c:forEach></select>&nbsp;</td>
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><select name="CHECK_TYPE" id="CHECK_TYPE" <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">disabled</c:if>>
											<c:forEach items="${checkTypeList}" var="item1">
														<option value="${item1.CODE }" <c:if test="${item1.CODE eq rentCheckDetail.CHECK_TYPE}">selected="selected"</c:if>>
															${item1.FLAG }
														</option>
											</c:forEach></select>&nbsp;</td>											
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="checkbox" NAME="check_ids_hw" id="check_ids_hw" value="${rentCheckDetail.ID}" style="width:100%;" <c:if test="${not empty rentCheckDetail.HW_CHECK_STATE and rentCheckDetail.HW_CHECK_STATE eq 1}">checked</c:if> disabled/>&nbsp;</td>				
										<td style="text-align: center;"class="ui-widget-content jqgrow ui-row-ltr"><INPUT TYPE="checkbox" NAME="check_ids" id="check_ids" value="${rentCheckDetail.ID}" style="width:100%;" <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">checked</c:if> <c:if test="${not empty rentCheckDetail.FINANCE_CHECK_STATE and rentCheckDetail.FINANCE_CHECK_STATE eq 1}">disabled</c:if>/>&nbsp;</td>
									</tr>
					<tr>
										<td colspan="8">			
											<table id="custRentInfo" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"> 
												<tr>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">客户名称</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">合同号</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">对应还款期数(起始)</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">对应还款期数(结束)</td>
													<td style="text-align: center; height: 20px;"
											class="ui-state-default ui-th-ltr zc_grid_head">操作&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
												
										<c:forEach items="${rentCheckLeaseCodeList}" var="item" varStatus="status">
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" id="CUST_NAME${ status.count }"	name="CUST_NAME" size="30" value="${item.CUST_NAME }" disabled/>&nbsp;<input type="hidden" id="CHECK_ID${ status.count }"	name="CHECK_ID_R" value="${item.CHECK_ID }"></td>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<select id="LEASE_CODE${ status.count }" name="LEASE_CODE" disabled>
														<option value="${ item.CREDIT_ID }">
															${item.LEASE_CODE }
														</option>
													</select>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<select id="START_PERIOD_NUM${ status.count }" name="START_PERIOD_NUM" disabled>
														<option value="${ item.CHECK_START }">
															${item.CHECK_START }
														</option>
													</select>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<select id="END_PERIOD_NUM${ status.count }" name="END_PERIOD_NUM" disabled>
														<option value="${ item.CHECK_END }">
															${item.CHECK_END }
														</option>
													</select>&nbsp;
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
													&nbsp;
												</td>
											</tr>
										</c:forEach>			
											</table>
											</td>
											</tr>
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