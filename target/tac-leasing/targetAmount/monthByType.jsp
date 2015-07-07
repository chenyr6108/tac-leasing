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
			value="amountCommand.getMonthByType">
		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="text-align: left; height: 30px">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">产品别月拨款/目标额度表(单位K)</span>
		</div>
		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			id="main">
			<table width="80%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8"></td>
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
					<td width="55" class="ss_th" valign="top"></td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" style="width: 100%" class="grid_table">
				<tr>
					<td rowspan="2" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">项目</td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center;">年度目标</td>
					<td rowspan="2"  class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; ">月分别</td>
						 <c:forEach items="${monthThreeAreas[0]}" var="month" >
							<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head"
								style="text-align: center; width: 100px;">${month.days}月</td>
						</c:forEach> 
					<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; ">Q1</td>
					<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; ">Q2</td>
					<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; ">Q3</td>
					<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; ">Q4</td>
					<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; ">累计</td>
				</tr>
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center; ">（仟元）</td>
				</tr>
<!-- 				内容 -->
				<c:forEach items="${monthThreeAreas}" var="areaList" varStatus="avs">
						    <tr>
						    	<c:if test="${avs.count ==1}">
						    		<th  rowspan="12" style="text-align: center; ">
						    		产<br/>品<br/>别<br/></th>
						    	</c:if>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
									<c:if test="${areaList[0].area eq'shebei'}">设备</c:if>
									<c:if test="${areaList[0].area eq 'shangyongche'}">商用车</c:if>
								</td>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
											<c:set var="yearall" value="0" scope="page"></c:set>
												 <c:forEach items="${seasonAreas}" var="seasonList" >
									 				 <c:if test="${areaList[0].area eq seasonList[0].area}">
													 		<c:forEach items="${seasonList}" var="season">
															 	<c:set var="yearall" value="${yearall+season.monthTargetMoney}" scope="page"></c:set>
															</c:forEach>
													</c:if>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${yearall}" /> 
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">目标</td>
									 <c:forEach items="${areaList}" var="month" >
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
											<fmt:formatNumber maxFractionDigits="0" value="${month.monthTargetMoney}" />
										</td>
									</c:forEach>
									
									   <c:forEach items="${seasonAreas}" var="seasonList" >
									 	 <c:if test="${areaList[0].area eq seasonList[0].area}">
										 	<c:forEach items="${seasonList}" var="season">
													<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
															<fmt:formatNumber maxFractionDigits="0" value="${season.monthTargetMoney}" />
													</td>
											</c:forEach>
										</c:if>
									</c:forEach>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
									 			<c:set var="yearTarget" value="0" scope="page"></c:set>
												 <c:forEach items="${seasonAreas}" var="seasonList" >
									 				 <c:if test="${areaList[0].area eq seasonList[0].area}">
													 		<c:forEach items="${seasonList}" var="season">
															 	<c:set var="yearTarget" value="${yearTarget+season.monthTargetMoney}" scope="page"></c:set>
															</c:forEach>
													</c:if>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${yearTarget }" /> 
								</td>
							</tr>
							 <tr>
						    	
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">实绩</td>
									<c:forEach items="${areaList}" var="month" >
										
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										<fmt:formatNumber maxFractionDigits="0" value="${month.monthMoney/1000}" />
										</td>
									</c:forEach>
									 <c:forEach items="${seasonAreas}" var="seasonList" >
									 	 <c:if test="${areaList[0].area eq seasonList[0].area}">
										 	<c:forEach items="${seasonList}" var="season">
													<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
															<fmt:formatNumber maxFractionDigits="0" value="${season.monthMoney/1000}" />
													</td>
											</c:forEach>
										</c:if>
									</c:forEach>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
												<c:set var="yearMoney" value="0" scope="page"></c:set>
												 <c:forEach items="${seasonAreas}" var="seasonList" >
									 				 <c:if test="${areaList[0].area eq seasonList[0].area}">
													 		<c:forEach items="${seasonList}" var="season">
															 	<c:set var="yearMoney" value="${yearMoney+(season.monthMoney/1000)}" scope="page"></c:set>
															</c:forEach>
													</c:if>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${yearMoney}" /> 
								</td>
							</tr>
							 <tr>
						    
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">达标率</td>
									<c:forEach items="${areaList}" var="month" varStatus="vs">
										<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
										<fmt:formatNumber type="number" value="${(month.monthMoney/1000) > 0 && month.monthTargetMoney > 0 ? ((month.monthMoney/1000) / month.monthTargetMoney) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%
										</td>
									</c:forEach>
									
								 <c:forEach items="${seasonAreas}" var="seasonList" >
									 	 <c:if test="${areaList[0].area eq seasonList[0].area}">
										 	<c:forEach items="${seasonList}" var="season">
													<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
															<fmt:formatNumber type="number" value="${(season.monthMoney/1000) > 0 && season.monthTargetMoney > 0 ? ((season.monthMoney/1000) / season.monthTargetMoney) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%
													</td>
											</c:forEach>
										</c:if>
									</c:forEach>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right; ">
									<fmt:formatNumber type="number" value="${yearMoney > 0 && yearTarget> 0 ? (yearMoney/yearTarget) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%
									
								</td>
							</tr>
				</c:forEach>
				
				<!-- 总计 -->
						 	<tr>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
									总计
								</td>
								<td  rowspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center; ">
											 <c:set var="total" value="0" scope="page"></c:set>
												<c:forEach items="${seasonByAllArea}" var="seasonAllArea" varStatus="vs" >
												 <c:set var="total" value="${total+seasonAllArea.monthTargetMoney}" scope="page"></c:set>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${total }" /> 
											
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">目标</td>
									<c:forEach items="${monthAllAreaList}" var="monthAllArea" varStatus="vs">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										<fmt:formatNumber maxFractionDigits="0" value="${monthAllArea.monthTargetMoney}" />
										</td>
									</c:forEach>
									<c:forEach items="${seasonByAllArea}" var="seasonAllArea" varStatus="vs">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										<fmt:formatNumber maxFractionDigits="0" value="${seasonAllArea.monthTargetMoney}" />
										</td>
									</c:forEach>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
											 <c:set var="yearTargetAllArea" value="0" scope="page"></c:set>
												<c:forEach items="${seasonByAllArea}" var="seasonAllArea" varStatus="vs" >
												 <c:set var="yearTargetAllArea" value="${yearTargetAllArea+seasonAllArea.monthTargetMoney}" scope="page"></c:set>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${yearTargetAllArea }" /> 
								
								</td>
							</tr>
							 <tr>
						    	
									<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">实绩</td>
									<c:forEach items="${monthAllAreaList}" var="monthAllArea" varStatus="vs">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										
										<fmt:formatNumber maxFractionDigits="0" value="${monthAllArea.monthMoney/1000}" />
										</td>
									</c:forEach>
								<c:forEach items="${seasonByAllArea}" var="seasonAllArea" varStatus="vs">
										<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;">
										<fmt:formatNumber maxFractionDigits="0" value="${seasonAllArea.monthMoney/1000}" />
										</td>
								</c:forEach>
									
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right; ">
											<c:set var="yearMoenyAllArea" value="0" scope="page"></c:set>
												<c:forEach items="${seasonByAllArea}" var="seasonAllArea" varStatus="vs" >
												 <c:set var="yearMoenyAllArea" value="${yearMoenyAllArea+(seasonAllArea.monthMoney/1000)}" scope="page"></c:set>
												</c:forEach>
											<fmt:formatNumber maxFractionDigits="0" value="${yearMoenyAllArea }" /> 
									
								</td>
							</tr>
							 <tr>
						    
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">达标率</td>
									<c:forEach items="${monthAllAreaList}" var="monthAllArea" varStatus="vs">
										<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
										<fmt:formatNumber type="number" value="${(monthAllArea.monthMoney/1000) > 0 && monthAllArea.monthTargetMoney > 0 ? ((monthAllArea.monthMoney/1000) / monthAllArea.monthTargetMoney) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%</td>
									</c:forEach>
								
									<c:forEach items="${seasonByAllArea}" var="seasonAllArea" varStatus="vs">
										<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right;">
										<fmt:formatNumber type="number" value="${(seasonAllArea.monthMoney/1000) > 0 && seasonAllArea.monthTargetMoney > 0 ? ((seasonAllArea.monthMoney/1000) / seasonAllArea.monthTargetMoney) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%</td>
									</c:forEach>
									<td class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: right; ">
										<fmt:formatNumber type="number" value="${yearMoenyAllArea > 0 && yearTargetAllArea > 0 ? (yearMoenyAllArea / yearTargetAllArea) * 100 : 0 }" maxFractionDigits="2" minFractionDigits="2"/>%
									</td>
							<%-- --%>
								
							</tr> 
			</table>
		</div>
	</form>
	<span id="clock"></span>
	<br>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-53</p>
</body>
</html>