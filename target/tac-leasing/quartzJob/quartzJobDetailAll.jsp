<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>Quartz Job 管理</title>

<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name=" form1" id="form1" action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" id="__action" name="__action" value="${__action }" />

<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;Quartz Job 明细</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
<br/>
<div class="ui-state-default ui-jqgrid-hdiv ">
<table class="grid_table">
	<thead>
	<tr>
		<th>编号</th>
		<th>执行时间</th>
		<th>执行结果</th>
		<th>错误代码</th>
		<th>说明</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${detail}" var="d" varStatus="index">
		<tr>
			<td>${index.count }</td>
			<td><fmt:formatDate value="${d.fireTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
			<td>${d.fireStatus }</td>
			<td>${d.errorCodeStr }</td>
			<td>${d.remark }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
</div>
</form>
</body>
</html>