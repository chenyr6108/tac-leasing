<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>支付表变更</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/collection/js/link.js"></script>
		<script type="text/javascript" src="${ctx }/collection/js/changePaylist.js"></script>
		<script type="text/javascript" src="${ctx }/collection/js/paylistIrrMonthPrice.js"></script>
		<script type="text/javascript">
		viewChangePaylist = function () {
			$("input[name='__action']").val("handlePaylistService.viewChangePaylist");
			
			if (submitPayForm()) {
				$("[name='payForm']").submit();
			}
		}
		saveChangePaylist = function () {
			$("input[name='__action']").val("handlePaylistService.saveChangePaylist");
			
			if (submitPayForm()) {
				$("[name='payForm']").submit();
			}
		}
		</script>
	</head>
	<body>
		<center>
		<ul><c:forEach items="${errList}" var="item" varStatus="status"><li><font color="red"><b>${item }</b></font></li></c:forEach></ul>
			<form action="${ctx }/servlet/defaultDispatcher" name="payForm" method="post">
				<input type="hidden" name="__action" value="">
				<input type="hidden" id="RECP_ID" name="RECP_ID" value="${paylist.RECP_ID }">
				<input type="hidden" id="RECT_ID" name="RECT_ID" value="${paylist.RECT_ID }">
				<input type="hidden" id="LEASE_CODE" name="LEASE_CODE" value="${paylist.LEASE_CODE }">
				<input type="hidden" id="RECP_CODE" name="RECP_CODE" value="${paylist.RECP_CODE }">
				<input type="hidden" id="CUST_NAME" name="CUST_NAME" value="${paylist.CUST_NAME }">
				<input type="hidden" id="LEASE_TOPRIC" name="LEASE_TOPRIC" value="${paylist.CONTRACT_PRICE }">
				<input type="hidden" id="TOTAL_PRICE" name="TOTAL_PRICE" value="${paylist.LEASE_TOPRIC }">
				<input type="hidden" id="VERSION_CODE" name="VERSION_CODE" value="${paylist.VERSION_CODE }">
				<input type="hidden" id="PAYDATE_FLAG" name="PAYDATE_FLAG" value="${paylist.PAYDATE_FLAG }">
				<input type="hidden" id="SUPL_TRUE" name="SUPL_TRUE" value="${paylist.SUPL_TRUE }">
				
		<table width="1028" cellpadding="0" cellspacing="0" border="0"
				align="center">	
				<tr>
					<td>	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支付表变更</span>
		   	</div>				
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           <div class="ui-state-default ui-jqgrid-hdiv ">	

								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<strong>基本信息</strong>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
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
														<fmt:formatNumber value="${paylist.LEASE_TOPRIC}" type="currency" />
														(大写：<script type="text/javascript">document.write(atoc(${paylist.LEASE_TOPRIC}));</script>)
														
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
											<%@ include file="createSchema.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="changePaylistMode.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="createInsure.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="createOtherFee.jsp"%>
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
														<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addIrrMonthPriceRow();">添加</a>
													</td>
												</tr>
												<c:forEach var="item" items="${paylist.irrMonthPaylines}" varStatus="status">
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
																<c:forEach begin="1" end="${paylist.LEASE_PERIOD}" var="item1" step="1">
																	<option value="${item1 }" <c:if test="${item.IRR_MONTH_PRICE_END eq item1}">selected="selected"</c:if>>${item1 }</option>
																</c:forEach></select>期
														</td>
														<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
														
															<span name="delSpan"
																	<c:if test="${status.count ne fn:length(paylist.irrMonthPaylines)}">style="display: none;"</c:if>
																><input type="button" name="delBut" onclick="deleteRow.call(this)" value="删 除" class="ui-state-default ui-corner-all"></span>
														</td>
													</tr>
												</c:forEach>
												<!-- 
												<tr>
													<td   class="ui-widget-content jqgrow ui-row-ltr">
														应付租金<font color="red">&nbsp;*</font>
													</td>
													<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="text" 
															name="PAY_IRR_MONTH_PRICE" class="input_right"
															style="width: 130px;"
															value="<fmt:formatNumber value="${empty paylist.IRR_MONTH_PRICE ? 0 : paylist.IRR_MONTH_PRICE }" type="currency" />">
													</td>
													<td   class="ui-widget-content jqgrow ui-row-ltr">
														对应期次
													</td>
													<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
														第<input type="text" name="PAY_IRR_MONTH_PRICE_START" value="${empty paylist.IRR_MONTH_PRICE_START ? 1 : paylist.IRR_MONTH_PRICE_START }" readonly="readonly" style="width: 30px;text-align: center;">期到第<select name="PAY_IRR_MONTH_PRICE_END" onchange="changeIrrMonthPriceEnd(this);">
															<c:forEach begin="1" end="${paylist.LEASE_PERIOD}" var="item" step="1">
																<option value="${item }" <c:if test="${(empty paylist.IRR_MONTH_PRICE_END ? 8 : paylist.IRR_MONTH_PRICE_END) eq item}">selected="selected"</c:if>>${item }</option>
															</c:forEach></select>期
													</td>
													<td   style="text-align:  left" class="ui-widget-content jqgrow ui-row-ltr">
														<span name="delSpan" style="display: block;"><input type="button" name="delBut" onclick="deleteRow.call(this)" value="删 除" class="ui-state-default ui-corner-all"></span>
													</td>
												</tr>
												 -->
											</table>
										</td>
									</tr>
									<tr>
										<td style="height: 26px;">
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="button" name="viewBut" value=预&nbsp;&nbsp;览 onclick="viewChangePaylist();"
															 class="ui-state-default ui-corner-all">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="button" name="gobackBut" onclick="saveChangePaylist();"
																value=保&nbsp;&nbsp;存  class="ui-state-default ui-corner-all">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="changePaylistPayline.jsp"%>
										</td>
									</tr>
									<!-- 
									<tr>
										<td>
											<%@ include file="showFirstValue.jsp"%>
										</td>
									</tr>
									 -->
								</table>
				</div>
				</div>
				</div>
	</td>
	</tr>
	</table>
			</form>
		</center>
	</body>
</html>

