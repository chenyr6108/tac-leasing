<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css"
			href="${ctx }/common/css/tab.css" />
		<title>融资租赁合同修改</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		
	</head>
	<body>
		<form action="#"  method="post"  name="rentContractForm">
			<input type="hidden" name="RECT_ID" value="${RECT_ID }">
			<input type="hidden" name="CUST_TYPE" value="${rentContract.CUST_TYPE }">
			<input type="hidden" name="CUST_CODE" value="${rentContract.CUST_CODE }">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div class="ui-state-default ui-jqgrid-hdiv ">
			<table width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"
				align="center">
				<tbody>
					<tr>
						
						<td >
							<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   						<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;合同管理</span>
	   						</div>
							
						</td>
						
					</tr>
					<tr>
						<td colspan="3" >
							<table width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td>
										<c:choose>
											<c:when test="${rentContract.CUST_TYPE eq 0}">
												自然人尚未开放，敬请期待！哈哈
											</c:when>
											<c:when test="${rentContract.CUST_TYPE eq 1}">
												<%@ include
													file="/rentcontract/showRentContractCustCorp.jsp"%>
											</c:when>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include
											file="/rentcontract/showRentContractEquipment.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include file="/rentcontract/showRentContractSchema.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include file="/rentcontract/showRentContractSchemaIrr.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include file="/rentcontract/showRentContractInsure.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<%@ include
											file="/rentcontract/showRentContractOtherFee.jsp"%>
									</td>
								</tr>
								<tr>
									<td>
										<table width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td  class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>其它约定</strong>
												</td>
											</tr>
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr">
													 ${rentContract.OTHER_AGREEMENT} &nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td  class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>备注</strong>
												</td>
											</tr>
											<tr>
												<td>
													<table width="99%"  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
													<tr>
														<td width="30px;" align="center" class="ui-widget-content jqgrow ui-row-ltr">序号</td>
														<td width="70px;" align="center" class="ui-widget-content jqgrow ui-row-ltr">备注人</td>
														<td width="130px;" align="center" class="ui-widget-content jqgrow ui-row-ltr">备注时间</td>
														<td align="center" class="ui-widget-content jqgrow ui-row-ltr">备注信息</td>
													</tr>
													<c:forEach items="${remarkList}" var="item" varStatus="status">
														<tr>
															<td align="center" class="ui-widget-content jqgrow ui-row-ltr">${status.count } &nbsp; </td>
															<td align="center" class="ui-widget-content jqgrow ui-row-ltr">${item.NAME } &nbsp; </td>
															<td align="center" class="ui-widget-content jqgrow ui-row-ltr"> &nbsp; <fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
															<td class="ui-widget-content jqgrow ui-row-ltr">${item.REMARK } &nbsp; </td>
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
										<table width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td colspan="8"  class="ui-state-default ui-th-ltr zc_grid_head">
													<strong>签字盖章</strong>
												</td>
											</tr>
											<tr>
												<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
													出租人：
												</td>
												<td width="25%" class="ui-widget-content jqgrow ui-row-ltr">
													 ${ rentContract.LESSOR} 
												</td>
												<td width="17%"  class="ui-widget-content jqgrow ui-row-ltr">
													客户名称：
												</td>
												<td width="43%"  class="ui-widget-content jqgrow ui-row-ltr">
													 ${ rentContract.LESSEE} 
												</td>
											</tr>
											<tr>
												<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
													合同签订日：
												</td>
												<td width="25%"  class="ui-widget-content jqgrow ui-row-ltr">
													<fmt:formatDate value="${rentContract.LESSOR_TIME}" pattern="yyyy-MM-dd"/>
												</td>
												<td width="17%"  class="ui-widget-content jqgrow ui-row-ltr">
													&nbsp;
												</td>
												<td width="43%"  class="ui-widget-content jqgrow ui-row-ltr">
													&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
											<tr>
												<td colspan="8" align="center"  class="ui-widget-content jqgrow ui-row-ltr">
													<input type="button" name="backBut" onclick="javascript:history.go(-1)" value=返&nbsp;&nbsp;回 
														class="ui-state-default ui-corner-all">
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
</div>
</div>
		</form>
	</body>
</html>
<style type="text/css">
