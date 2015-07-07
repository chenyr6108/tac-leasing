<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<script type="text/javascript">
		function exportExcelForHandlingCharge(){
			var po_id = $("#po_id").val();
			window.parent.callBirt("birtReport/payMoneyDetail/brokerageDetail.rptdesign","xls",{"po_id":po_id});
		}
	</script>
	<div style="text-align: left;">
		<input type="button" value="导出" class="panel_button" onclick="exportExcelForHandlingCharge();">
	</div>
	<input type="hidden" id="po_id" value="${po_id }">
	<table class="grid_table">
		<tr>
			<th>
				序号
			</th>
			<th>
				案件号
			</th>
			<th>
				合同编号
			</th>
			<th>
				客户名称
			</th>
			<th>
				办事处
			</th>
			<th>
				办事处主管
			</th>
			<th>
				客户经理
			</th>
			<th>
				银行拨款日
			</th>
			<th>案件拨款金额</th>
			<th>
				佣金
			</th>
		</tr>
		<c:set var="outPayTotal" value="0"/>
		<c:forEach items="${result}" var="item" varStatus="status">	
			<tr>
				<td style="text-align: center;">
					${status.count }
				</td>
				<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
				<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
				<td style="text-align: center;">${item.CUST_NAME }</td>
				<td style="text-align: center;">${item.DECP_NAME_CN }</td>
				<td style="text-align: center;">${item.UU_NAME }&nbsp;</td>
				<td style="text-align: center;">${item.U_NAME }&nbsp;</td>
				<td style="text-align: center;">${item.PAY_DATE }&nbsp;</td>
				<td style="text-align: right;">￥<fmt:formatNumber value="${item.PAY_MONEY }" pattern="#,###,##0.00"/>&nbsp;</td>
				<td style="text-align: right;">￥<fmt:formatNumber value="${item.SALES_PAY }" pattern="#,###,##0.00"/>&nbsp;</td>
			</tr>
			<c:set var="outPayTotal" value="${outPayTotal + item.SALES_PAY }"/>
		</c:forEach>
		<tr>
			<th colspan="9" style="text-align: right;">
				合计金额：
			</th>
			<td style="text-align: right; font-weight: bold;">￥<fmt:formatNumber value="${outPayTotal }" pattern="#,###,##0.00"/>&nbsp;</td>
		</tr>
	</table>
</html>