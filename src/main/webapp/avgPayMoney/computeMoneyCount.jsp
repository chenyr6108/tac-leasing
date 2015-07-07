<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<script type="text/javascript">
		$(function () {
			$("#FROM_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#TO_DATE").datepicker($.datepicker.regional['zh-CN']);
		});
		function doQuery() {
			$("#form1").submit();
		}
		
		function exportExcel() {
			window.parent.callBirt("birtReport/computeMoney.rptdesign","xls",{"startDate":$("#FROM_DATE").val(),"endDate":$("#TO_DATE").val(),"companyCode":$("#companyCode").val()});
		}
	</script>
</head>
<body>
<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
	<input type="hidden" name="__action" id="__action" value="avgPayMoneyReportCommand.queryComputeMoneyCount">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height:30px;width: 800px">
		<span class="ui-jqgrid-title" style="line-height:30px;font-size:15px;">&nbsp;&nbsp;预估来款金额与件数</span>
	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width: 800px">
	<input type="button" value="导出excel" class="panel_button" onclick="exportExcel()">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
				<td width="8">&nbsp;</td>
				<td width="60" class="ss_o"></td>
				<td width="40%" class="ss_t">
					<table style="margin-left: 10px;">
						<tr>
							<td colspan="5">&nbsp;预估来款开始时间：<input id="FROM_DATE" name="FROM_DATE" value="${FROM_DATE }" readonly="readonly" style="width: 80px;">&nbsp;
							预估来款结束时间：<input id="TO_DATE" name="TO_DATE" value="${TO_DATE }" readonly="readonly" style="width: 80px;">&nbsp;
							</td>
							<td>
							公司别：
							<select name="companyCode" id="companyCode">
								<option value="">全部</option>
								<c:forEach items="${companys}" var="item">
									<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
								</c:forEach>
							</select>			          
							</td>
						</tr>
					</table></td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a>
				</td>
			</tr>
		</table>
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;width: 800px">

			<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
				<tr>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:30px">序号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">来款日期</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">来款金额</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">来款件数</th>
				</tr>
			<c:forEach items="${list}" var="item" varStatus="index">
			<c:set var="TOTAL_MONEY" value="${item.MONEY+TOTAL_MONEY }"></c:set>
			<c:set var="TOTAL_COUNT" value="${item.COUNT+TOTAL_COUNT }"></c:set>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${index.count }</td>
					<td style="text-align: center;">${item.PAY_DATE }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber value="${item.MONEY }" pattern="#,##0.00"/>&nbsp;</td>
					<td style="text-align: right;">${item.COUNT }&nbsp;</td>
				</tr>
			</c:forEach>
				<tr>
					<td style="text-align: center;" colspan="2">总计</td>
					<td style="text-align: right;"><fmt:formatNumber value="${TOTAL_MONEY }" pattern="#,##0.00"/></td>
					<td style="text-align: right;">${TOTAL_COUNT }</td>
				</tr>
			</table>
		</div>
	</div>
</form>
</body>