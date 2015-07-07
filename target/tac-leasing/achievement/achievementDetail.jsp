<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>员工业绩进度</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="员工业绩进度">

<script type="text/javascript">
		
</script>
</head>
	<body>
			<table cellspacing="0" cellpadding="0" border="0" style="width:1500px;">
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						序号
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:200px;">
						客户名称
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:200px;">
						客户来源
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						合同类型
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						保证金
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						租金
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:50px;">
						期数
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						申请拨款金额
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						已拨款金额
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						合同签订日期
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						拨款日期
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						起租日期
					</td>
				</tr>
				<c:forEach items="${resultList}" var="item" varStatus="statusDetail">
					<c:set var="pledgePrice_total" value="${item.pledgePrice+pledgePrice_total }"/>
					<c:set var="leasePrice_total" value="${item.leasePrice+leasePrice_total }"/>
					<c:set var="applyMoney_total" value="${item.applyMoney+applyMoney_total }"/>
					<c:set var="payMoney_total" value="${item.payMoney+payMoney_total }"/>
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:100px;">
							${statusDetail.count }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:200px;">
							${item.custName }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:200px;">
							${item.custFrom }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:100px;">
							${item.contractType }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;">
							<fmt:formatNumber value="${item.pledgePrice }" type="currency"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;">
							<fmt:formatNumber value="${item.leasePrice }" type="currency"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:50px;">
							${item.leasePeriod }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;">
							<fmt:formatNumber value="${item.applyMoney }" type="currency"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:100px;">
							<fmt:formatNumber value="${item.payMoney }" type="currency"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:100px;">
							${item.signContractDateDescr }&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:100px;">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${item.payDate }"/>&nbsp;
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;width:100px;">
							${item.startLeaseDateDescr }&nbsp;
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						总计
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:200px;">
						&nbsp;
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:200px;">
						&nbsp;
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						&nbsp;
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;width:100px;">
						<fmt:formatNumber value="${pledgePrice_total }" type="currency"/>&nbsp;
						(<fmt:formatNumber value="${pledgePrice_total/1000 }" type="currency" pattern="#,##0"/>K)
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;width:100px;">
						<fmt:formatNumber value="${leasePrice_total }" type="currency"/>&nbsp;
						(<fmt:formatNumber value="${leasePrice_total/1000 }" type="currency" pattern="#,##0"/>K)
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:50px;">
						&nbsp;
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;width:100px;">
						<fmt:formatNumber value="${applyMoney_total }" type="currency"/>&nbsp;
						(<fmt:formatNumber value="${applyMoney_total/1000 }" type="currency" pattern="#,##0"/>K)
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right;width:100px;">
						<fmt:formatNumber value="${payMoney_total }" type="currency"/>&nbsp;
						(<fmt:formatNumber value="${payMoney_total/1000 }" type="currency" pattern="#,##0"/>K)
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						&nbsp;
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						&nbsp;
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:center;width:100px;">
						&nbsp;
					</td>
				</tr>
			</table>
	</body>
</html>