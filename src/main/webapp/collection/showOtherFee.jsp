<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript" src="${ctx }/collection/js/selectOtherPrice.js"></script>
<script type="text/javascript">
$(function(){
	 $("#otherFeeTotalSpan").html(atoc(${otherFeeTotal}));
	
});

</script>

<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherPriceTab">
	<tr>
		<td colspan="3" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>其他费用</strong>
		</td>
		<td colspan="2" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			&nbsp;
		</td>
	</tr>
	<tr>
		<th width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			费用名称
		</th>
		<th width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			费用金额
		</th>
		<th width="20%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			产生费用时间
		</th>
		<th width="35%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
	</tr>
	<c:set  var="otherFeeTotal" value="0"></c:set>
	<c:forEach items="${paylist.payOtherFees }" var="item">
		<tr>
			<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				 ${item.OTHER_NAME } 
			</td>
			<td style="text-align: right;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				 <fmt:formatNumber value="${item.OTHER_PRICE }" type="currency" /> 
			</td>
			<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				 ${item.OTHER_DATE } 
			</td>
			<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				 ${item.MEMO } 
			</td>
		</tr>
		<c:set  var="otherFeeTotal" value="${item.OTHER_PRICE + otherFeeTotal}"></c:set>
	</c:forEach>
	<tr>
		<td colspan="3" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：<!--  <script type="text/javascript">document.write(atoc(${otherFeeTotal}));</script>-->
			<span id="otherFeeTotalSpan"></span>
		</td>
		<td colspan="2" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：<fmt:formatNumber type="currency" value="${otherFeeTotal }" />）
		</td>
	</tr>

</table>
