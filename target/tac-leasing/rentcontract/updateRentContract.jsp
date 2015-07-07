<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>融资租赁合同修改</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<script type="text/javascript" src="${ctx }/rentcontract/js/link.js"></script>
		<script type="text/javascript" src="${ctx }/rentcontract/js/createRentContract.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#LESSEE_TIME").datepicker($.datepicker.regional['zh-CN']);
				$("#LESSOR_TIME").datepicker($.datepicker.regional['zh-CN']);
				$("#LESSOR_TIME").bind('focus',function (){
					$("#ui-datepicker-div").css('top',parseInt($("#ui-datepicker-div").css('top'))-120);
				});
				$("#LESSEE_TIME").bind('focus',function (){
					$("#ui-datepicker-div").css('top',parseInt($("#ui-datepicker-div").css('top'))-120);
				});
				
			});
		</script>
	</head>
	<body>
		<form action="${ctx }/servlet/defaultDispatcher"  method="post" onsubmit="return submitForm();" name="rentContractForm">
			<input type="hidden" name="__action" value="rentContract.updateRentContract">
			<input type="hidden" name="RECT_ID" value="${RECT_ID }">
			<input type="hidden" name="CUST_TYPE" value="${rentContract.CUST_TYPE }">
			<input type="hidden" name="CUST_CODE" value="${rentContract.CUST_CODE }">
			<input type="hidden" id="H_CONTRACT_TYPE" name="H_CONTRACT_TYPE" value="${rentContract.RECT_TYPE }">
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
											<c:when test="${rentContract.CUST_TYPE eq 0}">	
												<%@ include file="/rentcontract/updateRentContractNatuCorp.jsp"%>												
											</c:when>
											<c:when test="${rentContract.CUST_TYPE eq 1}">
												<%@ include file="/rentcontract/updateRentContractCustCorp.jsp"%>
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
										<%@ include file="/rentcontract/createRentContractSchema.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include file="/rentcontract/createRentContractSchemaIrr.jsp"%>
									</td>
								</tr>
								<tr>
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
										<table width="982" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>其它约定</strong>
												</td>
											</tr>
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													<textarea rows="4" cols="100" name="OTHER_AGREEMENT"
														id="OTHER_AGREEMENT">${rentContract.OTHER_AGREEMENT}</textarea>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="982"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>备注</strong>
												</td>
											</tr>
											<tr>
												<td>
													<table width="982"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
													<tr>
														<td width="30px;" class="ui-state-default ui-th-ltr zc_grid_head">序号</td>
														<td width="70px;" class="ui-state-default ui-th-ltr zc_grid_head">备注人</td>
														<td width="130px;" class="ui-state-default ui-th-ltr zc_grid_head">备注时间</td>
														<td class="ui-state-default ui-th-ltr zc_grid_head">备注信息</td>
													</tr>
													<c:forEach items="${remarkList}" var="item" varStatus="status">
														<tr class="ui-widget-content jqgrow ui-row-ltr">
															<td align="center">${status.count }</td>
															<td align="center">${item.NAME }</td>
															<td align="center">&nbsp;<fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
															<td>${item.REMARK }&nbsp;</td>
														</tr>
													</c:forEach>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="982"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
											<tr>
												<td colspan="8" class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>签字盖章</strong>
												</td>
											</tr>
											<tr>
												<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
													出租人：
												</td>
												<td width="25%" class="ui-widget-content jqgrow ui-row-ltr">
													<input type="text" name="LESSOR" id="LESSOR" value="${ rentContract.LESSOR}">
												</td>
												<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
													客户：
												</td>
												<td width="25%" class="ui-widget-content jqgrow ui-row-ltr">
													<input type="text" name="LESSEE" id="LESSEE" value="${ rentContract.LESSEE}">
												</td>
											</tr>
											<tr>
												<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
													合同签订日：
												</td>
												<td width="25%" class="ui-widget-content jqgrow ui-row-ltr">
													<input type="text" name="LESSOR_TIME" id="LESSOR_TIME" value="<c:if test="${rentContract.LESSOR_TIME!='1900-01-01 00:00:00.0'}"><fmt:formatDate value="${rentContract.LESSOR_TIME}" pattern="yyyy-MM-dd"/></c:if>"
														readonly="readonly">
													</td>
												<td width="17%" class="ui-widget-content jqgrow ui-row-ltr">
													&nbsp;
												</td>
												<td width="43%" class="ui-widget-content jqgrow ui-row-ltr">
													<input type="hidden" name="LESSEE_TIME" id="LESSEE_TIME" value="<c:if test="${rentContract.LESSOR_TIME!='1900-01-01 00:00:00.0'}"><fmt:formatDate value="${ rentContract.LESSEE_TIME}" pattern="yyyy-MM-dd"/></c:if>"
														readonly="readonly">
													</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td colspan="8" align="center">
													<input type="submit" name="subBut" value=保&nbsp;&nbsp;存
														class="ui-state-default ui-corner-all">
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
