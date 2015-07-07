<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title>更改單用時統計表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	$(function (){
		var year = ${year };
		var yearStart = 2012;
		var yearEnd = (new Date()).getFullYear();
		var o = null;
		for(var i = yearStart; i <= yearEnd; i ++){
			o = $("<option>");
			o.attr("value", i);
			o.text(i);
			if(i == year){
				o.attr("selected", true);
			}
			o.appendTo($("#year_text"));
		};
	});
	//查看每一天
	function showDetail(status){
		location.href="../servlet/defaultDispatcher?__action=modifyOrderCommand.showDayList&&status="+status+"&year=${year}";
	}
</script>
</head>
<body>
	<div>
		<form action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action"
				value="modifyOrderCommand.getAvgtimeForOrder" />
			<table width="100%">
				<tr>
					<td width="15%">日期：<select name="year" id="year_text"></select>
					</td>
					<td width="65%"><input type="submit" value="搜索"
						style="width: 80px; height: 24px;" /> &nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
	<table cellpadding="3" cellspacing="1" style="width: 50%"
		class="grid_table">
		<tr>
			<th style="width: 20%">月份</th>
			<th style="width: 20%">件数</th>
			<th style="width: 30%">平均处理时间（小时）</th>
			<th style="width: 30%">平均结束时间（小时）</th>
		</tr>


		<c:forEach items="${avglist}" var="vagDate" varStatus="status">
			<tr style="cursor: pointer;" onclick="showDetail('${status.count}');">
				<td style="text-align: center;"><fmt:formatDate
						pattern="yyyy-MM" type="both" value="${vagDate.MONTH1}" /></td>
				<td style="text-align: center;">${vagDate.oCount}&nbsp;</td>
				<c:forEach items="${vagDate.avgList}" var="vag">
					<td style="text-align: center;">${vag.HOURVALUEALTER} &nbsp;</td>
				</c:forEach>
				<c:forEach items="${vagDate.avgList}" var="vag">
					<td style="text-align: center;">${vag.HOURVALUEOVER} &nbsp;</td>
				</c:forEach>
			</tr>
		</c:forEach>
		<tr>
			<td align="center">合计：</td>
			<td align="center">${total.allCount}</td>
			<td align="center">${total.HOURVALUEALTER}</td>
			<td align="center">${total.HOURVALUEOVER}</td>
		</tr>
	</table>
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-48</p>
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