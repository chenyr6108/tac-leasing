<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<html>
	<head>
		<title>过往记录</title>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/tab.css" />
			<script type="text/javascript">
				function controllerTextArea(value, sed) {
					var taNode = $("#"+sed);
					var height = taNode.height();
					if ("add"==value) {
						taNode.height(height*2);
					}
					if ("del"==value) {
						if (parseInt(height) > 46) {
							taNode.height(height/2);
						}
					}
				}
			</script>
	</head>
		
	<body>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           				<div class="zc_grid_body jqgrowleft">
        <div>
		<form action="../servlet/defaultDispatcher" name="riorRecordsForm" id="riorRecordsForm"
			method="post">
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
			<input type="hidden" name="__action"
				value="creditPriorRecords.savecreditPriorRecords">
				<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<table width="100%" border="0" cellspacing="1" cellpadding="5">
				
				<tr>
								<td colspan="7"   class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" width="100%">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="12"  align="left">
										        <strong style="font-size: 14px;">过往合同</strong>
										   </td>
										</tr>
										<tr>
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												提前结清
											</th>
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												合同号
											</th>
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												拨款时间 
											</th>
											<!-- <th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												支付表号
											</th> -->
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												融资额
											</th>
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												实际TR
											</th>
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												期数
											</th>
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												已缴期数
											</th>
											<!-- <th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												租金总额
											</th> -->
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												未税净租金余额
											</th>
											<!-- <th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												剩余利息
											</th> -->
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												实际剩余本金
											</th>
											<th class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
												逾期情况
											</th>
										</tr>
										<c:forEach items="${priorContractInfo}" var="item">
											<tr>
												<td align="center"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													 <c:choose><c:when test="${item.RECP_STATUS ==3 }">是</c:when><c:otherwise>否</c:otherwise></c:choose>&nbsp;
												</td>
												<td align="center" height="26PX"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<a onclick="javascript:location.href='../servlet/defaultDispatcher?__action=collectionManage.showPaylist&FLAG=1&RECP_ID=${item.RECP_ID }&RECT_ID=${item.RECT_ID }'" href="javascript:void(0);">${item.LEASE_CODE }</a>&nbsp;
												</td>
												<td align="center"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<a onclick="javaScript:location.href='../servlet/defaultDispatcher?__action=riskAuditSee.selectRiskAuditForSee_zulin&credit_id=${item.PRCD_ID}&prc_id=${item.PRC_ID}'" href="javaScript:void(0)">${item.PAY_DATE}</a>&nbsp;
												</td>
												<%-- <td align="center"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													${item.RECP_CODE }&nbsp;
												</td> --%>
												<td align="right"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<!-- <fmt:formatNumber value="${item.LEASE_TOPRIC }" pattern="#,#00.00"/> &nbsp; -->
													<fmt:formatNumber value="${item.LEASE_RZE }" pattern="#,#00.00"/> &nbsp;
												</td>
												<td align="right"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<fmt:formatNumber value="${item.TR_IRR_RATE }" pattern="00.000"/>&nbsp;
												</td>
												<td align="center"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													${item.LEASE_PERIOD }&nbsp;
												</td>
												<td align="center"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<%-- <c:if test="${item.LEASE_TERM eq 1 }" >月</c:if>
													<c:if test="${item.LEASE_TERM eq 3 }" >季</c:if>
													<c:if test="${item.LEASE_TERM eq 6 }" >半年</c:if>
													<c:if test="${item.LEASE_TERM eq 12 }" >年</c:if>  --%>${item.LEASE_PAY_PERIOD }&nbsp;
												</td>
												<%-- <td align="right"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													 <fmt:formatNumber value="${item.TOTAL_PRICE }" pattern="#,#00.00"/>  &nbsp;
												</td> --%>
												<td align="right"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<%-- <fmt:formatNumber value="${item.MONTH_PRICE }" pattern="#,#00.00"/> --%><c:if test="${item.LEASE_PERIOD == item.LEASE_PAY_PERIOD}">0.00</c:if><c:if test="${item.LEASE_PERIOD != item.LEASE_PAY_PERIOD}"><fmt:formatNumber value="${item.REST_PRICE }" pattern="#,#00.00"/></c:if>&nbsp;
												</td>
												<%-- <td align="right"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<fmt:formatNumber value="${item.TOTAL_REN }" pattern="#,#00.00"/> &nbsp;
												</td> --%>
												<td align="right"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<%-- <c:if test="${item.LEASE_PERIOD == item.LEASE_PAY_PERIOD}">0.00</c:if><c:if test="${item.LEASE_PERIOD != item.LEASE_PAY_PERIOD}"><fmt:formatNumber value="${item.OWN_PRICE }" pattern="#,#00.00"/></c:if>&nbsp; --%>
													<fmt:formatNumber value="${item.REMAINING_PRINCIPAL }" pattern="#,#00.00"/>
												</td>
												<td align="center"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<c:if test="${empty item.HAS_DUN }">无</c:if>
													<c:if test="${not empty item.HAS_DUN }">
														<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.showNewDunDetailByDecpId&RECP_CODE=${item.RECP_CODE}&RECP_ID=${item.RECP_ID }'">有</a>
													</c:if> &nbsp;
												</td>
											</tr>
										</c:forEach>	
									</table>
								</td> 
							</tr>
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab111"  >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" >
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂房
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												国土证/房产证
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												面积（平方米）
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												出租人
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:if test="${creditPriorFactoryBuld.FBTYPE eq 1 }">银行贷款（元）</c:if>
												<c:if test="${creditPriorFactoryBuld.FBTYPE eq 0 }">每月租金（元）</c:if>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												备注说明
											</td>										
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												 <c:if test="${creditPriorFactoryBuld.FBTYPE eq 1 }">自有</c:if><c:if test="${creditPriorFactoryBuld.FBTYPE eq 0 }">租赁</c:if>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:if test="${creditPriorFactoryBuld.FBIDENTIFY eq 0 }">无</c:if> <c:if test="${creditPriorFactoryBuld.FBIDENTIFY eq 1 }">有</c:if>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												 <fmt:formatNumber value="${creditPriorFactoryBuld.FBAREA }"  pattern="#,#00.00" />&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												${creditPriorFactoryBuld.LESSOR }&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="right" >
												 <fmt:formatNumber value="${creditPriorFactoryBuld.MONTHCOST }"  type="currency" />&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<pre>${creditPriorFactoryBuld.REMARK }</pre>&nbsp;
											</td>										
										</tr>
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">备注</td>
											<td colspan="5" align="center"><table>
											<td width="100%"><pre style="font-size:14px;">${creditPriorFactoryBuld.REMARKCONTEXT }</pre></td>
											<!-- <td><input type='button' value='加' onClick='controllerTextArea("add", "REMARKCONTEXT");' /><br/>
											<input type='button' value='减' onClick='controllerTextArea("del", "REMARKCONTEXT");' /></td> -->
											</table>
											</td>
										</tr>
									</table>
								</td>
								
							</tr>
						</table>
					</td>
				</tr>
				
				 <tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab111"  >
							
							<tr>
								<td colspan="6"  width="100%">
									<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" >
										<tr >
											<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
											<strong style="font-size: 14px;">经营效益分析（仟元）</strong>
											</td>
											
										</tr>
										<tr >
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<strong style="font-size:14px;">交机/设定前</strong>
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<strong style="font-size:14px;">交机/设定后</strong>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<strong style="font-size:14px;">成长比重%</strong>
											</td>
											
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												销货收入
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BECELLINCOME }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												销货收入
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFCELLINCOME }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.CELLINCOMEPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												其他收入
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BEOTHERINCOME }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												其他收入
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFOTHERINCOME }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.OTHERINCOMEPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												原物料成本
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BERESOURCECOST }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												原物料成本
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFRESOURCECOST }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.RESOURCECOSTPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂房租金
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BEFBMONTHPRICE }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂房租金
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFFBMONTHPRICE }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.FBMONTHPRICEPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												薪资
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BESALARY }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												薪资
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFSALARY }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.SALARYPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												水电
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BEWATERELEC }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												水电
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFWATERELEC }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.WATERELECPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												其它支出
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BEBEFORECOST }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												其它支出
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFBEFORECOST }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BEFORECOSTPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												税金
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BETAXMON }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												税金
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFTAXMON }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.TAXMONPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												外发费用
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BEOTHERBANKLOAN }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												外发费用
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFOTHERBANKLOAN }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.OTHERBANKLOANPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												银行借款
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BEBANKLOAN }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												银行借款
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFBANKLOAN }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BANKLOANPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												本案租赁费
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BETHISRENT }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												本案租赁费
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFTHISRENT }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.THISRENTPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												结余
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.BESUM }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												结余
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.AFSUM }" type="currency"/>&nbsp;
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${submitMachineMap.SUMPER }" pattern="#,#00.00"/>&nbsp;
											</td>
										</tr>
										<tr style="min-height: 40px;">
											<td  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
												说明
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" colspan="4" style="font-size:14px;">
												<pre style="font-size:14px;">${submitMachineMap.REMARK }</pre>
											</td>
										</tr>
									</table>
								</td>
							</tr>	
				 		</table>
					</td>
				</tr>
				
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectEquipment">
										<tr >
											<td colspan="4" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
												设备明细（仟元）
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												
												&nbsp;
												
											</td>
										
										</tr>
										<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												设备名称
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												数量
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂牌
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												购入日期
											</td>
											<!-- <td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												购入金额
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												备注说明
											</td> -->
											<td width="8%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												购入单价
											</td>
											<td width="7%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												总计
											</td>
											<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												备注说明
											</td>

																				
										</tr>
										<c:forEach items="${EuqipmentsList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.EQUPNAME }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.EQUPNUM }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.EQUPMODEL }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;"><c:if test="${item.EQUPBUYDATE ne '1900-01-01' }">${item.EQUPBUYDATE}</c:if></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;"><fmt:formatNumber value="${item.EQUPBUYMON }" pattern="#,#00.00" /></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;"><fmt:formatNumber value="${item.EQUPBUYMON*item.EQUPNUM }" pattern="#,#00.00" /></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"width="100%" style="font-size:14px;"><pre>${item.EQUPREMARK }</pre></td>

										</tr>
										</c:forEach>
									</table>
								</td>			
							</tr>
							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
									说明
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
								<table>
									<td width="100%"><pre style="font-size:14px;">${EuqipmentsRemarkMap.ALLREMARK }</pre></td>
									<!--<td><input type='button' value='加' onClick='controllerTextArea("add", "ALLREMARK");' /><br/>
										<input type='button' value='减' onClick='controllerTextArea("del", "ALLREMARK");' /></td>-->
										</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- 主要往来客户 -->	
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="table_ContactCoustomer">
										<tr >
											<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
												主要销货客户（仟元）
											</td>
											<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;" style="font-size:14px;">
												
												&nbsp;
												
											</td>
										
										</tr>
										<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂商名称
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂商地点
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												商品种类
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												月往来金额
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												比重%
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												收款条件
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;" width="100px;">
												联系人
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;" width="100px;">
												电话
											</td>									
										</tr>
										<c:forEach items="${ContactCustomerList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.CC_NAME }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.CC_ADDRESS }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.CC_TYPE }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;"><fmt:formatNumber value="${item.CC_MONEY }" pattern="#,#00.00" /></td>
											<c:set var="cc_all" value="${ item.CC_MONEY +cc_all }"></c:set>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;"><fmt:formatNumber value="${item.CC_PERCENT}" pattern="#00.00" /></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.CC_CONDITION }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center" style="font-size: 14px;">${item.CC_LINK_MAN }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center" style="font-size: 14px;">${item.LINK_MAN_PHONE }</td>
										</tr>
										</c:forEach>

										<!-- 加入总计 -->
										<tr>
											<td colspan="2"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												&nbsp;
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												合计
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><fmt:formatNumber value='${cc_all}' pattern='#,#00.00' /></td>
											<td colspan="4"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">&nbsp;</td>
										</tr>

									</table>
								</td>			
							</tr>
							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
									照会情况
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
									<table>
									<td width="100%"><pre style="font-size:14px;">${ContactCustomerRemarkMap.ALLREMARK }</pre></td>
									<!--<td><input type='button' value='加' onClick='controllerTextArea("add", "CC_REMARK");' /><br/>
											<input type='button' value='减' onClick='controllerTextArea("del", "CC_REMARK");' /></td>-->
											</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<!-- 主要往来客户结束 -->		
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectBuyFactory">
										<tr >
											<td colspan="8" class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
												主要进货客户（仟元）
											</td>
											
										</tr>
										<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂商名称
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												商品种类
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												月往来金额
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												比重%
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												付款条件
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;width: 100px;" width="100px;">
												联系人
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;width: 100px;" width="100px;">
												电话
											</td>												
										</tr>
										<c:forEach items="${BuyFactoriesList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.FACTORYNAME }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.THINGKIND }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;"><fmt:formatNumber value="${item.MONTHINGOPRICE }" pattern="#,#00.00" /></td>
											<c:set var="BUYFACTORYOR_ALL" value="${ item.MONTHINGOPRICE +BUYFACTORYOR_ALL }"></c:set>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;"><fmt:formatNumber value="${item.PERCENTGRAVE }" pattern="#00.00" /></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.PAYCONDITIONS }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.BUY_LINK_MAN }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">${item.BUY_LINK_MAN_PHONE }</td>
										</tr>
										</c:forEach>
										<!-- 加入总计 -->
										<tr>
											<td colspan="1"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												&nbsp;
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												合计
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center" style="font-size:14px;"><fmt:formatNumber value='${BUYFACTORYOR_ALL}' pattern='#,#00.00' /></td>
											<td colspan="4"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												&nbsp;
											</td>
										</tr>

										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
											照会情况
											</td>
											<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
											<table>
												<td width="100%"><pre><pre style="font-size:14px;"><c:forEach items="${BuyFactoriesList}" var="item" varStatus="status">${item.ALLBUYREMARK }</c:forEach></pre></td>
												<!--<td><input type='button' value='加' onClick='controllerTextArea("add", "ALLBUYREMARK");' /><br/>
											<input type='button' value='减' onClick='controllerTextArea("del", "ALLBUYREMARK");' /></td>-->
											</table>
											</td>
										</tr>
									</table>
								</td>			
							</tr>
						</table>
					</td>
				</tr>
				<!-- 
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectCellFactory">
										<tr >
											<td colspan="6" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												销货厂商
											</td>
										</tr>
										<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂商名称
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												厂商地点
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												商品总种类
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												月往来金额
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												比重%
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												收款条件
											</td>												
										</tr>	
										<c:forEach items="${CellFactoriesList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center">${item.FACTORYNAME }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center">${item.FACTORYADDR }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center">${item.THINGKIND }</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><fmt:formatNumber value="${item.MONTHINGOPRICE }" pattern="#,#00.00" /></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><fmt:formatNumber value="${item.PERCENTGRAVE }" pattern="#,#00.00" /></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center">${item.PAYCONDITIONS }</td>
										</tr>
										</c:forEach>
									</table>
								</td>			
							</tr>
							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
										说明
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
										<textarea id="ALLCELLREMARK" name="ALLCELLREMARK" rows="3" cols="100">${CellFactoriesAllRemarkMap.ALLCELLREMARK }</textarea>
								</td>
							</tr>
							 -->
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"   >

							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
									内销比重%
								</td>
								<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
									<fmt:formatNumber value="${CellFactoriesAllRemarkMap.INPERCENTGRAVE }" pattern="#,#00.00" />
								</td>
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
									外销比重%
								</td>
								<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
									<fmt:formatNumber value="${CellFactoriesAllRemarkMap.OUTPERCENTGRAVE }" pattern="#,#00.00" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectBankCheckBill">
										<tr >
											<td colspan="8" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
												银行对账单(元)
											</td>
											
										</tr>
										<c:forEach items="${BankCheckBillList}" var="item" varStatus="status">
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
													户名
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
													${item.BANKCUSTNAME }
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
													银行支行
											</td>
											<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
													${item.BANKBRANCH }
											</td>

										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
												账号
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												${item.BANKCUSTCODE }
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="font-size:14px;">
												&nbsp;
											</td>
											<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												&nbsp;
											</td>		
										</tr>
										
										<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												期间（月）
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:choose><c:when test="${item.CHECKMONTHONE eq '1900-01-01 00:00:00.0'}">无</c:when><c:otherwise><fmt:formatDate value="${item.CHECKMONTHONE }" pattern="yyyy-MM"/></c:otherwise></c:choose>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:choose><c:when test="${item.CHECKMONTHTWO eq '1900-01-01 00:00:00.0'}">无</c:when><c:otherwise><fmt:formatDate value="${item.CHECKMONTHTWO }" pattern="yyyy-MM"/></c:otherwise></c:choose>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:choose><c:when test="${item.CHECKMONTHTHREE eq '1900-01-01 00:00:00.0'}">无</c:when><c:otherwise><fmt:formatDate value="${item.CHECKMONTHTHREE }" pattern="yyyy-MM"/></c:otherwise></c:choose>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:choose><c:when test="${item.CHECKMONTHFOUR eq '1900-01-01 00:00:00.0'}">无</c:when><c:otherwise><fmt:formatDate value="${item.CHECKMONTHFOUR }" pattern="yyyy-MM"/></c:otherwise></c:choose>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:choose><c:when test="${item.CHECKMONTHFINE eq '1900-01-01 00:00:00.0'}">无</c:when><c:otherwise><fmt:formatDate value="${item.CHECKMONTHFINE }" pattern="yyyy-MM"/></c:otherwise></c:choose>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<c:choose><c:when test="${item.CHECKMONTHSIX eq '1900-01-01 00:00:00.0'}">无</c:when><c:otherwise><fmt:formatDate value="${item.CHECKMONTHSIX }" pattern="yyyy-MM"/></c:otherwise></c:choose>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" rowspan="2" style="font-size:14px;">
												累计
											</td>
									</tr>
									<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												上期结余
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.LASTSUMONE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.LASTSUMTWO }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.LASTSUMTHREE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.LASTSUMFOUR }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.LASTSUMFINE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.LASTSUMSIX }" pattern="#,#00.00" />
											</td>
									</tr>
									<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												每月收入
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHINCOMEONE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHINCOMETWO }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHINCOMETHREE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHINCOMEFOUR }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHINCOMEFINE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHINCOMESIX }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHINCOMEONE+item.MONTHINCOMETWO+item.MONTHINCOMETHREE+item.MONTHINCOMEFOUR+item.MONTHINCOMEFINE+item.MONTHINCOMESIX }" pattern="#,#00.00" />
											</td>
									</tr>
									<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;" style="font-size:14px;">
												每月支出
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHCOSTONE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHCOSTTWO }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHCOSTTHREE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHCOSTFOUR }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHCOSTFINE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHCOSTSIX }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONTHCOSTSIX+item.MONTHCOSTFINE+item.MONTHCOSTFOUR+item.MONTHCOSTTHREE+item.MONTHCOSTTWO+item.MONTHCOSTONE }" pattern="#,#00.00" />
											</td>
									</tr>
									<tr>
											
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												本期结余
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.THISSUMONE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.THISSUMTWO }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.THISSUMOTHREE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.THISSUMFOUR }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.THISSUMFINE }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.THISSUMSIX }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" style="font-size:14px;">
												<fmt:formatNumber value="${item.THISSUMSIX+item.THISSUMFINE+item.THISSUMFOUR+item.THISSUMOTHREE+item.THISSUMTWO+item.THISSUMONE }" pattern="#,#00.00" />
											</td>
									</tr>
									<tr>
											
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												现金流入
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONEYFLOWINONE }" pattern="#,#00.00" />
											</td>
											
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONEYFLOWINTWO }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONEYFLOWINTHREE }" pattern="#,#00.00" />
											</td>
											
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONEYFLOWIFOUR }" pattern="#,#00.00" />
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONEYFLOWINFINE }" pattern="#,#00.00" />
											</td>
											
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												<fmt:formatNumber value="${item.MONEYFLOWINSIX }" pattern="#,#00.00" />
											</td>
									</tr>
									<tr >
										<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
												说明
										</td>
										<td colspan="8" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="font-size:14px;">
										<table><td>
												<pre>${item.REMARK }</pre></td>
											<!--<td><input type='button' value='加' onClick='controllerTextArea("add", "BANK_REMARK${ status.count }");' /><br/>
											<input type='button' value='减' onClick='controllerTextArea("del", "BANK_REMARK${ status.count }");' /></td>-->
											</table>
										</td>
									</tr>
									</c:forEach>	
										
									</table>
								</td>			
							</tr>
							
						</table>
					</td>
				</tr>
				<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
							银行同业往来:<br>
							<textarea rows="5" cols="200" readonly="readonly">${creditPriorFactoryBuld.BANK_TONGYE }</textarea>
					</td>
				</tr>
				
				<tr>
					<td>
						<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title"  id="priorRecordsTab">
							<tr>
								<td colspan="7" >
									<table  cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" width="100%">
										<tr >
											<td height="26" class="ui-state-default ui-th-ltr zc_grid_head" align="left" width="75.5%">
										        <strong style="font-size:14px;" style="font-size:14px;">过往记录</strong>
										   </td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="right"> 
												&nbsp; 
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"> 
												&nbsp;
											</td>
										</tr>
									</table>
								</td> 
							</tr>
							<tr>
								<th width="3%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
									<input type="checkbox" name="" id="checkbox9" disabled="disabled">
								</th>
								<th width="14%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
									供应商
								</th>
								<th width="17%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
									产品名称
								</th>
								<th width="18%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
									销售金额（千元）
								</th>
								<th width="14%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
									收款（千元）
								</th>
								<th colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
									往来情况说明
								</th>
							</tr>
							<c:forEach items="${creditPriorRecords}" var="item">
								<tr>
									<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
										<input type="checkbox" name="priorRecords_check" id="checkbox10" disabled="disabled">
									</td>
									<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
										${item.LEASE_CODE } &nbsp;
									</td>
									<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
										${item.EQUIPMENT_NAME }&nbsp;
									</td>
									<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
										${item.SALES_PRICE }&nbsp;
									</td>
									<td align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
										${item.GATHERING_PRICE }&nbsp;
									</td>
									<td colspan="2" align="center" style="text-align: center;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
										<pre style="font-size:14px;">${item.INFO_REMARK }</pre>  &nbsp;
									</td>
								</tr> 
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" id="priorProjectTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" >
							<tr>
								<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" width="100%">
									<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" >
										<tr >
											<td class="ui-widget-content jqgrow ui-row-ltr" align="left" width="88%" style="font-size: 14px;">
												过往项目
											</td>
											<td class="ui-widget-content jqgrow ui-row-ltr"  align="right" colspan="2"> 
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 0}">
									<tr>
										<td width="19%" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											<input type="checkbox" name="priorProjects_check" disabled="disabled" id="priorProjects_check" value="${status.count }"> 项目名称：
										</td>
										<td width="81%" style="text-align: left;font-size:14px;" class="ui-widget-content jqgrow ui-row-ltr">
											${item.PROJECT_NAME } &nbsp;
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											内容：
										</td>
										<td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr">
											<pre style="font-size: 14px;">${item.PROJECT_CONTENT } &nbsp;</pre>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
				<%-- <tr>
					<td>
						<table width="100%" id="thisProjectsTab"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td height="26" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
									本次租赁意见总结
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;"> 
								&nbsp;
								</td>
							</tr> 
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 1}">
									<tr>
										<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											项目名称：
										</td>
										<td width="81%" colspan="5" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											${item.PROJECT_NAME } &nbsp;
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											内容：
										</td>
										<td colspan="5"  width="81%"  class="ui-widget-content jqgrow ui-row-ltr">
											<pre style="font-size: 14px;">${item.PROJECT_CONTENT } &nbsp;</pre>
										</td>
									</tr>
								</c:if> 
							</c:forEach>	 --%>
							<!--<c:if test="${creditMap.CUST_TYPE eq 1 }">   <tr>
								<th width="19%" align="left" class="ui-state-default ui-th-ltr zc_grid_head">
									项目名称
								</th>
								<th colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
									财务情况说明 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位（千元）
								</th>
							</tr> 
							<tr>
								<td width="20%"  class="ui-widget-content jqgrow ui-row-ltr">
									项目： 
								</td>
								<td width="15%"     class="ui-widget-content jqgrow ui-row-ltr">
									${v1.PROJECT_NAME} &nbsp;
								</td>
								<td width="15%"    class="ui-widget-content jqgrow ui-row-ltr"> 
								    ${v2.PROJECT_NAME} &nbsp;
								</td>
								<td width="15%"      class="ui-widget-content jqgrow ui-row-ltr">
									${v3.PROJECT_NAME} &nbsp;
								</td>
								<td width="15%"     class="ui-widget-content jqgrow ui-row-ltr">
									${v4.PROJECT_NAME} &nbsp;
								</td>
								<td width="20%"    class="ui-widget-content jqgrow ui-row-ltr">
									备注： 
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									货币资金：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v1.MONEY_FUNDS} &nbsp;
								</td>
								<td    style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v2.MONEY_FUNDS} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v3.MONEY_FUNDS} &nbsp;
								</td>
								<td    style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v4.MONEY_FUNDS} &nbsp;
								</td>
								<td      style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									${cFS_Remark.MONEY_FUNDS} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									应收账款：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v1.ACCOUNTS_RECEIVABLE} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v2.ACCOUNTS_RECEIVABLE} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr"> 
									${v3.ACCOUNTS_RECEIVABLE} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v4.ACCOUNTS_RECEIVABLE} &nbsp;
								</td>
								<td      style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
									${cFS_Remark.ACCOUNTS_RECEIVABLE} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									存货：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v1.STOCK} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v2.STOCK} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v3.STOCK} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v4.STOCK} &nbsp;
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									${cFS_Remark.STOCK} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									固定资产（净值）：
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v1.CAPITAL_ASSERTS} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v2.CAPITAL_ASSERTS} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v3.CAPITAL_ASSERTS} &nbsp;
								</td>
								<td   style="text-align: right" class="ui-widget-content jqgrow ui-row-ltr">
									${v4.CAPITAL_ASSERTS} &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									${cFS_Remark.CAPITAL_ASSERTS} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									总资产：
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									${v1.TOTAL_ASSERTS} &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									${v2.TOTAL_ASSERTS} &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${v3.TOTAL_ASSERTS} &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${v4.TOTAL_ASSERTS} &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${cFS_Remark.TOTAL_ASSERTS} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									短期借款：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${v1.SHORTTIME_LOAN} &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${v2.SHORTTIME_LOAN} &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									${v3.SHORTTIME_LOAN} &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${v4.SHORTTIME_LOAN} &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${cFS_Remark.SHORTTIME_LOAN} &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									应付账款：
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.ACCOUNTS_PAYABLE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.ACCOUNTS_PAYABLE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.ACCOUNTS_PAYABLE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.ACCOUNTS_PAYABLE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.ACCOUNTS_PAYABLE}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									总负债：
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.TOTAL_OWES}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.TOTAL_OWES}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.TOTAL_OWES}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.TOTAL_OWES}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.TOTAL_OWES}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									实收资本：
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.CONTRIBUTED_CAPITAL}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.CONTRIBUTED_CAPITAL}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.CONTRIBUTED_CAPITAL}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.CONTRIBUTED_CAPITAL}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.CONTRIBUTED_CAPITAL}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									资本公积：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.CAPITAL_RESERVE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.CAPITAL_RESERVE}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.CAPITAL_RESERVE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.CAPITAL_RESERVE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.CAPITAL_RESERVE}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									未分配利润：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.UNDISTRIBUTED_PROFIT}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.UNDISTRIBUTED_PROFIT}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.UNDISTRIBUTED_PROFIT}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.UNDISTRIBUTED_PROFIT}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.UNDISTRIBUTED_PROFIT}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									销售收入：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.SALES_REVENUE}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.SALES_REVENUE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.SALES_REVENUE}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.SALES_REVENUE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.SALES_REVENUE}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"   class="ui-widget-content jqgrow ui-row-ltr">
									销售成本：
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.COST_OF_MARKETING}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.COST_OF_MARKETING}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.COST_OF_MARKETING}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.COST_OF_MARKETING}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.COST_OF_MARKETING}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%"  class="ui-widget-content jqgrow ui-row-ltr">
									期间费用：
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.PERIOD_EXPENSE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.PERIOD_EXPENSE}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.PERIOD_EXPENSE}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.PERIOD_EXPENSE}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.PERIOD_EXPENSE}  &nbsp;
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									利润总额：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.TOTAL_PROFIT}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.TOTAL_PROFIT}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.TOTAL_PROFIT}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.TOTAL_PROFIT}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.TOTAL_PROFIT}  &nbsp;
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									资产负债率：
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.DEBTR}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.DEBTR}  &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.DEBTR}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.DEBTR}  &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.DEBTR}  &nbsp;
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									销售净利率：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.PROFIT_MARGIN}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.PROFIT_MARGIN}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.PROFIT_MARGIN}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.PROFIT_MARGIN}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.PROFIT_MARGIN}  &nbsp;
								</td>
							</tr>
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									毛利率：
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.TTM}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.TTM}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.TTM}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.TTM}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.TTM}  &nbsp;
								</td>
							</tr>
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									销售增长率：
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.SALES_GROWTH}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.SALES_GROWTH}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.SALES_GROWTH}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.SALES_GROWTH}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.SALES_GROWTH}  &nbsp;
								</td>
							</tr>
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									净资产增长率：
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v1.NAGR}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v2.NAGR}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v3.NAGR}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${v4.NAGR}  &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${cFS_Remark.NAGR}  &nbsp;
								</td>
							</tr>       </c:if>

						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherProjectsTab">
							<tr>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									其他调查说明：
								</td>
								<td width="80%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
										<tr >
											<td    class="ui-widget-content jqgrow ui-row-ltr"> 
												&nbsp;
											 </td>
											<td    class="ui-widget-content jqgrow ui-row-ltr">
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 2}">
									<tr>
										<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head">
											<input type="checkbox" disabled="disabled" name="otherProjects_check" id="otherProjects_check" value="${status.count }"> 项目名称：
										</td>
										<td width="81%"    class="ui-widget-content jqgrow ui-row-ltr">
											${item.PROJECT_NAME } &nbsp;
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-state-default ui-th-ltr zc_grid_head">
											内容：
										</td>
										<td    class="ui-widget-content jqgrow ui-row-ltr">
											<pre>${item.PROJECT_CONTENT } &nbsp;</pre>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr> 
				<c:if test="${not empty creditPriorProject}">
				<tr>
					<td>
						<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="pingshenyijianTab">
							<tr>
								<td  class="ui-state-default ui-th-ltr zc_grid_head">
									<b>说明</b>
								</td>
								<td colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								&nbsp;
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 3}">
									 
									<tr>
										<td width="19%" height="50"   class="ui-widget-content jqgrow ui-row-ltr">
											意见：
										</td>
										<td   class="ui-widget-content jqgrow ui-row-ltr">
										<pre>${item.PROJECT_CONTENT } &nbsp;</pre>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr> 
			    </c:if>
				<c:if test="${empty creditPriorProject}">
				<tr>
					<td>
						<table width="100%"  cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="pingshenyijianTab">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<b>说明</b>
								</td>
								<td colspan="5"    class="ui-widget-content jqgrow ui-row-ltr"> 
								&nbsp;
								</td>
							</tr>
								
									<tr>
										<td width="19%" height="50"  class="ui-widget-content jqgrow ui-row-ltr">
											意见：
										</td>
										<td colspan="5"    class="ui-widget-content jqgrow ui-row-ltr">
											 &nbsp;
										</td>
									</tr>
						</table>
					</td>		
				</tr> 
			</c:if> 
						</table>
					</td>
				</tr>-->
			<c:if test="${not empty memoList}">
				<tr>
					<td>
				
				<table cellspacing="0" cellpadding="5" border="0"  class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong style="font-size:14px;" style="font-size: 14px;">序号</strong></td>
						<td style="background-color: #e8e8e8;" width="608"><strong style="font-size:14px;" style="font-size: 14px;">审核意见</strong></td>
						<td style="background-color: #e8e8e8;" width="120"><strong style="font-size:14px;" style="font-size: 14px;">审核人</strong></td>
						<td style="background-color: #e8e8e8;" width="50"><strong style="font-size:14px;" style="font-size: 14px;">时间</strong></td>
					</tr>
							
					<c:forEach items="${memoList}" var="item" varStatus="status" >														
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="width: 50px;"><strong style="font-size:14px;" style="font-size: 14px;">${status.count}</strong></td>
							<td width="59" align="center" width="100%"><pre style="font-size: 14px;">${item.MEMO}</pre></td>
							<td width="121" align="center" style="font-size: 14px;">${item.NAME}</td>
							<td width="50" align="center" style="font-size: 14px;"><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd"/></td>
						</tr>	
					</c:forEach>		
					</table>
				</td>		
			</tr> 
		</c:if>		

				<tr>
					<td align="center">
						<input type="button" class="ui-state-default ui-corner-all" name="sub" value="下一页" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.getCreditVouchersShow&credit_id=${creditMap.ID }&showFlag=3&examineFlag=${examineFlag}&commit_flag=${commit_flag}&isSalesDesk=${isSalesDesk }'"/>
						 
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>
	</body>
</html>
