<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回租开票资料--旧案</title>

<script type="text/javascript">
    function exportInvoiceDataForSprcial(companyCode){
    	location.href="../servlet/defaultDispatcher?__action=InvoiceData.exportSpecialInvoiceWithOldCredit&companyCode="+companyCode;
    }
    
    function exportInvoiceDataForGenerel(companyCode){
    	location.href="../servlet/defaultDispatcher?__action=InvoiceData.exportGenerelInvoiceWithOldCredit&companyCode="+companyCode;
    }

</script>
</head>
<body>
	<div
		class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
		style="height: 30px">
		<span class="ui-jqgrid-title"
			style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;回租开票资料--旧案</span>
	</div>
	<div
		class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
		id="main">
		<div class="zc_grid_body jqgrowleft">
			<div>
				<input type="button" value="导出回租普票资料-旧案(全部)" class="panel_button" onclick="exportInvoiceDataForGenerel('')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="导出回租专票资料-旧案(全部)" class="panel_button" onclick="exportInvoiceDataForSprcial('')">
				<br>
				<input type="button" value="导出回租普票资料-旧案(裕融)" class="panel_button" onclick="exportInvoiceDataForGenerel('1')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="导出回租专票资料-旧案(裕融)" class="panel_button" onclick="exportInvoiceDataForSprcial('1')">
				<br>
				<input type="button" value="导出回租普票资料-旧案(裕国)" class="panel_button" onclick="exportInvoiceDataForGenerel('2')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="导出回租专票资料-旧案(裕国)" class="panel_button" onclick="exportInvoiceDataForSprcial('2')">
			</div>
		</div><br>
		<font style="color:red">*</font>本金开普通发票，利息开专用发票
	</div>
</body>
</html>