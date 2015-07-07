<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<script>
		
		$(function () {
			$("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#END_DATE").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function doQuery() {
			$("#form").submit();
		}	
		
		function exportExcel(param1,param2,param3,param4,param5,param6,param7) {
			window.parent.callBirt("birtReport/custCase/custCaseTotal.rptdesign","xls",{"USER_NAME":encodeURI(param1),"DEPT_ID":param2,"CUST_NAME":encodeURI(param3),"CASE_TYPE":param4,"DATE_TYPE":param5,"START_DATE":param6,"END_DATE":param7});
		}
</script>
</head>
<body style="text-align:center;">
	<form id="form" method="post">
	<input type="hidden" name="__action" id="__action"
			value="customerCaseBatchJobCommand.query">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="text-align:left;height: 30px">
			<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;客户案况表</span>
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
								<td>经办：</td>
								<td colspan="5"><input value="${USER_NAME }" id="USER_NAME" name="USER_NAME" style="width:80px;"></td>
								<td>&nbsp;&nbsp;&nbsp;办事处：</td>
								<td colspan="5">
									<select id="DEPT_ID" name="DEPT_ID" style="width:100px;">
											<option value="">--全部--</option>
										<c:forEach items="${deptList}" var="item">
											<option value="${item.deptId }" <c:if test="${DEPT_ID eq item.deptId }">selected="selected"</c:if>>
													${item.deptName }
											</option>
										</c:forEach>
									</select>
								</td>
								<td>&nbsp;&nbsp;&nbsp;客户名称：</td>
								<td colspan="5"><input value="${CUST_NAME }" id="CUST_NAME" name="CUST_NAME" style="width:120px;"></td>
							</tr>
							<tr>
								<td>案况状况：</td>
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
								<td>&nbsp;&nbsp;&nbsp;查询条件：</td>
								<td colspan="5">
									<select id="DATE_TYPE" name="DATE_TYPE" style="width:100px;">
											<option value="">--请选择--</option>
											<option value="1" <c:if test="${DATE_TYPE eq '1' }">selected="selected"</c:if>>预计拨款日</option>
											<option value="2" <c:if test="${DATE_TYPE eq '2' }">selected="selected"</c:if>>实际拨款日</option>
											<option value="3" <c:if test="${DATE_TYPE eq '3' }">selected="selected"</c:if>>预计起租日</option>
									</select>
								</td>
								<td>&nbsp;&nbsp;&nbsp;开始日期：</td>
								<td colspan="5"><input id="START_DATE" name="START_DATE" value="${START_DATE }" readonly="readonly" style="width:120px;"></td>
								<td>结束日期：</td>
								<td colspan="5"><input id="END_DATE" name="END_DATE" value="${END_DATE }" readonly="readonly" style="width:120px;"></td>
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
		<input type="button" value="导出Excel" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="exportExcel('${USER_NAME}','${DEPT_ID }','${CUST_NAME }','${CASE_TYPE }','${DATE_TYPE }','${START_DATE }','${END_DATE }')">
		</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<%@ include file="/common/pageTagTop.jsp"%>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="0" cellpadding="0" border="0" style="width:2300px;">
					<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:20px;"><strong>序号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:70px;"><strong>办事处</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>客户编号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:160px;"><strong>客户名称</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:160px;"><strong>介绍人</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:160px;"><strong>供应商</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>租赁方式</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:120px;"><strong>租赁物概要</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>案况状态</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:60px;"><strong>经办</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>核准额度</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>访厂日</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>送件日</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>核准日</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>预计拨款日</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>实际拨款日</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>起租额度</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>预计起租日</strong></td>
					</tr>
					<c:forEach items="${resultList}" var="item" varStatus="count">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${count.count }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.deptName }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.custCode }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.custName }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.introducer }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.suplName }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.leaseType }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.equName }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.caseType }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.userName }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.confirmMoney }" type="currency" />&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><fmt:formatDate  pattern="yyyy-MM-dd" value="${item.visitDate }"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><fmt:formatDate  pattern="yyyy-MM-dd" value="${item.giveDate }"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><fmt:formatDate  pattern="yyyy-MM-dd" value="${item.confirmDate }"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><fmt:formatDate  pattern="yyyy-MM-dd" value="${item.expectedDate }"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><fmt:formatDate  pattern="yyyy-MM-dd" value="${item.payDate }"/>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.payMoney }" type="currency" />&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><fmt:formatDate  pattern="yyyy-MM-dd" value="${item.startDate }"/>&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
				<%@ include file="/common/pageTagBottom.jsp"%>
			</div>
	</form>
</body>
</html>