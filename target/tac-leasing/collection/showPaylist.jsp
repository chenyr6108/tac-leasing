<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>支付表浏览</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		function expPayToPdf(id) {
					location.href='../servlet/defaultDispatcher?__action=exportPayToPdf.expPayToPdf&ids='+id;
		}	
		
		
		function paylineDetail(id){
			location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylineDetail&RECP_ID='+id;
		}	
		</script>
	</head>
	<body>
		<center>
			<form action="${ctx }/servlet/defaultDispatcher">
			<br>
				<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
					<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支付表浏览</span>
				   	</div>
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          			<div class="zc_grid_body jqgrowleft">
           				
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: left ;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<strong>基本信息</strong>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同号：
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.LEASE_CODE }
													</td>
													<td width="17%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														客户名称：
													</td>
													<td width="43%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.CUST_NAME }
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														支付表号：
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.RECP_CODE }
													</td>
													<td width="17%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同总金额：
													</td>
													<td width="43%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${paylist.CONTRACT_PRICE}" type="currency" />
														(大写：<script type="text/javascript">document.write(atoc(${paylist.CONTRACT_PRICE}));</script>)
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="showEquipment.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="showSchema.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="showInsure.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="showOtherFee.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<table id="irrMonthPriceTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
														<b>&nbsp;&nbsp;融资租赁租金方案</b>
													</td>
													<td style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">
													&nbsp;
													</td>
												</tr>
												<c:forEach var="item" items="${paylist.irrMonthPaylines}" varStatus="status">
													<tr>
													<td  style="height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															应付租金<font color="red">&nbsp;*</font>
														</td>
														<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />
														</td>
														<td   class="ui-widget-content jqgrow ui-row-ltr">
															对应期次
														</td>
														<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
															第&nbsp;${item.IRR_MONTH_PRICE_START}&nbsp;期到第&nbsp;
																<c:forEach begin="1" end="${paylist.LEASE_PERIOD}" var="item1" step="1">
																	<c:if test="${item.IRR_MONTH_PRICE_END eq item1}">${item1 }</c:if>
																</c:forEach>&nbsp;期
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
										<td style="text-align: left;height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="5">
											<b><font color="red">实际剩余本金:&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${(empty settleMap.SUM_OWN_PRICE) or (paylist.RECP_STATUS eq 3)?0:settleMap.SUM_OWN_PRICE}" type="currency" /></font>&nbsp;</b>
										</td>
									</tr>									
									
									<tr>
										<td>
											<c:choose>
												<c:when test="${paylist.TAX_PLAN_CODE eq '2' }">
													<%@ include file="showPaylineValueAdded.jsp"%>
												</c:when>
												<c:when test="${paylist.TAX_PLAN_CODE eq '1' or paylist.TAX_PLAN_CODE eq '3' or paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '5'
												or paylist.TAX_PLAN_CODE eq '6'
												or paylist.TAX_PLAN_CODE eq '7'
												or paylist.TAX_PLAN_CODE eq '8'}">
													<%@ include file="showPayline.jsp"%>
												</c:when>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="showFirstValue.jsp"%>
										</td>
									</tr>
									<c:if test="${FLAG eq 1}">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>	
													<td colspan="8" align="center" class="ui-widget-content jqgrow ui-row-ltr">
													    <input type="button" class="ui-state-default ui-corner-all" id="But" value="导出支付表" name="But" onclick="expPayToPdf('${paylist.RECP_ID}');">
														<input type="button" name="gobackBut" onclick="javascript:history.go(-1);" value="返  回" class="ui-state-default ui-corner-all">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									</c:if>
									<c:if test="${FLAG eq 0}">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>	
													<td colspan="8" align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="button" name="gobackBut" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.queryRentContract';" value="返  回" class="ui-state-default ui-corner-all">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									</c:if>
									<c:if test="${FLAG eq 3}">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>	
													<td colspan="8" align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="button" name="gobackBut" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.queryPaylist';" value="返  回" class="ui-state-default ui-corner-all">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									</c:if>
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

