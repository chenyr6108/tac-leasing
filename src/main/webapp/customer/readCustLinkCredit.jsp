<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ctx }/customer/js/custLinkMan.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		link_idcard: new IdCard('link_idcard'),
	};
});
//-->
</script>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
<form id="custLinkManForm" name="custLinkManForm" method="POST"
	action="#">
	
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr class="ui-jqgrid-labels">
				<th colspan="7" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
					承租人所有报告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					序号
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					报告编号
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					合同号
				</td >
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					状况
				</td>
			</tr>
		</thead>
		<tbody id="divCustLinkman">
			<c:forEach items="${creditList}" var="item" varStatus="status">
				<tr id="CustLinkman_${item.ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td ><span id="custLinkmanIndex">${status.count }</span></td>
					<td ><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditReport.selectCreditForShow&credit_id=${item.ID }'">${item.CREDIT_CODE }</a>&nbsp;</td>
					<td ><c:if test="${not empty item.RECT_ID}"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentContract.showRentContract&RECT_ID=${item.RECT_ID }'">${item.LEASE_CODE }</a></c:if><c:if test="${empty item.RECT_ID}">${item.LEASE_CODE }</c:if>&nbsp;</td>
					<td ><c:choose><c:when test="${not empty item.RECT_ID}">已支付</c:when><c:when test="${not empty item.LEASE_CODE}">已签合同</c:when><c:otherwise><c:if test="${empty item.WIND_STATE and empty item.CREDIT_ID}">未提案</c:if><c:if test="${empty item.WIND_STATE and not empty item.CREDIT_ID}">已提交</c:if><c:if test="${ item.WIND_STATE eq 1 and not empty item.CREDIT_ID}">无条件通过</c:if><c:if test="${ item.WIND_STATE eq 3 and not empty item.CREDIT_ID}">不通过附条件</c:if><c:if test="${ item.WIND_STATE eq 4 and not empty item.CREDIT_ID}">不通过</c:if></c:otherwise></c:choose>&nbsp;</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</form>
</div>
</div>
</div>
