<%@ page language="java" pageEncoding="UTF-8"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="12" style="text-align:left ;height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b style="font-size: 14px;">&nbsp;&nbsp;融资租赁还款计划</b>
		</td>
		<td   class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
			<input  type="button" value="详细" onclick="submitCalCulate('${5}','2');" class="ui-state-default ui-corner-all">
		</td>
	</tr>
	<tr>
		<td height="30" rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			不等额
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			期次
		</td>
		<td style="text-align: center;height: 20px;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			支付时间
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			应收含税租金
		</td>		
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			应收未税租金
		</td>
		<!-- <td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			净现金流
		</td> -->
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			预期租金
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			本金
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			利息
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			剩余本金
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			增值税
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			收入
		</td>
		<td rowspan="2" style="text-align: center;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			实际本金
		</td>
		<!-- Add by Michael 2012 01 /15净本金余额 -->
		<!--
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			当期净本金
		</td>		
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			当期净本金余额
		</td>		
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			当期利息
		</td>	
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			资金成本息
		</td>	
		-->
	</tr>
	<tr>
		<td style="text-align: center;height: 20px;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			（年/月/日）
		</td>
	</tr>
	<c:set value="" var="footDate"></c:set>
	<c:set value="0" var="each_price"></c:set>
	<c:set value="0" var="TOTAL_IRR_MONTH_PRICE_TAX"></c:set>
	<c:set value="0" var="TOTAL_VALUE_ADDED_TAX"></c:set>
	<c:set value="0" var="first_insure_price"></c:set>
	<c:set value="0" var="total_insure_price"></c:set>
	<c:set value="0" var="TOTAL_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_OWN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_REN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_INCOME"></c:set>
	<c:set value="0" var="TOTAL_IRR_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_IRR_PRICE"></c:set>
	<c:set value="0" var="TOTAL_SALES_TAX"></c:set>
	<c:set value="0" var="realownprice"></c:set>
	<c:forEach items="${paylist.paylines }" var="item" varStatus="status">
		<c:set var="bgcolorClass" value=""></c:set>
		<c:if test="${(item.REDUCE_OWN_PRICE+item.REDUCE_REN_PRICE+item.REDUCE_OTHER_PRICE+item.REDUCE_LOSS_PRICE)>0}">
			<c:set var="bgcolorClass" value="class='kk'"></c:set>
		</c:if>
		<c:if test="${status.first}">
			<c:set value="${item.IRR_MONTH_PRICE }" var="each_price"></c:set>
			<c:set value="${item.MONTH_PRICE }" var="each2_price"></c:set>
			<c:set value="${item.INSURE_PRICE }" var="first_insure_price"></c:set>			
		</c:if>
		<tr>
			<td  ${bgcolorClass} style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${item.LOCKED eq 1 }">不等额</c:if>&nbsp;
			</td>
			<td ${bgcolorClass} style="text-align: center;height: 24px;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.PERIOD_NUM}
			</td>
			<td ${bgcolorClass} style="text-align: center;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd" />
				<c:set value="${item.PAY_DATE }" var="footDate"></c:set>
			</td>
			<td ${bgcolorClass}  style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_MONTH_PRICE+item.VALUE_ADDED_TAX }" type="currency" />&nbsp;
			</td>				
			<td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_MONTH_PRICE }" type="currency" />
			</td>
			<%-- <td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_PRICE }" type="currency" />
			</td> --%>
			<td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.MONTH_PRICE }" type="currency" />
			</td>
			<td  ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.LAST_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.VALUE_ADDED_TAX }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE - item.SALES_TAX }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REAL_OWN_PRICE }" type="currency" />
			</td>
			<!-- Add by Michael 2012 01 /15净本金余额 -->
		<!--
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${item.NETCURRENTFINANCE }" type="currency" />
		</td>		
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${item.NETFINANCE }" type="currency" />
		</td>		
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${item.CURRENTRENPRICE }" type="currency" />
		</td>	
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			<fmt:formatNumber value="${item.CURRENTFINANCECOSTREN }" type="currency" />
		</td>
		 -->
		</tr>
		<c:set value="${item.INSURE_PRICE+total_insure_price }" var="total_insure_price"></c:set>
		<c:set  value="${TOTAL_IRR_MONTH_PRICE + item.IRR_MONTH_PRICE }" var="TOTAL_IRR_MONTH_PRICE"></c:set>
		<c:set  value="${TOTAL_IRR_PRICE + item.IRR_PRICE }" var="TOTAL_IRR_PRICE"></c:set>
		<c:set value="${TOTAL_MONTH_PRICE + item.MONTH_PRICE }" var="TOTAL_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_OWN_PRICE +  item.OWN_PRICE}" var="TOTAL_OWN_PRICE"></c:set>
		<c:set value="${TOTAL_REN_PRICE + item.REN_PRICE }" var="TOTAL_REN_PRICE"></c:set>
		<c:set value="${TOTAL_SALES_TAX + item.SALES_TAX }" var="TOTAL_SALES_TAX"></c:set>
		<c:set value="${TOTAL_INCOME + item.REN_PRICE - item.SALES_TAX }" var="TOTAL_INCOME"></c:set>
		<c:set value="${realownprice + item.REAL_OWN_PRICE }" var="realownprice"></c:set>
		<c:set value="${TOTAL_IRR_MONTH_PRICE_TAX+item.IRR_MONTH_PRICE + item.VALUE_ADDED_TAX }" var="TOTAL_IRR_MONTH_PRICE_TAX"></c:set>
		<c:set value="${TOTAL_VALUE_ADDED_TAX + item.VALUE_ADDED_TAX }" var="TOTAL_VALUE_ADDED_TAX"></c:set>
	</c:forEach>
		 <tr>
		<td colspan="3" style="text-align: center;height: 24px;font-size: 14px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>合计:</b>
		</td>
		<td style="text-align: right;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE_TAX}" type="currency" />
		</td>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE}" type="currency" />
		</td>
		<%-- <td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_IRR_PRICE}" type="currency" />
		</td> --%>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_MONTH_PRICE}" type="currency" />
		</td>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_OWN_PRICE }" type="currency" />
		</td>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />
		</td>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_VALUE_ADDED_TAX }" type="currency" />
		</td>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp; <fmt:formatNumber value="${TOTAL_INCOME }" type="currency" />
		</td>
		<td style="text-align: right;font-size: 14px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp; <!--<fmt:formatNumber value="${realownprice }" type="currency" />-->
		</td>
	</tr> 
