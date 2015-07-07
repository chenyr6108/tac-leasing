<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<table class="grid_table">
	<tr>
		<th>序号</th>
		<th>案件号</th>
		<th>合同号</th>
		<th>承租人</th>
		<th>租金总额</th>
		<th>实际剩余租金</th>
		<th>本金总额</th>
		<th>实际剩余本金</th>
		<th>租金期间</th>
		<th>剩余期数</th>
		<th>实际TR</th>
		<th>保证类型</th>
	</tr>
	<c:set var="totalRemainingPrincipal" value="0"/>
	<c:set var="totalRemainingRental" value="0"/>
	<c:set var="totalMonthPrice" value="0"/>
	<c:set var="totalAllPrincipal" value="0"/>
	
	<c:set var="subtotalRemainingPrincipal" value="0"/>
	<c:set var="subtotalRemainingRental" value="0"/>
	<c:set var="subtotalMonthPrice" value="0"/>
	<c:set var="subtotalAllPrincipal" value="0"/>
	
	<c:set var="supl_true" value="0"/>
	<c:forEach items="${projectList}" var="items" varStatus="i">
		<c:if test="${!fn:contains(supl_true, items.SUPL_TRUE) && i.count ne 1}">
			<tr>
				<th colspan="4" style="text-align: right;">小计：</th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalMonthPrice}"/></th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalRemainingRental}"/></th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalAllPrincipal}"/></th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalRemainingPrincipal}"/></th>
				<th colspan="4">&nbsp;</th>
			</tr>
			<c:set var="subtotalRemainingPrincipal" value="0"/>
			<c:set var="subtotalRemainingRental" value="0"/>
			<c:set var="subtotalMonthPrice" value="0"/>
			<c:set var="subtotalAllPrincipal" value="0"/>
		</c:if>
		<tr>
			<td style="text-align: center;">${i.count }</td>
			<td>${items.CREDIT_RUNCODE }</td>
			<td>
				<a href="#" onclick="javascript:window.parent.openNewTab('${ctx }','collectionManage.showPayListByCredit&creditId=${items.CREDIT_ID }', '支付表');">
					${items.LEASE_CODE }
				</a>
			</td>
			<td>${items.CUST_NAME }</td>
			<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${items.MONTH_PRICE }"/></td>
			<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${items.remainingRental }"/></td>
			<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${items.allPrincipal }"/></td>
			<td style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${items.remainingPrincipal }"/></td>
			<td>${items.LEASE_TERM }</td>
			<td>${items.remainingPeriodNum }</td>
			<td><fmt:formatNumber pattern="#,###,##0.00" value="${items.TR_IRR_RATE }"/></td>
			<td>${items.SUPL_TRUE }</td>
		</tr>
		<c:set var="totalRemainingPrincipal" value="${totalRemainingPrincipal + items.remainingPrincipal }"/>
		<c:set var="totalRemainingRental" value="${totalRemainingRental + items.remainingRental }"/>
		<c:set var="totalMonthPrice" value="${totalMonthPrice + items.MONTH_PRICE }"/>
		<c:set var="totalAllPrincipal" value="${totalAllPrincipal + items.allPrincipal }"/>
		
		<c:set var="subtotalRemainingPrincipal" value="${subtotalRemainingPrincipal + items.remainingPrincipal }"/>
		<c:set var="subtotalRemainingRental" value="${subtotalRemainingRental + items.remainingRental }"/>
		<c:set var="subtotalMonthPrice" value="${subtotalMonthPrice + items.MONTH_PRICE }"/>
		<c:set var="subtotalAllPrincipal" value="${subtotalAllPrincipal + items.allPrincipal }"/>
		
		<c:if test="${i.count == fn:length(projectList)}">
			<tr>
				<th colspan="4" style="text-align: right;">小计：</th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalMonthPrice}"/></th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalRemainingRental}"/></th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalAllPrincipal}"/></th>
				<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${subtotalRemainingPrincipal}"/></th>
				<th colspan="4">&nbsp;</th>
			</tr>
		</c:if>
		<c:set var="supl_true" value="${items.SUPL_TRUE }"/>
	</c:forEach>
	<tr>
		<th colspan="4" style="text-align: right;">合计：</th>
		<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${totalMonthPrice}"/></th>
		<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${totalRemainingRental}"/></th>
		<th style="text-align: right;"><fmt:formatNumber pattern="#,###,##0.00" value="${totalRemainingPrincipal}"/></th>
		<th colspan="4">&nbsp;</th>
	</tr>
</table>		

