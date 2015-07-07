<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id='target_limit' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'target_limit');" title="点击删除导航"></span>目标额度
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<%-- <tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">当年目标</td>
					<td style="text-align: center;">当日完成</td>
					<td style="text-align: center;">已完成</td>
					<td style="text-align: center;">已完成%</td>
					<td style="text-align: center;">剩余时间（月）</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="750000000"></fmt:formatNumber></td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${sumLeaseToday }"></fmt:formatNumber></td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${sumLeaseAll }"></fmt:formatNumber></td>
					<td style="text-align: center;">${completed }</td>
					<td style="text-align: center;">${loseMonth }</td>
				</tr> --%>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">月份</td>
					<td style="text-align: center;">目標額度</td>
					<td style="text-align: center;">累積撥款</td>
					<td style="text-align: center;">達成率</td>
					<td style="text-align: center;">剩餘時間</td>
				</tr>
				<c:set var="sum_GOAL_MONEY" value="0"/>
				<c:set var="sum_PAY_MONEY" value="0"/>
				<c:forEach var="item"  items="${resultList}" varStatus="status"> 
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: right;">${item.MONTH }</td>
						<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.GOAL_MONEY}"></fmt:formatNumber></td>
						<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.PAY_MONEY }"></fmt:formatNumber></td>
						<td style="text-align: center;"><fmt:formatNumber type="number" value="${item.PERCENT_MONEY }" maxFractionDigits="2"/>%</td>
						<td style="text-align: center;">${item.DAYREMAINING < 0 ? 0 : item.DAYREMAINING }（日）</td>
					</tr>
					<c:set var="sum_GOAL_MONEY" value="${sum_GOAL_MONEY + item.GOAL_MONEY }"/>
					<c:set var="sum_PAY_MONEY" value="${sum_PAY_MONEY + item.PAY_MONEY }"/>
				</c:forEach>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: right;">合計：</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${sum_GOAL_MONEY }"></fmt:formatNumber></td>
					<%-- <td style="text-align: right;"><fmt:formatNumber type="currency" value="750000000"></fmt:formatNumber></td> --%>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${sum_PAY_MONEY }"></fmt:formatNumber></td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${sum_PAY_MONEY > 0 && sum_GOAL_MONEY > 0 ? (sum_PAY_MONEY / sum_GOAL_MONEY) * 100 : 0 }" maxFractionDigits="2"/>%</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${loseMonth }" maxFractionDigits="2"/>（月）</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="2" style="text-align: center;">當日撥款：</td>
					<td colspan="3" style="text-align: center;"><fmt:formatNumber type="currency" value="${sumLeaseToday }"/></td>
				</tr>
			</table>
		</div>
		</div>
		</div>
	</div>
</div>