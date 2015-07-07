<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<table class="grid_table">
	<tr>
		<th rowspan="2"><input type="checkbox" style="cursor: pointer;" name="chkAll" onclick="selAllForCar()"></th>
		<th rowspan="2">序号</th>
		<th rowspan="2">拨款日</th>
		<th rowspan="2">案件号</th>
		<th rowspan="2">合同号</th>
		<th rowspan="2">客户编号/客户名称</th>
		<th rowspan="2">银行账户</th>
		<th rowspan="2">拨款金额</th>
		<th rowspan="2">业务员</th>
		<th rowspan="2">办事处</th>
		<th colspan="3">金蝶抛转</th>
		<th rowspan="2">操作</th>
	</tr>
	<tr>
		<th>操作人员</th>
		<th>操作时间</th>
		<th>传票时间</th>
	</tr>
	<c:forEach items="${dw.resultList }" var="item" varStatus="index">
		<tr>
			<td><input type="checkbox" style="cursor: pointer;" value="${item.ID }" name="batchVoucherForCar" <c:if test="${item.OPERATE_RESULT == 1 or item.LOCK eq 'Y' }">disabled="disabled"</c:if>></td>
			<td>${index.count }</td>
			<td>${item.PAY_DATE }</td>
			<td>${item.CREDIT_RUNCODE }</td>
			<td>${item.LEASE_CODE }</td>
			<td>${item.CUST_CODE }/${item.CUST_NAME }</td>
			<td>${item.BANK_ACCOUNT }</td>
			<td style="text-align: right;">￥<fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,##0.00"/></td>
			<td>${item.NAME }</td>
			<td>${item.DECP_NAME_CN }</td>
			<td>${item.OPERATE_NAME }</td>
			<td><fmt:formatDate value="${item.OPERATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>
				<c:if test="${item.OPERATE_RESULT == 0 }">
						<input type="text" style="width: 80px;" readonly="readonly" name="settleDate" id="settleDate${item.ID }" value="${settleDate }" class="panel_text">
				</c:if>
				<c:if test="${item.OPERATE_RESULT == 1 }">
					<c:if test='${not empty item.SETTLE_DATE }'>${item.SETTLE_DATE }</c:if>
					<c:if test='${empty item.SETTLE_DATE }'>
						<input type="text" style="width: 80px;" readonly="readonly" name="settleDate" id="settleDate${item.ID }" value="${settleDate }" class="panel_text">
					</c:if>
				</c:if>
			</td>
			<td>
				<c:if test="${item.OPERATE_RESULT == 0 }">
					<input value="生成凭证" class="panel_button" type="button" onclick="generateVoucher('${item.ID }')" style="width: 60px">
				</c:if>
				<c:if test="${item.OPERATE_RESULT == 1 }">
					<input value="生成凭证" class="panel_button" type="button" disabled="disabled" style="width: 60px">
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>