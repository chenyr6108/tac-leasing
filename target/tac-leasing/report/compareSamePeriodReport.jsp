<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>年度业绩同期比</title>
		<script type="text/javascript">
			function doQuery() {
				$("#form").submit();
			}
			
			$(function () {
				var d=new Date();
			    var sec=d.getSeconds();
			    var min=d.getMinutes();
			    var hour=d.getHours();
			    if(sec<10) {
			    	sec="0"+sec;
			    }
			    if(min<10) {
			    	min="0"+min;
			    }
			    if(hour<10) {
			    	hour="0"+hour;
			    }
			    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+hour+":"+min+":"+sec+"之数据";
			});
		</script>
	</head>
	<body >
		<form id="form" name="form" action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action" value="compareSamePeriodReport.getReport">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 800px;">
			<div class="zc_grid_body jqgrowleft" style="width: 800px;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;width: 795px;">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;年度业绩同期比</span>
		   	</div>
	          	<table width="800px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      	<td width="8">&nbsp;</td>
				        <td width="40" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table>
							<tr>
								<td>年份：</td>
								<td><select name="year"><c:forEach items="${yearList}" var="item"><option value="${item }" <c:if test="${item==year }">selected="selected"</c:if>>${item }</option></c:forEach></select></td>	</tr>
						  </table>
			            </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" onclick="doQuery();" class="blue_button">搜 索</a></td>
				      </tr>
			    </table>
				<table class="grid_table" style="width: 800px;">
					<tr class="ui-state-default zc_grid_head">
						<th rowspan="2" style="text-align: center;">月份</th>
						<th colspan="3" style="text-align: center;">${year-1 }</th>
						<th colspan="3" style="text-align: center;">${year}</th>
						<th rowspan="2" style="text-align: center;">同期比</th>
					</tr>
					<tr class="ui-state-default zc_grid_head">
						
						<th style="text-align: center;">拨款金额</th>
						<th style="text-align: center;">委贷金额</th>
						<th style="text-align: center;">合计</th>

						<th style="text-align: center;">拨款金额</th>
						<th style="text-align: center;">委贷金额</th>
						<th style="text-align: center;">合计</th>

					</tr>
					<c:forEach var="item"  items="${resultList}" varStatus="status"> 
						<tr>
							<td style="text-align: center;">${item.PAY_MONTH }</td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.LAST_YEAR_PAY_MONEY}"></fmt:formatNumber></td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.LAST_YEAR_CREDIT_MONEY }"></fmt:formatNumber></td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.LAST_YEAR_TOTAL_MONEY }"/></td>

							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.SEARCH_YEAR_PAY_MONEY}"></fmt:formatNumber></td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.SEARCH_YEAR_CREDIT_MONEY }"></fmt:formatNumber></td>
							<td style="text-align: right;"><fmt:formatNumber type="currency" value="${item.SEARCH_YEAR_TOTAL_MONEY }"/></td>
							
							<td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${item.COMPARE_RATE }"/>%</td>

						</tr>
					</c:forEach>
				</table>
			</div>
			<span id="clock"></span>
		</div>
		</form>
		<br>
		<p align="right" style="font-weight:bolder;">编号：IT-RPT-29</p>
	</body>
</html>
