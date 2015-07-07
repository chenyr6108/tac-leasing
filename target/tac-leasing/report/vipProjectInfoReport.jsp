<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>绿色通道案件分析</title>
		<script type="text/javascript">
		</script>
	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			年月：<input type="text" name="date" value="${date }"/>(格式：年-月, 例：2012-12)
			<input type="submit" value="搜索" />
			<input type="hidden" name="__action" value="vipReportCommand.getReport">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;案件分析(绿色通道)</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
			<div style="overflow-y:scroll;">
				<table class="grid_table">
	  				<tr>
	  					<th rowspan="2" style="width: 8%;">月份</th>
	  					<th colspan="4">进件统计</th>
	  					<th colspan="2">访厂分析</th>
	  					<th colspan="4">审查统计</th>
	  					<th colspan="4">拨款分析</th>
	  					<th colspan="4">逾期分析</th>
	  				</tr>
	  				<tr>
	  					<th style="width: 3%;">进件件数</th>
	  					<th style="width: 3%;">送审件数</th>
	  					<th style="width: 3%;">自行撤销件数</th>
	  					<th style="width: 10%;">核准总额</th>
	  					<th style="width: 3%;">访厂件数</th>
	  					<th style="width: 5%;">访厂比率</th>
	  					<th style="width: 3%;">无条件通过件数</th>
	  					<th style="width: 5%;">无条件通过比</th>
	  					<th style="width: 3%;">不通过件数</th>
	  					<th style="width: 5%;">不通过比</th>
	  					<th style="width: 3%;">已核准未拨款件数</th>
	  					<th style="width: 10%;">已核准未拨款金额</th>
	  					<th style="width: 3%;">拨款件数</th>
	  					<th style="width: 10%;">拨款金额</th>
	  					<th style="width: 3%;">件数</th>
	  					<th style="width: 10%;">金额</th>
	  					<th style="width: 5%;">件数比</th>
	  					<th style="width: 5%;">金额比</th>
	  				</tr>
	  			</table>
			</div>
	  		<div style="height: 72%; background-color: #FFFFFF; position: relative;overflow-x: auto;overflow-y:scroll;">
	  			<table class="grid_table">
	  				<c:if test="${empty resultList }">
	  					<tr>
	  						<td colspan="19"><font color="red" style="font-weight: bold;">无数据!</font></td>
	  					</tr>
	  				</c:if>
	  				<c:forEach items="${resultList }" var="r">
	  					<tr>
	  						<td style="width: 8%;">${r.CREATE_DATE }&nbsp;</td>
	  						<td style="width: 3%;">${r.CREATE_COUNT }&nbsp;</td>
	  						<td style="width: 3%;">${r.COMMIT_COUNT }&nbsp;</td>
	  						<td style="width: 3%;">${r.CANCEL_COUNT }&nbsp;</td>
	  						<td style="width: 10%;"><fmt:formatNumber value="${r.RISK_MONEY }" type="currency" />&nbsp;</td>
	  						<td style="width: 3%;">${r.VISIT_COUNT }&nbsp;</td>
	  						<td style="width: 5%;"><fmt:formatNumber value="${r.VISIT_PERCENT }" type="percent" />&nbsp;</td>
	  						<td style="width: 3%;">${r.APP_COUNT }&nbsp;</td>
	  						<td style="width: 5%;"><fmt:formatNumber value="${r.APP_PERCENT }" type="percent" />&nbsp;</td>
	  						<td style="width: 3%;">${r.REJECT_COUNT }&nbsp;</td>
	  						<td style="width: 5%;"><fmt:formatNumber value="${r.REJECT_PERCENT }" type="percent" />&nbsp;</td>
	  						<td style="width: 3%;">${r.APP_UNPAY_COUNT }&nbsp;</td>
	  						<td style="width: 10%;"><fmt:formatNumber value="${r.APP_UNPAY_MONEY }" type="currency" />&nbsp;</td>
	  						<td style="width: 3%;">${r.PAY_COUNT }&nbsp;</td>
	  						<td style="width: 10%;"><fmt:formatNumber value="${r.PAY_MONEY }" type="currency" />&nbsp;</td>
	  						<td style="width: 3%;">${r.DUN_COUNT }&nbsp;</td>
	  						<td style="width: 10%;"><fmt:formatNumber value="${r.DUN_MONEY }" type="currency" />&nbsp;</td>
	  						<td style="width: 5%;"><fmt:formatNumber value="${r.DUN_COUNT_PERCENT }" type="percent" />&nbsp;</td>
	  						<td style="width: 5%;"><fmt:formatNumber value="${r.DUN_MONEY_PERCENT }" type="percent" />&nbsp;</td>
		  				</tr>
	  				</c:forEach>
	  			</table>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
