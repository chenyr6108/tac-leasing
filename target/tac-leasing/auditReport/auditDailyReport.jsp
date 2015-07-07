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
	/* $(function (){
		$("#tBody tr").each(function (){
			$(this).data("oldColor", $(this).attr("bgcolor"));
		});
	}); */
	
	function trOver(e){
		$(e).data("oldColor", $(e).attr("bgcolor"));
		$(e).attr("bgcolor", "#A6C9E2");
		$(e).css("fontWeight", "bold");
	}
	
	function trOut(e){
		$(e).attr("bgcolor", $(e).data("oldColor"));
		$(e).css("fontWeight", "normal");
	}
	
	function exportDetail(){
		window.parent.callBirt("birtReport/auditReport/auditReport.rptdesign", "xls"
				, {"decp_id" : "${decp_id}",
					"year" : "${year }",
					"month" : "${month }",
					"decpName" : encodeURI("${resultList[0].decpName }")});
	}
	
</script>
	
</head>

<body>
	<div>
	<form action="../servlet/defaultDispatcher" method="post">
	<input type="hidden" name="__action" value="auditReportCommand.getDailyReport"/>
		<table width="100%">
			<tr>
				<td width="30%">
					办事处：<select name="decp_id" style="width: 100px; height: 20px;">
						<option value="">请选择</option>
						<c:forEach items="${office }" var="o">
							<option value="${o.option_value }" <c:if test="${decp_id eq o.option_value }">selected="selected"</c:if>
								>${o.display_name }</option>
						</c:forEach>
						<option value="0" <c:if test="${decp_id eq 0 }">selected="selected"</c:if>>绿色通道</option>
					</select>
					年：<input type="text" name="year" value="${year }" maxlength="4" style="width: 40px;"/>
					月：<input type="text" name="month" value="${month }" maxlength="2" style="width: 20px;"/>
				</td>
				<td width="20%">
					<input type="submit" value="搜索" style="width: 80px; height: 24px;"/>
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="导出" onclick="exportDetail();" style="width: 80px; height:24px;"/>
				</td>
				<td align="right">
					<table cellpadding="3" cellspacing="1" bgcolor="#A6C9E2">
						<tr>
							<td bgcolor="white">&nbsp;&nbsp;&nbsp;</td>
							<td bgcolor="white">工作日</td>
						</tr>
						<tr>
							<td bgcolor="#A7A7A7">&nbsp;&nbsp;&nbsp;</td>
							<td bgcolor="white">节假日</td>
						</tr>
						<tr>
							<td bgcolor="green">&nbsp;&nbsp;&nbsp;</td>
							<td bgcolor="white">今天</td>
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
				<th rowspan="2" style="width: 10%">日期</th>
				
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
			<c:set var="unaudited_sum" value="${o.unaudited}"/>
			
			<c:set var="apply_count_sum" value="${o.apply_count + apply_count_sum}"/>
			<c:set var="none_count_sum" value="${o.none_count + none_count_sum}"/>
			<c:set var="rj_count_sum" value="${o.rj_count + rj_count_sum}"/>
			
			<tr bgcolor="<c:choose>
					<c:when test="${o.dayType eq 'HD' }">#A7A7A7</c:when>
					<c:when test="${o.date eq now }">
						<c:set var="unaudited" value="${o.unaudited}"/>
						green
					</c:when>
					<c:otherwise>white</c:otherwise>
				</c:choose>"
				onmouseover="trOver(this);" onmouseout="trOut(this);"
			>
				<td align="center">${o.date }</td>
				
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
		<c:set var="unaudited_sum" value="${unaudited == null ? unaudited_sum : unaudited }"/>
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
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${commitDaily_sum == 0 ? 0 : ((approvalDaily_sum + returnDaily_sum + rejectDaily_sum) / commitDaily_sum * 100) }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${commitDaily_sum == 0 ? 0 : (approvalDaily_sum / commitDaily_sum * 100) }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${commitProDaily_sum == 0 ? 0 : ((commitProDaily_sum - unaudited_sum) / commitProDaily_sum * 100) }"/>%</td>
			<td align="center"><fmt:formatNumber pattern="#0.00" value="${commitProDaily_sum == 0 ? 0 : (approvalDaily_sum / commitProDaily_sum * 100) }"/>%</td>
		</tr>
	</table>
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-16</p>
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