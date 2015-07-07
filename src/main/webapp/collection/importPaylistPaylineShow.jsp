<%@ page language="java" pageEncoding="UTF-8"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="11" style="text-align:left ;height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;融资租赁还款计划</b>
		</td>
	</tr>
	<tr>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			期次
		</td>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			支付时间
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			应收租金
		</td>
		<!-- <td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			净现金流
		</td> -->
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			预期租金
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
			营业税
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			收入
		</td>
	</tr>
	<tr>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			（年/月/日）
		</td>
	</tr>
	<c:forEach items="${paylist.paylines }" var="item" varStatus="status">
		<tr>
			<td ${bgcolorClass} style="text-align: center;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.PERIOD_NUM}
			</td>
			<td ${bgcolorClass} style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd" />
				<c:set value="${item.PAY_DATE }" var="footDate"></c:set>
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_MONTH_PRICE }" pattern='#,##0.00' />
			</td>
			<%-- <td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_PRICE }" pattern='#,##0.00' />
			</td> --%>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.MONTH_PRICE }" pattern='#,##0.00' />
			</td>
			<td  ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE }" pattern='#,##0.00' />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE }" pattern='#,##0.00' />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.LAST_PRICE }" pattern='#,##0.00' />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.SALES_TAX }" pattern='#,##0.00' />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE - item.SALES_TAX }" pattern='#,##0.00' />
			</td>
		</tr>
	</c:forEach>
</table>
