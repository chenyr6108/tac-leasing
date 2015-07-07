<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>
		$(function (){
			$("#DATE").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function doQuery() {
			$("#form").submit();
		}
		
		function doSort(param1,param2) {
			$("#SORT").val(param1);
			$("#SORT_TYPE").val(param2);
			doQuery();
		}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="achievementCaseCommand.query">
		<input type="hidden" id="SORT" name="SORT">
		<input type="hidden" id="SORT_TYPE" name="SORT_TYPE">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height:30px;">
			<span class="ui-jqgrid-title"
				style="line-height:30px;font-size:15px;">&nbsp;&nbsp;当日各办事处业绩进度一览(单位:K)</span>
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
							<td colspan="5">&nbsp;时间：<input id="DATE" name="DATE" value="${DATE }" readonly="readonly"> &nbsp;
							办事处： <select id="DEPT_ID" name="DEPT_ID" style="width:150px">
									<option value="">--所有办事处--</option>
									<c:forEach items="${deptList}" var="dept"
										varStatus="status">
										<option value="${dept.DECP_ID}"
											<c:if test="${dept.DECP_ID eq DEPT_ID}">selected='selected'</c:if>>${dept.DECP_NAME_CN}</option>
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
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
		<table cellspacing="0" cellpadding="0" border="0" class="grid_table">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:30px;" rowspan="2">序号</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;" rowspan="2">办事处</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">当日拨款案件</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;" rowspan="2">本期目标</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">当月累计拨款</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">当月累计尾款</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;" rowspan="2">达成率</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;" rowspan="2">隔日预拨款</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="2">已核准待起租</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">当日案件状况</th>
				<%-- <th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','PAY_COUNT' )"
				>新增拨款案件<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'PAY_COUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'PAY_COUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:90px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','PAY_MONEY' )"
				>拨款金额<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'PAY_MONEY' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'PAY_MONEY' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','APPROVE_COUNT' )"
				>当日核准案件<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'APPROVE_COUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'APPROVE_COUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','PENDING_APPROVE_COUNT' )"
				>当日送审案件<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'PENDING_APPROVE_COUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'PENDING_APPROVE_COUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:90px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','CAUTION_COUNT' )"
				>入保证金<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'CAUTION_COUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'CAUTION_COUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','AUDIT_COUNT' )"
				>当前在审案件<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'AUDIT_COUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'AUDIT_COUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:110px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','HAS_APPROVE_COUNT' )"
				>当前已核准案件<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'HAS_APPROVE_COUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'HAS_APPROVE_COUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:110px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','HAS_APPROVE_AMOUNT' )"
				>当前已核准金额<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'HAS_APPROVE_AMOUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'HAS_APPROVE_AMOUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:110px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','ACHIEVEMENT_COUNT' )"
				>本月总拨款案件<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'ACHIEVEMENT_COUNT' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'ACHIEVEMENT_COUNT' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:110px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','ACHIEVEMENT_MONEY' )"
				>本月拨款金额<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'ACHIEVEMENT_MONEY' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'ACHIEVEMENT_MONEY' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','TARGET_MONEY' )"
				>本月任务<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'TARGET_MONEY' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'TARGET_MONEY' }">↓</c:if>)</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:90px;cursor:pointer;"
				 onclick="doSort('<c:if test="${SORT eq 'ASC' }">DESC</c:if><c:if test="${SORT eq 'DESC' }">ASC</c:if>','ACHIEVEMENT_MONEY/TARGET_MONEY*1000' )"
				>达成率<br>(点击排序<c:if test="${SORT eq 'ASC' and SORT_TYPE eq 'ACHIEVEMENT_MONEY/TARGET_MONEY*1000' }">↑</c:if><c:if test="${SORT eq 'DESC' and SORT_TYPE eq 'ACHIEVEMENT_MONEY/TARGET_MONEY*1000' }">↓</c:if>)</th> --%>
				
			</tr>
			<tr>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;">件数</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">金额</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;">件数</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">金额</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;">件数</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">金额</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;">件数</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:100px;">金额</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;">送审</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;">核准</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;">审查中</th>
			</tr>
			<c:forEach items="${resultList}" var="item" varStatus="status">
				<c:set var="payCountTotal" value="${item.payCount+payCountTotal }"/>
				<c:set var="payMoneyTotal" value="${item.payMoney+payMoneyTotal }"/>
				<c:set var="approveCountTotal" value="${item.approveCount+approveCountTotal }"/>
				<c:set var="pendingApproveCountTotal" value="${item.pendingApproveCount+pendingApproveCountTotal }"/>
				<c:set var="cautionCountTotal" value="${item.cautionCount+cautionCountTotal }"/>
				<c:set var="auditCountTotal" value="${item.auditCount+auditCountTotal }"/>
				<c:set var="hasApproveCountTotal" value="${item.hasApproveCount+hasApproveCountTotal }"/>
				<c:set var="hasApproveAmountTotal" value="${item.hasApproveAmount+hasApproveAmountTotal }"/>
				<c:set var="achievementCountTotal" value="${item.achievementCount+achievementCountTotal }"/>
				<c:set var="achievementMoneyTotal" value="${item.achievementMoney+achievementMoneyTotal }"/>
				<c:set var="targetMoneyTotal" value="${item.targetMoney+targetMoneyTotal }"/>
				<c:set var="lastAchievementCountTotal" value="${item.lastAchievementCount+lastAchievementCountTotal }"/>
				<c:set var="lastAchievementMoneyTotal" value="${item.lastAchievementMoney+lastAchievementMoneyTotal }"/>
				<c:set var="nextDayPayMoneyTotal" value="${item.nextDayPayMoney+nextDayPayMoneyTotal }"/>
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${status.count }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.deptName }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.payCount}</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.payMoney}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.targetMoney}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.achievementCount}</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.achievementMoney}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.lastAchievementCount}</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.lastAchievementMoney}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.achievement}</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.nextDayPayMoney}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.hasApproveCount}</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;"><fmt:formatNumber value="${item.hasApproveAmount}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.pendingApproveCount}</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.approveCount}</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.auditCount}</td>
					<%-- <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">${item.cautionCount}</td> --%>
				<tr>
			</c:forEach>
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;" colspan="2">合计</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">${payCountTotal}</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${payMoneyTotal}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${targetMoneyTotal}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">${achievementCountTotal}</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${achievementMoneyTotal}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">${lastAchievementCountTotal}</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${lastAchievementMoneyTotal}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${achievementMoneyTotal/targetMoneyTotal*100 }" type="currency" pattern="##0.00"/>%</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${nextDayPayMoneyTotal}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">${hasApproveCountTotal}</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;"><fmt:formatNumber value="${hasApproveAmountTotal}" type="currency" pattern="#,##0.00"/></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">${pendingApproveCountTotal}</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">${approveCountTotal}</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;">${auditCountTotal}</td>
				</tr>
		</table>
		</div>
		<font color="#FF0000">*</font>${DATE }&nbsp;17:30:00之数据
		</div>
	</form>
	<br><br>
		<font color="#FF0000">*</font>上表不含企金委贷<br>
		<font color="#FF0000">*</font>上海企金委贷${DATE }案件金额:<fmt:formatNumber value="${loanMoneyToday.currentAchievement }" type="currency" pattern="#,##0.00"/><br>
		<font color="#FF0000">*</font><%-- 上海企金委贷${month }月案件金额:<fmt:formatNumber value="${loanMoneyMonth.currentAchievement }" type="currency" pattern="#,##0.00"/> --%>周期按照财务结账周期
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-1</p>
</body>
</html>