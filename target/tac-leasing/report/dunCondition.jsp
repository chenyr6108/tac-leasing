<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 全部 -->
	<c:set value="${conditionMap}" var="dunCondition" ></c:set>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
			<th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>当月租金</strong>
			</th>
		<!-- <th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>当月应收1</strong>
			</th>
			<th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>当月应收2</strong> -->
			<th width="12.5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>总逾期率</strong>
			</th>
		</tr>
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">${dunCondition.NUM }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunCondition.MONTHPRICE}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunCondition.RENPRICE}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunCondition.FINE}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunCondition.MONTH_PRICE}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<!-- <td style="text-align: right;"><fmt:formatNumber value="${dunCondition.RECEIVABLES1}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunCondition.RECEIVABLES2}" type="currency"></fmt:formatNumber>&nbsp;</td> -->
			<td style="text-align: center;">${dunCondition.PERCENTT }%&nbsp;</td>
		</tr>
	</table>