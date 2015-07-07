<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
		  $("#__action").val("insuranceReport.expInsuranceStampToExcel");
		  $("#form1").submit();
		  $("#__action").val("insuranceReport.insuranceStampReport");
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
				value="insuranceReport.insuranceStampReport">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险合同印花税</span>
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
					          		<td><input type="text" value="${date}" onchange="updateDateMonth() ;" name="date" id="startDate" readonly="readonly" style="width:150px; height:18px;"></td>	          
									<td>
									公司别：
									<select name="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
										</c:forEach>
									</select>			          
									</td>
									<td>&nbsp;
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
					<td><input type="button" class="panel_button"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					<td style="text-align: right;"><page:pagingToolbarTop pagingInfo="${dw }"/></td>
				</tr>
			</table>
			<table class="grid_table">
				<tr>
					<th rowspan="2">
						<strong>序号</strong>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="PAY_DATE"><strong>拨款日期</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="CREDIT_RUNCODE"><strong>案件号</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME"><strong>客户名称</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE"><strong>合同号</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="FIRST_PAYDATE"><strong>起租日期</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_TERM"><strong>期数</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="NAME"><strong>业务员</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="DECP_NAME_CN"><strong>办事处</strong></page:pagingSort>
					</th>
					<th rowspan="2">
						<page:pagingSort pagingInfo="${dw }" orderBy="SHORT_NAME"><strong>保险公司</strong></page:pagingSort>
					</th>
					<th colspan="2">
						<strong>保险合同</strong>
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th>
						<page:pagingSort pagingInfo="${dw }" orderBy="INSU_PRICE"><strong>计税金额</strong></page:pagingSort>
					</th>
					<th>
						<page:pagingSort pagingInfo="${dw }" orderBy="TAX"><strong>税额（计算）</strong></page:pagingSort>
					</th>
				</tr>
				<c:forEach items="${dw.resultList}" var="item" varStatus="i">
					<tr>
						<td style="text-align: center;">${i.count }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatDate value="${item.PAY_DATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
						<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
						<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatDate value="${item.FIRST_PAYDATE }" pattern="yyyy-MM-dd"/>&nbsp;</td>
						<td style="text-align: center;">${item.LEASE_TERM }&nbsp;</td>
						<td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">${item.DECP_NAME_CN }&nbsp;</td>
						<td style="text-align: center;">${item.SHORT_NAME }&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.INSU_PRICE }" type="currency" />&nbsp;</td>
						<td style="text-align: center;"><fmt:formatNumber value="${item.TAX }" type="currency" />&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<page:pagingToolbar pagingInfo="${dw }"/>	
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>