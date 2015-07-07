<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<table class="grid_table">
	<tr>
		<th>序号</th>
		<th>单据号</th>
		<th>案件号</th>
		<th>合同号</th>
		<th>客户名称</th>
		<th>期数</th>
		<th>未税金额</th>
		<th>类型</th>
		<th>税率</th>
		<th>发票号码</th>
		<th>发票类型</th>
		<th>开票地址信息<br>开票银行信息</th>
		<th>税务登记号</th>
		<th>已缴租金/应缴租金</th>
	</tr>
	<c:forEach items="${dw.resultList }" var="item" varStatus="index">
		<tr>
			<td>${index.count }</td>
			<td>${item.DOC_NUM }</td>
			<td>${item.CREDIT_RUNCODE }</td>
			<td>${item.LEASE_CODE }</td>
			<td>${item.CUST_NAME }</td>
			<td>${item.PERIOD_NUM }</td>
			<td style="text-align: right;">￥<fmt:formatNumber value="${item.PRICE_WHITOUT_TAX }" pattern="#,##0.00"/></td>
			<td>
				<c:if test="${item.PRICE_TYPE eq 'INTEREST' }">利息</c:if>
			</td>
			<td style="text-align: right;">${item.TAX_RATE }</td>
			<td><a href="#" onclick="showResult('${item.ID }')">${item.INVOICE_NUM }</a></td>
			<td>
				<c:if test="${item.INVOICE_TYPE eq '1' }">普票</c:if>
				<c:if test="${item.INVOICE_TYPE eq '2' }">增票</c:if>
			</td>
			<td>${item.ADDRESS }<br>${item.BANK_INFO }</td>
			<td>${item.TAX_REGISTRATION_NUMBER }</td>
			<td <c:if test="${item.SHOULD_PAY-item.REDUCE_OWN_PRICE!=0 }">style="color:red"</c:if>>￥<fmt:formatNumber value="${item.REDUCE_OWN_PRICE }" pattern="#,##0.00"/>/￥<fmt:formatNumber value="${item.SHOULD_PAY }" pattern="#,##0.00"/></td>
		</tr>
	</c:forEach>
</table>