<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function rejectFundDetail(id, fund_type, detail_status,BIZ_TYPE){
	if(confirm("确定要这么做吗？")){
		window.location.href = "${ctx }/servlet/defaultDispatcher?__action=decompose.rejectFundDetail&detail_id=" + id + "&fund_type=" + fund_type + "&detail_status=" + detail_status+"&BIZ_TYPE="+BIZ_TYPE;
	}
}

function exportFundDetail(id){
/* 	var url = "${ctx }";
	window.parent.openCredit(url,"decompose.showFundReturnDetail&detail_id=" + id); */
	//window.location.href = "${ctx }/servlet/defaultDispatcher?__action=decompose.showFundReturnDetail&detail_id=" + id;
	window.parent.callBirt("birtReport/financeReport/exportFundReturnDetail.rptdesign","pdf",{"detail_id":id});
}
</script>
<style type="text/css">
	.resutn-style{background-color: #A7A7A7;}
</style>
<div>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<thead>
	<tr class="ui-jqgrid-labels">
		<th class="ui-state-default ui-th-ltr zc_grid_head">编号</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">认退状态</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">认退类型</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">认退原因</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请金额</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请人</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">申请日期</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">确认人</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">确认日期</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultList}" var="fund" varStatus="index">
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				>${index.count }&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				><c:if test="${fund.STATUS == 0}">待确认</c:if><c:if test="${fund.STATUS == 1}">确认</c:if><c:if test="${fund.STATUS == 2}">驳回</c:if>&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				><c:if test="${fund.FUND_TYPE == 1}">认领</c:if><c:if test="${fund.FUND_TYPE == 2}">退款</c:if>&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				>${fund.REASON }&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				><fmt:formatNumber type="currency" value="${fund.AMOUNT }"/>&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				>${fund.MODIFY_BY }&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				><fmt:formatDate value="${fund.MODIFY_DATE }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				>${fund.AUTH_BY }&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				><fmt:formatDate value="${fund.AUTH_DATE }" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
			<td <c:if test="${fund.STATUS == 2}">class="resutn-style"</c:if>
				><c:if test="${fund.FUND_TYPE == 2 && (fund.STATUS == 0 || fund.STATUS == 1)}"><a href="javascript:void(0);" onclick="exportFundDetail('${fund.ID}');">[打印退款单]</a></c:if><c:if test="${fund.STATUS == 0}">&nbsp;&nbsp;<c:if test="${authRole }"><a href="javascript:void(0);" onclick="rejectFundDetail(${fund.ID},${fund.FUND_TYPE},'2','${BIZ_TYPE }');">[驳回]</a>&nbsp;&nbsp;</c:if><c:if test="${(claimRole && fund.FUND_TYPE == 1) || (returnRole && fund.FUND_TYPE == 2)}"><a href="javascript:void(0);" onclick="rejectFundDetail(${fund.ID},${fund.FUND_TYPE},'-1','${BIZ_TYPE }');">[作废]</a></c:if></c:if>&nbsp;</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>