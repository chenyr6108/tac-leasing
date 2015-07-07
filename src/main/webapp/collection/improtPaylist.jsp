<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>支付表变更</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/collection/js/link.js"></script>
		<script type="text/javascript" src="${ctx }/collection/js/importPaylist.js"></script>
		<script type="text/javascript" src="${ctx }/collection/js/paylistIrrMonthPrice.js"></script>
		<script type="text/javascript">
		importPaylist = function () {
			$("input[name='__action']").val("handlePaylistService.viewImportPaylist");
			
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
				<input type="hidden" id="SUPL_TRUE" name="SUPL_TRUE" value="${paylist.SUPL_TRUE }">
				<br>
		<table width="1028" cellpadding="0" cellspacing="0" border="0"
				align="center">	
				<tr>
					<td>	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支付表导入</span>
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
											<%@ include file="importPaylistPayline.jsp"%>
										</td>
									</tr>
									<!-- 
									<tr>
										<td>
											<%@ include file="showFirstValue.jsp"%>
										</td>
									</tr>
									 -->
									 									<tr>
									<td style="height: 26px;">
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="button" name="viewBut" value=分&nbsp;&nbsp;析 onclick="importPaylist();" class="ui-state-default ui-corner-all">
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

