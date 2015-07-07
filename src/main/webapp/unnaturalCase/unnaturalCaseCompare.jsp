<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>已拨款案件进度异常</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	
	function showCharTable() {
		if($("#charTable").css("display")=='none') {
			$("#charTable").show(1000);
			$("#charButton").val("隐藏柱状图");
		} else {
			$("#charTable").hide(1000);
			$("#charButton").val("显示柱状图");
		}
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="unnaturalCaseCommand.queryCaseCompare">
		<input type="hidden" name="id" id="id">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;已拨款案件进度异常(截至<c:forEach var="item" items="${dateList}"><c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">${item.DATE }</c:if></c:when><c:otherwise><c:if test="${item.DATE eq DATE }">${item.DATE }</c:if></c:otherwise></c:choose></c:forEach>&nbsp;20:10:00)</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<table width="80%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td>
									时间：
									<select id="DATE" name="DATE">
										<c:forEach var="item" items="${dateList}">
											<option value="${item.DATE }" 
												<c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">selected="selected"</c:if></c:when>
														  <c:otherwise><c:if test="${item.DATE eq DATE }">selected="selected"</c:if></c:otherwise>
												</c:choose>>${item.DATE }
											</option>
										</c:forEach>
									</select>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									办事处：
									<select id="DEPT_ID" name="DEPT_ID">
											<option value="">--所有办事处--</option>
										<c:forEach var="item" items="${deptList}">
											<option value="${item.DEPT_ID }" <c:if test="${item.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
												${item.DEPT_NAME }
											</option>
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
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<br>
			<input style="cursor: pointer;" type="button" class="ui-state-default ui-corner-all" value="显示柱状图" onclick="showCharTable()" id="charButton">
			<span id="charTable" style="display: none;">
				<br>
				<chart:chartTag chartResult="${chartResult }"/>
			</span>
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
						<page:pagingSort orderBy="a_B" pagingInfo="${pagingInfo }"><strong>进件~访厂(&gt;5)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="b_C" pagingInfo="${pagingInfo }"><strong>访厂~初次风控(&gt;5) </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="c_D" pagingInfo="${pagingInfo }"><strong>初次风控~最终风控(&gt;5) </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="d_E" pagingInfo="${pagingInfo }"><strong>最终风控~审查核准(&gt;3) </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="e_F" pagingInfo="${pagingInfo }"><strong>审查核准~业管初审(&gt;30)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="f_G" pagingInfo="${pagingInfo }"><strong>业管初审~拨款(&gt;5)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="a_G" pagingInfo="${pagingInfo }"><strong>进件~拨款(&gt;50) </strong></page:pagingSort>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;">${item.deptName }&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=caseCompareDayCommand.query&isUnnatural=Y&DEPT_ID=${item.deptId }&DATE=${DATE}&F-G=5">${item.a_B }</a>&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=caseCompareDayCommand.query&isUnnatural=Y&DEPT_ID=${item.deptId }&DATE=${DATE}&E-F=5">${item.b_C }</a>&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=caseCompareDayCommand.query&isUnnatural=Y&DEPT_ID=${item.deptId }&DATE=${DATE}&D-E=5">${item.c_D }</a>&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=caseCompareDayCommand.query&isUnnatural=Y&DEPT_ID=${item.deptId }&DATE=${DATE}&C-D=3">${item.d_E }</a>&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=caseCompareDayCommand.query&isUnnatural=Y&DEPT_ID=${item.deptId }&DATE=${DATE}&B-C=30">${item.e_F }</a>&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=caseCompareDayCommand.query&isUnnatural=Y&DEPT_ID=${item.deptId }&DATE=${DATE}&A-B=5">${item.f_G }</a>&nbsp;</td>
						<td style="text-align: right;"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=caseCompareDayCommand.query&isUnnatural=Y&DEPT_ID=${item.deptId }&DATE=${DATE}&A-G=50">${item.a_G }</a>&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
		</div>
	</form>
</body>