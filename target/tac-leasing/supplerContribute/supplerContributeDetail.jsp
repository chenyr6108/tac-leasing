<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script>
	//导出Excel
	function exportDetail(param) {
		window.parent.callBirt("birtReport/exportSupplerContribute/supplerContributeDetailBySuplId.rptdesign","xls",{"suplId":param});
	}
</script>
<table><tr><th colspan="11" style="text-align: left; border: 0px;">
	<input type="button" value="导出Excel" onclick="exportDetail('${suplId}')" class="panel_button">
</th></tr></table>
<table class="grid_table">
		<tr>
			<th>序号</th>
			<th>承租人名称</th>
			<th>合同号</th>
			<th>起租日期</th>
			<th>净拨款金额</th>
			<th>实际剩余本金</th>
			<th>TR</th>
			<th>发票待补状态</th>
			<th>剩余期数</th>
			<th>逾期次数</th>
			<th>逾期明细</th>
			<th>状态</th>
		</tr>
	<c:forEach items="${resultList }" var="detailItem" varStatus="detailCount">
		<tr>
			<td style="text-align:center;">${detailCount.count } &nbsp;</td>
			<td style="text-align:center;">${detailItem.custName } &nbsp;</td>
			<td style="text-align:center;"><a href="#" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${detailItem.recpId }&RECT_ID=${detailItem.rectId }'">${detailItem.leaseCode }</a> &nbsp;</td>
			<td style="text-align:right;"><fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${detailItem.firstPaydate}" /> &nbsp;</td>
			<td style="text-align:right;"><fmt:formatNumber value="${detailItem.payMoney }" type="currency" /> &nbsp;</td>
			<td style="text-align:right;"><fmt:formatNumber value="${detailItem.restMoney }" type="currency" /> &nbsp;</td>
			<td style="text-align:right;"><fmt:formatNumber value="${detailItem.trrAte }" type="currency" pattern="##.000"/>&nbsp;</td>
			<td style="text-align:right;">
				<c:choose>
					<c:when test="${detailItem.total_qty>0 }">待补</c:when>
					<c:otherwise>无</c:otherwise>
				</c:choose>									
			</td>
			<td style="text-align:right;">${detailItem.restPeriod } &nbsp;</td>
			<td style="text-align:right;">${detailItem.dunCountByLease } &nbsp;</td>
			<td style="text-align:center;"><a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.getDunDetailByCustIdAndDate&RECP_CODE=${detailItem.recpCode}&RECP_ID=${detailItem.recpId }&CUST_NAME=${detailItem.custName }'">逾期明细</a></td>
			<td style="text-align:center;">${detailItem.status } &nbsp;</td>
		</tr>
	 </c:forEach>
</table>
