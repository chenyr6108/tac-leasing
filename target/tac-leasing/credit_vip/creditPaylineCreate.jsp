<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
$selectPayline = {
	allOrNot : function (obj) {
			$("input[name='MONTH_PRICE']").attr("disabled",!obj.checked);
			$("input[name='PERIOD_NUM']").attr("checked",obj.checked);
		}
};
</script>
<table width="982" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="11" style="text-align:left ;height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;融资租赁还款计划</b>
		</td>
		<td  class="ui-state-default ui-th-ltr zc_grid_head">
			<%-- <input  type="button" value="详细" onclick="submitCalCulate('${5}','2');" class="ui-state-default ui-corner-all"> --%>
		</td>
	</tr>
	<tr>
		<td height="30" rowspan="2" style="text-align: center;font-size:14px;display: none;" class="ui-state-default ui-th-ltr zc_grid_head">
			不等额<br/><input type="checkbox" name="checkboxAll"  onclick="$selectPayline.allOrNot(this);" />
		</td>
		<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			期次
		</td>
		<td style="text-align: center;height: 20px;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			支付时间
		</td>
		<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			应收租金
		</td>
		<!-- <td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			净现金流
		</td> -->
		<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">合同</c:if><c:if test="${paylist.TAX_PLAN_CODE ne '4'}">预期</c:if>租金
		</td>
		<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">合同当期</c:if>本金
		</td>
		<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">合同当期</c:if>利息
		</td>
		<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			剩余本金
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
			<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
				增值税
			</td>
			<!-- <td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
				城建稅費
			</td> --><td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
				實際支付增值稅
			</td>
			<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
				进项税余额
			</td>
		</c:if>
		<c:if test="${paylist.TAX_PLAN_CODE ne '4'}">
			<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
				<c:if test="${paylist.TAX_PLAN_CODE eq '1'}">营业税</c:if><c:if test="${paylist.TAX_PLAN_CODE eq '3'}">增值税</c:if>
			</td>
			<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
				收入
			</td>
			<td rowspan="2" style="text-align: center;font-size:14px;" class="ui-state-default ui-th-ltr zc_grid_head">
				实际本金
			</td>
		</c:if>
	</tr>
	<tr>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			（年/月/日）
		</td>
	</tr>
	<c:set value="" var="footDate"></c:set>
	<c:set value="0" var="each_price"></c:set>
	<c:set value="0" var="TOTAL_MONTH_PRICE"></c:set>
	<c:set value="0" var="first_insure_price"></c:set>
	<c:set value="0" var="total_insure_price"></c:set>
	<c:set value="0" var="TOTAL_OWN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_REN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_INCOME"></c:set>
	<c:set value="0" var="TOTAL_IRR_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_IRR_PRICE"></c:set>
	<c:set value="0" var="TOTAL_SALES_TAX"></c:set>
	<c:set value="0" var="realownprice"></c:set>
	<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
		<c:set value="0" var="TOTAL_TAX_ADD_PRICE"></c:set>
		<c:set value="0" var="TOTAL_PAY_TAX_ADD_PRICE"></c:set>
		<c:set value="0" var="TOTAL_BUILD_TAX"></c:set>
	</c:if>
	<c:forEach items="${paylist.paylines }" var="item"  varStatus="status">
		<c:if test="${status.first}">
			<c:set value="${item.IRR_MONTH_PRICE }" var="each_price"></c:set>
			<c:set value="${item.MONTH_PRICE }" var="each2_price"></c:set>
			<c:set value="${item.INSURE_PRICE }" var="first_insure_price"></c:set>
		</c:if>
		<tr>
			<td style="text-align: center;height: 24px;font-size:14px;display: none;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="item_lock_${item.PERIOD_NUM}" type="checkbox" <c:if test="${item.LOCKED eq 1 }">checked="checked"</c:if>
					name="PERIOD_NUM" value="${item.PERIOD_NUM}" 
					onclick="document.getElementById('item_monthPrice_${item.PERIOD_NUM}').disabled=!this.checked;" />	&nbsp;
			</td>
			<td style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.PERIOD_NUM}
			</td>
			<td style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd" />
				<c:set value="${item.PAY_DATE }" var="footDate"></c:set>	&nbsp;
			</td>
			<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<input id="item_monthPrice_${item.PERIOD_NUM}" type="hidden" <c:if test="${item.LOCKED eq 0 }">disabled</c:if>
					name="MONTH_PRICE" class="input_right" autocomplete="off"
					value='<fmt:formatNumber type="currency" value="${item.IRR_MONTH_PRICE}"/>'
					 />	<fmt:formatNumber type="currency" value="${item.IRR_MONTH_PRICE}"/>&nbsp;
			</td>
			<%-- <td align="right" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_PRICE }" type="currency" />&nbsp;
			</td> --%>
			<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber type="currency" value="${item.MONTH_PRICE}"/>&nbsp;
			</td>
			<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE }" type="currency" />&nbsp;
			</td>
			<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE }" type="currency" />&nbsp;
			</td>
			<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.LAST_PRICE<0?0:item.LAST_PRICE }" type="currency" />&nbsp;
			</td>
			<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.TAX_ADD_PRICE }" type="currency" />&nbsp;
			</td>
			<%-- <td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.BUILD_TAX }" type="currency" />&nbsp;
			</td> --%>
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.PAY_TAX_ADD_PRICE }" type="currency" />&nbsp;
			</td>
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.INCOME_TAX_VALUE<0?0:item.INCOME_TAX_VALUE }" type="currency" />&nbsp;
			</td>
			</c:if>
			<c:if test="${paylist.TAX_PLAN_CODE ne '4'}">
				<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<fmt:formatNumber value="${item.SALES_TAX }" type="currency" />&nbsp;
				</td>
				<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<fmt:formatNumber value="${item.REN_PRICE - item.SALES_TAX }" type="currency" />&nbsp;
				</td>
				<td align="right" style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
					<fmt:formatNumber value="${item.REAL_OWN_PRICE }" type="currency" />
				</td>
			</c:if>
		</tr>
		<c:set value="${item.INSURE_PRICE+total_insure_price }" var="total_insure_price"></c:set>
		<c:set  value="${TOTAL_IRR_MONTH_PRICE + item.IRR_MONTH_PRICE }" var="TOTAL_IRR_MONTH_PRICE"></c:set>
		<c:set  value="${TOTAL_IRR_PRICE + item.IRR_PRICE }" var="TOTAL_IRR_PRICE"></c:set>
		<c:set value="${TOTAL_MONTH_PRICE + item.MONTH_PRICE }" var="TOTAL_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_OWN_PRICE +  item.OWN_PRICE}" var="TOTAL_OWN_PRICE"></c:set>
		<c:set value="${TOTAL_REN_PRICE + item.REN_PRICE }" var="TOTAL_REN_PRICE"></c:set>
		<c:if test="${paylist.TAX_PLAN_CODE ne '4'}">
		<c:set value="${TOTAL_SALES_TAX + item.SALES_TAX }" var="TOTAL_SALES_TAX"></c:set>
		<c:set value="${TOTAL_INCOME + item.REN_PRICE - item.SALES_TAX }" var="TOTAL_INCOME"></c:set>
		<c:set value="${realownprice + item.REAL_OWN_PRICE }" var="realownprice"></c:set>
		</c:if>
		<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
			<c:set value="${TOTAL_TAX_ADD_PRICE + item.TAX_ADD_PRICE }" var="TOTAL_TAX_ADD_PRICE"></c:set>
			<c:set value="${TOTAL_PAY_TAX_ADD_PRICE + item.PAY_TAX_ADD_PRICE }" var="TOTAL_PAY_TAX_ADD_PRICE"></c:set>
			<c:set value="${TOTAL_BUILD_TAX + item.BUILD_TAX }" var="TOTAL_BUILD_TAX"></c:set>
		</c:if>
	</c:forEach>
	 <tr>
		<td colspan="2" align="right;font-size:14px;" style="text-align: right" class="ui-state-default ui-th-ltr zc_grid_head">
			<b style="text-align: center;">合计:</b>
		</td>
		<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			  <fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE}" type="currency" />&nbsp;
		</td>
		<%-- <td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			  &nbsp; <fmt:formatNumber value="${TOTAL_IRR_PRICE}" type="currency" />
		</td> --%>
		<td   style="text-align: right;height: 24px;;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${TOTAL_MONTH_PRICE}" type="currency" />&nbsp;
		</td>
		<td   style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${TOTAL_OWN_PRICE }" type="currency" />&nbsp;
		</td>
		<td   style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />&nbsp;
		</td>
		<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${TOTAL_TAX_ADD_PRICE }" type="currency" />&nbsp;
			</td>
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${TOTAL_BUILD_TAX }" type="currency" />&nbsp;
			</td>
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${TOTAL_PAY_TAX_ADD_PRICE }" type="currency" />&nbsp;
			</td>
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;
			</td>
		</c:if>
		<c:if test="${paylist.TAX_PLAN_CODE ne '4'}">
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				 &nbsp; <fmt:formatNumber value="${TOTAL_SALES_TAX }" type="currency" />
			</td>
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp; <fmt:formatNumber value="${TOTAL_INCOME }" type="currency" />
			</td>
			<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp; <!--<fmt:formatNumber value="${realownprice }" type="currency" />-->
			</td> 
		</c:if>
	</tr>
