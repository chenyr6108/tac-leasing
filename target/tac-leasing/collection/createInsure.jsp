<%@ page language="java" pageEncoding="utf-8"%>
<script type="text/javascript" src="${ctx }/collection/js/selectInsureItem.js"></script>
<script type="text/javascript">
var insureTypeData = ${insureTypeJsonList}
$("#showInsureTotalSpanUpper").html(atoc(${insureTotal}));
</script>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="insureTab">
	<tr>
		<td  colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<strong>保险费</strong>
		</td>
		<td  colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;">
			<!-- Modify by Michael 2012 1/5 去除增加按钮 <img src="${ctx }/images/u100.gif"><a href="javascript:void(0)" style="cursor: pointer;"
				onclick="addInsureItem();">添加</a> -->
		</td>
	</tr>
	<tr>
		<th width="20%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险项目
		</th>
		<th width="20%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险期间
		</th>
		<th width="10%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险费率
		</th>
		<th width="18%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			保险费用
		</th>
		<th width="27%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			备注
		</th>
		<th width="5%" style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			操作
		</th>
	</tr>
	<c:set  var="insureTotal" value="0"></c:set>
	<c:forEach items="${paylist.payInusres }" var="item">
		<tr>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<select id="INSURE_ITEM0" name="INSURE_ITEM">
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
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="START_DATE0" name="INSURE_START_DATE" size="11"
					value="${item.START_DATE }" />
				到
				<input id="END_DATE0" name="INSURE_END_DATE" size="11"
					value="${item.END_DATE }" />
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="INSURE_RATE0" name="INSURE_RATE" size="4"
					value="${item.INSURE_RATE }">
				%
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input class="input_right" id="INSURE_PRICE0" name="INSURE_PRICE" onchange="changeField('INSURE_PRICE',this);" 
					size="15"
					value="<fmt:formatNumber value="${item.INSURE_PRICE }" type="currency" />">
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="INSURE_MEMO0" name="INSURE_MEMO" size="25"
					value="${item.MEMO }">
			</td>
			<td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				<img src="${ctx }/images/u103.gif"><a href="javascript:void(0)" onclick="deleteInsureItemRow.call(this)">删除</a>
				<input type="hidden" name="RECI_ID" value="${item.RECI_ID }" id="RECI_ID0">
			</td>
		</tr>
		<c:set  var="insureTotal" value="${insureTotal + item.INSURE_PRICE}"></c:set>
	</c:forEach>
	<tr>
		<td colspan="4" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			
			合计（大写）：<!--  <script type="text/javascript">document.write(atoc(${insureTotal}));</script>-->
			<span id="showInsureTotalSpanUpper">
			
			</span>
		</td>
		<td colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
			（小写：
			<span id="showInsureTotalSpan">
			<fmt:formatNumber type="currency" value="${insureTotal }" />
			</span>
			）
		</td>
	</tr>

</table>
