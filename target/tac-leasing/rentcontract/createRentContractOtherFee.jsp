<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript"
	src="${ctx }/rentcontract/js/selectOtherPrice.js"></script>

<table align="center" width="982"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherPriceTab">
	<tr>
		<td align="left" style="height: 26px;"  colspan="3"  class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>&nbsp;&nbsp;其他费用</strong>
		</td>
		<td align="left" colspan="2"  class="ui-state-default ui-th-ltr zc_grid_head">
			<img src="${ctx }/images/u100.gif">
			&nbsp;
			<a href="javascript:void(0)" style="cursor: pointer;"
				onclick="addOtherPrice();">添加</a>
		</td>
	</tr>
	<tr>
		<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
			费用名称
		</th>
		<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
			费用金额
		</th>
		<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
			产生费用时间
		</th>
		<th width="35%" class="ui-state-default ui-th-ltr zc_grid_head">
			备注
		</th>
		<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
			操作
		</th>
	</tr>
	<c:set var="otherFeeTotal" value="0"></c:set>
	<c:forEach items="${otherFeeList }" var="item" varStatus="status">
		<tr>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_NAME${status.index }" name="OTHER_NAME"
					value="${item.OTHER_NAME }" />
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input class="input_right" onchange="changeField('OTHER_PRICE',this);"  id="OTHER_PRICE${status.index }" name="OTHER_PRICE"
					value="<fmt:formatNumber value="${item.OTHER_PRICE }" type="currency" />">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_DATE${status.index }" name="OTHER_DATE"
					value="${item.OTHER_DATE }">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="OTHER_MEMO${status.index }" name="OTHER_MEMO" size="30"
					value="${item.MEMO }">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteOtherPriceRow.call(this)">删除</a>
				<input type="hidden" name="RECO_ID" value="${item.RECO_ID }" id="RECO_ID${status.index }">
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
