<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>税务备案资料导出</title>
		<script type="text/javascript">
			function exportCarCntractFile(companyCode){
				var date = $("#date").val();
				window.location.href="${ctx}/servlet/defaultDispatcher?__action=rentFile.exportRentFileForCar&date="+date+"&companyCode="+companyCode;
			}
			$(function(){
				$("#date").datepicker($.datepicker.regional['zh-CN']);
				var date = new Date();
				var year = date.getFullYear();
				var month =  date.getMonth()+1;
				if(month<10){
					month = "0" + month;
				}
				date = year + "-" + month;
				$("#date").val(date);
			});
			
			function dateChange(date){
				$("#date").val(date.toString().substring(0,7)) ;
			}
		</script>
	</head>
	<body>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;税务备案资料导出</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	         	<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						日期：<input type="text" name ="date" id="date" onchange="dateChange(this.value)" value="${date}">
						<button onclick="exportCarCntractFile('')">导出当月税务备案资料(全部)</button>
						<button onclick="exportCarCntractFile('1')">导出当月税务备案资料(裕融)</button>
						<button onclick="exportCarCntractFile('2')">导出当月税务备案资料(裕国)</button>
					</div>
				</div>
			</div>
	</body>
</html>