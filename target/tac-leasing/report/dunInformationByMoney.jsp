<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>逾期状况统计表</title>
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
function doSearch(){
	var date = $("#DATE").val();
	var sDate = new Date(date.replace(/-/g,"/"));
	var validDate = new Date("2013/12/31");
	if(sDate.getTime() > validDate.getTime()){
		alert("数据查询有效日期截止至2013-12-31日，如需查询2014年或之后数据，请至新的逾期状况统计表5(金额)中查询！");
		return false;
	}
	$("#f").submit();
}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" method="post" id="f">
		<input type="hidden" name="__action"  value="dunCaseCommand.queryDunCase" />
		日期<input type="text" name="DATE" id="DATE" value="${DATE }" 
			style="width:80px; height:18px;" onblur="this.value= '';this.focus();" readonly/>
		<input type="button" onclick="doSearch();" value="查询" style="width : 50px; height : 30px;cursor: pointer;" class="ui-state-default ui-corner-all"/>
	</form>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
			<table cellspacing="1" cellpadding="0" border="0" class="tbw">
				<tr class="ui-jqgrid-labels">
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						金额范围
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						总件数/总金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						7天以下
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						8天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						15天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						31天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						61天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						91天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						181天以上
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						件数/金额<br/>件数比/金额比
					</th>
				</tr>
				<tbody>
				<c:forEach items="${resultList }" var="item" varStatus="index">
				<c:set var="totalCount" value="${item.totalCount+totalCount }"></c:set>
				<c:set var="totalMoney" value="${item.totalMoney+totalMoney }"></c:set>
				<c:set var="totalCount7" value="${item.count_7+totalCount7 }"></c:set>
				<c:set var="totalMoney7" value="${item.money_7+totalMoney7 }"></c:set>
				<c:set var="totalCount8" value="${item.count8_+totalCount8 }"></c:set>
				<c:set var="totalMoney8" value="${item.money8_+totalMoney8 }"></c:set>
				<c:set var="totalCount15" value="${item.count15_+totalCount15 }"></c:set>
				<c:set var="totalMoney15" value="${item.money15_+totalMoney15 }"></c:set>
				<c:set var="totalCount31" value="${item.count31_+totalCount31 }"></c:set>
				<c:set var="totalMoney31" value="${item.money31_+totalMoney31 }"></c:set>
				<c:set var="totalCount61" value="${item.count61_+totalCount61 }"></c:set>
				<c:set var="totalMoney61" value="${item.money61_+totalMoney61 }"></c:set>
				<c:set var="totalCount91" value="${item.count91_+totalCount91 }"></c:set>
				<c:set var="totalMoney91" value="${item.money91_+totalMoney91 }"></c:set>
				<c:set var="totalCount181" value="${item.count181_+totalCount181 }"></c:set>
				<c:set var="totalMoney181" value="${item.money181_+totalMoney181 }"></c:set>
				</c:forEach>
				<c:forEach items="${resultList }" var="item" varStatus="index">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.flag }
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.totalCount }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.totalMoney }"/>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.count_7 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money_7 }"/>
						<br>
							<fmt:formatNumber type="number" value="${item.count_7/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money_7/item.totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.count8_ }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money8_ }"/>
						<br> 
							<fmt:formatNumber type="number" value="${item.count8_/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money8_/item.totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.count15_ }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money15_ }"/>
						<br> 
							<fmt:formatNumber type="number" value="${item.count15_/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money15_/item.totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${item.count31_ }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money31_ }"/>
						<br> 
							<fmt:formatNumber type="number" value="${item.count31_/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money31_/item.totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.count61_ }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money61_ }"/>
						<br>
							<fmt:formatNumber type="number" value="${item.count61_/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money61_/item.totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.count91_ }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money91_ }"/>
						<br>
							<fmt:formatNumber type="number" value="${item.count91_/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money91_/item.totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${item.count181_ }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money181_ }"/>
						<br>
							<fmt:formatNumber type="number" value="${item.count181_/item.totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money181_/item.totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
					</tr>
				</c:forEach>
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							总计
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney }"/>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount7 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney7 }"/>
						<br>
							<fmt:formatNumber type="number" value="${totalCount7/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${totalMoney7/totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount8 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney8 }"/>
						<br>
							<fmt:formatNumber type="number" value="${totalCount8/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${totalMoney8/totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount15 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney15 }"/>
						<br>
							<fmt:formatNumber type="number" value="${totalCount15/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${totalMoney15/totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount31 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney31 }"/>
						<br>
							<fmt:formatNumber type="number" value="${totalCount31/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${totalMoney31/totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount61 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney61 }"/>
						<br>
							<fmt:formatNumber type="number" value="${totalCount61/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${totalMoney61/totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount91 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney91 }"/>
						<br>
							<fmt:formatNumber type="number" value="${totalCount91/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${totalMoney91/totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;"> 
							${totalCount181 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${totalMoney181 }"/>
						<br>
							<fmt:formatNumber type="number" value="${totalCount181/totalCount *100 }" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${totalMoney181/totalMoney *100 }" maxFractionDigits="2"/>%
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-13</p>
	<script>
	$(function () {
		var dd = '${DATE }';
		/* var d=new Date();
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
	    } */
	    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+dd+"  "+"20:00之数据";
	});
	</script>
</body>
</html>