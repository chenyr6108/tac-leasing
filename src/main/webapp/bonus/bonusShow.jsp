<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<title>奖金查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<script type="text/javascript">
</script>

<style type="text/css">
th {
	font-size: 12px;
}
</style>

<script type="text/javascript">
$(function (){
	$(".divClass").each(function (){
		$(this).css("top", $(this).css("top").replace("px", "") - $(this).css("height").replace("px", "") + 18);
	});
	
	var startYear = parseInt("${startYear}");
	var startMonth = parseInt("${startMonth}");
	var currentYear = parseInt("${currentYear}");
	var currentMonth = parseInt("${currentMonth}");
	var year = parseInt("${year}");
	var month = parseInt("${month}");
	var condition = true;
	while (condition) {
		var o = $("<option>");
		o.val(currentYear + "-" + currentMonth)
			.text(currentYear + "-" + currentMonth);
		if(currentYear == year && currentMonth == month){
			o.attr("selected", true);
		}
		o.appendTo($("#year_month"));
		if(currentYear == startYear && currentMonth == startMonth){
			condition = false;
		} else {
			if(currentMonth == 1){
				currentYear -= 1;
				currentMonth = 12;
			} else {
				currentMonth -= 1;
			}
		}
	}
	
});

function getBonusByYearMonth(){
	location.href = "../servlet/defaultDispatcher?__action=bonusManage.bonusShow&year_month=" + $("#year_month").val();
}
function exportExcel(form) {
	form.submit();
}

function exportDetail(){
	var year_month = $("#year_month").val();
	window.parent.callBirt("birtReport/bonusReport/bonusDetailReport.rptdesign", "xls", {"year_month" : year_month});
}

</script>

</head>

