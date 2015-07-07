<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>
		function back() {
			$("#form").submit();
		}
</script>
</head>
<body style="text-align:center;">
<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="achievementReportCommand.query">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align:left;height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;${DEPT_NAME }(单位:K)</span>
		</div>
		<br><br><br>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
		<table cellspacing="0" cellpadding="0" border="0" style="width:1600px;">
			<tr>
				<th style="text-align:center;width:90px;" class="ui-state-default ui-th-ltr zc_grid_head"><strong>姓名</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-1月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-1月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-2月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-2月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-3月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-3月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-4月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-4月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-5月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-5月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-6月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-6月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-7月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-7月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-8月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-8月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-9月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-9月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-10月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-10月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-11月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-11月<br>实际达成</strong></th>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:70px;"><strong>${YEAR }-12月<br>目标</strong></th>
				<th class="ui-widget-content jqgrow ui-row-ltr" style="width:70px;background-color:#8080C0;"><strong>${YEAR }-12月<br>实际达成</strong></th>
			</tr>
			<c:forEach items="${resultList}" var="item">
			<c:set var="MON1_TOTAL" value="${MON1_TOTAL+item.MON1 }"></c:set>
			<c:set var="ACHIEVEMENT1_TOTAL" value="${ACHIEVEMENT1_TOTAL+item.ACHIEVEMENT1 }"></c:set>
			<c:set var="MON2_TOTAL" value="${MON2_TOTAL+item.MON2 }"></c:set>
			<c:set var="ACHIEVEMENT2_TOTAL" value="${ACHIEVEMENT2_TOTAL+item.ACHIEVEMENT2 }"></c:set>
			<c:set var="MON3_TOTAL" value="${MON3_TOTAL+item.MON3 }"></c:set>
			<c:set var="ACHIEVEMENT3_TOTAL" value="${ACHIEVEMENT3_TOTAL+item.ACHIEVEMENT3 }"></c:set>
			<c:set var="MON4_TOTAL" value="${MON4_TOTAL+item.MON4 }"></c:set>
			<c:set var="ACHIEVEMENT4_TOTAL" value="${ACHIEVEMENT4_TOTAL+item.ACHIEVEMENT4 }"></c:set>
			<c:set var="MON5_TOTAL" value="${MON5_TOTAL+item.MON5 }"></c:set>
			<c:set var="ACHIEVEMENT5_TOTAL" value="${ACHIEVEMENT5_TOTAL+item.ACHIEVEMENT5 }"></c:set>
			<c:set var="MON6_TOTAL" value="${MON6_TOTAL+item.MON6 }"></c:set>
			<c:set var="ACHIEVEMENT6_TOTAL" value="${ACHIEVEMENT6_TOTAL+item.ACHIEVEMENT6 }"></c:set>
			<c:set var="MON7_TOTAL" value="${MON7_TOTAL+item.MON7 }"></c:set>
			<c:set var="ACHIEVEMENT7_TOTAL" value="${ACHIEVEMENT7_TOTAL+item.ACHIEVEMENT7 }"></c:set>
			<c:set var="MON8_TOTAL" value="${MON8_TOTAL+item.MON8 }"></c:set>
			<c:set var="ACHIEVEMENT8_TOTAL" value="${ACHIEVEMENT8_TOTAL+item.ACHIEVEMENT8 }"></c:set>
			<c:set var="MON9_TOTAL" value="${MON9_TOTAL+item.MON9 }"></c:set>
			<c:set var="ACHIEVEMENT9_TOTAL" value="${ACHIEVEMENT9_TOTAL+item.ACHIEVEMENT9 }"></c:set>
			<c:set var="MON10_TOTAL" value="${MON10_TOTAL+item.MON10 }"></c:set>
			<c:set var="ACHIEVEMENT10_TOTAL" value="${ACHIEVEMENT10_TOTAL+item.ACHIEVEMENT10 }"></c:set>
			<c:set var="MON11_TOTAL" value="${MON11_TOTAL+item.MON11 }"></c:set>
			<c:set var="ACHIEVEMENT11_TOTAL" value="${ACHIEVEMENT11_TOTAL+item.ACHIEVEMENT11 }"></c:set>
			<c:set var="MON12_TOTAL" value="${MON12_TOTAL+item.MON12 }"></c:set>
			<c:set var="ACHIEVEMENT12_TOTAL" value="${ACHIEVEMENT12_TOTAL+item.ACHIEVEMENT12 }"></c:set>
				<tr>
					<td style="text-align:center;width:50px;font-weight:normal;" class="ui-state-default ui-th-ltr">${item.NAME }</td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON1 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT1 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON2 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT2 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON3 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT3 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON4 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT4 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON5 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT5 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON6 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT6 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON7 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT7 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON8 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT8 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON9 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT9 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON10 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT10 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON11 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT11 }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;width:70px;font-weight:normal;" class="ui-state-default ui-th-ltr"><fmt:formatNumber value="${item.MON12 }" type="currency" pattern="#,##0"/></td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;width:70px;font-weight:normal;background-color:#8080C0;"><fmt:formatNumber value="${item.ACHIEVEMENT12 }" type="currency" pattern="#,##0"/></td>
				</tr>						
			</c:forEach>
				<tr>
					<td style="text-align:center;" class="ui-state-default ui-th-ltr zc_grid_head">总计</td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON1_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT1_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON2_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT2_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON3_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT3_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON4_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT4_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON5_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT5_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON6_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT6_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON7_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT7_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON8_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT8_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON9_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT9_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON10_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT10_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON11_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT11_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;" class="ui-state-default ui-th-ltr zc_grid_head"><fmt:formatNumber value="${MON12_TOTAL }" type="currency" pattern="#,##0"/></td>
					<td style="text-align:right;font-weight:bold;" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber value="${ACHIEVEMENT12_TOTAL }" type="currency" pattern="#,##0"/></td>
				</tr>
				<tr>
					<td style="text-align:center;" colspan="25"><br><br><br><input type="button" value="返回" class="ui-state-default ui-corner-all" onclick="back()"></td>
				</tr>
		</table>
		</div>
		</div>
</form>
</body>
</html>