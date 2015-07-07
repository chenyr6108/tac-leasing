<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>修改支付表其他费用</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/support/js/supportUpdatePayMoney.js"></script>
		<script type="text/javascript">
			saveSupportUpdatePay = function () {
				$("input[name='__action']").val("supportUpdatePayMoney.saveChangePaylist");		
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
				<input type="hidden" name="RECP_ID" value="${paylist.RECP_ID }">
				<input type="hidden" name="RECT_ID" value="${paylist.RECT_ID }">
				<input type="hidden" name="LEASE_CODE" value="${paylist.LEASE_CODE }">
				<input type="hidden" name="RECP_CODE" value="${paylist.RECP_CODE }">
				<input type="hidden" name="CUST_NAME" value="${paylist.CUST_NAME }">
				<input type="hidden" name="LEASE_TOPRIC" value="${paylist.CONTRACT_PRICE }">
				<input type="hidden" name="TOTAL_PRICE" value="${paylist.LEASE_TOPRIC }">
				<input type="hidden" name="VERSION_CODE" value="${paylist.VERSION_CODE }">
				<input type="hidden" name="PAYDATE_FLAG" value="${paylist.PAYDATE_FLAG }">
				<br>
		<table width="1028" cellpadding="0" cellspacing="0" border="0"
				align="center">	
				<tr>
					<td>	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改支付表其他费用</span>
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
														承租人：
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
											<%@ include file="/collection/showEquipment.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showSchema.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showInsure.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherPriceTab">
	<tr>
		<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<strong>其他费用</strong>
		</td>
		<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addOtherPrice();">添加</a>
		</td>
	</tr>
	<tr>
		<th width="20%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			费用名称
		</th>
		<th width="20%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			费用金额
		</th>
		<th width="20%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			产生费用时间
		</th>
		<th width="35%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
		<th width="5%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			操作
		</th>
	</tr>
	<c:set  var="otherFeeTotal" value="0"></c:set>
	<c:forEach items="${paylist.payOtherFees }" var="item">
		<tr>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_NAME0" name="OTHER_NAME" value="${item.OTHER_NAME }"/>
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input class="input_right" onchange="changeField('OTHER_PRICE',this);" id="OTHER_PRICE0" name="OTHER_PRICE" value="<fmt:formatNumber value="${item.OTHER_PRICE }" type="currency" />" >
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_DATE0" name="OTHER_DATE" value="${item.OTHER_DATE }">
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_MEMO0" name="OTHER_MEMO" size="30" value="${item.MEMO }">
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteOtherPriceRow.call(this)">删除</a>
				<input type="hidden" name="RECO_ID" value="${item.RECO_ID }" id="RECO_ID0">
			</td>
		</tr>
		<c:set  var="otherFeeTotal" value="${item.OTHER_PRICE + otherFeeTotal}"></c:set>
	</c:forEach>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">
			合计（大写）：
			<span id="showOtherFeeTotalSpanUpper">
			<script type="text/javascript">document.write(atoc(${otherFeeTotal}));</script>
			</span>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
			（小写：
			<span id="showOtherFeeTotalSpan">
			<fmt:formatNumber type="currency" value="${otherFeeTotal }" />
			</span>
			）
		</td>
	</tr>

</table>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showPayline.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="/collection/showFirstValue.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="button" name="gobackBut" onclick="saveSupportUpdatePay();" value=保&nbsp;&nbsp;存  class="ui-state-default ui-corner-all">
													</td>
												</tr>
											</table>
										</td>
									</tr>
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

