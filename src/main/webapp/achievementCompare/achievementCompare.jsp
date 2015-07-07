<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>
	$(function (){
		$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function doQuery() {
		$("#form").submit();
	}
	
	function getToday() {
		var today=new Date();
		var month=today.getMonth()+1;
		if(month<10) {
			month="0"+month;
		}
		$("#datebegin").val(today.getFullYear()+"-"+month+"-"+today.getDate());
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="achievementCompareCommand.query">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align: left; height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;各区业绩同期比(单位K)</span>
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
							<td colspan="5">业绩日期：<input type="text" id="datebegin" name="datebegin" value="${DATE }" readonly="readonly">&nbsp;&nbsp;<input type="button" value="今天" class="ui-state-default ui-corner-all" onclick="getToday()">
							</td>
						</tr>
					</table>
				</td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doQuery();" class="blue_button">搜 索</a></td>
			</tr>
		</table>
		<br>
		<br> <span
			class="ui-widget-content jqgrow ui-row-ltr ui-th-ltr zc_grid_head ui-helper-clearfix"
			style="width:250px; text-align:left; font-weight:normal;">&nbsp;&nbsp;<b>上期日期区间:</b>${LAST_MONTH_BEGIN_DATE
			}至${LAST_MONTH_END_DATE }</span> <span
			class="ui-widget-content jqgrow ui-row-ltr ui-th-ltr zc_grid_head ui-helper-clearfix"
			style="width:180px; text-align:left; font-weight:normal;">&nbsp;&nbsp;<b>上期区间工作天数:</b>${LAST_MONTH_COUNT
			}天</span><br><span
			class="ui-state-default ui-th-ltr zc_grid_head ui-helper-clearfix"
			style="width:250px; text-align:left; font-weight:normal;">&nbsp;&nbsp;<b>本期日期区间:</b>${CURRENT_MONTH_BEGIN_DATE
			}至${CURRENT_MONTH_END_DATE }</span> <span
			class="ui-state-default ui-th-ltr zc_grid_head ui-helper-clearfix"
			style="width:180px; text-align:left; font-weight:normal;">&nbsp;&nbsp;<b>本期区间工作天数:</b>${CURRENT_MONTH_COUNT
			}天</span> <span
			class="ui-state-default ui-th-ltr zc_grid_head ui-helper-clearfix"
			style="width:180px; text-align:left; font-weight:normal;">&nbsp;&nbsp;<b>业绩日期:</b>${CURRENT_MONTH_END_DATE
			}</span> <br><br><br>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<c:choose>
				<c:when test="${resultList==null }">
						<span style="width:250px; text-align:left;font-weight:normal;">
								${MSG }区间工作日为0,查询无结果!
						</span>
				</c:when>
				<c:otherwise>
						<table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										区域
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										本期业绩
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										上期业绩
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										同期比
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										本期目标
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										本期达成
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										累计业绩
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										累计目标
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										累计达成
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										年度目标
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										年度达成率
									</td>
								</tr>
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;">
										华东区域
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="10">
									</td>
								</tr>
								<c:forEach items="${resultList}" var="item">
										<c:set var="currentAchievement_total" value="${item.currentAchievement+currentAchievement_total }"/>
						 				<c:set var="lastAchievement_total" value="${item.lastAchievement+lastAchievement_total }"/>
						 				<c:set var="currentTarget_total" value="${item.currentTarget+currentTarget_total }"/>
						 				<c:set var="totalAchievement_total" value="${item.totalAchievement+totalAchievement_total }"/>
						 				<c:set var="totalTarget_total" value="${item.totalTarget+totalTarget_total }"/>
						 				<c:set var="yearTarget_total" value="${item.yearTarget+yearTarget_total }"/>
						 				
										<c:if test="${item.deptId eq '1' or item.deptId eq '2' or item.deptId eq '7' or item.deptId eq '13'
										 				or item.deptId eq '15' or item.deptId eq '16' or item.deptId eq '17' }">
						 				<c:set var="currentAchievement_total_east" value="${item.currentAchievement+currentAchievement_total_east }"/>
						 				<c:set var="lastAchievement_total_east" value="${item.lastAchievement+lastAchievement_total_east }"/>
						 				<c:set var="currentTarget_total_east" value="${item.currentTarget+currentTarget_total_east }"/>
						 				<c:set var="totalAchievement_total_east" value="${item.totalAchievement+totalAchievement_total_east }"/>
						 				<c:set var="totalTarget_total_east" value="${item.totalTarget+totalTarget_total_east }"/>
						 				<c:set var="yearTarget_total_east" value="${item.yearTarget+yearTarget_total_east }"/>
											<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.deptName }
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.lastAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<c:if test="${item.lastAchievement==0 }">
														-
													</c:if>
													<c:if test="${item.lastAchievement!=0 }">
														<fmt:formatNumber value="${item.compare1 }" type="currency" pattern="##0.00"/>%
													</c:if>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare2 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare3 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.yearTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare4 }" type="currency" pattern="##0.00"/>%
												</td>
											</tr>
										</c:if>
								</c:forEach>
								
								<tr>
									<td style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										小计
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${currentAchievement_total_east }" type="currency" pattern="#,##0"/>
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${lastAchievement_total_east }" type="currency" pattern="#,##0"/>
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<c:if test="${lastAchievement_total_east!=0 }">
												<fmt:formatNumber value="${(currentAchievement_total_east-lastAchievement_total_east)/lastAchievement_total_east*100 }" type="currency" pattern="##0.00"/>%
											</c:if>
											<c:if test="${lastAchievement_total_east==0 }">
												-
											</c:if>
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${currentTarget_total_east }" type="currency" pattern="#,##0"/>
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${currentAchievement_total_east/currentTarget_total_east*100 }" type="currency" pattern="##0.00"/>%
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${totalAchievement_total_east }" type="currency" pattern="#,##0"/>
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${totalTarget_total_east }" type="currency" pattern="#,##0"/>
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${totalAchievement_total_east/totalTarget_total_east*100 }" type="currency" pattern="##0.00"/>%
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${yearTarget_total_east }" type="currency" pattern="#,##0"/>
									</td>
									<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
										<fmt:formatNumber value="${totalAchievement_total_east/yearTarget_total_east*100 }" type="currency" pattern="##0.00"/>%
									</td>
								</tr>
						</table>
						<br><br>
						<table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
								</tr>
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;">
										华南区域
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="10">
									</td>
								</tr>
								<c:forEach items="${resultList}" var="item">
										<c:if test="${item.deptId eq '3' or item.deptId eq '8' or item.deptId eq '11' }">
										<c:set var="currentAchievement_total_south" value="${item.currentAchievement+currentAchievement_total_south }"/>
						 				<c:set var="lastAchievement_total_south" value="${item.lastAchievement+lastAchievement_total_south }"/>
						 				<c:set var="currentTarget_total_south" value="${item.currentTarget+currentTarget_total_south }"/>
						 				<c:set var="totalAchievement_total_south" value="${item.totalAchievement+totalAchievement_total_south }"/>
						 				<c:set var="totalTarget_total_south" value="${item.totalTarget+totalTarget_total_south }"/>
						 				<c:set var="yearTarget_total_south" value="${item.yearTarget+yearTarget_total_south }"/>
												<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.deptName }
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.lastAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<c:if test="${item.lastAchievement==0 }">
														-
													</c:if>
													<c:if test="${item.lastAchievement!=0 }">
														<fmt:formatNumber value="${item.compare1 }" type="currency" pattern="##0.00"/>%
													</c:if>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare2 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare3 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.yearTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare4 }" type="currency" pattern="##0.00"/>%
												</td>
											</tr>
			 							</c:if>
								</c:forEach>
									<tr>
										<td style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											小计
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total_south }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${lastAchievement_total_south }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<c:if test="${lastAchievement_total_south!=0 }">
												<fmt:formatNumber value="${(currentAchievement_total_south-lastAchievement_total_south)/lastAchievement_total_south*100 }" type="currency" pattern="##0.00"/>%
											</c:if>
											<c:if test="${lastAchievement_total_south==0 }">
												-
											</c:if>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentTarget_total_south }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total_south/currentTarget_total_south*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_south }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalTarget_total_south }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_south/totalTarget_total_south*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${yearTarget_total_south }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_south/yearTarget_total_south*100 }" type="currency" pattern="##0.00"/>%
										</td>
									</tr>
						</table>
						<br><br>	
						<table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
								</tr>
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;">
										西南区域
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="10">
									</td>
								</tr>
								<c:forEach items="${resultList}" var="item">
										<c:if test="${item.deptId eq '9' or item.deptId eq '14' }">
										<c:set var="currentAchievement_total_west" value="${item.currentAchievement+currentAchievement_total_west }"/>
						 				<c:set var="lastAchievement_total_west" value="${item.lastAchievement+lastAchievement_total_west }"/>
						 				<c:set var="currentTarget_total_west" value="${item.currentTarget+currentTarget_total_west }"/>
						 				<c:set var="totalAchievement_total_west" value="${item.totalAchievement+totalAchievement_total_west }"/>
						 				<c:set var="totalTarget_total_west" value="${item.totalTarget+totalTarget_total_west }"/>
						 				<c:set var="yearTarget_total_west" value="${item.yearTarget+yearTarget_total_west }"/>
												<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.deptName }
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.lastAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<c:if test="${item.lastAchievement==0 }">
														-
													</c:if>
													<c:if test="${item.lastAchievement!=0 }">
														<fmt:formatNumber value="${item.compare1 }" type="currency" pattern="##0.00"/>%
													</c:if>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare2 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare3 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.yearTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare4 }" type="currency" pattern="##0.00"/>%
												</td>
											</tr>
			 							</c:if>
								</c:forEach>
									<tr>
										<td style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											小计
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total_west }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${lastAchievement_total_west }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<c:if test="${lastAchievement_total_west!=0 }">
												<fmt:formatNumber value="${(currentAchievement_total_west-lastAchievement_total_west)/lastAchievement_total_west*100 }" type="currency" pattern="##0.00"/>%
											</c:if>
											<c:if test="${lastAchievement_total_west==0 }">
												-
											</c:if>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentTarget_total_west }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total_west/currentTarget_total_west*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_west }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalTarget_total_west }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_west/totalTarget_total_west*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${yearTarget_total_west }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_west/yearTarget_total_west*100 }" type="currency" pattern="##0.00"/>%
										</td>
									</tr>
						</table>
						<br><br>
						<table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
								</tr>
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;">
										乘用车
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="10">
									</td>
								</tr>
								<c:forEach items="${resultList}" var="item">
										<c:if test="${item.deptId eq '19' or item.deptId eq '20' }">
										<c:set var="currentAchievement_total_car" value="${item.currentAchievement+currentAchievement_total_car }"/>
						 				<c:set var="lastAchievement_total_car" value="${item.lastAchievement+lastAchievement_total_car }"/>
						 				<c:set var="currentTarget_total_car" value="${item.currentTarget+currentTarget_total_car }"/>
						 				<c:set var="totalAchievement_total_car" value="${item.totalAchievement+totalAchievement_total_car }"/>
						 				<c:set var="totalTarget_total_car" value="${item.totalTarget+totalTarget_total_car }"/>
						 				<c:set var="yearTarget_total_car" value="${item.yearTarget+yearTarget_total_car }"/>
												<tr>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">
													${item.deptName }
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.lastAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<c:if test="${item.lastAchievement==0 }">
														-
													</c:if>
													<c:if test="${item.lastAchievement!=0 }">
														<fmt:formatNumber value="${item.compare1 }" type="currency" pattern="##0.00"/>%
													</c:if>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.currentTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare2 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalAchievement }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.totalTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare3 }" type="currency" pattern="##0.00"/>%
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.yearTarget }" type="currency" pattern="#,##0"/>
												</td>
												<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
													<fmt:formatNumber value="${item.compare4 }" type="currency" pattern="##0.00"/>%
												</td>
											</tr>
			 							</c:if>
								</c:forEach>
									<tr>
										<td style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											小计
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total_car }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${lastAchievement_total_car }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<c:if test="${lastAchievement_total_car!=0 }">
												<fmt:formatNumber value="${(currentAchievement_total_car-lastAchievement_total_car)/lastAchievement_total_car*100 }" type="currency" pattern="##0.00"/>%
											</c:if>
											<c:if test="${lastAchievement_total_car==0 }">
												-
											</c:if>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentTarget_total_car }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total_car/currentTarget_total_car*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_car }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalTarget_total_car }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_car/totalTarget_total_car*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${yearTarget_total_car }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total_car/yearTarget_total_car*100 }" type="currency" pattern="##0.00"/>%
										</td>
									</tr>
						</table>
						<br><br>
						<table cellspacing="0" cellpadding="0" border="0" style="width: 100%">	
								<tr>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
										
									</td>
								</tr>
								<tr>
										<td style="text-align:center;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											总计
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${lastAchievement_total }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<c:if test="${lastAchievement_total!=0 }">
												<fmt:formatNumber value="${(currentAchievement_total-lastAchievement_total)/lastAchievement_total*100 }" type="currency" pattern="##0.00"/>%
											</c:if>
											<c:if test="${lastAchievement_total==0 }">
												-
											</c:if>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentTarget_total }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${currentAchievement_total/currentTarget_total*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalTarget_total }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total/totalTarget_total*100 }" type="currency" pattern="##0.00"/>%
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${yearTarget_total }" type="currency" pattern="#,##0"/>
										</td>
										<td style="text-align:right;width:100px;" class="ui-state-default ui-th-ltr zc_grid_head">
											<fmt:formatNumber value="${totalAchievement_total/yearTarget_total*100 }" type="currency" pattern="##0.00"/>%
										</td>
									</tr>
							</table>
				</c:otherwise>
			</c:choose>
			</div>
			</div>
	</form>
	<br>
	<font color="red">*</font>各区业绩同期比不含企金委贷 
	<br>
	<span id="clock"></span>
	<br>
	<font color="red">*</font>周期按照自然月
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-3</p>
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