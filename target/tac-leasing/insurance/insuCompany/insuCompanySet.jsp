<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>投保设置</title>
		<script type="text/javascript">
			$(function (){
				$("#start_date_1").datepicker($.datepicker.regional['zh-CN']);
				$("#start_date_2").datepicker($.datepicker.regional['zh-CN']);
				var msg = "${msg}";
				if(msg != ""){
					alert(msg);
				}
			});
		</script>
		<style type="text/css">
			.myTd{background-color: white;}
		</style>
	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="insuranceCommand.saveInsuSet">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;投保设置</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
	  			<table class="panel_table">
	  				<tr>
	  					<th rowspan="2">序号</th>
	  					<th rowspan="2">保险公司</th>
  						<th colspan="${fn:length(allOffice) }">裕融</th>
  						<th rowspan="2">比例</th>
	  				</tr>
	  				<tr>
  						<c:forEach  items="${allOffice }" var="o" varStatus="j">
  							<th>${o.DECP_NAME_CN }</th>
  						</c:forEach>
	  				</tr>
	  				<c:forEach items="${insuCompany }" var="c" varStatus="i">
	  					<tr>
	  						<td style="text-align: center;">${i.count  }</td>
	  						<td>${c.INCP_NAME  }</td>
	  						<c:forEach  items="${allOffice }" var="t" varStatus="j">
	  							<td style="text-align: center;"><input name="insu2decp_1" id="${c.INCP_ID }_${t.DECP_ID}_1" value="${c.INCP_ID }_${t.DECP_ID}" type="checkbox"/></td>
	  						</c:forEach>
	  						<td ><input type="text" name="price_percent_${c.INCP_ID }_1" id="price_percent_${c.INCP_ID }_1" style="width: 50px; height: 20px;"/>%</td>
		  				</tr>
	  				</c:forEach>
	  				<tr>
  						<th colspan="17">启用日期：<input type="text" name="start_date_1" id="start_date_1" value="${insu2Decp_tac[0].START_DATE }" style="width: 130px; height: 20px;"/></th>
	  				</tr>
	  			</table>
	  			<div style="height: 20px; background-color: white;"></div>
	  			<table class="panel_table">
	  				<tr>
	  					<th rowspan="2">序号</th>
	  					<th rowspan="2">保险公司</th>
  						<th colspan="${fn:length(allOffice) }">裕国</th>
  						<th rowspan="2">比例</th>
	  				</tr>
	  				<tr>
  						<c:forEach  items="${allOffice }" var="o" varStatus="j">
  							<th>${o.DECP_NAME_CN }</th>
  						</c:forEach>
	  				</tr>
	  				<c:forEach items="${insuCompany }" var="c" varStatus="i">
	  					<tr>
	  						<td style="text-align: center;">${i.count  }</td>
	  						<td >${c.INCP_NAME  }</td>
	  						<c:forEach  items="${allOffice }" var="t" varStatus="j">
	  							<td style="text-align: center; background-color: #FFDC6E;"><input name="insu2decp_2" id="${c.INCP_ID }_${t.DECP_ID}_2" value="${c.INCP_ID }_${t.DECP_ID}" type="checkbox"/></td>
	  						</c:forEach>
	  						<td style="background-color: #FFDC6E;"><input type="text" name="price_percent_${c.INCP_ID }_2" id="price_percent_${c.INCP_ID }_2" style="width: 50px; height: 20px;"/>%</td>
		  				</tr>
	  				</c:forEach>
	  				<tr>
  						<th colspan="17">启用日期：<input type="text" name="start_date_2" id="start_date_2" value="${insu2Decp_yuguo[0].START_DATE }" style="width: 130px; height: 20px;"/></th>
	  				</tr>
	  			</table>
	  			<div style="height: 20px; background-color: white;"></div>
	  			<div style="background-color: white; text-align: center;">
	  				<input type="submit" style="width: 100px;" value="保存" class="panel_button"/>
	  			</div>
  				
			</div>
			</div>
			</div>
			</div>
		</form>
		<c:forEach items="${insu2Decp_tac }" var="i">
			<script type="text/javascript">
				$("#${i.INCP_ID}_${i.DECP_ID}_1").attr("checked", true);
				if($("#price_percent_${i.INCP_ID }_1").val() == 0){
					$("#price_percent_${i.INCP_ID }_1").val("${i.PRICE_PERCENT}");
				}
			</script>
		</c:forEach>
		<c:forEach items="${insu2Decp_yuguo }" var="i">
			<script type="text/javascript">
				$("#${i.INCP_ID}_${i.DECP_ID}_2").attr("checked", true);
				if($("#price_percent_${i.INCP_ID }_2").val() == 0){
					$("#price_percent_${i.INCP_ID }_2").val("${i.PRICE_PERCENT}");
				}
			</script>
		</c:forEach>
	</body>
</html>
