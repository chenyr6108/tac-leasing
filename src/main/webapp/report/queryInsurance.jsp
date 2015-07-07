<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
		  $("#__action").val("insuranceReport.expToExcel");
		  $("#form1").submit();
		  $("#__action").val("insuranceReport.insuranceReport");
		}			
		$(function (){
			$("#startDate").datepicker($.datepicker.regional["zh-CN"]);
		});
		function updateDateMonth(){
			var date = $("#startDate").val() ;
			$("#startDate").val(date.toString().substring(0,7)) ;
		}	
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action"
				value="insuranceReport.insuranceReport">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险费明细表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
	           		<div style="margin: 6 0 6 0px;">
		          		<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					      <tr>
					      <td width="8">&nbsp;</td>
					        <td width="60" class="ss_o"></td>
					        <td width="40%" class="ss_t">
					          <table style="margin-left: 10px;">
								 <tr>
					          		<td>查询日期：</td>
					          		<td><input type="text" value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="startDate" id="startDate" readonly="readonly" style="width:150px; height:18px;">
					          		</td>	          
									<td>
										&nbsp;
									</td>
									<td>&nbsp;
									</td>
	     						 </tr>
						          <tr>
							          <td>查询内容：</td>
							          <td colspan="5"><input type="text" id="content" name="content" value="${content }" style="width:395px; height:20px;">
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
				<tr >
					<td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>

			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>客户名称</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>供应商</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>业务员</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>办事处</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>设备总价款</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>起租日</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>租赁期</strong>
					</th>
					<th colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>保险合同</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>调整差异</strong>
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>当月实际</strong>
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>金额</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>当月均摊保费</strong>
					</th>
				</tr>
				<c:forEach items="${dw.rs}" var="item">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>					
						<td style="text-align: center;">${item.SUPL_NAME }&nbsp;</td>					
						<td style="text-align: center;">${item.RECP_CODE }&nbsp;</td>	
						<td style="text-align: center;">${item.NAME }&nbsp;</td>	
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.LEASE_TOPRIC }" type="currency" />&nbsp;</td>
						<td style="text-align: center;">${item.FIRST_PAYDATE }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_PERIOD }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.INSURANCE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.MONTHINSURANCE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;">&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.MONTHINSURANCE }" type="currency" />&nbsp;</td>	
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