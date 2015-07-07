<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>
			function doQuery() {
				$("#form").submit();
			}
			
			function showDetail(id,name,year) {
				$("#__action").val("achievementReportCommand.showDetail");
				$("#SELECT_DEPT").val(id);
				$("#SELECT_NAME").val(name);
				$("#SELECT_YEAR").val(year);
				$("#form").submit();
			}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="achievementReportCommand.query">
		<input type="hidden" name="SELECT_DEPT" id="SELECT_DEPT"
			value="">
		<input type="hidden" name="SELECT_NAME" id="SELECT_NAME"
			value="">
		<input type="hidden" name="SELECT_YEAR" id="SELECT_YEAR"
			value="">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;各区业绩表(单位:K)</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="background: white">
		<table width="80%" border="0" cellspacing="0" cellpadding="0"
			bgcolor="#ffffff">
			<tr>
				<td width="8">&nbsp;</td>
				<td width="60" class="ss_o"></td>
				<td width="40%" class="ss_t">
					<table style="margin-left: 10px;">
						<tr>
							<td colspan="5">&nbsp;年份： <select id="YEAR" name="YEAR"
								style="width: 70px">
									<c:forEach items="${yearList}" var="year" varStatus="status">
										<option value="${year}"
											<c:if test="${year eq YEAR}">selected='selected'</c:if>>${year}</option>
									</c:forEach>
							</select> &nbsp;月份： <select id="MONTH" name="MONTH" style="width:70px">
									<option value="">--所有--</option>
									<c:forEach items="${monthList}" var="month" varStatus="status">
										<option value="${month}"
											<c:if test="${month eq MONTH}">selected='selected'</c:if>>${month}</option>
									</c:forEach>
							</select> &nbsp;办事处： <select id="DEPT" name="DEPT" style="width:120px">
									<option value="">--所有办事处--</option>
									<c:forEach items="${companyList}" var="company"
										varStatus="status">
										<option value="${company.DECP_ID}"
											<c:if test="${company.DECP_ID eq DEPT}">selected='selected'</c:if>>${company.DECP_NAME_CN}</option>
									</c:forEach>
							</select></td>
						</tr>
					</table></td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a>
				</td>
			</tr>
		</table>
		<br><br><br>
		<div class="ui-state-default ui-jqgrid-hdiv" style="background: white">
		<table cellspacing="0" cellpadding="0" border="0" <c:choose><c:when test="${MONTH eq null or MONTH eq ''}">style="width:2000px;"</c:when>
				<c:otherwise>style="width:600px;"</c:otherwise></c:choose>>
			<c:if test="${empty MONTH}">
			<tr>
				<th style="width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>地区</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-1月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-1月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-2月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-2月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-3月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-3月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-4月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-4月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-5月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-5月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-6月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-6月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-7月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-7月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-8月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-8月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-9月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-9月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-10月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-10月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-11月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-11月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-12月<br>目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-12月<br>实际达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>总目标</strong></th>
						<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>总达成</strong></th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>达成率</strong></th>
			</tr>
			<tr>
						<td style="text-align: center;" colspan="3">
							<table cellspacing="0" cellpadding="0" border="0" style="width:250px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 1}">
									<c:set var="ACHIEVEMENT1" value="${ACHIEVEMENT1+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY1" value="${PAY1+item.PAY_MONEY }"></c:set>
										<tr>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:100px;font-weight:normal;background-color:#8080C0;"><a href="#" onclick="showDetail(${item.DECP_ID},'${item.DECP_NAME_CN}',${YEAR})">${item.DECP_NAME_CN }</a></td>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 2}">
									<c:set var="ACHIEVEMENT2" value="${ACHIEVEMENT2+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY2" value="${PAY2+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 3}">
									<c:set var="ACHIEVEMENT3" value="${ACHIEVEMENT3+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY3" value="${PAY3+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 4}">
									<c:set var="ACHIEVEMENT4" value="${ACHIEVEMENT4+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY4" value="${PAY4+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 5}">
									<c:set var="ACHIEVEMENT5" value="${ACHIEVEMENT5+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY5" value="${PAY5+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 6}">
									<c:set var="ACHIEVEMENT6" value="${ACHIEVEMENT6+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY6" value="${PAY6+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 7}">
									<c:set var="ACHIEVEMENT7" value="${ACHIEVEMENT7+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY7" value="${PAY7+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 8}">
									<c:set var="ACHIEVEMENT8" value="${ACHIEVEMENT8+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY8" value="${PAY8+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 9}">
									<c:set var="ACHIEVEMENT9" value="${ACHIEVEMENT9+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY9" value="${PAY9+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 10}">
									<c:set var="ACHIEVEMENT10" value="${ACHIEVEMENT10+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY10" value="${PAY10+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 11}">
									<c:set var="ACHIEVEMENT11" value="${ACHIEVEMENT11+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY11" value="${PAY11+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;" colspan="2">
							<table cellspacing="0" cellpadding="0" border="0" style="width:150px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 12}">
									<c:set var="ACHIEVEMENT12" value="${ACHIEVEMENT12+item.GOAL_MONEY }"></c:set>
									<c:set var="PAY12" value="${PAY12+item.PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;">
							<table cellspacing="0" cellpadding="0" border="0" style="width:80px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 1}">
									<c:set var="TOTAL_TARGET_SUM" value="${TOTAL_TARGET_SUM+item.TOTAL_GOAL_MONEY }"></c:set>
									<c:set var="TOTAL_ACHIEVEMENT_SUM" value="${TOTAL_ACHIEVEMENT_SUM+item.TOTAL_PAY_MONEY }"></c:set>
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.TOTAL_GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;">
							<table cellspacing="0" cellpadding="0" border="0" style="width:80px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 1}">
										<tr>
											<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.TOTAL_PAY_MONEY }" type="currency" pattern="#,##0"/>&nbsp;</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
						<td style="text-align: center;">
							<table cellspacing="0" cellpadding="0" border="0" style="width:80px;">
								<c:forEach items="${resultList}" var="item">
									<c:if test="${item.MONTH == 1}">
										<tr>
											<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr">
												<c:choose>
													<c:when test="${not empty item.TOTAL_GOAL_MONEY && item.TOTAL_GOAL_MONEY > 0 }">
														<fmt:formatNumber value="${item.TOTAL_PAY_MONEY/item.TOTAL_GOAL_MONEY*100 }" type="currency" pattern="0.00"/>
													</c:when>
													<c:otherwise>0.00</c:otherwise>
												</c:choose>%
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
					</tr>
						<tr>
								<th style="width:100px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>总计</strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT1 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY1 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT2 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY2 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT3 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY3 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT4 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY4 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT5 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY5 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT6 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY6 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT7 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY7 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT8 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY8 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT9 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY9 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT10 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY10 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT11 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY11 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${ACHIEVEMENT12 }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${PAY12 }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${TOTAL_TARGET_SUM }" type="currency" pattern="#,##0"/></strong></th>
								<th class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><strong><fmt:formatNumber value="${TOTAL_ACHIEVEMENT_SUM }" type="currency" pattern="#,##0"/></strong></th>
								<th style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><strong><fmt:formatNumber value="${TOTAL_ACHIEVEMENT_SUM/TOTAL_TARGET_SUM*100 }" type="currency" pattern="0.00"/>%</strong></th>
						</tr>
				</c:if>
				<c:if test="${not empty MONTH}">
						<tr>
							<th style="width:60px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>地区</strong></th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-${MONTH}月<br>目标</strong></th>
							<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-${MONTH}月<br>实际达成</strong></th>
							<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>达成率</strong></th>
						</tr>
						<tr>
							<td style="text-align: center;width:60px;">
								<table cellspacing="0" cellpadding="0" border="0">
									<c:forEach items="${resultList}" var="item">
										<c:if test="${item.MONTH == MONTH}">
										<c:set var="ACHIEVEMENT" value="${ACHIEVEMENT+item.GOAL_MONEY }"></c:set>
										<c:set var="PAY" value="${PAY+item.PAY_MONEY }"></c:set>
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:140px;font-weight:normal;background-color:#8080C0;"><a href="#" onclick="showDetail(${item.DECP_ID},'${item.DECP_NAME_CN}',${YEAR})">${item.DECP_NAME_CN }</a></td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</td>
							<td style="text-align: right;width:60px;">
								<table cellspacing="0" cellpadding="0" border="0">
									<c:forEach items="${resultList}" var="item">
										<c:if test="${item.MONTH == MONTH}">
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:160px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.GOAL_MONEY }" type="currency" pattern="#,##0"/></td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</td>
							<td style="text-align: right;width:60px;">
								<table cellspacing="0" cellpadding="0" border="0">
									<c:forEach items="${resultList}" var="item">
										<c:if test="${item.MONTH == MONTH}">
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:180px;font-weight:normal;background-color:#8080C0;">
													<fmt:formatNumber value="${item.PAY_MONEY }" type="currency" pattern="#,##0"/>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</td>
							<td style="text-align: right;width:60px;">
								<table cellspacing="0" cellpadding="0" border="0">
									<c:forEach items="${resultList}" var="item">
										<c:if test="${item.MONTH== MONTH}">
											<c:set var="division" value="${item.GOAL_MONEY>0?item.GOAL_MONEY:1 }"></c:set>
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:180px;font-weight:normal;background-color:#8080C0;">
													<fmt:formatNumber value="${item.PAY_MONEY/division*100 }" type="currency" pattern="0.00"/>%
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</td>
						</tr>
				</c:if>
		</table>
		</div>
		</div>
	</form>
	<br>
	<font color="red">*</font>各区业绩表不含企金委贷
	<br>
	<span id="clock"></span>
	<br>
	<font color="red">*</font>周期按照财务结账周期
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-4</p>
<script>
	$(function () {
		var d=new Date();
	    var sec=d.getSeconds();
	    var min=d.getMinutes();
	    var hour=d.getHours();
	    if(sec<10) {
	    	sec="0"+sec;
	    }
	    if(min<10) {
	    	min="0"+min;
	    }
	    if(hour<10) {
	    	hour="0"+hour;
	    }
	    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
	});
</script>
</body>
</html>