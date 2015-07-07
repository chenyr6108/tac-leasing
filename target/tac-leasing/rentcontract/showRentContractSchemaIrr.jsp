<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${ctx }/rentcontract/js/createRentContractSchemaIrr.js"></script>
<input type="hidden" id="listLength" value="${fn:length(schemaIrrList)}">
<table id="irrMonthPriceTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="3">
			<b>&nbsp;&nbsp;融资租赁方案测算方式一</b>
		</td>
	</tr>
	<c:forEach var="item" items="${schemaIrrList}" varStatus="status">
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				未税应付租金<font color="red">&nbsp;*</font>
			</td>
			<td style="text-align: left;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" pattern="#,##0.00" />
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				对应期次
			</td>
			<td style="text-align: left;" class="ui-widget-content jqgrow ui-row-ltr">
				第 ${item.IRR_MONTH_PRICE_START} 
				期到第 ${item.IRR_MONTH_PRICE_END} 期
			</td>
		</tr>
	</c:forEach>
</table>
