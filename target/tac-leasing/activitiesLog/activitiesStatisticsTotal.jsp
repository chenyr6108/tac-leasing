<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>业务人员活动日报汇总表</title>
		<script type="text/javascript">
			function expToExcel(){
			  $("#__action").val("activitiesLog.activitiesStatisitceTotalExcel");
			  $("#form1").submit();
			  $("#__action").val("activitiesLog.activitiesStatisitceTotal");
			}			
			$(function (){
				$("#startDate").datepicker($.datepicker.regional["zh-CN"]);
				$("#endDate").datepicker($.datepicker.regional["zh-CN"]);
			});
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="activitiesLog.activitiesStatisitceTotal">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业务人员活动日报汇总表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="width:1200px;">
	           <div class="zc_grid_body jqgrowleft">
				
				
				  <div style="margin: 6 0 6 0px;">
		          		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      <td width="8">&nbsp;</td>
					        <td width="60" class="ss_o"></td>
					        <td width="40%" class="ss_t">
					          <table style="margin-left: 10px;">
	 							<tr>
					          		<td>起始时间：</td>
					          		<td><input type="text" name="startDate" id="startDate"
										value="${startDate}"
										style="width: 150x" /></td>	          
									<td>
										结束时间：
									</td>
									<td><input type="text" name="endDate" id="endDate"
										value="${endDate}"
										style="width: 150px" />
									</td>
	     						 </tr>
					          </table>
					          </td>
					        <td width="55" class="ss_th" valign="top">&nbsp;</td>
					        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
					      </tr>
					    </table>
	          		</div>
				
				
				
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr>
				    <td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th  class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>${year }</strong>
					</th>
					<th colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>外出访客数</strong>
					</th>
					<th colspan="3" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>有望客户数</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>报价数</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>送件数</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>签约数</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>入保证金</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>当日动拨金额</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>当月累计动发金额</strong>
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>日期</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>首次拜访</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>勘厂</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户服务</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>经销商拜访</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>回访</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>H</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>A</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>B</strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.CREATE_DATE}&nbsp;</td>
						<td style="text-align: center;">${item.CREATECOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.VISITFACTORYCOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.FUHECOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.CUSTVISITCOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.BACKVISITCOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.HCOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.ACOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.BCOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.FIRSTPRICECOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.SENDCOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.SHENGHECOUNT }&nbsp;</td>
						<td style="text-align: center;">${item.MARGINCOUNT }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.PAY_MONEYDAYCOUNT }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.PAY_MONEYMONTHCOUNT }" type="currency" />&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<%@ include file="/common/pageControl.jsp"%>			
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>