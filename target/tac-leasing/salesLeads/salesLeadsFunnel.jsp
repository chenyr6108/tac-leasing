<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>销售漏斗</title>
		<script type="text/javascript" src="${ctx }/salesLeads/js/salesLeads.js"></script>
		<script type="text/javascript" src="${ctx }/salesLeads/js/FusionCharts.js"></script>
		<script type="text/javascript">
			$(function (){
				$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
				$("#dateend").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
		<script type="text/javascript">
			$(function(){
			$R0 = {
				initCharts : function(){
					var myChart = new FusionCharts("../salesLeads/charts/Funnel.swf", "myChartId", "100%", "300");
					myChart.setDataURL("../salesLeads/data/salesLeadsFunnel.xml");
					myChart.render("salesFunnel");
					}
			};
			$R0.initCharts();
		});
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="funnelForm" id="funnelForm" method="post">
			<input type="hidden" name="__action" id="__action" value="salesLeads.funnelSalesLeads">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;销售机会管理-销售漏斗</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>起始日期:</td>
				          <td><input type="text" name="start_date" style="width:80px; height:18px;" readonly="readonly"
							id="datebegin" value="${start_date }"></td>
				          <td>结束日期：</td>
				          <td><input type="text" name="end_date" id="dateend" style="width:80px; height:18px;" readonly="readonly"
							value="${end_date }"></td>
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="javaScript:void(0);" name="search" onclick="doSubmit();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
				<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td width="40%">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" rowspan="5">
										<div id="salesFunnel"></div>
									</td>
								</tr>
							</table>
						</td>
						<td width="60%">
							<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">机会阶段</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">机会数</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">比例</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head" width="20%">预期金额</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">比例</th>
								</tr>
								<c:forEach items="${list}" var="item">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${item.flag }</td>
										<td style="text-align: center;">${item.count }</td>
										<td style="text-align: center;">${item.countProp }</td>
										<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.expect_money_sum }"></fmt:formatNumber></td>
										<td style="text-align: center;">${item.moneyProp }</td>
									</tr>
								</c:forEach>
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="text-align: center;">合计</td>
									<td style="text-align: center;">${countAll }</td>
									<td style="text-align: center;">100%</td>
									<td style="text-align: right;"><fmt:formatNumber type="currency" value="${proportionCount }"></fmt:formatNumber></td>
									<td style="text-align: center;">100%</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<center>
					<input type="button" onclick="goBack();" class="ui-state-default ui-corner-all" value="返回">
				</center>
				</div>
				</div>
			</div>	
		</form>
	</body>
</html>