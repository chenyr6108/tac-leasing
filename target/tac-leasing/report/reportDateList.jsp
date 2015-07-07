<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
</head>
<body>
<form id="form" name="form" action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action" value="achievementCaseCommand.getAchievementCaseReport">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 400px;">
			<div class="zc_grid_body jqgrowleft" style="width: 400px;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width:395px;">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;报表日期</span>
		   	</div>
				<table class="grid_table" style="width:400px;">
					<tr class="ui-state-default zc_grid_head">
						<th style="text-align: center;">年</th>
						<th style="text-align: center;">月</th>
						<th style="text-align: center;">开始时间</th>
						<th style="text-align: center;">结束时间</th>
					</tr>
					<c:forEach items="${list}" var="item">
					<tr class="ui-state-default zc_grid_head">
						<td style="text-align: center;">${item.year }</td>
						<td style="text-align: center;">${item.month }</td>
						<td style="text-align: center;">${item.beginTime }</td>
						<td style="text-align: center;">${item.endTime }</td>
					</tr>
					</c:forEach>
				</table>
		<span id="clock"></span>
		</div>
		</form>
		<br>
</body>
</html>