<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="14" style="text-align:left ;height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;融资租赁还款计划</b>
		</td>
		<td   class="ui-state-default ui-th-ltr zc_grid_head">
			<%-- <input  type="button" value="详细" onclick="paylineDetail('${RECP_ID}');" class="ui-state-default ui-corner-all"> --%>
		</td>
	</tr>
	<tr>
		<!-- <td height="30" rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			不等额
		</td> -->
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
			<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">合同</c:if>
			<c:if test="${paylist.TAX_PLAN_CODE ne '4' and paylist.TAX_PLAN_CODE ne '6' and paylist.TAX_PLAN_CODE ne '7' and paylist.TAX_PLAN_CODE ne '8'}">预期</c:if>租金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">合同当期</c:if>本金
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
			<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			合同当期未税本金
			</td>
			<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			税金
			</td>
		</c:if>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">合同当期</c:if>利息
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE eq '3' or paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
			<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
				未税利息
			</td>
			<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
				税金
			</td>
		</c:if>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			剩余本金
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE ne '4' and paylist.TAX_PLAN_CODE ne '6' and paylist.TAX_PLAN_CODE ne '7' and paylist.TAX_PLAN_CODE ne '8'}">
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			<c:if test="${paylist.TAX_PLAN_CODE eq '1' or paylist.TAX_PLAN_CODE eq '5'}">营业税</c:if><c:if test="${paylist.TAX_PLAN_CODE eq '3'}">增值税</c:if>
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			收入
		</td>
		</c:if>
	</tr>
	<tr>
		<td style="text-align: center;height: 20px;" class="ui-state-default ui-th-ltr zc_grid_head">
			（年/月/日）
		</td>
	</tr>
	<c:set value="" var="footDate"></c:set>
		<c:set value="0" var="TOTAL_IRR_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_IRR_PRICE"></c:set>
	<c:set value="0" var="TOTAL_SALES_TAX"></c:set>
	<c:set value="0" var="TOTAL_MONTH_PRICE"></c:set>
	<c:set value="0" var="TOTAL_OWN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_REN_PRICE"></c:set>
	<c:set value="0" var="TOTAL_INCOME"></c:set>
	<c:if test="${paylist.TAX_PLAN_CODE eq '3'}">
		<c:set value="0" var="TOTAL_REN_PRICE_WITHOUT_TAX"></c:set>
		<c:set value="0" var="REN_TAX"></c:set>
	</c:if>
	<%Map res=(Map)request.getAttribute("paylist");
		List resultList=(List)res.get("paylines");
		DecimalFormat df=new DecimalFormat("#.00");
		double total=0;
		double taxTotal=0;
		
		double total1=0;
		double taxTotal1=0;
		for(int i=0;i<resultList.size();i++) {
			total=total+Double.valueOf(df.format(Double.valueOf(((Map)resultList.get(i)).get("REN_PRICE").toString())/1.17).toString());
			taxTotal=taxTotal+Double.valueOf(df.format(Double.valueOf(((Map)resultList.get(i)).get("REN_PRICE").toString())/1.17*0.17).toString());
			
			total1=total1+Double.valueOf(df.format(Double.valueOf(((Map)resultList.get(i)).get("OWN_PRICE").toString())/1.17).toString());
			taxTotal1=taxTotal1+Double.valueOf(df.format(Double.valueOf(((Map)resultList.get(i)).get("OWN_PRICE").toString())/1.17*0.17).toString());
		}
		total=Double.valueOf(df.format(total));
		taxTotal=Double.valueOf(df.format(taxTotal));
		
		total1=Double.valueOf(df.format(total1));
		taxTotal1=Double.valueOf(df.format(taxTotal1));
	%>
	<c:forEach items="${paylist.paylines }" var="item" varStatus="status">
		<c:set var="bgcolorClass" value=""></c:set>
		<c:if test="${(item.IRR_MONTH_PRICE-item.REDUCE_OWN_PRICE)==0}">
			<c:set var="bgcolorClass" value="class='kk'"></c:set>
		</c:if>
		<tr>
			<%-- <td  ${bgcolorClass} style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${item.LOCKED eq 1 }">不等额</c:if>&nbsp;
			</td> --%>
			<td ${bgcolorClass} style="text-align: center;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
				${item.PERIOD_NUM}
			</td>
			<td ${bgcolorClass} style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd" />
				<c:set value="${item.PAY_DATE }" var="footDate"></c:set>
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_MONTH_PRICE }" type="currency" />
			</td>
			<%-- <td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.IRR_PRICE }" type="currency" />
			</td> --%>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.MONTH_PRICE }" type="currency" />
			</td>
			<td  ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE }" type="currency" />
			</td>
			<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
			<td  ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE/1.17 }" type="currency" />
			</td>
			<td  ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.OWN_PRICE-item.OWN_PRICE/1.17 }" type="currency" />
			</td>
			</c:if>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE }" type="currency" />
			</td>
			<c:if test="${paylist.TAX_PLAN_CODE eq '3' or paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
			<td ${bgcolorClass} style="text-align: right;" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE/1.17 }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right;" class="ui-widget-content jqgrow ui-row-ltr">
				<%-- <fmt:formatNumber value="${item.REN_PRICE/1.17*0.17 }" type="currency" /> --%>
				<fmt:formatNumber value="${item.REN_PRICE-item.REN_PRICE/1.17 }" type="currency" />
			</td>
			</c:if>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.LAST_PRICE }" type="currency" />
			</td>
			<c:if test="${paylist.TAX_PLAN_CODE ne '4' and paylist.TAX_PLAN_CODE ne '6' and paylist.TAX_PLAN_CODE ne '7' and paylist.TAX_PLAN_CODE ne '8'}">
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.SALES_TAX }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE - item.SALES_TAX }" type="currency" />
			</td>
			</c:if>
		</tr>
		<c:set value="${TOTAL_IRR_MONTH_PRICE + item.IRR_MONTH_PRICE  }" var="TOTAL_IRR_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_IRR_PRICE + item.IRR_PRICE }" var="TOTAL_IRR_PRICE"></c:set>
		<c:set value="${TOTAL_SALES_TAX + item.SALES_TAX }" var="TOTAL_SALES_TAX"></c:set>
		<c:set value="${TOTAL_MONTH_PRICE + item.MONTH_PRICE }" var="TOTAL_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_OWN_PRICE +  item.OWN_PRICE}" var="TOTAL_OWN_PRICE"></c:set>
		<c:set value="${TOTAL_REN_PRICE + item.REN_PRICE }" var="TOTAL_REN_PRICE"></c:set>
		<c:set value="${TOTAL_INCOME + item.REN_PRICE - item.SALES_TAX }" var="TOTAL_INCOME"></c:set>
		<c:if test="${paylist.TAX_PLAN_CODE eq '3'}">
			<c:set value="${item.REN_PRICE/1.17 +TOTAL_REN_PRICE_WITHOUT_TAX}" var="TOTAL_REN_PRICE_WITHOUT_TAX"></c:set>
			<c:set value="${item.REN_PRICE/1.17*0.17 +REN_TAX}" var="REN_TAX"></c:set>
		</c:if>
	</c:forEach>
		<tr>
		<td colspan="2" style="text-align: center;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>合计:</b>
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp;<fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE}" type="currency" />	
		</td>
		<%-- <td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_IRR_PRICE}" type="currency" />	
		</td> --%>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_MONTH_PRICE}" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_OWN_PRICE }" type="currency" />
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE eq '4' or paylist.TAX_PLAN_CODE eq '6' or paylist.TAX_PLAN_CODE eq '7' or paylist.TAX_PLAN_CODE eq '8'}">
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp; <fmt:formatNumber value="<%=total1 %>" type="currency" />
			</td>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="<%=taxTotal1 %>" type="currency" />
			</td>
		</c:if>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE eq '3' or paylist.TAX_PLAN_CODE eq '4'}">
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp; <fmt:formatNumber value="<%=total %>" type="currency" /><%-- <fmt:formatNumber value="${TOTAL_REN_PRICE_WITHOUT_TAX }" type="currency" /> --%>  
			</td>
			<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp;<fmt:formatNumber value="<%=taxTotal %>" type="currency" /><%-- <fmt:formatNumber value="${REN_TAX }" type="currency" /> --%>
			</td>
		</c:if>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<c:if test="${paylist.TAX_PLAN_CODE ne '4' and paylist.TAX_PLAN_CODE ne '6' and paylist.TAX_PLAN_CODE ne '7' and paylist.TAX_PLAN_CODE ne '8'}">
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_SALES_TAX }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_INCOME }" type="currency" />
		</td>
		</c:if>
	</tr>
</table>



