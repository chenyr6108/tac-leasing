<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>融资额及租金余额表</title>
<style type="text/css">
.tdb{background-color: #99CCFF; text-align: center;}
.tdh{background-color: #E0EFFC; text-align: center;}
.tdl{background-color: #A7A7A7; text-align: center;}
.tds{background-color: #FFFF99; text-align: center;}
.tbw{background-color: #FFFFFF; width: 100%}
</style>
<script type="text/javascript">
$(function (){
	$("#DATE").datepicker($.datepicker.regional['zh-CN']);
});
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" method="post">
		<input type="hidden" name="__action"  value="dunCaseCommand.queryRentMoney" />
		日期<input type="text" name="DATE" id="DATE" value="${DATE }" 
			style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly/>
		<input type="submit" value="查询" style="width : 50px; height : 30px;cursor: pointer;" class="ui-state-default ui-corner-all"/>
	</form>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<table cellspacing="1" cellpadding="0" border="0" class="tbw">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						金额范围
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						申请授信金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						申请授信金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						租金余额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						租金余额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						余额/原申请
					</th>
				</tr>
				<tbody>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<c:set var="totalMoney" value="${item.totalMoney+ totalMoney }"></c:set>
					<c:set var="totalRentMoney" value="${item.rentMoney+ totalRentMoney }"></c:set>
				</c:forEach>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.flag }
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> 
							<fmt:formatNumber type="currency" value="${item.totalMoney }"/>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> 
							<fmt:formatNumber type="number" value="${item.totalScale*100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> 
							<fmt:formatNumber type="currency" value="${item.rentMoney }"/>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> 
							<fmt:formatNumber type="number" value="${item.rentScale*100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"> 
							<fmt:formatNumber type="number" value="${item.originalScale*100 }" maxFractionDigits="2"/>%
						</td>
					</tr>
				</c:forEach>
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							总计
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"><fmt:formatNumber type="currency" value="${totalMoney }"/></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">100%</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"><fmt:formatNumber type="currency" value="${totalRentMoney }"/></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">100%</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"><fmt:formatNumber type="number" value="${totalRentMoney/totalMoney*100 }" maxFractionDigits="2"/>%</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-15</p>
	<script>
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
</body>
</html>