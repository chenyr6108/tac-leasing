<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改供应商保证</title>
<script type="text/javascript">
	
	$(function (){
		$("#dateFrom").datepicker($.datepicker.regional['zh-CN']);
		$("#dateTo").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function doExport(){
		window.parent.callBirt("birtReport/estimatesPayDate/exportEstimatesPayDate.rptdesign","xls",{"dateFrom":$("#dateFrom").val(),"dateTo":$("#dateTo").val()});
	}

</script>
</head>
<body>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;导出预估拨款日明细</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
<div class="zc_grid_body jqgrowleft">
<div>
	<br>
	预计支付日：<input type="text" id="dateFrom" name="dateFrom" class="panel_text" readonly="readonly"/> ~ 
			<input type="text" id="dateTo" name="dateTo" class="panel_text" readonly="readonly"/>
	<input type="button" value="导出" class="panel_button" onclick="doExport();"/>
	<br/>
	<br/>
</div>
</div>
</div>
</body>
</html>