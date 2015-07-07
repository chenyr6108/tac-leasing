<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript">
		function expToExcel(){
			var startDate = $("#startDate").val();
			var report_type = $("#report_type").val();
			if(report_type == "1"){
				window.parent.callBirt("birtReport/financeReport/insuReport.rptdesign" ,"xls" ,{"date" : startDate,"companyCode":$("#companyCode").val()});
			} else if (report_type == "2") {
				window.parent.callBirt("birtReport/financeReport/settleReport.rptdesign" ,"xls" ,{"date" : startDate,"companyCode":$("#companyCode").val()});
			} else {
				alert("请选择报表类型。");
			}
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
				value="insuranceForAccountantReportCommand.getReportData">
	
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;保险报表</span>
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
										报表类型：
									</td>
									<td><c:if test=""></c:if>
										<select name="report_type" id="report_type">
											<option value="1" <c:if test="${report_type eq 1 }">selected="selected"</c:if>>拨款案件保险公司明细表</option>
											<option value="2" <c:if test="${report_type eq 2 }">selected="selected"</c:if>>结清案件保险费调整表</option>
										</select>
									</td>
									<td>
									公司别：
									<select name="companyCode" id="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
										</c:forEach>
									</select>			          
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
					<td><br><page:pagingToolbarTop pagingInfo="${dw }"/><br></td>
				</tr>
			</table>
			
			<c:if test="${report_type eq 1 }">
				<table class="grid_table">
					<tr>
						<th>
							<strong>序号</strong>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE"><strong>合同号</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME"><strong>客户名称</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INCP_NAME"><strong>首次投保公司</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INSU_TYPE"><strong>投保状态</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INSU_START_DATE"><strong>投保起始日期</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INSU_END_DATE"><strong>投保终止日期</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="FIRST_PAYDATE"><strong>案件起租日</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="END_DATE"><strong>案件终止日</strong></page:pagingSort>
						</th>
					</tr>
					<c:forEach items="${dw.resultList}" var="item" varStatus="i">
						<tr>
							<td style="text-align: center;">${i.count }&nbsp;</td>
							<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
							<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.INCP_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.INSU_TYPE }&nbsp;</td>
							<td style="text-align: center;">${item.INSU_START_DATE }&nbsp;</td>
							<td style="text-align: center;">${item.INSU_END_DATE }&nbsp;</td>
							<td style="text-align: center;">${item.FIRST_PAYDATE }&nbsp;</td>
							<td style="text-align: center;">${item.END_DATE }&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${report_type eq 2 }">
				<table class="grid_table">
					<tr>
						<th>
							<strong>序号</strong>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="SETTLE_DATE"><strong>结清日期</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_CODE"><strong>合同号</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="CUST_NAME"><strong>客户名称</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_PERIOD"><strong>案件期数</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="LEASE_TOPRIC"><strong>设备总价</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INCP_NAME"><strong>投保公司</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INSU_START_DATE"><strong>投保起始日期</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INSU_END_DATE"><strong>投保终止日期</strong></page:pagingSort>
						</th>
						<th>
							<page:pagingSort pagingInfo="${dw }" orderBy="INSU_PRICE"><strong>保费</strong></page:pagingSort>
						</th>
					</tr>
					<c:forEach items="${dw.resultList}" var="item" varStatus="i">
						<tr>
							<td style="text-align: center;">${i.count }&nbsp;</td>
							<td style="text-align: center;">${item.SETTLE_DATE }&nbsp;</td>
							<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
							<td style="text-align: center;">${item.CUST_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.LEASE_PERIOD }&nbsp;</td>
							<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.LEASE_TOPRIC }" /> &nbsp;</td>
							<td style="text-align: center;">${item.INCP_NAME }&nbsp;</td>
							<td style="text-align: center;">${item.INSU_START_DATE }&nbsp;</td>
							<td style="text-align: center;">${item.INSU_END_DATE }&nbsp;</td>
							<td style="text-align: center;"><fmt:formatNumber type="currency" value="${item.INSU_PRICE }" />&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<page:pagingToolbar pagingInfo="${dw }"/>	
			</div>
				</div>
			</div>		
		</form>
	</body>
</html>