<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	
	<title>核准率月报表</title>
		<script type="text/javascript">
			function exportThis(year){
				window.parent.callBirt("birtReport/approvedPercentReport/approvedPercentReport.rptdesign", "xls", {"year" : year});
			}
		</script>
	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="appPercentCommand.getReport">
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;核准率月报表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
	  			<table class="grid_table" cellspacing="1" cellpadding="0">
	  				<tr>
	  					<th style="width: 16%">
	  						<input type="text" name="year" value="${year }" style="width: 70px; height: 25px; text-align: center;">
	  						<input type="submit" value="Go.." style="height: 25px; font-size: 12px;" />
	  						<input type="button" value="导出" style="height: 25px; font-size: 12px;" onclick="exportThis('${year }');"/>
	  					</th>
	  					<th style="width: 7%">1月</th>
	  					<th style="width: 7%">2月</th>
	  					<th style="width: 7%">3月</th>
	  					<th style="width: 7%">4月</th>
	  					<th style="width: 7%">5月</th>
	  					<th style="width: 7%">6月</th>
	  					<th style="width: 7%">7月</th>
	  					<th style="width: 7%">8月</th>
	  					<th style="width: 7%">9月</th>
	  					<th style="width: 7%">10月</th>
	  					<th style="width: 7%">11月</th>
	  					<th style="width: 7%">12月</th>
	  				</tr>
	  				<c:forEach items="${resutl }" var="r" varStatus="i">
	  					<c:if test="${r.T != 4 }">
	  					<tr>
	  						<td>${r.typeName }进件数</td>
	  						<td>${r.total_1 }&nbsp;</td>
	  						<td>${r.total_2 }&nbsp;</td>
	  						<td>${r.total_3 }&nbsp;</td>
	  						<td>${r.total_4 }&nbsp;</td>
	  						<td>${r.total_5 }&nbsp;</td>
	  						<td>${r.total_6 }&nbsp;</td>
	  						<td>${r.total_7 }&nbsp;</td>
	  						<td>${r.total_8 }&nbsp;</td>
	  						<td>${r.total_9 }&nbsp;</td>
	  						<td>${r.total_10 }&nbsp;</td>
	  						<td>${r.total_11 }&nbsp;</td>
	  						<td>${r.total_12 }&nbsp;</td>
		  				</tr>
		  				<tr>
	  						<td>核准率</td>
	  						<td>
	  							<c:if test="${r.total_1 > 0}">
	  								<fmt:formatNumber type="percent" value="${r.approved_1 / r.total_1 }"/>
	  							</c:if>
	  							<c:if test="${r.total_1 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_2 > 0}"><fmt:formatNumber type="percent" value="${r.approved_2 / r.total_2 }"/></c:if>
	  							<c:if test="${r.total_2 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_3 > 0}"><fmt:formatNumber type="percent" value="${r.approved_3 / r.total_3 }"/></c:if>
	  							<c:if test="${r.total_3 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_4 > 0}"><fmt:formatNumber type="percent" value="${r.approved_4 / r.total_4 }"/></c:if>
	  							<c:if test="${r.total_4 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_5 > 0}"><fmt:formatNumber type="percent" value="${r.approved_5 / r.total_5 }"/></c:if>
	  							<c:if test="${r.total_5 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_6 > 0}"><fmt:formatNumber type="percent" value="${r.approved_6 / r.total_6 }"/></c:if>
	  							<c:if test="${r.total_6 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_7 > 0}"><fmt:formatNumber type="percent" value="${r.approved_7 / r.total_7 }"/></c:if>
	  							<c:if test="${r.total_7 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_8 > 0}"><fmt:formatNumber type="percent" value="${r.approved_8 / r.total_8 }"/></c:if>
	  							<c:if test="${r.total_8 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_9 > 0}"><fmt:formatNumber type="percent" value="${r.approved_9 / r.total_9 }"/></c:if>
	  							<c:if test="${r.total_9 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_10 > 0}"><fmt:formatNumber type="percent" value="${r.approved_10 / r.total_10 }"/></c:if>
	  							<c:if test="${r.total_10 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_11 > 0}"><fmt:formatNumber type="percent" value="${r.approved_11 / r.total_11 }"/></c:if>
	  							<c:if test="${r.total_11 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_12 > 0}"><fmt:formatNumber type="percent" value="${r.approved_12 / r.total_12 }"/></c:if>
	  							<c:if test="${r.total_12 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
		  				</tr>
		  				</c:if>
	  				</c:forEach>
	  			</table>
	  			<table class="grid_table" cellspacing="1">
	  				<tr>
	  					<th style="width: 16%">${year }</th>
	  					<th style="width: 7%">1月</th>
	  					<th style="width: 7%">2月</th>
	  					<th style="width: 7%">3月</th>
	  					<th style="width: 7%">4月</th>
	  					<th style="width: 7%">5月</th>
	  					<th style="width: 7%">6月</th>
	  					<th style="width: 7%">7月</th>
	  					<th style="width: 7%">8月</th>
	  					<th style="width: 7%">9月</th>
	  					<th style="width: 7%">10月</th>
	  					<th style="width: 7%">11月</th>
	  					<th style="width: 7%">12月</th>
	  				</tr>
	  				<c:forEach items="${resutl }" var="r" varStatus="i">
	  					<c:if test="${r.T eq 4 }">
	  					<tr>
	  						<td>${r.typeName }进件数</td>
	  						<td>${r.total_1 }&nbsp;</td>
	  						<td>${r.total_2 }&nbsp;</td>
	  						<td>${r.total_3 }&nbsp;</td>
	  						<td>${r.total_4 }&nbsp;</td>
	  						<td>${r.total_5 }&nbsp;</td>
	  						<td>${r.total_6 }&nbsp;</td>
	  						<td>${r.total_7 }&nbsp;</td>
	  						<td>${r.total_8 }&nbsp;</td>
	  						<td>${r.total_9 }&nbsp;</td>
	  						<td>${r.total_10 }&nbsp;</td>
	  						<td>${r.total_11 }&nbsp;</td>
	  						<td>${r.total_12 }&nbsp;</td>
		  				</tr>
		  				<tr>
	  						<td>核准率</td>
	  						<td>
	  							<c:if test="${r.total_1 > 0}">
	  								<fmt:formatNumber type="percent" value="${r.approved_1 / r.total_1 }"/>
	  							</c:if>
	  							<c:if test="${r.total_1 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_2 > 0}"><fmt:formatNumber type="percent" value="${r.approved_2 / r.total_2 }"/></c:if>
	  							<c:if test="${r.total_2 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_3 > 0}"><fmt:formatNumber type="percent" value="${r.approved_3 / r.total_3 }"/></c:if>
	  							<c:if test="${r.total_3 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_4 > 0}"><fmt:formatNumber type="percent" value="${r.approved_4 / r.total_4 }"/></c:if>
	  							<c:if test="${r.total_4 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_5 > 0}"><fmt:formatNumber type="percent" value="${r.approved_5 / r.total_5 }"/></c:if>
	  							<c:if test="${r.total_5 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_6 > 0}"><fmt:formatNumber type="percent" value="${r.approved_6 / r.total_6 }"/></c:if>
	  							<c:if test="${r.total_6 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_7 > 0}"><fmt:formatNumber type="percent" value="${r.approved_7 / r.total_7 }"/></c:if>
	  							<c:if test="${r.total_7 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_8 > 0}"><fmt:formatNumber type="percent" value="${r.approved_8 / r.total_8 }"/></c:if>
	  							<c:if test="${r.total_8 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_9 > 0}"><fmt:formatNumber type="percent" value="${r.approved_9 / r.total_9 }"/></c:if>
	  							<c:if test="${r.total_9 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_10 > 0}"><fmt:formatNumber type="percent" value="${r.approved_10 / r.total_10 }"/></c:if>
	  							<c:if test="${r.total_10 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_11 > 0}"><fmt:formatNumber type="percent" value="${r.approved_11 / r.total_11 }"/></c:if>
	  							<c:if test="${r.total_11 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
	  						<td><c:if test="${r.total_12 > 0}"><fmt:formatNumber type="percent" value="${r.approved_12 / r.total_12 }"/></c:if>
	  							<c:if test="${r.total_12 <= 0}">
	  								0%
	  							</c:if>&nbsp;</td>
		  				</tr>
		  				</c:if>
	  				</c:forEach>
	  			</table>
			</div>
			</div>
			</div>
			</div>
		</form>
		
	<br>
	<span id="clock"></span>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-19</p>
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