<body>
<form action="../servlet/defaultDispatcher?__action=bonusManage.bonusExportExcel" name="form" id="form" method="post">
<%-- 设定年月选择区间 --%>
年月：<select name="year_month" id="year_month" onchange="getBonusByYearMonth()">
</select>&nbsp;&nbsp;&nbsp;<input type="button" value="导出Excel" onclick="exportExcel(this.form)" style="height:24px;"/>
&nbsp;&nbsp;&nbsp;<input type="button" value="导出案件明细" onclick="exportDetail();" style="height:24px;"/>
<table cellpadding="3" cellspacing="1" style="background-color: #C5DBEC; text-align: center;" width="120%">
	<tr style="background-color : #E0EFFC">
		<th rowspan="3" width="60px" style="background-color: #8080C0;">單位</th>
		<th rowspan="3" width="40px" style="background-color: #8080C0;">經辦人</th>
		<th colspan="7" style="background-color: #FFFF99;">當月業績</th>
		<th colspan="7" style="background-color: #99CCFF;">年度累積業績</th>
		<th colspan="5" style="background-color: #33CCCC">業績獎金計算</th>
		<th rowspan="3" style="background-color: #33CCCC">獎金合計</th>
	</tr>
	<tr style="background-color : #E0EFFC">
		<th colspan="2" style="background-color: #FFFF99;">業績目標</th>
		<th colspan="3" style="background-color: #FFFF99">當月實際承做</th>
		<th colspan="2" style="background-color: #FFFF99;">達成率</th>
		<th colspan="2" style="background-color: #99CCFF;">年度目標</th>
		<th colspan="3" style="background-color: #99CCFF">當年累積承做</th>
		<th colspan="2" style="background-color: #99CCFF;">達成率</th>
		<th rowspan="2" style="background-color: #33CCCC;">業<br/>績<br/>是<br/>否<br/>達<br/>成</th>
		<th rowspan="2" style="background-color: #33CCCC">利<br/>差<br/>是<br/>否<br/>達<br/>成</th>
		<th rowspan="2" style="background-color: #33CCCC">單位獎金</th>
		<th rowspan="2" style="background-color: #33CCCC">案件獎金</th>
		<th rowspan="2" style="background-color: #33CCCC">利差獎金</th>
	</tr>
	<tr style="background-color : #E0EFFC">
		<th style="background-color: #FFFF99;">淨授信金額</th>
		<th style="background-color: #FFFF99">利差現值</th>
		<th style="background-color: #FFFF99">案<br/>件<br/>數</th>
		<th style="background-color: #FFFF99">淨授信金額</th>
		<th style="background-color: #FFFF99">利差現值</th>
		<th style="background-color: #FFFF99">淨授信金額</th>
		<th style="background-color: #FFFF99;">利差現值</th>
		<th style="background-color: #99CCFF;">淨授信金額</th>
		<th style="background-color: #99CCFF">利差現值</th>
		<th style="background-color: #99CCFF">案<br/>件<br/>數</th>
		<th style="background-color: #99CCFF">淨授信金額</th>
		<th style="background-color: #99CCFF">利差現值</th>
		<th style="background-color: #99CCFF">淨授信金額</th>
		<th style="background-color: #99CCFF;">利差現值</th>
	</tr>
	
	<c:set var="dept_name" value=""/>
	<c:set var="dept_index" value="1"/>
	<c:forEach items="${resultList }" var="list" varStatus="index">
		<tr style="background-color : #FFFFFF">
			<c:if test="${dept_name != list.DECP_NAME}">
				<td style="background-color: 
					<c:if test="${dept_index % 2 != 0 }">#E0EFFC</c:if>
					<c:if test="${dept_index % 2 == 0 }">#8080C0</c:if>;"
					rowspan="${list.COUNT_BY_DEPT == 0 ? 2 : list.COUNT_BY_DEPT + 1 }">${list.DECP_NAME }</td>
				<c:set var="dept_index" value="${dept_index + 1 }"/>
			</c:if>
			<c:set var="dept_name" value="${list.DECP_NAME }"/>
			<td width="40px" style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
						<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
						<c:if test="${index.count % 2 == 0 }">#8080C0</c:if></c:otherwise></c:choose>;">
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '_' || fn:substring(list.EMP_NAME,0,1) eq '*'}">
						${fn:substring(list.EMP_NAME,fn:length(list.EMP_NAME) - 2,fn:length(list.EMP_NAME)) }
					</c:when>
					<c:otherwise>
						${list.EMP_NAME }
					</c:otherwise>
				</c:choose>
			</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#FFFF99</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.MONTH_TARGET}" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#FFFF99</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.MONTH_RATE_TARGET}" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#FFFF99</c:if></c:otherwise></c:choose>;">${list.MONTH_COUNT }</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#FFFF99</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.MONTH_PAY_MONEY }" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#FFFF99</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.MONTH_RATE_DIFF }" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#FFFF99</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="number" value="${list.MONTH_PAY_MONEY_PERCENT}" maxFractionDigits="2"/>%</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#FFFF99</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="number" value="${list.MONTH_RATE_DIFF_PERCENT}" maxFractionDigits="2"/>%</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#99CCFF</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.YEAR_TARGET }" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#99CCFF</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.YEAR_RATE_TARGET}" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#99CCFF</c:if></c:otherwise></c:choose>;">${list.YEAR_COUNT }</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#99CCFF</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.YEAR_PAY_MONEY }" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#99CCFF</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.YEAR_RATE_DIFF }" /></td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#99CCFF</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="number" value="${list.YEAR_PAY_MONEY_PERCENT}" maxFractionDigits="2"/>%</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#99CCFF</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="number" value="${list.YEAR_RATE_DIFF_PERCENT}" maxFractionDigits="2"/>%</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#33CCCC</c:if></c:otherwise></c:choose>;">
				<c:choose>
					<c:when test="${list.MONTH_PAY_MONEY_PERCENT >= 100}">
						是
					</c:when>
					<c:otherwise>
						否
					</c:otherwise>
				</c:choose>
			
			</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#33CCCC</c:if></c:otherwise></c:choose>;">
				<c:choose>
					<c:when test="${list.MONTH_RATE_DIFF_PERCENT >= 100}">
						是
					</c:when>
					<c:otherwise>
						否
					</c:otherwise>
				</c:choose>
			</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#33CCCC</c:if></c:otherwise></c:choose>;">
				&nbsp;
			</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#33CCCC</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.PROJECT_COUNT_BONUS }" />	
			</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#33CCCC</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.RATE_DIFF_BONUS }" />
			</td>
			<td style="background-color: 
				<c:choose>
					<c:when test="${fn:substring(list.EMP_NAME,0,1) eq '*' }">
						#A7A7A7
					</c:when>
					<c:otherwise>
				<c:if test="${index.count % 2 != 0 }">#E0EFFC</c:if>
				<c:if test="${index.count % 2 == 0 }">#33CCCC</c:if></c:otherwise></c:choose>;">
				<fmt:formatNumber type="currency" value="${list.RATE_DIFF_BONUS + list.PROJECT_COUNT_BONUS }" />
				<c:if test="${list.EMP_ID eq '-1' }">
					<div style="position: absolute; margin-left: 70px;" class="divClass">
						<table cellpadding="3" cellspacing="1" style="background-color: #C5DBEC; text-align: center; width: 150px;">
							<c:forEach items="${list.managerList }" var="manager">
								<tr>
									<td style="background-color: #A7A7A7;">${manager.EMP_NAME }</td>
									<td style="background-color: #A7A7A7;"><fmt:formatNumber type="currency" value="${manager.money }" /></td>
								</tr>
							</c:forEach>
							<c:forEach items="${list.assistantList }" var="assistant">
								<tr>
									<td style="background-color: #A7A7A7; width: 40%;">${assistant.EMP_NAME }</td>
									<td style="background-color: #A7A7A7; width: 60%;"><fmt:formatNumber type="currency" value="${assistant.money }" /></td>
								</tr>
							</c:forEach>
						</table>&nbsp;
					</div>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
</form>
<br>
<p align="right" style="font-weight:bolder;">编号：IT-RPT-40</p>
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
		    document.getElementById("clock").innerHTML='<font color="#FF0000">*</font>'+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+(d.getDate()-1)+"  "+"20:00之数据";
		});
</script>

<span id="clock"></span>
</body>
</html>