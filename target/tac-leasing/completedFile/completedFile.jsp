<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>可结清明细表</title>

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
			value="completedFileControl.getCompletedFileList">
		<input type="hidden" name="id" id="id">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;可结清明细表(截至<c:forEach var="logdate" items="${dateList}" varStatus="status"><c:choose><c:when test="${DATE==null}"><c:if test="${status.index==0}">${logdate.LOGDATE}</c:if></c:when><c:otherwise><c:if test="${logdate.LOGDATE eq DATE }">${DATE }</c:if></c:otherwise> </c:choose></c:forEach>&nbsp;14:30:00)</span>
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
								<td colspan="5">
									查找内容：
									<input id="CONTENT" name="CONTENT" value="${CONTENT}" style="width: 200px;">
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：
									<select id="DATE" name="DATE">
										<c:forEach items="${dateList}" var="logdate">
											<option value="${logdate.LOGDATE }" 
												<c:choose>
													<c:when test="${DATE == null }"><c:if test="${logdate.FILETYPE eq '1' }">selected="selected"</c:if></c:when>
												    <c:otherwise><c:if test="${logdate.LOGDATE eq DATE }">selected="selected"</c:if></c:otherwise>
												</c:choose>>
												${logdate.LOGDATE}
											</option>
										</c:forEach>
									</select>
								</td>
								 <td>
									办事处：
									<select id="DEPT_ID" name="DEPT_ID">
											<option value="">--所有办事处--</option>
										<c:forEach var="office" items="${officeList}">
											<option value="${office.DEPT_ID }" <c:if test="${office.DEPT_ID eq DEPT_ID }">selected="selected"</c:if>>
												${office.DEPT_NAME }
											</option>
										</c:forEach>
									</select>
								</td> 
								<td>
									距今天数：
									<select id="DIFF" name="DIFF">
											<option value="0" <c:if test="${DIFF eq 0 }">selected="selected"</c:if>>90天以下</option>
											<option value="1" <c:if test="${DIFF eq 1 }">selected="selected"</c:if>>90天以上</option>
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
			<page:pagingToolbarTop pagingInfo="${dw }"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>序号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					<strong>合同号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					<strong>客户名称 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务经办 </strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="DUN_PRICE" pagingInfo="${dw }"><strong>未缴罚息 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					
					<page:pagingSort orderBy="DEBT" pagingInfo="${dw }"><strong>未缴期满购买金 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="OPPOSING_DATE" pagingInfo="${dw }"><strong>最后一期来款时间	 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="TOTALLAWYFEE" pagingInfo="${dw }"><strong>法务费用 </strong></page:pagingSort>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
					<page:pagingSort orderBy="DIFF_DAY" pagingInfo="${dw }"><strong>距今天数 </strong></page:pagingSort>
					</th>
				</tr>
				<c:forEach items="${dw.resultList}" var="completed" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${index.count }&nbsp;</td>
						<td style="text-align: center;">${completed.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;">${completed.CUST_NAME}&nbsp;</td>
						<td style="text-align: center;">${completed.DECP_NAME_CN}&nbsp;</td>
						<td style="text-align: center;">${completed.USER_NAME}&nbsp;</td>
						<td style="text-align: center;">${completed.DUN_PRICE}&nbsp;</td>
						<td style="text-align: center;">${completed.DEBT}&nbsp;</td>
						<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${completed.OPPOSING_DATE}" />&nbsp;</td>
						<td style="text-align: center;">${completed.TOTALLAWYFEE}&nbsp;</td>
						<td style="text-align: center;">${completed.DIFF_DAY}&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${dw }"/>
			</div>
		</div>
	</form>
</body>