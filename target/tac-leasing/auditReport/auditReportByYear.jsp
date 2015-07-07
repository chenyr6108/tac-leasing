<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<title>审查日报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css">
</style>

<script type="text/javascript">
	$(function (){
		var year = ${year };
		var yearStart = 2010;
		var yearEnd = (new Date()).getFullYear();
		var o = null;
		for(var i = yearStart; i <= yearEnd; i ++){
			o = $("<option>");
			//o.val(i);
			o.attr("value", i);
			o.text(i);
			if(i == year){
				o.attr("selected", true);
			}
			o.appendTo($("#year_text"));
		};
	});
	
	function trOver(e){
		$(e).data("oldColor", $(e).attr("bgcolor"));
		$(e).attr("bgcolor", "#A6C9E2");
		$(e).css("fontWeight", "bold");
	}
	
	function trOut(e){
		$(e).attr("bgcolor", $(e).data("oldColor"));
		$(e).css("fontWeight", "normal");
	}
	
	function showMonthDetail(year, month){
		location.href = "../servlet/defaultDispatcher?__action=auditReportCommand.getDailyReportByDecp&year=" + year + "&month=" + month;
	}
	
	function exportDetail(){
		window.parent.callBirt("birtReport/auditReport/auditReportYear.rptdesign", "xls"
				, {"year" : "${year }"});
	}
	
</script>
	
</head>

