<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>未拨款案件进度异常查看详细</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<script type="text/javascript">
	function goBack() {
		window.location.href='../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCase';
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action" value="unnaturalCaseCommand.queryDynamicCaseDetail">
		<input type="hidden" name="DEPT_ID" value="${DEPT_ID }">
		<input type="hidden" name="DATE" value="${DATE }">
		<input type="hidden" name="flag" value="${flag }">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;未拨款案件进度异常查看详细</span>
		</div>
		<br>
		<input type="button" value="返回" class="ui-state-default ui-corner-all" onclick="goBack()" style="cursor: pointer;"/>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>序号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="creditRunCode" pagingInfo="${pagingInfo }"><strong>案件号</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="name" pagingInfo="${pagingInfo }"><strong>业务员</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务主管</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="createOn" pagingInfo="${pagingInfo }"><strong><c:if test="${flag eq 'a' or flag eq 'g'}">报告生成时间</c:if><c:if test="${flag eq 'b' }">访厂时间</c:if><c:if test="${flag eq 'c' }">初次提交风控时间</c:if><c:if test="${flag eq 'd' }">最终提交风控时间</c:if><c:if test="${flag eq 'e' }">审查核准时间</c:if><c:if test="${flag eq 'f' }">业管初审时间</c:if></strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="dayDiff" pagingInfo="${pagingInfo }"><strong>距今时间</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>类型</strong>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;">${item.deptName }&nbsp;</td>
						<td style="text-align: center;">${item.creditRunCode }&nbsp;</td>
						<td style="text-align: center;">${item.custName }&nbsp;</td>
						<td style="text-align: center;">${item.name }&nbsp;</td>
						<td style="text-align: center;">${item.upName }&nbsp;</td>
						<td style="text-align: center;">${item.createOn }&nbsp;</td>
						<td style="text-align: right;">${item.dayDiff }&nbsp;</td>
						<td style="text-align: center;"><c:if test="${flag eq 'a' }">未访厂,进件后超过5天</c:if><c:if test="${flag eq 'b' }">未提交风控,已访厂后超过5天</c:if><c:if test="${flag eq 'c' }">不通过附条件退回,初次提交风控后超过5天</c:if><c:if test="${flag eq 'd' }">审查未核准,最终提交风控后超过3天</c:if><c:if test="${flag eq 'e' }">业管未初审,审查核准后超过30天</c:if><c:if test="${flag eq 'f' }">未拨款,业管初审后超过5天</c:if><c:if test="${flag eq 'g' }">未拨款,进件后超过50天</c:if>&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
		</div>
	</form>
</body>