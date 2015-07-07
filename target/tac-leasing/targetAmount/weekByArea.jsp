<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script>
	function doQuery() {
		$("#form").submit();
	}
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
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form" id="form"
		method="post">
		<input type="hidden" name="__action" id="__action"
			value="amountCommand.queryWeekByArea">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align: left; height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;各区周拨款/目标额度表(单位K)</span>
		</div>
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			id="main">
			<table width="80%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">年：<input type="text" name="year" value="${year}" maxlength="4" style="width: 40px;" /> 
												月：<input type="text" name="month" value="${month}" maxlength="3" style="width: 20px;" />
								</td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" style="width: 100%" class="grid_table">
				<tr>
					<td rowspan="2" colspan="2"
						class="ui-state-default ui-th-ltr zc_grid_head"
						style="text-align: center;">项目</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head"
						style="text-align: center;">目标（仟元）</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head"
						style="text-align: center; ">周次</td>

					<c:forEach items="${weekByArea[0]}" var="week" varStatus="vs">
						<td class="ui-state-default ui-th-ltr zc_grid_head"
							style="text-align: center; width: 100px;">W${vs.count}</td>
					</c:forEach>

					<td class="ui-state-default ui-th-ltr zc_grid_head"
						style="text-align: center; ">累计</td>
				</tr>
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head"
						style="text-align: center; ">
								${month}-1~${month}-${targetDay}
					</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head"
						style="text-align: center;">日期</td>
					<c:forEach items="${weekByArea[0]}" var="week" varStatus="vs">
						<td class="ui-state-default ui-th-ltr zc_grid_head"
							style="text-align: center;">
							<fmt:formatDate pattern="MM-dd" type="both" value="${week.startDate}"/>
							~<fmt:formatDate pattern="MM-dd" type="both" value="${week.endDate}"/>&nbsp;</td>
					</c:forEach>
					<td class="ui-state-default ui-th-ltr zc_grid_head"
						style="text-align: center; ">${month}-1~${month}-${targetDay}</td>
				</tr>
			<!-- 	内容 -->
				<c:forEach items="${weekByArea}" var="areaList" varStatus="avs">
						    <tr>
						    	<c:if test="${avs.count ==1}">
						    		<th  rowspan="12" style="text-align: center; ">
						    		设<br/>备<br/>租<br/>赁<br/>地<br/>区<br/>别<br/></th>
						    	</c:if>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
								
									<c:if test="${areaList[0].area eq'huadong'}">华东</c:if>
									<c:if test="${areaList[0].area eq 'huanan'}">华南</c:if>
									<c:if test="${areaList[0].area eq 'xinan'}">西南</c:if>
								</td>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
									<c:forEach items="${monthByArea}" var="monArea">
										<c:if test="${monArea.area eq areaList[0].area}">
										<fmt:formatNumber maxFractionDigits="0" value="${monArea.monthTargetMoney}" />
										</c:if>
									</c:forEach>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">目标</td>
									<c:forEach items="${areaList}" var="week" varStatus="vs">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										<fmt:formatNumber maxFractionDigits="0" value="${week.targetMoney}" /></td>
									</c:forEach>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
									<c:forEach items="${monthByArea}" var="monArea">
										<c:if test="${monArea.area eq areaList[0].area}">
										<fmt:formatNumber maxFractionDigits="0" value="${monArea.monthTargetMoney}" />
										</c:if>
									</c:forEach>
								</td>
							</tr>
							 <tr>
						    	
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">实绩</td>
									<c:forEach items="${areaList}" var="week" varStatus="vs">
										
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										<fmt:formatNumber maxFractionDigits="0" value="${week.weekMoney/1000}" />
										</td>
									</c:forEach>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
									<c:forEach items="${monthByArea}" var="monArea">
										<c:if test="${monArea.area eq areaList[0].area}">
										<fmt:formatNumber maxFractionDigits="0" value="${monArea.monthMoney/1000}" />
										</c:if>
									</c:forEach>
								</td>
							</tr>
							 <tr>
						    
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">达标率</td>
									<c:forEach items="${areaList}" var="week" varStatus="vs">
										<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
										<fmt:formatNumber type="number" value="${(week.weekMoney/1000) > 0 && week.targetMoney > 0 ? ((week.weekMoney/1000) / week.targetMoney) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%&nbsp;
										</td>
									</c:forEach>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right; ">
									<c:forEach items="${monthByArea}" var="monArea">
										<c:if test="${monArea.area eq areaList[0].area}">
											<fmt:formatNumber type="number" value="${(monArea.monthMoney/1000) > 0 && monArea.monthTargetMoney > 0 ? ((monArea.monthMoney/1000) / monArea.monthTargetMoney) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%&nbsp;
										</c:if>
									</c:forEach>
								</td>
							</tr>
				</c:forEach>
				
				<!-- 总计 -->
						 	<tr>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
									总计
								</td>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
											<c:set var="isPay" value="0" scope="page"></c:set>
												<c:forEach items="${weekAllList}" var="weekAll" varStatus="vs" >
												 <c:set var="isPay" value="${isPay+weekAll.targetMoney}" scope="page"></c:set>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${isPay }" />
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">目标</td>
									<c:forEach items="${weekAllList}" var="weekAll" varStatus="vs">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
											<fmt:formatNumber maxFractionDigits="0" value="${weekAll.targetMoney}" />
										</td>
									</c:forEach>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
												<c:set var="allTarget" value="0" scope="page"></c:set>
												<c:forEach items="${weekAllList}" var="weekAll" varStatus="vs" >
												 <c:set var="allTarget" value="${allTarget+weekAll.targetMoney}" scope="page"></c:set>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${allTarget }" />
								
								</td>
							</tr>
							 <tr>
						    	
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">实绩</td>
									<c:forEach items="${weekAllList}" var="weekAll" varStatus="vs">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										<fmt:formatNumber maxFractionDigits="0" value="${weekAll.weekMoney/1000}" />
										</td>
									</c:forEach>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
											<c:set var="allMoney" value="0" scope="page"></c:set>
												<c:forEach items="${weekAllList}" var="weekAll" varStatus="vs" >
												 <c:set var="allMoney" value="${allMoney+weekAll.weekMoney}" scope="page"></c:set>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${allMoney/1000 }" />
								</td>
							</tr>
							 <tr>
						    
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">达标率</td>
									<c:forEach items="${weekAllList}" var="weekAll" varStatus="vs">
										<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
										<fmt:formatNumber type="number" value="${(weekAll.weekMoney/1000) > 0 && weekAll.targetMoney > 0 ? ((weekAll.weekMoney/1000) / weekAll.targetMoney) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%&nbsp;&nbsp;</td>
									</c:forEach>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right; ">
							<fmt:formatNumber type="number" value="${(allMoney/1000) > 0 && allTarget > 0 ? ((allMoney/1000) / allTarget) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%&nbsp;
								</td>
							</tr>
			</table>
		</div>
	</form>
	<span id="clock"></span>
	<br>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-51</p>
</body>
</html>