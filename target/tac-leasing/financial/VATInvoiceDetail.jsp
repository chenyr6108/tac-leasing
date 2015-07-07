<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	
	function exportExcel(){
		var v=$("#selectDate").val();
		location.href="../servlet/defaultDispatcher?__action=InvoiceData.exportVATInvoice&exportDate="+v;
	}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增值税本金发票开具明细表</title>
</head>
<body>
<form action="../servlet/defaultDispatcher" method="post" name="form1"
		id="form1">
		<input type="hidden" name="__action" id="__action"
		value="InvoiceData.queryWithVATDetail">

		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px;width:1200px;">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;增值税本金发票开具明细--售后回租</span>
		</div>

		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white;width:1200px;">

			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;					          		
								<td>查询周期：</td>
					          		<td>
					          			<select name="selectDate" id="selectDate">
					          				<c:forEach var="item" items="${dateList }">
					          					<option value="${item.CODE }" <c:if test="${item.CODE eq selectDate }">selected="selected"</c:if>>
					          						${item.DESCR }
					          					</option>
					          				</c:forEach>
					          			</select>
					          		</td>	 
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
			
			<br> <br> <br>
						<div class="ui-state-default ui-jqgrid-hdiv"
				style="background: white">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
				    <td><input type="button" value="导出Excel" onclick="exportExcel()"></td>
					<td><%@ include file="/common/pageControl.jsp"%></td>
				</tr>
			</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
					  <th style="width:250px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>客户</strong></th>
					  <th style="width:250px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>合同号</strong></th>
					  <th style="width:140px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>国别地区</strong></th>
					  <th class="ui-state-default ui-th-ltr zc_grid_head"><strong>本金未税</strong></th>
					  <th class="ui-state-default ui-th-ltr zc_grid_head"><strong>本金税金</strong></th>
					  <th class="ui-state-default ui-th-ltr zc_grid_head"><strong>本金含税</strong></th>
					</tr>
					<c:forEach var="item" varStatus="index" items="${lst}">
					   <tr class="ui-widget-content jqgrow ui-row-ltr">
					     <td style="text-align: center;">${item.CUST_NAME }</td>
					     <td style="text-align: center;">${item.LEASE_CODE }</td>
					     <td style="text-align: center;">${item.DECP_NAME_CN }</td>
					     <td style="text-align: right;">${item.princpleOutstandingTax }</td>
					     <td style="text-align: right;">${item.tax }</td>
					     <td style="text-align: right;">${item.OWN_PRICE }</td>
					   </tr>
					</c:forEach>
				</table>
				<%@ include file="/common/pageControl.jsp"%>
			</div>
		</div>
	</form>

</body>
</html>