<body>
	<div>
	<form action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" name="__action" value="auditReportCommand.getAuditReportByYear"/>
		<table width="100%">
			<tr>
				<td width="15%">
					日期：<select name="year" id="year_text"></select>
				</td>
				<td width="65%">
					<input type="submit" value="搜索" style="width: 80px; height:24px;"/>
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="导出" onclick="exportDetail();" style="width: 80px; height:24px;"/>
				</td>
				<td align="right">
					<table cellpadding="3" cellspacing="1" bgcolor="#A6C9E2">
						<tr>
							<td bgcolor="white">&nbsp;&nbsp;&nbsp;</td>
							<td bgcolor="white">普通月</td>
						</tr>
						<tr>
							<td bgcolor="green">&nbsp;&nbsp;&nbsp;</td>
							<td bgcolor="white">当前月</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<table cellpadding="3" cellspacing="1" bgcolor="#A6C9E2" style="width: 100%">
		<thead>
			<tr bgcolor="#E0EFFC">
				<th rowspan="2" style="width: 10%">月份</th>
				
				<th rowspan="2" style="width: 5%">当日申请访厂</th>
				<th rowspan="2" style="width: 5%">累计申请访厂</th>
				<th rowspan="2" style="width: 5%">当日免访厂</th>
				<th rowspan="2" style="width: 5%">累计免访厂</th>
				<th rowspan="2" style="width: 5%">当日访厂婉拒</th>
				<th rowspan="2" style="width: 5%">累计访厂婉拒</th>
				
				<th rowspan="2" style="width: 5%">当日已访厂</th>
				<th rowspan="2" style="width: 5%">累计访厂</th>
				<th rowspan="2" style="width: 5%">当日进件<br/>(件/次)</th>
				<th rowspan="2" style="width: 5%">累计进件<br/>(件/次)</th>
				<th colspan="3" style="width: 15%">当日已审批</th>
				<th rowspan="2" style="width: 5%">未审批</th>
				<th rowspan="2" style="width: 5%">完成率(次)</th>
				<th rowspan="2" style="width: 5%">核准率(次)</th>
				<th rowspan="2" style="width: 5%">完成率(件)</th>
				<th rowspan="2" style="width: 5%">核准率(件)</th>
			</tr>
			<tr bgcolor="#E0EFFC">
				<th style="width: 5%">核准</th>
				<th style="width: 5%">附条件</th>
				<th style="width: 5%">婉拒</th>
			</tr>
			<tr bgcolor="#E0EFFC">
				<th style="width: 10%">&nbsp;</th>
				<th style="width: 5%">&nbsp;</th>
				<th style="width: 5%">&nbsp;</th>
				<th style="width: 5%">&nbsp;</th>
				<th style="width: 5%">&nbsp;</th>
				<th style="width: 5%">&nbsp;</th>
				<th style="width: 5%">&nbsp;</th>
				<th style="width: 5%">A</th>
				<th style="width: 5%">B</th>
				<th style="width: 5%">J/C</th>
				<th style="width: 5%">K/D</th>
				<th style="width: 5%">E</th>
				<th style="width: 5%">F</th>
				<th style="width: 5%">G</th>
				<th style="width: 5%">H</th>
				<th style="width: 5%">(E+F+G)/D</th>
				<th style="width: 5%">E/D</th>
				<th style="width: 5%">(K-H)/K</th>
				<th style="width: 5%">E/K</th>
			</tr>
		</thead>
		<tbody id="tBody">
		<c:set var="visitDaily_sum" value="0"/>
		<c:set var="commitDaily_sum" value="0"/>
		<c:set var="commitProDaily_sum" value="0"/>
		<c:set var="approvalDaily_sum" value="0"/>
		<c:set var="returnDaily_sum" value="0"/>
		<c:set var="rejectDaily_sum" value="0"/>
		<c:set var="visitTotal_sum" value="0"/>
		<c:set var="commitTotal_sum" value="0"/>
		<c:set var="unaudited_sum" value="0"/>
		
		<c:set var="apply_count_sum" value="0"/>
		<c:set var="none_count_sum" value="0"/>
		<c:set var="rj_count_sum" value="0"/>
		
		<c:forEach items="${resultList }" var="o" varStatus="i">
			<c:set var="visitDaily_sum" value="${o.visitDaily + visitDaily_sum}"/>
			<c:set var="commitDaily_sum" value="${o.commitDaily + commitDaily_sum}"/>
			<c:set var="commitProDaily_sum" value="${o.commitProDaily + commitProDaily_sum}"/>
			<c:set var="approvalDaily_sum" value="${o.approvalDaily + approvalDaily_sum}"/>
			<c:set var="returnDaily_sum" value="${o.returnDaily + returnDaily_sum}"/>
			<c:set var="rejectDaily_sum" value="${o.rejectDaily + rejectDaily_sum}"/>
			
			<c:set var="apply_count_sum" value="${o.apply_count + apply_count_sum}"/>
			<c:set var="none_count_sum" value="${o.none_count + none_count_sum}"/>
			<c:set var="rj_count_sum" value="${o.rj_count + rj_count_sum}"/>
			
			<tr bgcolor="<c:choose>
					<c:when test="${o.auditMonth eq currentMonth }">
						<c:set var="unaudited_sum" value="${o.unaudited}"/>
						green
					</c:when>
					<c:otherwise>white</c:otherwise>
				</c:choose>"
				onmouseover="trOver(this);" onmouseout="trOut(this);"
			>
				<td align="center" onclick="showMonthDetail('${year }', '${o.auditMonth }');" style="cursor: pointer;">${o.auditMonth }</td>
				
				<td align="center">${o.apply_count }</td>
				<td align="center">${o.apply_count }</td>
				<td align="center">${o.none_count }</td>
				<td align="center">${o.none_count }</td>
				<td align="center">${o.rj_count }</td>
				<td align="center">${o.rj_count }</td>
				
				<td align="center">${o.visitDaily }</td>
				<td align="center">${o.visitDaily }</td>
				<td align="center">${o.commitProDaily }/${o.commitDaily }</td>
				<td align="center">${o.commitProDaily }/${o.commitDaily }</td>
				<td align="center">${o.approvalDaily }</td>
				<td align="center">${o.returnDaily }</td>
				<td align="center">${o.rejectDaily }</td>
				<td align="center">${o.unaudited }</td>
				<td align="center"><c:if test="${o.commitDaily != 0 }"><fmt:formatNumber pattern="#0.00" value="${(o.approvalDaily + o.returnDaily + o.rejectDaily) / o.commitDaily * 100 }"/>%</c:if></td>
				<td align="center"><c:if test="${o.commitDaily != 0 }"><fmt:formatNumber pattern="#0.00" value="${o.approvalDaily / o.commitDaily * 100 }"/>%</c:if></td>
				<td align="center"><c:if test="${o.commitProDaily != 0 }"><fmt:formatNumber pattern="#0.00" value="${(o.commitProDaily - o.unaudited) / o.commitProDaily * 100 }"/>%</c:if></td>
				<td align="center"><c:if test="${o.commitProDaily != 0 }"><fmt:formatNumber pattern="#0.00" value="${o.approvalDaily / o.commitProDaily * 100 }"/>%</c:if></td>
			</tr>
		</c:forEach>
		</tbody>
		<tr bgcolor="yellow">
			<td align="center">合计：</td>
			
			<td align="center">${apply_count_sum }</td>
			<td align="center">${apply_count_sum }</td>
			<td align="center">${none_count_sum }</td>
			<td align="center">${none_count_sum }</td>
			<td align="center">${rj_count_sum }</td>
			<td align="center">${rj_count_sum }</td>
			
			<td align="center">${visitDaily_sum }</td>
			<td align="center">${visitDaily_sum }</td>
			<td align="center">${commitProDaily_sum}/${commitDaily_sum }</td>
			<td align="center">${commitProDaily_sum}/${commitDaily_sum }</td>
			<td align="center">${approvalDaily_sum }</td>
			<td align="center">${returnDaily_sum }</td>
			<td align="center">${rejectDaily_sum }</td>
			<td align="center">${unaudited_sum }</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${(approvalDaily_sum + returnDaily_sum + rejectDaily_sum) / commitDaily_sum * 100 }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${approvalDaily_sum / commitDaily_sum * 100 }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${(commitProDaily_sum - unaudited_sum) / commitProDaily_sum * 100 }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${approvalDaily_sum / commitProDaily_sum * 100 }"/>%</td>
		</tr>
	</table>
	
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-18</p>
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
</body>
</html>