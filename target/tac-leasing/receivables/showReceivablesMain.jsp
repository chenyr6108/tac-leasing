<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/decompose/js/tab.js"></script>
		<script type="text/javascript" src="${ctx }/receivables/js/showreceivables.js"></script>
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();
				$("#tabs").tabs('select',${cardFlag});
			});
		</script>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<title>应收账款</title>
	</head>
	<body>
		<div id="tabs">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(0,'2010')">2010年</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(1,'2011')">2011年</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(2,'2012')">2012年</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(3,'2013')">2013年</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(4,'2014')">2014年</a></li>
			<li style="width: 100px;text-align: center;"><a href="#tabs-1" onclick="selectCard(5,'2015')">2015年</a></li>
		</ul>
		<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
				<div id="tabs-1">
					<c:set value="${yearMap}" var="yearMap" ></c:set>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr class="ui-jqgrid-labels">
							<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>年度</strong>
							</th>
							<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收租金</strong>
							</th>
							<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收本金</strong>
							</th>
							<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收利息</strong>
							</th>
						</tr>
						<tr	class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;"><input type="hidden" name="receivables_year" id="receivables_year" value="${yearMap.PAY_YEAR }" /><strong>年度总额</strong></td>
							<td style="text-align: right;"><input type="hidden" name="year_month_price" id="year_month_price" value="${yearMap.MONTH_PRICE }" /><fmt:formatNumber value="${yearMap.MONTH_PRICE}" type="currency"></fmt:formatNumber></td>
							<td style="text-align: right;"><input type="hidden" name="year_own_price" id="year_own_price" value="${yearMap.OWN_PRICE}" /><fmt:formatNumber value="${yearMap.OWN_PRICE}" type="currency"></fmt:formatNumber></td>
							<td style="text-align: right;"><input type="hidden" name="year_ren_price" id="year_ren_price" value="${yearMap.REN_PRICE}" /><fmt:formatNumber value="${yearMap.REN_PRICE}" type="currency"></fmt:formatNumber></td>
						</tr>
						<tr class="ui-jqgrid-labels">
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>季度</strong>
							</th>
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收租金</strong>
							</th>
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收本金</strong>
							</th>
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收利息</strong>
							</th>
						</tr>
						<c:forEach items="${quarterList}" var="quarter" varStatus="status">
							<tr	class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><input type="hidden" name="receivables_quarter" id="receivables_quarter" value="${quarter.PAY_QUARTER }" /><strong>第${quarter.PAY_QUARTER }季度</strong></td>
								<td style="text-align: right;"><input type="hidden" name="quarter_month_price" id="quarter_month_price" value="${quarter.MONTH_PRICE }" /><fmt:formatNumber value="${quarter.MONTH_PRICE}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;"><input type="hidden" name="quarter_own_price" id="quarter_own_price" value="${quarter.OWN_PRICE}" /><fmt:formatNumber value="${quarter.OWN_PRICE}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;"><input type="hidden" name="quarter_ren_price" id="quarter_ren_price" value="${quarter.REN_PRICE}" /><fmt:formatNumber value="${quarter.REN_PRICE}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
						<tr class="ui-jqgrid-labels">
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>月份</strong>
							</th>
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收租金</strong>
							</th>
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收本金</strong>
							</th>
							<th width="" class="ui-state-default ui-th-ltr zc_grid_head">
								<strong>应收利息</strong>
							</th>
						</tr>
						<c:forEach items="${monthList}" var="month" varStatus="status">
							<tr	class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;"><input type="hidden" name="receivables_quarter" id="receivables_quarter" value="${month.PAY_MONTH }" /><strong>${month.PAY_MONTH }月份</strong></td>
								<td style="text-align: right;"><input type="hidden" name="quarter_month_price" id="quarter_month_price" value="${month.MONTH_PRICE }" /><fmt:formatNumber value="${month.MONTH_PRICE}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;"><input type="hidden" name="quarter_own_price" id="quarter_own_price" value="${month.OWN_PRICE}" /><fmt:formatNumber value="${month.OWN_PRICE}" type="currency"></fmt:formatNumber></td>
								<td style="text-align: right;"><input type="hidden" name="quarter_ren_price" id="quarter_ren_price" value="${month.REN_PRICE}" /><fmt:formatNumber value="${month.REN_PRICE}" type="currency"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				</div>
				</div>
			</div>
		</div>
	</body>
</html>