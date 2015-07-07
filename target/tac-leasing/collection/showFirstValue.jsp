<%@ page language="java" pageEncoding="UTF-8"%>

<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>备注</b>
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="height: 24px;">
			 承租人应在融资租赁合同签署后五个工作日内，将首期款电汇至出租人指定的账户。<br />
			首期款包括：租赁质押金、管理费、首期租金、差旅费等， 以上共计
			<span id="showFirstValueSpan">
			<!-- Modify by Michael 2012 01/29 去除管理费加总 -->
			 <fmt:formatNumber value="${paylist.PLEDGE_PRICE + paylist.BUSINESS_TRIP_PRICE + paylist.HEAD_HIRE }" type="currency" /> 
			</span>元
		</td>
	</tr>
</table>
