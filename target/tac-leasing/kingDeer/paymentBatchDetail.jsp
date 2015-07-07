<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$(function() {
		$("input[name='batchSettleDate']").datepicker($.datepicker.regional['zh-CN']);
	});
</script>
<input id="flag" value="${flag }" type="hidden">
<table class="panel_table">
	<tr>
		<th>序号</th>
		<th>拨款日</th>
		<th>案件号</th>
		<th>合同号</th>
		<th>客户编号/客户名称</th>
		<th>银行账户</th>
		<th>拨款金额</th>
		<th>业务员</th>
		<th>办事处</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${resultList }" var="item" varStatus="index">
		<tr id="tr${item.ID }">
			<td style="text-align: center;">${index.count }</td>
			<td style="text-align: center;">${item.PAY_DATE }</td>
			<td style="text-align: center;">${item.CREDIT_RUNCODE }</td>
			<td style="text-align: center;">${item.LEASE_CODE }</td>
			<td style="text-align: center;">${item.CUST_CODE }/${item.CUST_NAME }</td>
			<td style="text-align: center;">${item.BANK_ACCOUNT }</td>
			<td style="text-align: right;">￥<fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,##0.00"/></td>
			<td style="text-align: center;">${item.NAME }</td>
			<td style="text-align: center;">${item.DECP_NAME_CN }</td>
			<td style="text-align: center;"><img onclick="delBatchId('${item.FLAG}','${item.ID }')" style="cursor:pointer;" src="../images/del.gif" title="从批量中剔除"></td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="7" style="text-align: center;">
			</td>
			<td style="text-align: center;">
				传票时间
			</td>
			<td style="text-align: center;">
				<input type="text" style="width: 80px;" readonly="readonly" name="batchSettleDate" value="${batchSettleDate }" class="panel_text">
			</td>
			<td style="text-align: center;">
				<input class="panel_button" type="button" value="生成凭证" style="width: 60px" onclick="batchGenerateVoucher()">
			</td>
		</tr>
</table>