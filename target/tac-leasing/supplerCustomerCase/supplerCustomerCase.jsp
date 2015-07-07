<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<script>
		
		function doQuery() {
			$("#form").submit();
		}	
		
		//导出Excel
		function exportExcel(param1,param2,param3,param4) {
			window.parent.callBirt("birtReport/exportSupplerCustomerCase/supplerCustomerCase.rptdesign","xls",{"SUPL_NAME":encodeURI(param1),"CUST_NAME":encodeURI(param2),"CASE_TYPE":param3,"LEASE_CODE":param4});
		}
</script>
</head>
<body>
	<form id="form" method="post">
	<input type="hidden" name="__action" id="__action"
			value="supplerCustomerCaseBatchJobCommand.query">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="text-align:left;height: 30px">
			<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;供应商客户案况</span>
			</div>
		<div>
			<table width="97%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="60%" class="ss_t">
						<table style="margin-left:10px;">
							<tr>
								<td>&nbsp;&nbsp;&nbsp;供应商名称：</td>
								<td colspan="5"><input value="${SUPL_NAME }" id="SUPL_NAME" name="SUPL_NAME" style="width:140px;"></td>
								<td>&nbsp;&nbsp;&nbsp;客户名称：</td>
								<td colspan="5"><input value="${CUST_NAME }" id="CUST_NAME" name="CUST_NAME" style="width:140px;"></td>
								<td>&nbsp;&nbsp;&nbsp;合同号：</td>
								<td colspan="5"><input value="${LEASE_CODE }" id="LEASE_CODE" name="LEASE_CODE" style="width:140px;"></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;案况状态：</td>
								<td colspan="5">
									<select id="CASE_TYPE" name="CASE_TYPE" style="width:80px;">
											<option value="">--全部--</option>
										<c:forEach items="${caseTypeList}" var="item">
											<option value="${item.CODE }" <c:if test="${CASE_TYPE eq item.CODE }">selected="selected"</c:if>>
													${item.FLAG }
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
		</div>
		<br><br><br>
		<div class="ui-state-default ui-jqgrid-hdiv" style="text-align:left;background:#FFFFFF;">
		<input type="button" value="导出Excel" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="exportExcel('${SUPL_NAME }','${CUST_NAME }','${CASE_TYPE }','${LEASE_CODE }')">
		</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<%@ include file="/common/pageTagTop.jsp"%>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="0" cellpadding="0" border="0" style="width:1200px;">
					<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:20px;"><strong>序号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:120px;"><strong>供应商名称</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:120px;"><strong>客户名称</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:90px;"><strong>合同号/报告号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:90px;"><strong>拨款金额</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>承做期数</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>已交期数</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:90px;"><strong>逾期金额</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:40px;"><strong>案件进度</strong></td>
					</tr>
					<c:forEach items="${resultList}" var="item" varStatus="count">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${count.count }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.suplName }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.custName }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.leaseCode }<c:if test="${item.leaseCode == null}">${item.creditId }</c:if>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.payMoney }" type="currency" />&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.totalPeriod }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.payPeriod }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.dunMoney }" type="currency" />&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.caseType }&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
				<%@ include file="/common/pageTagBottom.jsp"%>
			</div>
	</form>
	<font color="red">*</font>截止昨天20:00之数据
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-44</p>
</body>
</html>