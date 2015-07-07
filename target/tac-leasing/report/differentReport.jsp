<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>成本差异</title>	
	<script type="text/javascript">
		$(function (){
			$("#startDate").datepicker($.datepicker.regional["zh-CN"]);
			$("#endDate").datepicker($.datepicker.regional["zh-CN"]);
		});
	
		function expToExcel(){
		  $("#__action").val("differentReport.expDifferentToExcel");
		  $("#form1").submit();
		}		
		//成本差异增加时间范围
		function checkDoSearch(){
		 	$("#__action").val("differentReport.differentReportAll");
			$("#form1").submit();
		}	
		
		function updateDateMonth(){
			var date = $("#startDate").val() ;
			$("#startDate").val(date.toString().substring(0,7)) ;
		}	
		</script>
	</head>
	<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" id="__action" value="">
  	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;收入成本差异表</span>
   	</div>	
		<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv" >
					<div class="zc_grid_body ">
					<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff"> 
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="300" class="ss_t">&nbsp;&nbsp;
				          <table style="margin-left: 10px;vertical-align: top;" >
				       <td>起始时间：</td><td>	<input type="text" value="<fmt:formatDate value="${startDate}" pattern="yyyy-MM"/>" onchange="updateDateMonth() ;" name="startDate" id="startDate" readonly="readonly" style="width:150px; height:18px;">
					</td>	
					<!-- Modify by Michael 2012 02-28 -->          
					<!--  
					<td>
					结束时间：
					</td>
					<td><input type="text" name="endDate" id="endDate"
					value="${endDate}"
					style="width: 150px" />
					</td>
					-->
					</table>				          
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="checkDoSearch();"  class="blue_button">搜 索</a></td>
				        <td windth="100%">&nbsp;</td>
				      </tr>
				    </table>
				  	&nbsp;
				    </div>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" width="100%"  >
					<tr>
						<td><input type="button" class="ui-state-default ui-corner-all"  value="导出(EXCEL)"  onclick="expToExcel();"></td>
					</tr>
						<tr>
						<td style="width: 40% ; vertical-align: top; "><!--vertical-align: top;  -->
							<table style="width: 270" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title" style="vertical-align: top;">
							  <tr>
							    <td colspan="2" align="center" height="40" class="ui-widget-content jqgrow ui-row-ltr">项目</td>
							    <td colspan="2" align="center" height="40" class="ui-widget-content jqgrow ui-row-ltr">小计</td>
							  </tr>
							  <tr>
							    <td width="19%" rowspan="4"align="center" height="20" class="ui-widget-content jqgrow ui-row-ltr">收入</td><%--
							    <td width="81%" height="20" class="ui-widget-content jqgrow ui-row-ltr">应确认收入</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${ren_priceSubtotal }"/></td>
							  --%></tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">财务确认收入</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${caiwuSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">税务确认收入</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${shuiwuSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">差异</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${chayiSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td rowspan="6"align="center" height="20" class="ui-widget-content jqgrow ui-row-ltr">税务成本</td>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">营业税</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${yingyeSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">城建</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${chengjianSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">地方教育费附加</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${jiaoyuSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">保险费</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${insure_priceSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">印花税</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${yinhuaSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">小计</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${xiaojiSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td rowspan="3" align="center" height="20" class="ui-widget-content jqgrow ui-row-ltr">主营业务利润</td>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">财务利润</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${cliSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">税务利润</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${sliSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr">差异</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${licSubtotal }"/></td>
							  </tr>
							  <tr>
							    <td height="20" class="ui-widget-content jqgrow ui-row-ltr"></td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"></td>
							  </tr><%--
							  <tr>
							    <td colspan="2" align="center" height="20" class="ui-widget-content jqgrow ui-row-ltr">融资租赁合同总额</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="0.0"/></td>
							  </tr>
							  <tr>
							     <td colspan="2" align="center" height="20" class="ui-widget-content jqgrow ui-row-ltr">融资租赁设备款</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${shebeiTotal }"/></td>
							  </tr>
							  <tr>
							    <td colspan="2" align="center" height="20" class="ui-widget-content jqgrow ui-row-ltr">保险费（年）</td>
							    <td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr"><fmt:formatNumber type="currency" value="${insure_priceSubtotal }"/></td>
							  </tr>
							--%></table>						
						</td>
						<td >
							<!-- <table>
									<tr>    
										<td height="36">&nbsp;</td>																																																
									</tr>
							</table> -->
							<div style="width:968;height:420;overflow-x:scroll;overflow-y:hidden ;">
								<table style="width: 1;" border="0" cellspacing="0" cellpadding="0" class="ui-jqgrid-htable zc_grid_title">
									<tr>    
										<c:forEach items="${nianList}" var="nianList">	
										<!-- 
												<c:forEach items="${nianCountList}" var="nianCountList">	
													<c:if test="${creditMap.CUST_TYPE eq 0}">
													${creditMap.NATU_HOME_ADDRESS}
													</c:if>	
												</c:forEach>	
										 -->												
												<td height="20" class="ui-widget-content jqgrow ui-row-ltr" align="center">${nianList.NIAN}年</td>																																																
										</c:forEach>	
									</tr>								
									<tr>    
										<c:forEach items="${yueList}" var="yueList">				
												<td height="20" class="ui-widget-content jqgrow ui-row-ltr" align="center">${yueList.YUE}月</td>																																																
										</c:forEach>	
									</tr><%--	
									<tr>    
										<c:forEach items="${ren_priceList}" var="ren_priceList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${ren_priceList.REN_PRICE}"/></td>																																																	
										</c:forEach>	
									</tr>	
									--%><tr>    
										<c:forEach items="${caiwuList}" var="caiwuList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${caiwuList.CAIWU}"/></td>																																																
										</c:forEach>	
									</tr>	
									<tr>    
										<c:forEach items="${shuiwuList}" var="shuiwuList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${shuiwuList.SHUIWU}"/></td>																																																	
										</c:forEach>	
									</tr>
									<tr>    
										<c:forEach items="${chayiList}" var="chayiList">					
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${chayiList.CHAYI}"/></td>																																																
										</c:forEach>	
									</tr>	
									<tr>    
										<c:forEach items="${yingyeList}" var="yingyeList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${yingyeList.YINGYE}"/></td>																																																	
										</c:forEach>	
									</tr>
									<tr>    
										<c:forEach items="${chengjianList}" var="chengjianList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${chengjianList.CHENGJIAN}"/></td>																																																
										</c:forEach>	
									</tr>	
									<tr>    
										<c:forEach items="${jiaoyuList}" var="jiaoyuList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${jiaoyuList.JIAOYU}"/></td>																																																	
										</c:forEach>	
									</tr>
									<tr>    
										<c:forEach items="${insure_priceList}" var="insure_priceList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${insure_priceList.INSURE_PRICE}"/></td>																																																	
										</c:forEach>	
									</tr>	
									<tr>    
										<c:forEach items="${yinhuaList}" var="yinhuaList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${yinhuaList.YINHUA}"/></td>																																																		
										</c:forEach>	
									</tr>
									<tr>    
										<c:forEach items="${xiaojiList}" var="xiaojiList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${xiaojiList.XIAOJI}"/></td>																																																		
										</c:forEach>	
									</tr>	
									<tr>    
										<c:forEach items="${cliList}" var="cliList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${cliList.CLI}"/></td>																																																	
										</c:forEach>	
									</tr>
									<tr>    
										<c:forEach items="${sliList}" var="sliList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${sliList.SLI}"/></td>																																																	
										</c:forEach>	
									</tr>	
									<tr>    
										<c:forEach items="${licList}" var="licList">				
												<td align="right" height="20" class="ui-widget-content jqgrow ui-row-ltr">&nbsp;<fmt:formatNumber type="currency" value="${licList.LIC}"/></td>																																																
										</c:forEach>	
									</tr>	
								</table>
							</div>	
						</td>
						</tr>
					</table>
				</div>
				</div>
			</div>	
		</form>
	</body>
</html>