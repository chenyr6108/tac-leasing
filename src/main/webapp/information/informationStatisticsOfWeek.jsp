<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>资讯需求单周报表</title>
</head>
<body>
  		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px;width:700px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;资讯需求单周报表</span>
		</div>
		<br><br><br>
		<div class="ui-state-default ui-jqgrid-hdiv"
				style="background: white;width:700px">
				<table cellspacing="0" cellpadding="0" border="0" class="grid_table" style="width:700px">
					<tr class="ui-state-default zc_grid_head">
						<th><strong>统计日期</strong></th>
						<th><strong>累计总数</strong></th>
						<th><strong>已完成</strong></th>
						<th><strong>未完成</strong></th>
						<th><strong>总完成比例</strong></th>
						<th><strong>本期新增</strong></th>
						<th><strong>本期完成</strong></th>
						<th><strong>本期完成比</strong></th>
					</tr>

					<c:forEach items="${DataList}" var="item" varStatus="status">
						<tr>
							<td style="text-align: center;">${item.backDate}</td>
							<td style="text-align: right;">${item.total }</td>
							<td style="text-align: right;">${item.totalOfFinish }</td>
							<td style="text-align: right;">${item.totalOfUnFinish }</td>
							<td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.totalOfScale}"/>%</td>
							<td style="text-align: right;">${item.addNumOfWeek }</td>
							<td style="text-align: right;">${item.addNumOfWeek_fis }</td>
							<td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.weekOfScale}"/>%</td>
						</tr>
					</c:forEach>

				</table>
			</div>
             <br><br><br>
			<div>
			  <span style="color:red">*</span>&nbsp;${backDate }&nbsp;23:00:00之数据<br>
			  <span style="color:red">*</span>&nbsp;每周五23点统计一次<br>
			  <span style="color:red">*</span>&nbsp;已完成包括(不同意、已撤案、验收通过)
			</div>
			<p align="right" style="font-weight:bolder;">编号：IT-RPT-36</p>
</body>
</html>