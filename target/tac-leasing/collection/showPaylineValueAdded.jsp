<%@ page language="java" pageEncoding="UTF-8"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="10" style="text-align:left ;height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;融资租赁还款计划</b>
		</td>
		<td   class="ui-state-default ui-th-ltr zc_grid_head">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td height="30" rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			不等额
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			期次
		</td>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			支付时间
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			含税应收租金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			平均增值税
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			未税应收租金
		</td>		
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			合同预期租金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			本金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			利息
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			剩余本金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			实际增值税
		</td>
	</tr>
	<tr>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			（年/月/日）
		</td>
	</tr>
	<c:set value="" var="footDate"></c:set>
		<c:set value="0" var="TOTAL_IRR_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_IRR_PRICE"></c:set>
	<c:set value="0" var="TOTAL_VALUE_ADDED_TAX"></c:set>
	<c:set value="0" var="TOTAL_VALUE_ADDED_TAX_TRUE"></c:set>
	<c:set value="0" var="TOTAL_IRR_MONTH_PRICE_TAX"></c:set>
	<c:set value="0" var="TOTAL_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_OWN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_REN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_INCOME"></c:set>
	<c:forEach items="${paylist.paylines }" var="item" varStatus="status">
		<c:set var="bgcolorClass" value="class='kk'"></c:set>
		<c:if test="${(item.IRR_MONTH_PRICE+item.VALUE_ADDED_TAX-item.REDUCE_OWN_PRICE)>0}">
			<c:set var="bgcolorClass" value=""></c:set>
		</c:if>
		<tr>
			<td  ${bgcolorClass} style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${item.LOCKED eq 1 }">不等额</c:if>&nbsp;
			</td>
			<td ${bgcolorClass} style="text-align: center;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.PERIOD_NUM}
			</td>
			<td ${bgcolorClass} style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd" />
				<c:set value="${item.PAY_DATE }" var="footDate"></c:set>
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_MONTH_PRICE+ item.VALUE_ADDED_TAX}" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.VALUE_ADDED_TAX }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_MONTH_PRICE}" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.MONTH_PRICE }" type="currency" />
			</td>
			<td  ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.LAST_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.VALUE_ADDED_TAX_TRUE }" type="currency" />
			</td>
		</tr>
		<c:set value="${TOTAL_IRR_MONTH_PRICE + item.IRR_MONTH_PRICE  }" var="TOTAL_IRR_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_IRR_PRICE + item.IRR_PRICE }" var="TOTAL_IRR_PRICE"></c:set>
		<c:set value="${TOTAL_VALUE_ADDED_TAX + item.VALUE_ADDED_TAX }" var="TOTAL_VALUE_ADDED_TAX"></c:set>
		<c:set value="${TOTAL_MONTH_PRICE + item.MONTH_PRICE }" var="TOTAL_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_OWN_PRICE +  item.OWN_PRICE}" var="TOTAL_OWN_PRICE"></c:set>
		<c:set value="${TOTAL_REN_PRICE + item.REN_PRICE }" var="TOTAL_REN_PRICE"></c:set>
		<c:set value="${TOTAL_VALUE_ADDED_TAX_TRUE + item.VALUE_ADDED_TAX_TRUE }" var="TOTAL_VALUE_ADDED_TAX_TRUE"></c:set>
		<c:set value="${TOTAL_IRR_MONTH_PRICE_TAX + item.IRR_MONTH_PRICE + item.VALUE_ADDED_TAX  }" var="TOTAL_IRR_MONTH_PRICE_TAX"></c:set>
	</c:forEach>
		<tr>
		<td colspan="3" style="text-align: center;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>合计:</b>
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE_TAX}" type="currency" />	
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_VALUE_ADDED_TAX}" type="currency" />	
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp;<fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE}" type="currency" />	
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_MONTH_PRICE}" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_OWN_PRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_VALUE_ADDED_TAX_TRUE }" type="currency" />
		</td>
	</tr>
</table>



