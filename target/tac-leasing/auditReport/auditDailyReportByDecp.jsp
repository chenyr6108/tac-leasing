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
		$("#date_text").datepicker($.datepicker.regional['zh-CN']);
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
	
	function showDecpDetail(decpId){
		var dateInfo = $("#date_text").val().split("-");
		location.href = "../servlet/defaultDispatcher?__action=auditReportCommand.getDailyReport&decp_id=" + decpId 
				+ "&year=" + dateInfo[0]
				+ "&month=" + dateInfo[1];
	}
	
	function exportDetail(){
		window.parent.callBirt("birtReport/auditReport/auditReportDecp.rptdesign", "xls"
				, {"date" : "${date }"});
	}
	
</script>
	
</head>

<body>
	<div>
	<form action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" name="__action" value="auditReportCommand.getDailyReportByDecp"/>
		<table width="100%">
			<tr>
				<td width="15%">
					日期：<input type="text" name="date" id="date_text" readonly="readonly" value="${date }"/>
				</td>
				<td width="85%">
					<input type="submit" value="搜索" style="width: 80px; height:24px;"/>
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="导出" onclick="exportDetail();" style="width: 80px; height:24px;"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<table cellpadding="3" cellspacing="1" bgcolor="#A6C9E2" style="width: 100%">
		<thead>
			<tr bgcolor="#E0EFFC">
				<th rowspan="2" style="width: 10%">办事处</th>
				
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
				<th style="width: 5%">SUM(E+F+G)/D</th>
				<th style="width: 5%">SUM(E)/D</th>
				<th style="width: 5%">(K-H)/K</th>
				<th style="width: 5%">SUM(E)/K</th>
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
		<c:set var="commitProTotal_sum" value="0"/>
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
			<c:set var="visitTotal_sum" value="${o.visitTotal + visitTotal_sum}"/>
			<c:set var="commitTotal_sum" value="${o.commitTotal + commitTotal_sum}"/>
			<c:set var="commitProTotal_sum" value="${o.commitProTotal + commitProTotal_sum}"/>
			<c:set var="unaudited_sum" value="${o.unaudited + unaudited_sum}"/>
			
			<c:set var="apply_count_sum" value="${o.apply_count + apply_count_sum}"/>
			<c:set var="none_count_sum" value="${o.none_count + none_count_sum}"/>
			<c:set var="rj_count_sum" value="${o.rj_count + rj_count_sum}"/>
			
			<tr bgcolor="white"
				onmouseover="trOver(this);" onmouseout="trOut(this);"
			>
				<td align="center" onclick="showDecpDetail('${o.decpId }');"
					style="cursor: pointer;">${o.decpName }</td>
				
				<td align="center">${o.apply_count }</td>
				<td align="center">${o.apply_count_total }</td>
				<td align="center">${o.none_count }</td>
				<td align="center">${o.none_count_total }</td>
				<td align="center">${o.rj_count }</td>
				<td align="center">${o.rj_count_total }</td>
				
				<td align="center">${o.visitDaily }</td>
				<td align="center">${o.visitTotal }</td>
				<td align="center">${o.commitProDaily }/${o.commitDaily }</td>
				<td align="center">${o.commitProTotal }/${o.commitTotal }</td>
				<td align="center">${o.approvalDaily }</td>
				<td align="center">${o.returnDaily }</td>
				<td align="center">${o.rejectDaily }</td>
				<td align="center">${o.unaudited }</td>
				<td align="center"><fmt:formatNumber pattern="#0.00" value="${o.finishPercent }"/>%</td>
				<td align="center"><fmt:formatNumber pattern="#0.00" value="${o.approvedPercent }"/>%</td>
				<td align="center"><fmt:formatNumber pattern="#0.00" value="${o.finishPercentPro }"/>%</td>
				<td align="center"><fmt:formatNumber pattern="#0.00" value="${o.approvedPercentPro }"/>%</td>
			</tr>
		</c:forEach>
		</tbody>
		<tr bgcolor="yellow">
			<td align="center">当日合计：</td>
			
			<td align="center">${apply_count_sum }</td>
			<td align="center">${apply_count_sum }</td>
			<td align="center">${none_count_sum }</td>
			<td align="center">${none_count_sum }</td>
			<td align="center">${rj_count_sum }</td>
			<td align="center">${rj_count_sum }</td>
			
			<td align="center">${visitDaily_sum }</td>
			<td align="center">${visitTotal_sum }</td>
			<td align="center">${commitProDaily_sum }/${commitDaily_sum }</td>
			<td align="center">${commitProTotal_sum }/${commitTotal_sum }</td>
			<td align="center">${approvalDaily_sum }</td>
			<td align="center">${returnDaily_sum }</td>
			<td align="center">${rejectDaily_sum }</td>
			<td align="center">${unaudited_sum }</td>
			<td align="center">-</td>
			<td align="center">-</td>
			<td align="center">-</td>
			<td align="center">-</td>
		</tr>
		<tr bgcolor="yellow">
			<td align="center">当月合计：</td>
			
			<td align="center">${auditReportTotal.apply_count }</td>
			<td align="center">${auditReportTotal.apply_count }</td>
			<td align="center">${auditReportTotal.none_count }</td>
			<td align="center">${auditReportTotal.none_count }</td>
			<td align="center">${auditReportTotal.rj_count }</td>
			<td align="center">${auditReportTotal.rj_count }</td>
			
			<td align="center">${auditReportTotal.visitDaily }</td>
			<td align="center">${auditReportTotal.visitDaily }</td>
			<td align="center">${auditReportTotal.commitProDaily }/${auditReportTotal.commitDaily }</td>
			<td align="center">${auditReportTotal.commitProDaily }/${auditReportTotal.commitDaily }</td>
			<td align="center">${auditReportTotal.approvalDaily }</td>
			<td align="center">${auditReportTotal.returnDaily }</td>
			<td align="center">${auditReportTotal.rejectDaily }</td>
			<td align="center">${unaudited_sum }</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" 
				value="${auditReportTotal.commitDaily eq 0 ? 0 : ((auditReportTotal.approvalDaily + auditReportTotal.returnDaily + auditReportTotal.rejectDaily) 
					/ auditReportTotal.commitDaily * 100) }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${auditReportTotal.commitDaily eq 0 ? 0 : (auditReportTotal.approvalDaily / auditReportTotal.commitDaily * 100) }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" 
				value="${auditReportTotal.commitProDaily eq 0 ? 0 : ((auditReportTotal.commitProDaily - unaudited_sum) 
					/ auditReportTotal.commitProDaily * 100) }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" 
				value="${auditReportTotal.commitProDaily eq 0 ? 0 : (auditReportTotal.approvalDaily / auditReportTotal.commitProDaily * 100) }"/>%</td>
		</tr>
	</table>
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-17</p>
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