</table>
<input type='hidden' id="TOTAL_SALES_TAX" value="<fmt:formatNumber value="${TOTAL_SALES_TAX}" type="currency" />" />
<input type='hidden' id="STAMP_TAX_PRICE" value="<fmt:formatNumber value="${paylist.STAMP_TAX_PRICE }" type="currency" />" />
<c:if test="${paylist.TAX_PLAN_CODE eq '4'}">
	<input type='hidden' id="total_insure_price" value="<fmt:formatNumber value="${paylist.total_insure_price}" type="currency" />" />
	<input type='hidden' id="first_insure_price" value="<fmt:formatNumber value="${paylist.first_insure_price}" type="currency" />" />
</c:if>
<c:if test="${paylist.TAX_PLAN_CODE ne '4'}">
<input type='hidden' id="total_insure_price" value="<fmt:formatNumber value="${total_insure_price}" type="currency" />" />
<input type='hidden' id="first_insure_price" value="<fmt:formatNumber value="${first_insure_price}" type="currency" />" />
</c:if>
<input type="hidden" id="each_price" value="<fmt:formatNumber value="${each_price }" type="currency" />">
<input type="hidden" id="each2_price"  value="<fmt:formatNumber value="${each2_price }" type="currency" />">
<input type="hidden" id="total_price" value="<fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE }" type="currency" />">
<input type="hidden" id="total_ren_price" value="<fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />">
<input type="hidden" id="base_rate" value="${paylist.JIZHUNLILV }">
<input type="hidden" id="cust_tr" value="${paylist.TR_RATE}"> 
<input type="hidden" id="TR_IRR_RATE" value="${paylist.TR_IRR_RATE}"> 
<input type="hidden" id="STAMP_TAX_INSUREPRIC" value="${paylist.STAMP_TAX_INSUREPRIC}"> 