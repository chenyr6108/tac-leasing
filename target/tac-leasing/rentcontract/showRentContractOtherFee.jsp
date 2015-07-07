<%@ page language="java" pageEncoding="utf-8"%>

<table align="center" id="otherPriceTab" width="92%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
	<tr>
		<td align="left" colspan="3"  class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>其他费用</strong>
		</td>
		<td align="left" colspan="2"  class="ui-state-default ui-th-ltr zc_grid_head">
			 &nbsp; 
		</td>
	</tr>
	<tr>
		<th width="20%"  class="ui-widget-content jqgrow ui-row-ltr">
			费用名称
		</th>
		<th width="20%"  class="ui-widget-content jqgrow ui-row-ltr">
			费用金额
		</th>
		<th width="20%"  class="ui-widget-content jqgrow ui-row-ltr">
			产生费用时间
		</th>
		<th width="35%"  class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
	</tr>
	<c:set var="otherFeeTotal" value="0"></c:set>
	<c:forEach items="${otherFeeList }" var="item" varStatus="status">
		<tr>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				${item.OTHER_NAME } &nbsp; 
			</td>
			<td align="right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OTHER_PRICE }" type="currency" /> &nbsp; 
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				${item.OTHER_DATE } &nbsp; 
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				${item.MEMO } &nbsp; 
			</td>
		</tr>
		<c:set var="otherFeeTotal" value="${item.OTHER_PRICE + otherFeeTotal}"></c:set>
	</c:forEach>
	<tr>
		<td align="left" colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：
			<span id="showOtherFeeTotalSpanUpper"> <script
					type="text/javascript">document.write(atoc(${otherFeeTotal}));</script>
			</span>
		</td>
		<td align="left" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：
			<span id="showOtherFeeTotalSpan"> <fmt:formatNumber
					type="currency" value="${otherFeeTotal }" /> </span> ）
		</td>
	</tr>

</table>
