<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<table class="grid_table">
	<tr>
		<th>序号</th>
		<th>案件号</th>
		<th>合同号</th>
		<th>客户名称</th>
		<th>期数</th>
		<th>含税金额</th>
		<th>类型</th>
		<th>发票号码</th>
		<th>已缴租金/应缴租金</th>
	</tr>
	<c:forEach items="${dw.resultList }" var="item" varStatus="index">
		<tr>
			<td>${index.count }</td>
			<td>${item.CREDIT_RUNCODE }</td>
			<td>${item.LEASE_CODE }</td>
			<td>${item.CUST_NAME }</td>
			<td>${item.PERIOD_NUM }</td>
			<td style="text-align: right;">￥<fmt:formatNumber value="${item.PRICE_WHITOUT_TAX }" pattern="#,##0.00"/></td><!-- 乘用车委贷此栏位是含税金额 -->
			<td>
				<c:if test="${item.PRICE_TYPE eq 'INTEREST' }">利息</c:if>
				<c:if test="${item.PRICE_TYPE eq 'CAPITAL' }">本金</c:if>
				<c:if test="${item.PRICE_TYPE eq 'DEPOSIT' }">保证金</c:if>
			</td>
			<td><a href="#" onclick="showResult('${item.ID }')">${item.INVOICE_NUM }</a></td>
			<td <c:if test="${item.SHOULD_PAY-item.REDUCE_OWN_PRICE!=0 }">style="color:red"</c:if>>￥<fmt:formatNumber value="${item.REDUCE_OWN_PRICE }" pattern="#,##0.00"/>/￥<fmt:formatNumber value="${item.SHOULD_PAY }" pattern="#,##0.00"/></td>
		</tr>
	</c:forEach>
</table>