<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%> 
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看历史保险费余额变动</title>
</head>
<body>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
        <div class="zc_grid_body jqgrowleft">
        	<div class="ui-state-default ui-jqgrid-hdiv">
        		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
        			<tr>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							序号
						</th>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							支付表号
						</th>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							支付日
						</th>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							期数
						</th>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							期初余额
						</th>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							本期新增
						</th>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							本期减少
						</th>
						<th style="font-size: 11px;background-color:#e8e8e8;color: black;">
							期末余额
						</th>
					</tr>
					<c:forEach items="${reportList}" var="item" varStatus="index">
						<c:if test="${item.isLastRow ne 'Y' }">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${index.count }</td>
								<td style="text-align: center;">${item.RECP_CODE }</td>
								<td style="text-align: center;">${item.PAY_DATE }</td>
								<td style="text-align: right;">${item.PERIOD_NUM }</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.BEGIN_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.INCREASE_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: right;"><fmt:formatNumber value="${item.REDUCE_MONEY }" pattern="#,##0.00"/>&nbsp;</td>
								<td style="text-align: right;"><c:if test='${item.END_MONEY>=0}'><fmt:formatNumber value="${item.END_MONEY }" pattern="#,##0.00"/></c:if><c:if test='${item.END_MONEY<0}'><fmt:formatNumber value="${item.END_MONEY*-1 }" pattern="#,##0.00"/></c:if>&nbsp;</td>
							</tr>
						</c:if>
						<c:if test="${item.isLastRow eq 'Y' }">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<th style="text-align: center;"><b>${index.count }</b></th>
								<th style="text-align: center;"><b>${item.RECP_CODE }</b></th>
								<th style="text-align: center;"><b>${item.PAY_DATE }</b></th>
								<th style="text-align: right;"><b>${item.PERIOD_NUM }</b></th>
								<th style="text-align: right;"><b><fmt:formatNumber value="${item.BEGIN_MONEY }" pattern="#,##0.00"/>&nbsp;</b></th>
								<th style="text-align: right;"><b><fmt:formatNumber value="${item.INCREASE_MONEY }" pattern="#,##0.00"/>&nbsp;</b></th>
								<th style="text-align: right;"><b><fmt:formatNumber value="${item.REDUCE_MONEY }" pattern="#,##0.00"/>&nbsp;</b></th>
								<th style="text-align: right;"><b><c:if test='${item.END_MONEY>=0}'><fmt:formatNumber value="${item.END_MONEY }" pattern="#,##0.00"/></c:if><c:if test='${item.END_MONEY<0}'><fmt:formatNumber value="${item.END_MONEY*-1 }" pattern="#,##0.00"/></c:if>&nbsp;</b></th>
							</tr>
						</c:if>
					</c:forEach>
        		</table>
        	</div>
        </div>
    </div>
</body>
</html>