<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>融资租赁合同初审</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/rentcontract/js/link.js"></script>
		<script type="text/javascript" src="${ctx }/rentcontract/js/createRentContract.js"></script>
		<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#LESSEE_TIME").datepicker($.datepicker.regional['zh-CN']);
			$("#LESSOR_TIME").datepicker($.datepicker.regional['zh-CN']);
			$("#LESSEE_TIME").bind('focus',function (){
				//alert(parseInt($("#ui-datepicker-div").css('top')));
				$("#ui-datepicker-div").css('top',parseInt($("#ui-datepicker-div").css('top'))-120);
			});
			$("#LESSOR_TIME").bind('focus',function (){
				$("#ui-datepicker-div").css('top',parseInt($("#ui-datepicker-div").css('top'))-120);
			});
		});
		
			function dateClick(){
				$("input[id^='OTHER_DATE']").datepicker($.datepicker.regional['zh-CN']); 
				$("input[id^='START_DATE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[id^='END_DATE']").datepicker($.datepicker.regional['zh-CN']);
			}
			
		</script>
	</head>
	<body>
		<form action="${ctx }/servlet/defaultDispatcher" method="post" onsubmit="return submitForm();" name="rentContractForm" id="rentContractForm">
			<input type="hidden" name="__action"
				value="rentContract.createRentContract">
			<input type="hidden" name="PRCD_ID" value="${PRCD_ID }">
			<input type="hidden" name="CUST_ID" value="${cust.CUST_ID }">
			<input type="hidden" name="CUST_TYPE" value="${cust.CUST_TYPE }">
			<input type="hidden" name="CUST_CODE" value="${cust.CUST_CODE }">
			<input type="hidden" id="H_CONTRACT_TYPE" name="H_CONTRACT_TYPE" value="${cust.CONTRACT_TYPE }">
			<center>
			<table width="982">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
					   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;合同管理</span>
					   	</div>
					   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
							<table width="982" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td>
										<c:choose>
											<c:when test="${cust.CUST_TYPE eq 0}">
												<%@ include file="/rentcontract/createRentContractNatuCorp.jsp"%>
											</c:when>
											<c:when test="${cust.CUST_TYPE eq 1}">
												<%@ include file="/rentcontract/createRentContractCustCorp.jsp"%>
											</c:when>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include
											file="/rentcontract/createRentContractEquipment.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<%-- 2011/12/30 Yang Yun 合同初审时  融资租赁方案 信息不能修改 除了保险公司可以选择. 
										<%@ include file="/rentcontract/createRentContractSchema.jsp"%>
										--%>
										<%@ include file="/rentcontract/createRentContractSchemaShow.jsp"%>
										<%-- 2011/12/30 Yang Yun 合同初审时  融资租赁方案 信息不能修改 除了保险公司可以选择. --%>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include file="/rentcontract/createRentContractSchemaIrr.jsp"%>
									</td>
								</tr>
								<tr style="display: none;">
									<td>
										<%@ include file="/rentcontract/createRentContractInsure.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include
											file="/rentcontract/createRentContractOtherFee.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<table width="982"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td style="height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>&nbsp;&nbsp;其它约定</strong>
												</td>
											</tr>
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<textarea rows="4" cols="130" name="OTHER_AGREEMENT"
														id="OTHER_AGREEMENT"></textarea>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="982"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td style="height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>&nbsp;&nbsp;备注</strong>
												</td>
											</tr>
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<textarea rows="4" cols="130" name="REMARK" id="REMARK"></textarea>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="982"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
											<tr>
												<td colspan="8"  style="height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>&nbsp;&nbsp;签字盖章</strong>
												</td>
											</tr>
											<tr class="ui-widget-content jqgrow ui-row-ltr">
												<td width="15%">出租人：</td>
												<td width="25%"><input type="text" name="LESSOR" id="LESSOR" value="${decpname.DECP_NAME_CN }"></td>
												<td width="15%">客户名称：</td>
												<td width="25%"><input type="text" name="LESSEE" id="LESSEE" value="${cust.CUST_NAME }"></td>
											</tr>
											<tr class="ui-widget-content jqgrow ui-row-ltr">
												<td width="15%">合同签订日：</td>
												<td width="25%"><input type="text" name="LESSOR_TIME" id="LESSOR_TIME" readonly="readonly" value="<c:if test="${cust.LESSOR_TIME!='1900-01-01 00:00:00.0'}"><fmt:formatDate value="${cust.LESSOR_TIME}" pattern="yyyy-MM-dd"/></c:if>"></td>
												<td width="15%">&nbsp;</td>
												<td width="25%" class="ui-widget-content jqgrow ui-row-ltr"><input type="hidden" name="LESSEE_TIME" id="LESSEE_TIME" readonly="readonly"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td colspan="8" align="center" style="align:center">
													<input type="submit" name="subBut" value=保&nbsp;&nbsp;存 class="ui-state-default ui-corner-all">
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</center>			
		</form>
	</body>
</html>
