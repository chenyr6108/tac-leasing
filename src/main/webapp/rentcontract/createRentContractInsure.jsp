<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/selectInsureItem.js"></script>
<script type="text/javascript">
var insureTypeData = ${insureTypeJsonList}
</script>
<table align="center" width="982" id="insureTab"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
	<tr>
		<td align="left" style="height: 26px;"   colspan="4"  class="ui-state-default ui-th-ltr zc_grid_head">
			<strong>&nbsp;&nbsp;保险费</strong>
		</td>
		<td align="left" colspan="2"  class="ui-state-default ui-th-ltr zc_grid_head">
			<img src="${ctx }/images/u100.gif">
			&nbsp;
			<a href="javascript:void(0)" style="cursor: pointer;"
				onclick="addInsureItem();">添加</a>
		</td>
	</tr>
	<tr>
		<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
			保险项目
		</th>
		<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
			保险期间
		</th>
		<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
			保险费率
		</th>
		<th width="18%" class="ui-state-default ui-th-ltr zc_grid_head">
			保险费用
		</th>
		<th width="27%" class="ui-state-default ui-th-ltr zc_grid_head">
			备注
		</th>
		<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
			操作
		</th>
	</tr>
	<c:set var="insureTotal" value="0"></c:set>
	<c:forEach items="${insureList }" var="item" varStatus="status">
		<c:set var="insureTotal" value="${insureTotal + item.INSURE_PRICE}"></c:set>
		<tr>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<select id="INSURE_ITEM${status.index }" name="INSURE_ITEM">
					<option value="-1">
						-请选择-
					</option>
					<c:forEach items="${insureTypeList }" var="insureTypeList">
						<option value="${insureTypeList.INTP_ID }"
							<c:if test="${insureTypeList.INTP_ID eq item.INSURE_ITEM }">selected="selected"</c:if>>
							${insureTypeList.INTP_NAME }
						</option>
					</c:forEach>
				</select>
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="START_DATE${status.index }" name="INSURE_START_DATE" size="11"
					value="${item.START_DATE }" />
				到
				<input id="END_DATE${status.index }" name="INSURE_END_DATE" size="11"
					value="${item.END_DATE }" />
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="INSURE_RATE${status.index }" name="INSURE_RATE" size="4"
					value="${item.INSURE_RATE }">
				%
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input class="input_right" id="INSURE_PRICE${status.index }" name="INSURE_PRICE" onchange="changeField('INSURE_PRICE',this);" 
					size="15"
					value="<fmt:formatNumber value="${item.INSURE_PRICE }" type="currency" />">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="INSURE_MEMO${status.index }" name="INSURE_MEMO" size="25"
					value="${item.MEMO }">
			</td>
			<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
				<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteInsureItemRow.call(this)">删除</a>
				<input type="hidden" name="RECI_ID" value="${item.RECI_ID}" id="RECI_ID0">
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td align="left" colspan="4" class="ui-widget-content jqgrow ui-row-ltr">
			合计（大写）：
			<span id="showInsureTotalSpanUpper"> <script
					type="text/javascript">document.write(atoc(${insureTotal}));</script>
			</span>
		</td>
		<td align="left" colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：
			<span id="showInsureTotalSpan"> <fmt:formatNumber
					type="currency" value="${insureTotal }" /> </span> ）
		</td>
	</tr>
</table>
