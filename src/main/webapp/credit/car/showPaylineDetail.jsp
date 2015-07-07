<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
	</head>
	<body>
		<center>
			<form action="${ctx }/servlet/defaultDispatcher">
			<br>
				<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
					<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;支付表详细</span>
				   	</div>
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          			<div class="zc_grid_body jqgrowleft">
     
     
     <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr>
		<td colspan="20" style="text-align:left ;height: 26px;"  class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;融资租赁还款计划</b>
		</td>
	</tr>
	<tr>
		<td height="30" rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			不等额
		</td>
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
			预期租金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			本金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			利息
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			剩余本金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			营业税
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			收入
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			保证金
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			保险费
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			成本
		</td>
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
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
		
		<td rowspan="2" style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head">
			利差
		</td>
		-->
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
	<c:set value="0" var="TOTAL_DEPOSIT_PRICE"></c:set>
	<c:set value="0" var="TOTAL_INSURE_PRICE"></c:set>
	<c:set value="0" var="TOTAL_COST_PRICE"></c:set>
	<c:set value="0" var="realownprice"></c:set>
	<c:set value="0" var="TOTAL_PV_PRICE"></c:set>
	<c:set value="0" var="NETCURRENTFINANCE"></c:set>
	<c:set value="0" var="NETFINANCE"></c:set>
	<c:set value="0" var="CURRENTRENPRICE"></c:set>
	<c:set value="0" var="CURRENTFINANCECOSTREN"></c:set>
	
	<c:forEach items="${paylist.paylines }" var="item" varStatus="status">
		<c:set var="bgcolorClass" value=""></c:set>
		<c:if test="${(item.REDUCE_OWN_PRICE+item.REDUCE_REN_PRICE+item.REDUCE_OTHER_PRICE+item.REDUCE_LOSS_PRICE)>0}">
			<c:set var="bgcolorClass" value="class='kk'"></c:set>
		</c:if>
		<tr>
			<td  ${bgcolorClass} style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${item.LOCKED eq 1 }">不等额</c:if>&nbsp;
			</td>
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
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.LAST_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.SALES_TAX }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REN_PRICE - item.SALES_TAX }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.DEPOSIT_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.INSURE_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.COST_PRICE }" type="currency" />
			</td>
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				<fmt:formatNumber value="${item.REAL_OWN_PRICE }" type="currency" />
			</td>
			<!-- Add by Michael 2012 01 /15净本金余额 -->
			<!-- 
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${item.NETCURRENTFINANCE }" type="currency" />
		</td>		
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${item.NETFINANCE }" type="currency" />
		</td>		
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${item.CURRENTRENPRICE }" type="currency" />
		</td>	
		<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${item.CURRENTFINANCECOSTREN }" type="currency" />
		</td>
		
			<td ${bgcolorClass} style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
				&nbsp;<fmt:formatNumber value="${item.PV_PRICE }" type="currency" />
			</td>
			-->
		</tr>
		<c:set value="${TOTAL_IRR_MONTH_PRICE + item.IRR_MONTH_PRICE  }" var="TOTAL_IRR_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_IRR_PRICE + item.IRR_PRICE }" var="TOTAL_IRR_PRICE"></c:set>
		<c:set value="${TOTAL_SALES_TAX + item.SALES_TAX }" var="TOTAL_SALES_TAX"></c:set>
		<c:set value="${TOTAL_MONTH_PRICE + item.MONTH_PRICE }" var="TOTAL_MONTH_PRICE"></c:set>
		<c:set value="${TOTAL_OWN_PRICE +  item.OWN_PRICE}" var="TOTAL_OWN_PRICE"></c:set>
		<c:set value="${TOTAL_REN_PRICE + item.REN_PRICE }" var="TOTAL_REN_PRICE"></c:set>
		<c:set value="${TOTAL_INCOME + item.REN_PRICE - item.SALES_TAX }" var="TOTAL_INCOME"></c:set>
		<c:set value="${TOTAL_DEPOSIT_PRICE +  item.DEPOSIT_PRICE}" var="TOTAL_DEPOSIT_PRICE"></c:set>
		<c:set value="${TOTAL_INSURE_PRICE + item.INSURE_PRICE }" var="TOTAL_INSURE_PRICE"></c:set>
		<c:set value="${TOTAL_COST_PRICE + item.COST_PRICE  }" var="TOTAL_COST_PRICE"></c:set>
		<c:set value="${realownprice + item.REAL_OWN_PRICE }" var="realownprice"></c:set>
		<c:set value="${TOTAL_PV_PRICE + item.PV_PRICE }" var="TOTAL_PV_PRICE"></c:set>
		
	<c:set value="${NETCURRENTFINANCE + item.NETCURRENTFINANCE }" var="NETCURRENTFINANCE"></c:set>
	<c:set value="${NETFINANCE + item.NETFINANCE }" var="NETFINANCE"></c:set>
	<c:set value="${CURRENTRENPRICE + item.CURRENTRENPRICE }" var="CURRENTRENPRICE"></c:set>
	<c:set value="${CURRENTFINANCECOSTREN + item.CURRENTFINANCECOSTREN }" var="CURRENTFINANCECOSTREN"></c:set>
		
	</c:forEach>
		<tr>
		<td colspan="3" style="text-align: center;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>合计:</b>
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp;<fmt:formatNumber value="${TOTAL_IRR_MONTH_PRICE}" type="currency" />	
		</td>
		<%-- <td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_IRR_PRICE}" type="currency" />	
		</td> --%>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp;<fmt:formatNumber value="${TOTAL_MONTH_PRICE}" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp;<fmt:formatNumber value="${TOTAL_OWN_PRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			 &nbsp;<fmt:formatNumber value="${TOTAL_REN_PRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_SALES_TAX }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_INCOME }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_DEPOSIT_PRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_INSURE_PRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_COST_PRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<!-- <fmt:formatNumber value="${realownprice }" type="currency" />-->
		</td>
		<!-- 
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${NETCURRENTFINANCE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${NETFINANCE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${CURRENTRENPRICE }" type="currency" />
		</td>
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${CURRENTFINANCECOSTREN }" type="currency" />
		</td>	
				
		<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;<fmt:formatNumber value="${TOTAL_PV_PRICE }" type="currency" />
		</td>
		-->	
	</tr>
	<tr>
		<td colspan="3" style="height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;印花税:</b>
		</td>
		<td colspan="13" style="height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;&nbsp;<fmt:formatNumber value="${paylist.STAMP_TAX_PRICE }" type="currency" />
		</td>
	</tr>
	<tr>
		<td colspan="3" style="height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;期初保证金收入:</b>
		</td>
		<td colspan="13" style="height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;&nbsp;<fmt:formatNumber value="${paylist.PLEDGE_AVE_PRICE + paylist.PLEDGE_LAST_PRICE}" type="currency" />
		</td>
	</tr>
	<tr>
		<td colspan="3" style="height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;期末保证金返还:</b>
		</td>
		<td colspan="13" style="height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;&nbsp;<fmt:formatNumber value="${paylist.PLEDGE_BACK_PRICE }" type="currency" />
		</td>
	</tr>
	<!--
	<tr>
		<td colspan="3" style="height: 26px;" class="ui-state-default ui-th-ltr zc_grid_head">
			<b>&nbsp;&nbsp;利差额:</b>
		</td>
		<td colspan="13" style="height: 26px;" class="ui-widget-content jqgrow ui-row-ltr">
			&nbsp;&nbsp;<fmt:formatNumber value="${TOTAL_PV_PRICE }" type="currency" />
		</td>
	</tr>
	-->	
	<tr>
		<td colspan="16" align="center" class="ui-widget-content jqgrow ui-row-ltr">
			<input type="button" name="gobackBut" onclick="javascript:history.go(-1);" value="返  回" class="ui-state-default ui-corner-all">
		</td>
	</tr>
</table>      				
								
					
							</div>
				</div>
							</td>
						</tr>
				</table>
			</form>
		</center>
	</body>
</html>

