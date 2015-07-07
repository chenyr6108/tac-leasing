<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css">
	.resutn-style{background-color: #A7A7A7;}
</style>
<div>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">合同号</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">客户名称</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">类别</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">状态</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请人</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请日期</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultList}" var="item" varStatus="index">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td>${index.count }&nbsp;</td>
			<td>${item.LEASE_CODE }&nbsp;</td>
			<td>${item.CUST_NAME }&nbsp;</td>
			<td><c:if test="${item.INVOICE_TYPE eq 0 }">暂停发票开具</c:if><c:if test="${item.INVOICE_TYPE eq 1 }">续开发票</c:if>&nbsp;</td>
			<td><c:if test="${item.INVOICE_STATUS eq 0 }">提交财务</c:if><c:if test="${item.INVOICE_STATUS eq 1 }">财务通过</c:if><c:if test="${item.INVOICE_STATUS eq 2 }">财务驳回</c:if>&nbsp;</td>
			<td>${item.NAME }&nbsp;</td>
			<td>${item.CREATE_TIME }&nbsp;</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>