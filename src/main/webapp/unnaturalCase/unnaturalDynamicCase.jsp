<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>未拨款案件进度异常</title>

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
			value="unnaturalCaseCommand.queryDynamicCase">
		<input type="hidden" name="id" id="id">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;未拨款案件进度异常(截至<c:forEach var="item" items="${dateList}"><c:choose><c:when test="${DATE == null }"><c:if test="${item.FLAG eq 'Y' }">${item.DATE }</c:if></c:when><c:otherwise><c:if test="${item.DATE eq DATE }">${item.DATE }</c:if></c:otherwise></c:choose></c:forEach>&nbsp;01:00:00)</span>
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
						<page:pagingSort orderBy="a" pagingInfo="${pagingInfo }"><strong>进件~未访厂(&gt;5)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="b" pagingInfo="${pagingInfo }"><strong>访厂~未提交初次风控(&gt;5) </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="c" pagingInfo="${pagingInfo }"><strong>初次风控~最终风控(&gt;5) </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="d" pagingInfo="${pagingInfo }"><strong>最终风控~审查未核准(&gt;3) </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="e" pagingInfo="${pagingInfo }"><strong>审查核准~业管未初审(&gt;30)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="f" pagingInfo="${pagingInfo }"><strong>业管初审~未拨款(&gt;5)</strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<page:pagingSort orderBy="g" pagingInfo="${pagingInfo }"><strong>进件~未拨款(&gt;50) </strong></page:pagingSort>
					</th>
				</tr>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="index">
				<c:set var="aTotal" value="${item.a+aTotal }"/>
				<c:set var="bTotal" value="${item.b+bTotal }"/>
				<c:set var="cTotal" value="${item.c+cTotal }"/>
				<c:set var="dTotal" value="${item.d+dTotal }"/>
				<c:set var="eTotal" value="${item.e+eTotal }"/>
				<c:set var="fTotal" value="${item.f+fTotal }"/>
				<c:set var="gTotal" value="${item.g+gTotal }"/>
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;">${item.deptName }&nbsp;</td>
						<td style="text-align: right;"><c:if test="${item.a !=0 }"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCaseDetail&DEPT_ID=${item.deptId }&flag=a&DATE=${item.createOn }&DEPT_ID=${item.deptId }">${item.a }</a></c:if><c:if test="${item.a ==0 }">0</c:if>&nbsp;</td>
						<td style="text-align: right;"><c:if test="${item.b !=0 }"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCaseDetail&DEPT_ID=${item.deptId }&flag=b&DATE=${item.createOn }&DEPT_ID=${item.deptId }">${item.b }</a></c:if><c:if test="${item.b ==0 }">0</c:if>&nbsp;</td>
						<td style="text-align: right;"><c:if test="${item.c !=0 }"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCaseDetail&DEPT_ID=${item.deptId }&flag=c&DATE=${item.createOn }&DEPT_ID=${item.deptId }">${item.c }</a></c:if><c:if test="${item.c ==0 }">0</c:if>&nbsp;</td>
						<td style="text-align: right;"><c:if test="${item.d !=0 }"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCaseDetail&DEPT_ID=${item.deptId }&flag=d&DATE=${item.createOn }&DEPT_ID=${item.deptId }">${item.d }</a></c:if><c:if test="${item.d ==0 }">0</c:if>&nbsp;</td>
						<td style="text-align: right;"><c:if test="${item.e !=0 }"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCaseDetail&DEPT_ID=${item.deptId }&flag=e&DATE=${item.createOn }&DEPT_ID=${item.deptId }">${item.e }</a></c:if><c:if test="${item.e ==0 }">0</c:if>&nbsp;</td>
						<td style="text-align: right;"><c:if test="${item.f !=0 }"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCaseDetail&DEPT_ID=${item.deptId }&flag=f&DATE=${item.createOn }&DEPT_ID=${item.deptId }">${item.f }</a></c:if><c:if test="${item.f ==0 }">0</c:if>&nbsp;</td>
						<td style="text-align: right;"><c:if test="${item.g !=0 }"><a title="点击查看详细" style="cursor: pointer;" href="../servlet/defaultDispatcher?__action=unnaturalCaseCommand.queryDynamicCaseDetail&DEPT_ID=${item.deptId }&flag=g&DATE=${item.createOn }&DEPT_ID=${item.deptId }">${item.g }</a></c:if><c:if test="${item.g ==0 }">0</c:if>&nbsp;</td>
					</tr>
				</c:forEach>
					<tr class="ui-state-default ui-th-ltr zc_grid_head">
						<td colspan="2" align="center">合计</td>
						<td align="right">${aTotal }&nbsp;&nbsp;</td>
						<td align="right">${bTotal }&nbsp;&nbsp;</td>
						<td align="right">${cTotal }&nbsp;&nbsp;</td>
						<td align="right">${dTotal }&nbsp;&nbsp;</td>
						<td align="right">${eTotal }&nbsp;&nbsp;</td>
						<td align="right">${fTotal }&nbsp;&nbsp;</td>
						<td align="right">${gTotal }&nbsp;&nbsp;</td>
					</tr>
			</table>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
		</div>
	</form>
</body>