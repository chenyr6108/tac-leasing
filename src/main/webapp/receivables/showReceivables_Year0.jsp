<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 当年的应收账款 -->
	<c:set value="${yearMap}" var="yearMap" ></c:set>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">
				应收租金：
			</td>
			<td style="text-align: left;" colspan="3">
				<fmt:formatNumber value="${yearMap.MONTH_PRICE}" type="currency"></fmt:formatNumber>
			</td>
		</tr>
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">
				应收本金：
			</td>
			<td style="text-align: left;" colspan="3">
				<fmt:formatNumber value="${yearMap.OWN_PRICE}" type="currency"></fmt:formatNumber>
			</td>
		</tr>
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">
				应收利息：
			</td>
			<td style="text-align: left;" colspan="3">
				<fmt:formatNumber value="${yearMap.REN_PRICE}" type="currency"></fmt:formatNumber>
			</td>
		</tr>
		<tr class="ui-jqgrid-labels">
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>日期</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>应收租金</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>应收本金</strong>
			</th>
			<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>应收利息</strong>
			</th>
		</tr>
		<c:forEach items="${quarterList}" var="quarter" varStatus="status">
			<tr	class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;"><input type="hidden" name="receivables_quarter" id="receivables_quarter" value="${quarter.PAY_QUARTER }" />第${quarter.PAY_QUARTER }季度</td>
				<td style="text-align: right;"><input type="hidden" name="quarter_month_price" id="quarter_month_price" value="${quarter.MONTH_PRICE }" /><fmt:formatNumber value="${quarter.MONTH_PRICE}" type="currency"></fmt:formatNumber></td>
				<td style="text-align: right;"><input type="hidden" name="quarter_own_price" id="quarter_own_price" value="${quarter.OWN_PRICE}" /><fmt:formatNumber value="${quarter.OWN_PRICE}" type="currency"></fmt:formatNumber></td>
				<td style="text-align: right;"><input type="hidden" name="quarter_ren_price" id="quarter_ren_price" value="${quarter.REN_PRICE}" /><fmt:formatNumber value="${quarter.REN_PRICE}" type="currency"></fmt:formatNumber></td>
			</tr>
		</c:forEach>
	</table>