</table>
<input type='hidden' id="TOTAL_SALES_TAX" value="<fmt:formatNumber value="${TOTAL_SALES_TAX}" type="currency" />" />
<input type='hidden' id="STAMP_TAX_PRICE" value="<fmt:formatNumber value="${paylist.STAMP_TAX_PRICE }" type="currency" />" />
<input type='hidden' id="first_insure_price" value="<fmt:formatNumber value="${first_insure_price}" type="currency" />" />
<input type='hidden' id="total_insure_price" value="<fmt:formatNumber value="${total_insure_price}" type="currency" />" />
<input type="hidden" id="each_price"  value="<fmt:formatNumber value="${each_price }" type="currency" />">
<input type="hidden" id="each2_price" value="<fmt:formatNumber value="${each2_price }" type="currency" />">
<input type="hidden" id="total_price" value="<fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE }" type="currency" />">
<input type="hidden" id="total_ren_price" value="<fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />">
<input type="hidden" id="base_rate" value="${paylist.JIZHUNLILV }"> 
<input type="hidden" id="cust_tr" value="${paylist.TR_RATE}"> 
<input type="hidden" id="TR_IRR_RATE" value="${paylist.TR_IRR_RATE}"> 
<input type="hidden" id="STAMP_TAX_INSUREPRIC" value="${paylist.STAMP_TAX_INSUREPRIC}"> 