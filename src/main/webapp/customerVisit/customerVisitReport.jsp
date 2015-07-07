<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>客户拜访计划外出时间</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="customerVisitReportCommand.query">
		<input type="hidden" name="id" id="id">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;客户拜访计划外出时间</span>
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
											<option value="${item.value }" 
												<c:choose><c:when test="${DATE == null }"><c:if test="${item.flag eq 'Y' }">selected="selected"</c:if></c:when>
														  <c:otherwise><c:if test="${item.value eq DATE }">selected="selected"</c:if></c:otherwise>
												</c:choose>>${item.descr }
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
			<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>序号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="deptId" pagingInfo="${pagingInfo }"><strong>办事处</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="name" pagingInfo="${pagingInfo }"><strong>业务员</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="ongoingCaseCount" pagingInfo="${pagingInfo }"><strong>进行中案件数</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="caseCount" pagingInfo="${pagingInfo }"><strong>案件数</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="casePayMoney" pagingInfo="${pagingInfo }"><strong></strong>净授信金额</page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="caseRateDiff" pagingInfo="${pagingInfo }"><strong>利差现值</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="totalTimeCode" pagingInfo="${pagingInfo }"><strong>总填报时间(小时)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="outsideTimeCode" pagingInfo="${pagingInfo }"><strong>外出时间(小时)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="descr" pagingInfo="${pagingInfo }">外出工时比率<br>(外出时间/(${DAY }*8))</page:pagingSort>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;">${item.deptName }&nbsp;</td>
						<td style="text-align: center;">${item.name }&nbsp;</td>
						<td style="text-align: right;">${item.ongoingCaseCount }&nbsp;</td>
						<td style="text-align: right;">${item.caseCount }&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value="${item.casePayMoney }" type="currency"/>&nbsp;</td>
						<td style="text-align: right;"><fmt:formatNumber value="${item.caseRateDiff }" type="currency"/>&nbsp;</td>
						<td style="text-align: right;">${item.totalTime/60 }&nbsp;</td>
						<td style="text-align: right;">${item.outsideTime/60 }&nbsp;</td>
						<td style="text-align: right;">${item.descr }&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
		</div>
	</form>
</body>