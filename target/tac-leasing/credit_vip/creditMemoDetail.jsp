<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>案件备注</title>

<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;案件备注</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
<br/>
<div class="ui-state-default ui-jqgrid-hdiv ">
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th class="ui-state-default ui-th-ltr zc_grid_head">编号</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">备注时间</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">备注人</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">备注</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultList}" var="d" varStatus="index">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td>${index.count }&nbsp;</td>
			<td>${d.create_date_str }&nbsp;</td>
			<td>${d.create_by }&nbsp;</td>
			<td>${d.content }&nbsp;</td>
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