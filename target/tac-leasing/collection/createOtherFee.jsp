<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript" src="${ctx }/collection/js/selectOtherPrice.js" />
<script type="text/javascript">
$("#showOtherFeeTotalSpanUpper").html(atoc(${otherFeeTotal}));
</script>

<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherPriceTab">
	<tr>
		<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<strong>其他费用</strong>
		</td>
		<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<!-- Modify by Michael 2012 1/5 去除增加按钮 <img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;" onclick="addOtherPrice();">添加</a> -->
		</td>
	</tr>
	<tr>
		<th width="20%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			费用名称
		</th>
		<th width="20%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			费用金额
		</th>
		<th width="20%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			产生费用时间
		</th>
		<th width="35%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
		<th width="5%"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			操作
		</th>
	</tr>
	<c:set  var="otherFeeTotal" value="0"></c:set>
	<c:forEach items="${paylist.payOtherFees }" var="item">
		<tr>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_NAME0" name="OTHER_NAME" value="${item.OTHER_NAME }"/>
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input class="input_right" onchange="changeField('OTHER_PRICE',this);" id="OTHER_PRICE0" name="OTHER_PRICE" value="<fmt:formatNumber value="${item.OTHER_PRICE }" type="currency" />" >
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_DATE0" name="OTHER_DATE" value="${item.OTHER_DATE }">
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_MEMO0" name="OTHER_MEMO" size="30" value="${item.MEMO }">
			</td>
			<td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteOtherPriceRow.call(this)">删除</a>
				<input type="hidden" name="RECO_ID" value="${item.RECO_ID }" id="RECO_ID0">
			</td>
		</tr>
		<c:set  var="otherFeeTotal" value="${item.OTHER_PRICE + otherFeeTotal}"></c:set>
	</c:forEach>
	<tr>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr" colspan="3">
			合计（大写）：
			<span id="showOtherFeeTotalSpanUpper">
			<!--  <script type="text/javascript">document.write(atoc(${otherFeeTotal}));</script>-->
			</span>
		</td>
		<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
			（小写：
			<span id="showOtherFeeTotalSpan">
			<fmt:formatNumber type="currency" value="${otherFeeTotal }" />
			</span>
			）
		</td>
	</tr>

</table>
