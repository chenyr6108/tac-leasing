<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
		<title>担保人财务信息</title>	
<script type="text/javascript" src="${ctx }/credit/js/creditVoucherAndDebt2.js"></script>
 <!-- 财务信息    baiman+ -->
	 <input type="hidden" name="statuscount" id="statuscount" value="${status.count }">
	 <input type="hidden" name="lengthpc" id="lengthpc" value="${fn:length(corpList) }">
	  <c:if test="${not empty objlist}">
	 <c:forEach items="${objlist}" var="obj" varStatus="objcount">
	    <c:if test="${obj.objcount==(status.count*3-2)}">
	    <c:set var="obj1" value="${obj }"   />
	    </c:if>
	     <c:if test="${obj.objcount==(status.count*3-1)}">
	    <c:set var="obj2" value="${obj }"   />
	    </c:if>
	     <c:if test="${obj.objcount==(status.count*3)}">
	    <c:set var="obj3" value="${obj }"   />
	    </c:if>
	 </c:forEach>  
	  </c:if>
    <c:if test="${not empty obj1}">
     <c:if test="${obj1.PJCCC_ID==item.PJCCC_ID}">
	<%@ include file="creditVoucherAndDebt.jsp"%>
	<%@ include file="creditVoucherAndDebt2.jsp"%>
     </c:if>
    </c:if>
	
	 <!-- 财务信息    baiman- -->
		
	<!--					<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<th width="19%" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
									项目名称
								</th>
								<th colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									财务情况说明 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位（千元）
								</th>
							</tr> 
							<tr>
								<td width="20%" class="ui-widget-content jqgrow ui-row-ltr">
									项目： 
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
									${v1.PROJECT_NAME} &nbsp;
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr"> 
								    ${v2.PROJECT_NAME} &nbsp;
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
									${v3.PROJECT_NAME} &nbsp;
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
									${v4.PROJECT_NAME} &nbsp;
								</td>
								<td width="20%" class="ui-widget-content jqgrow ui-row-ltr">
									备注： 
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									货币资金：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v1.MONEY_FUNDS}"/> &nbsp;
								</td>
								<td    style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v2.MONEY_FUNDS}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v3.MONEY_FUNDS}"/> &nbsp;
								</td>
								<td    style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v4.MONEY_FUNDS}"/> &nbsp;
								</td>
								<td      style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.MONEY_FUNDS}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									应收账款：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v1.ACCOUNTS_RECEIVABLE}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v2.ACCOUNTS_RECEIVABLE}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"> 
									<fmt:formatNumber  pattern="#,##0.00"  value="${v3.ACCOUNTS_RECEIVABLE}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v4.ACCOUNTS_RECEIVABLE}"/> &nbsp;
								</td>
								<td      style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.ACCOUNTS_RECEIVABLE} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									存货：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v1.STOCK}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v2.STOCK}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v3.STOCK}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v4.STOCK}"/> &nbsp;
								</td>
								<td  style="text-align: center"   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.STOCK}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									固定资产（净值）：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v1.CAPITAL_ASSERTS}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v2.CAPITAL_ASSERTS}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v3.CAPITAL_ASSERTS}"/> &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v4.CAPITAL_ASSERTS}"/> &nbsp;
								</td>
								<td   style="text-align: center"   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.CAPITAL_ASSERTS} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									总资产：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v1.TOTAL_ASSERTS}"/> &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v2.TOTAL_ASSERTS}"/> &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v3.TOTAL_ASSERTS}"/> &nbsp;
								</td>
								<td style="text-align: right" style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v4.TOTAL_ASSERTS}"/> &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.TOTAL_ASSERTS}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									短期借款：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v1.SHORTTIME_LOAN}"/> &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v2.SHORTTIME_LOAN}"/> &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v3.SHORTTIME_LOAN}"/> &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatNumber  pattern="#,##0.00"  value="${v4.SHORTTIME_LOAN}"/> &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.SHORTTIME_LOAN}  &nbsp;
								</td>
							</tr>
							<tr>
								<td   width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									应付账款：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.ACCOUNTS_PAYABLE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.ACCOUNTS_PAYABLE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.ACCOUNTS_PAYABLE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.ACCOUNTS_PAYABLE}"/>  &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.ACCOUNTS_PAYABLE}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									总负债：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.TOTAL_OWES}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.TOTAL_OWES}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.TOTAL_OWES}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.TOTAL_OWES}"/>  &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.TOTAL_OWES}   &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									实收资本：
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.CONTRIBUTED_CAPITAL}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.CONTRIBUTED_CAPITAL}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.CONTRIBUTED_CAPITAL}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.CONTRIBUTED_CAPITAL}"/>  &nbsp;
								</td>
								<td  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									  ${v5.CONTRIBUTED_CAPITAL}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									资本公积：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.CAPITAL_RESERVE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.CAPITAL_RESERVE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.CAPITAL_RESERVE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.CAPITAL_RESERVE}"/>  &nbsp;
								</td>
								<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.CAPITAL_RESERVE}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									未分配利润：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.UNDISTRIBUTED_PROFIT}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.UNDISTRIBUTED_PROFIT}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.UNDISTRIBUTED_PROFIT}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.UNDISTRIBUTED_PROFIT}"/>  &nbsp;
								</td>
								<td  style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									  ${v5.UNDISTRIBUTED_PROFIT}   &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									销售收入：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.SALES_REVENUE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.SALES_REVENUE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.SALES_REVENUE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.SALES_REVENUE}"/>  &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.SALES_REVENUE}   &nbsp;
								</td>
							</tr>
							<tr>
								<td   width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									销售成本：
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.COST_OF_MARKETING}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.COST_OF_MARKETING}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.COST_OF_MARKETING}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.COST_OF_MARKETING}"/>  &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									  ${v5.COST_OF_MARKETING}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									期间费用：
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.PERIOD_EXPENSE}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.PERIOD_EXPENSE}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.PERIOD_EXPENSE}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.PERIOD_EXPENSE}"/>  &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									  ${v5.PERIOD_EXPENSE} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									利润总额：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v1.TOTAL_PROFIT}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v2.TOTAL_PROFIT}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v3.TOTAL_PROFIT}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber  pattern="#,##0.00"  value="${v4.TOTAL_PROFIT}"/>  &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.TOTAL_PROFIT}   &nbsp;
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									资产负债率：
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v1.DEBTR}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v2.DEBTR}"/>  &nbsp;
								</td>
								<td style="text-align: right"class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v3.DEBTR}"/>  &nbsp;
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v4.DEBTR}"/>  &nbsp;
								</td>
								<td   style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									  ${v5.DEBTR}  &nbsp;
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									销售净利率：
								</td>
								<td style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v1.PROFIT_MARGIN}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v2.PROFIT_MARGIN}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v3.PROFIT_MARGIN}"/>  &nbsp;
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v4.PROFIT_MARGIN}"/>  &nbsp;
								</td>
								<td  style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									  ${v5.PROFIT_MARGIN} &nbsp;
								</td>
							</tr>
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									毛利率：
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v1.TTM}"/>  &nbsp;
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v2.TTM}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v3.TTM}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v4.TTM}"/>  &nbsp;
								</td>
								<td   style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									  ${v5.TTM}   &nbsp;
								</td>
							</tr>
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									销售增长率：
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v1.SALES_GROWTH}"/>  &nbsp;
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v2.SALES_GROWTH}"/>  &nbsp;
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v3.SALES_GROWTH}"/>  &nbsp;
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v4.SALES_GROWTH}"/>  &nbsp;
								</td>
								<td   style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.SALES_GROWTH}   &nbsp;
								</td>
							</tr>
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									净资产增长率：
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v1.NAGR}"/>  &nbsp;
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v2.NAGR}"/>  &nbsp;
								</td>
								<td  style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v3.NAGR}"/>  &nbsp;
								</td>
								<td style="text-align: right"  class="ui-widget-content jqgrow ui-row-ltr">
									 <fmt:formatNumber type="percent" value="${v4.NAGR}"/>  &nbsp;
								</td>
								<td   style="text-align: center"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v5.NAGR}   &nbsp;
								</td>
							</tr>
						</table>-->
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherProjectsTab">
							<tr>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									其他调查说明：
								</td>
								<td width="80%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
										<tr >
											<td    class="ui-widget-content jqgrow ui-row-ltr"> 
												&nbsp;
											 </td>
											<td    class="ui-widget-content jqgrow ui-row-ltr">
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="itemss" varStatus="stat">
								<c:if test="${itemss.STATE eq 2}">
									<tr>
										<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
											<input type="checkbox" disabled="disabled" name="otherProjects_check" id="otherProjects_check" value="${stat.count }"> 项目名称：
										</td>
										<td width="81%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											${itemss.PROJECT_NAME } &nbsp;
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
											内容：
										</td>
										<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											<pre>${itemss.PROJECT_CONTENT } &nbsp;</pre>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="pingshenyijianTab">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<b style="font-size: 14px;">名下资产</b>
								</td>
								<td colspan="3"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								&nbsp;
								</td>
							</tr>
							<c:forEach items="${corpProperty}" var="items" varStatus="s">
									  <c:if test="${item.PJCCC_ID eq items.VOUCH_ID }">
										<input type="hidden" name="ID" value="${items.ID }">
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td style="font-size: 14px;">房产名称</td>
											<td colspan="3" style="font-size: 14px;">${items.HOUSE_NAME }&nbsp;</td>
										</tr>
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td style="font-size: 14px;">房产坐落地点</td>
											<td width="30%" style="font-size: 14px;">${items.HOUSE_ADDRESS }&nbsp;</td>
											<td style="font-size: 14px;">面积</td>
											<td style="font-size: 14px;"> ${items.HOUSE_AREA }&nbsp;</td>
										</tr>
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td style="font-size: 14px;">国土证/房产证</td>
											<td width="30%" style="font-size: 14px;">${items.HOUSE_PROVE }&nbsp;</td>
											<td style="font-size: 14px;">他项权利</td>
											<td style="font-size: 14px;">${items.HOUSE_OTHERRIGHT }&nbsp;</td>
										</tr>
										<tr class="ui-widget-content jqgrow ui-row-ltr">
											<td style="font-size: 14px;">备注 </td>
											<td colspan="3" style="font-size: 14px;">${items.NOTES }&nbsp;</td>
										</tr>
									  </c:if>
							</c:forEach>
						</table>
						<c:if test="${not empty creditPriorProject}">
						<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="pingshenyijianTab">
							<tr>
								<td  class="ui-state-default ui-th-ltr zc_grid_head">
									<b style="font-size: 14px;">说明</b>
								</td>
								<td colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								&nbsp;
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="itemss" varStatus="stat">
								<c:if test="${itemss.STATE eq 3}">
									<tr>
										<td width="19%" height="50"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											意见：
										</td>
										<td   class="ui-widget-content jqgrow ui-row-ltr">
										<pre style="font-size: 14px;">${itemss.PROJECT_CONTENT } &nbsp;</pre>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					    </c:if>
						<c:if test="${empty creditPriorProject}">
						<table width="100%"  cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<b style="font-size: 14px;">说明</b>
								</td>
								<td colspan="5"    class="ui-widget-content jqgrow ui-row-ltr"> 
								&nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" height="50"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									意见：
								</td>
								<td colspan="5"    class="ui-widget-content jqgrow ui-row-ltr">
									 &nbsp;
								</td>
							</tr>
						</table>
						</c:if>
