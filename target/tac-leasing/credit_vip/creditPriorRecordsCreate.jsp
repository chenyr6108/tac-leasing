<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>过往记录</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<script src="${ctx }/credit_vip/js/creditPriorRecords.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/common/dateFormat.js"></script>
		<script type="text/javascript">				
			$(function (){
				//$("input[name='sequipmentdate']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHONE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHTWO']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHTHREE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHFOUR']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHFIVE']").datepicker($.datepicker.regional['zh-CN']);
				$("input[name='CHECKMONTHSIX']").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
	</head>

	<body>

		<form action="../servlet/defaultDispatcher" name="riorRecordsForm" id="riorRecordsForm"
			method="post">
			<input type="hidden" name="__action"
				value="creditPriorRecordsVip.savecreditPriorRecords">
				<input type="hidden" name="credit_id" value="${creditMap.ID }">
				<input type="hidden" name="cust_id" value="${creditMap.CUST_ID }">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           		<div class="zc_grid_body jqgrowleft">
        		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td>
						<table width="100%" id="priorRecordsTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="7"   class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" width="100%">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" colspan="12"  align="left">
										        <strong>过往合同</strong>
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
													<c:if test="${item.LEASE_PERIOD == item.LEASE_PAY_PERIOD}">0.00</c:if><c:if test="${item.LEASE_PERIOD != item.LEASE_PAY_PERIOD}"><fmt:formatNumber value="${item.OWN_PRICE }" pattern="#,#00.00"/></c:if>&nbsp;
												</td>
												<td align="center"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
													<c:if test="${empty item.HAS_DUN }">无</c:if>
													<c:if test="${not empty item.HAS_DUN }">
														<a href="javascript:void(0);" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=dunTask.getDunDetailByCustIdAndDate&RECP_CODE=${item.RECP_CODE}&RECP_ID=${item.RECP_ID }'">有</a>
													</c:if> &nbsp;
												</td>
											</tr>
										</c:forEach>	
									</table>
								</td> 
							</tr>
							
							<tr>
								<td colspan="7"   class="ui-state-default ui-th-ltr zc_grid_head">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" width="100%" id="beforerecords">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="left" width="75.5%">
										        <strong>过往记录</strong>
										   </td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="right">
													相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addCreditPriorRecords();">添加</a>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deleteCreditPriorRecords();">删除&nbsp;</a> 
											</td>
										</tr>
									</table>
								</td> 
							</tr>
							<tr>
								<th width="3%" class="ui-state-default ui-th-ltr zc_grid_head">
									<input type="checkbox" name="" id="checkbox9">
								</th>
								<th width="14%" class="ui-state-default ui-th-ltr zc_grid_head">供应商 
								</th>
								<th width="17%" class="ui-state-default ui-th-ltr zc_grid_head">
									产品名称
								</th>
								<th width="18%" class="ui-state-default ui-th-ltr zc_grid_head">
									销售金额（千元）
								</th>
								<th width="14%" class="ui-state-default ui-th-ltr zc_grid_head">
									收款（千元）
								</th>
								<th colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
									往来情况说明
								</th>
							</tr>
							<c:forEach items="${creditPriorRecords}" var="item">
								<tr>
									<td align="center"   class="ui-widget-content jqgrow ui-row-ltr">
										<input type="checkbox" name="priorRecords_check" id="checkbox10">
									</td>
									<td align="center"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="LEASE_CODE" id="LEASE_CODE" value="${item.LEASE_CODE }"
											style="width: 120px;">
									</td>
									<td align="center"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="EQUIPMENT_NAME" id="EQUIPMENT_NAME" value="${item.EQUIPMENT_NAME }"
											style="width: 120px;"> 
									</td>
									<td align="center"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="SALES_PRICE" id="SALES_PRICE" value="${item.SALES_PRICE }"
											style="width: 80px;">
									</td>
									<td align="center"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="GATHERING_PRICE" id="GATHERING_PRICE"  value="${item.GATHERING_PRICE }"
											style="width: 80px;">
									</td>
									<td colspan="2" align="center"  class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" name="INFO_REMARK" id="INFO_REMARK" value="${item.INFO_REMARK }"
											style="width: 200px;">
									</td>
								</tr> 
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
					</br>
					<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
									
										<tr >
											<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head" align="left">
												<strong>厂房概况</strong>
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
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="factorytable"  >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="factoryinfotable">
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂房
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												国土证/房产证
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												面积（平方米）
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												出租人
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												每月租金（元）
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												备注说明
											</td>										
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="radio" id="FBTYPE" name="FBTYPE" value="1" <c:if test="${creditPriorFactoryBuld.FBTYPE eq 1 }">checked="ture"</c:if>>自有/<input type="radio" id="FBTYPE" name="FBTYPE" value="0" <c:if test="${creditPriorFactoryBuld.FBTYPE eq 0 }">checked="ture"</c:if>>租赁
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="radio" id="FBIDENTIFY" name="FBIDENTIFY" value="0" <c:if test="${creditPriorFactoryBuld.FBIDENTIFY eq 0 }">checked="ture"</c:if>>无/<input type="radio" id="FBIDENTIFY" name="FBIDENTIFY" value="1" <c:if test="${creditPriorFactoryBuld.FBIDENTIFY eq 1 }">checked="ture"</c:if>>有
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" id="FBAREA" name="FBAREA" value="<fmt:formatNumber value="${creditPriorFactoryBuld.FBAREA }" pattern="#,#00.00" />"  style="text-align: center"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" id="LESSOR" name="LESSOR" value="${creditPriorFactoryBuld.LESSOR }" style="text-align: center"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" id="MONTHCOST" name="MONTHCOST" value="<fmt:formatNumber value="${creditPriorFactoryBuld.MONTHCOST }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" id="REMARK" name="REMARK" value="${creditPriorFactoryBuld.REMARK }" style="text-align: center"/>
											</td>										
										</tr>
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" >备注</td>
											<td colspan="5" align="center"><textarea id="REMARKCONTEXT" name="REMARKCONTEXT" rows="3" cols="120">${creditPriorFactoryBuld.REMARKCONTEXT }</textarea></td>
										</tr>
									</table>
								</td>
								
							</tr>
						</table>
					</td>
				</tr>
					</br>		
				 <tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							
							<tr>
								<td colspan="6"  width="100%">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
										<tr >
											<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
											<strong>经营效益分析（仟元）</strong>
											</td>
											
										</tr>
										<tr >
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<strong>交机/设定前</strong>
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<strong>交机/设定后</strong>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<strong>成长比重%</strong>
											</td>
											
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												销货收入
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BECELLINCOME" name="BECELLINCOME" value="<fmt:formatNumber value="${submitMachineMap.BECELLINCOME }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												销货收入
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFCELLINCOME" name="AFCELLINCOME" value="<fmt:formatNumber value="${submitMachineMap.AFCELLINCOME }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="CELLINCOMEPER" name="CELLINCOMEPER" value="<fmt:formatNumber value="${submitMachineMap.CELLINCOMEPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												其他收入
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BEOTHERINCOME" name="BEOTHERINCOME" value="<fmt:formatNumber value="${submitMachineMap.BEOTHERINCOME }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												其他收入
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFOTHERINCOME" name="AFOTHERINCOME" value="<fmt:formatNumber value="${submitMachineMap.AFOTHERINCOME }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="OTHERINCOMEPER" name="OTHERINCOMEPER" value="<fmt:formatNumber value="${submitMachineMap.OTHERINCOMEPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												原物料成本
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BERESOURCECOST" name="BERESOURCECOST" value="<fmt:formatNumber value="${submitMachineMap.BERESOURCECOST }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												原物料成本
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFRESOURCECOST" name="AFRESOURCECOST" value="<fmt:formatNumber value="${submitMachineMap.AFRESOURCECOST }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="RESOURCECOSTPER" name="RESOURCECOSTPER" value="<fmt:formatNumber value="${submitMachineMap.RESOURCECOSTPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂房租金
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BEFBMONTHPRICE" name="BEFBMONTHPRICE" value="<fmt:formatNumber value="${submitMachineMap.BEFBMONTHPRICE }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂房租金
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFFBMONTHPRICE" name="AFFBMONTHPRICE" value="<fmt:formatNumber value="${submitMachineMap.AFFBMONTHPRICE }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="FBMONTHPRICEPER" name="FBMONTHPRICEPER" value="<fmt:formatNumber value="${submitMachineMap.FBMONTHPRICEPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												薪资
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BESALARY" name="BESALARY" value="<fmt:formatNumber value="${submitMachineMap.BESALARY }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												薪资
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFSALARY" name="AFSALARY" value="<fmt:formatNumber value="${submitMachineMap.AFSALARY }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="SALARYPER" name="SALARYPER" value="<fmt:formatNumber value="${submitMachineMap.SALARYPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												水电
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BEWATERELEC" name="BEWATERELEC" value="<fmt:formatNumber value="${submitMachineMap.BEWATERELEC }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												水电
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFWATERELEC" name="AFWATERELEC" value="<fmt:formatNumber value="${submitMachineMap.AFWATERELEC }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="WATERELECPER" name="WATERELECPER" value="<fmt:formatNumber value="${submitMachineMap.WATERELECPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												其它支出
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BEBEFORECOST" name="BEBEFORECOST" value="<fmt:formatNumber value="${submitMachineMap.BEBEFORECOST }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												其它支出
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFBEFORECOST" name="AFBEFORECOST" value="<fmt:formatNumber value="${submitMachineMap.AFBEFORECOST }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="BEFORECOSTPER" name="BEFORECOSTPER" value="<fmt:formatNumber value="${submitMachineMap.BEFORECOSTPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												税金
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BETAXMON" name="BETAXMON" value="<fmt:formatNumber value="${submitMachineMap.BETAXMON }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												税金
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFTAXMON" name="AFTAXMON" value="<fmt:formatNumber value="${submitMachineMap.AFTAXMON }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="TAXMONPER" name="TAXMONPER" value="<fmt:formatNumber value="${submitMachineMap.TAXMONPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												外发费用
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BEOTHERBANKLOAN" name="BEOTHERBANKLOAN" value="<fmt:formatNumber value="${submitMachineMap.BEOTHERBANKLOAN }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												外发费用
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFOTHERBANKLOAN" name="AFOTHERBANKLOAN" value="<fmt:formatNumber value="${submitMachineMap.AFOTHERBANKLOAN }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="OTHERBANKLOANPER" name="OTHERBANKLOANPER" value="<fmt:formatNumber value="${submitMachineMap.OTHERBANKLOANPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												银行借款
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BEBANKLOAN" name="BEBANKLOAN" value="<fmt:formatNumber value="${submitMachineMap.BEBANKLOAN }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												银行借款
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFBANKLOAN" name="AFBANKLOAN" value="<fmt:formatNumber value="${submitMachineMap.AFBANKLOAN }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="BANKLOANPER" name="BANKLOANPER" value="<fmt:formatNumber value="${submitMachineMap.BANKLOANPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												本案租赁费
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setBESUM()" id="BETHISRENT" name="BETHISRENT" value="<fmt:formatNumber value="${submitMachineMap.BETHISRENT }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												本案租赁费
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" onchange="setAFSUM();" id="AFTHISRENT" name="AFTHISRENT" value="<fmt:formatNumber value="${submitMachineMap.AFTHISRENT }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="THISRENTPER" name="THISRENTPER" value="<fmt:formatNumber value="${submitMachineMap.THISRENTPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												结余
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="BESUM" name="BESUM" value="<fmt:formatNumber value="${submitMachineMap.BESUM }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												结余
											</td>
											<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="AFSUM" name="AFSUM" value="<fmt:formatNumber value="${submitMachineMap.AFSUM }" pattern="#,#00.00" />" style="text-align: right"/>
											</td>
											<td style="text-align: center" style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" onblur="computePER() ;" id="SUMPER" name="SUMPER" value="<fmt:formatNumber value="${submitMachineMap.SUMPER }" pattern="#,#00.00" />" style="text-align: center"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												说明
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
												<textarea rows="3" cols="100" style="margin-left: 87px;" name="benefit_remark">${submitMachineMap.REMARK }</textarea>
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
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectEquipment">
										<tr >
											<td colspan="4" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												设备明细（仟元）
											</td>
											<td colspan="2" width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addpriorEquipments();">添加</a>
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="right">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deletepriorEquipments();">删除</a>
											</td>
										</tr>
										<tr>
											<td width="25%"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												设备名称
											</td>
											<td width="8%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												数量
											</td>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂牌
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												购入日期
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												购入单价
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												总计
											</td>
											<td width="23%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												备注说明
											</td>
											<td width="3%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="checkbox" id="priorProjectsequipment" name="priorProjectsequipment" onclick="getAllequipment();">
											</td>	
																				
										</tr>
										<c:forEach items="${EuqipmentsList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="35" name="sequipmentname" id="sequipmentname${ status.count }" value="${item.EQUPNAME }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" onchange="getTotalMoney();" name="sequipmentnum" id="sequipmentnum${ status.count }" value="${item.EQUPNUM }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="30" name="sequipmentmaker" id="sequipmentmaker${ status.count }" value="${item.EQUPMODEL }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" name="sequipmentdate" id="sequipmentdate${ status.count }" <c:if test="${item.EQUPBUYDATE == '1900-01-01'}">value=""</c:if><c:if test="${item.EQUPBUYDATE != '1900-01-01'}">value="${item.EQUPBUYDATE }"</c:if> style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" onchange="getTotalMoney();" name="sequipmentmoney" id="sequipmentmoney${ status.count }" value="<fmt:formatNumber value='${item.EQUPBUYMON }' pattern="#,#00.00" />" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="left"><input type="text" name="sequipmentmoneyAll" id="sequipmentmoneyAll${ status.count }" size="10" readonly="readonly" value="<fmt:formatNumber value='${item.EQUPNUM*item.EQUPBUYMON }' pattern='#,#00.00' />"></td>
											<c:set var="all" value="${ item.EQUPNUM*item.EQUPBUYMON +all }"></c:set>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="35" name="sequipmentramark" id="sequipmentramark${ status.count }" value="${item.EQUPREMARK }" size="8"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="checkbox" name="sequipmentorder" id="sequipmentorder${ status.count }" value="${ status.count }"></td>
										</tr>
										</c:forEach>

										<!-- 加入总计 -->
										<tr>
											<td colspan="4"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												&nbsp;
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												合计
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="left"><input type="text" size="10" name="sequipmentmoney_total_all" id="sequipmentmoney_total_all" value="<fmt:formatNumber value='${all}' pattern='#,#00.00' />" size="10" readonly="readonly"></td>
										</tr>

									</table>
								</td>			
							</tr>
							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
									说明
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
									<textarea id="ALLREMARK" name="ALLREMARK" rows="3" cols="100">${EuqipmentsRemarkMap.ALLREMARK }</textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<!-- 主要往来客户 -->	
								
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="table_ContactCoustomer">
										<tr >
											<td colspan="3" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												主要往来客户（仟元）
											</td>
											<td colspan="2" width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addpriorContactCustomer();">添加</a>
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="right">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deletepriorContactCustomer();">删除</a>
											</td>
										</tr>
										<tr>
											<td width="25%"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂商名称
											</td>
											<td width="8%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂商地点
											</td>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												商品种类
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												月往来金额
											</td>
											<td width="8%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												比重%
											</td>
											<td width="25%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												收款条件
											</td>
											<td width="4%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="checkbox" id="priorProjectContactCustomer" name="priorProjectContactCustomer" onclick="getAllCantactCustomer();">
											</td>	
																				
										</tr>
										<c:forEach items="${ContactCustomerList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="35"   name="cc_name" id="cc_name${ status.count }" value="${item.CC_NAME }" style="text-align: center"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" name="cc_address" id="cc_address${ status.count }" value="${item.CC_ADDRESS }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="30" name="cc_type" id="cc_type ${ status.count }" value="${item.CC_TYPE }" style="text-align: center"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" onchange="CCPerAndSum('${ status.count }')" name="cc_money" id="cc_money${ status.count }"  value="<fmt:formatNumber value='${item.CC_MONEY }' pattern='#,#00.00' />" style="text-align: center" size="10"></td>
											<c:set var="cc_all" value="${ item.CC_MONEY +cc_all }"></c:set>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" name="cc_percent" id="cc_percent${  status.count }"  value="<fmt:formatNumber value='${item.CC_PERCENT }' pattern='#,#00.00' />" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="35" name="cc_condition" id="cc_condition ${ status.count }" value="${item.CC_CONDITION }"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="checkbox" name="cc_order" id="cc_order${ status.count }" value="${ status.count }"></td>
										</tr>
										</c:forEach>

										<!-- 加入总计 -->
										<tr>
											<td colspan="4"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												&nbsp;
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												合计
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="35" name="cc_all" id="cc_all" value="<fmt:formatNumber value='${cc_all}' pattern='#,#00.00' />" size="8"></td>
										</tr>

									</table>
								</td>			
							</tr>
							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
									说明
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
									<textarea id="CC_REMARK" name="CC_REMARK" rows="3" cols="100">${ContactCustomerRemarkMap.ALLREMARK }</textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			<!-- 	
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="table_ContactCoustomer">
										<tr >
											<td colspan="4" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												主要往来客户
											</td>
											<td  width="20%"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addpriorContactCustomer();">添加</a>
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deletepriorContactCustomer();">删除</a>
											</td>
										</tr>
										<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂商名称
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂商地点
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												商品种类
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												月往来金额
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												比重%
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												收款条件
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="checkbox" id="priorProjectContactCustomer" name="priorProjectContactCustomer" onclick="getAllCantactCustomer();">
											</td>	
																				
										</tr>
										<c:forEach items="${ContactCustomerList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text"  name="cc_name" id="cc_name${ status.count }" value="${item.CC_NAME }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" name="cc_address" id="cc_address${ status.count }" value="${item.CC_ADDRESS }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" name="cc_type" id="cc_type ${ status.count }" value="${item.CC_TYPE }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" name="cc_money" id="cc_money ${ status.count }"  value="<fmt:formatNumber value='${item.CC_MONEY }' pattern='#,#00.00' />" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" name="cc_percent" id="cc_percent${  status.count }"  value="<fmt:formatNumber value='${item.CC_PERCENT }' pattern='#,#00.00' />"  style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" name="cc_condition" id="cc_condition ${ status.count }" value="${item.CC_CONDITION }" size="8"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="checkbox" name="cc_order" id="cc_order${  status.count }"></td>
										</tr>
										</c:forEach>
									</table>
								</td>			
							</tr>
							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
									说明
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
									<textarea id="CC_REMARK" name="CC_REMARK" rows="3" cols="100">${ContactCustomerRemarkMap.ALLREMARK }</textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				 -->

				<!-- 主要往来客户结束 -->		
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectBuyFactory">
										<tr >
											<td colspan="4" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												进货厂商（仟元）
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addpriorBuyFactorys();">添加</a>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deletepriorBuyFactorys();">删除</a>
											</td>
										</tr>
										<tr>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂商名称
											</td>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												商品种类
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												月往来金额
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												比重%
											</td>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												付款条件
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="checkbox" id="priorProjectBuyFactorys" name="priorProjectBuyFactorys" onclick="getAllBuyFactory();">
											</td>												
										</tr>
										<c:forEach items="${BuyFactoriesList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="35" name="BUYFACTORYNAME" id="BUYFACTORYNAME${ status.count }" value="${item.FACTORYNAME }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="30" name="BUYTHINGKIND" id="BUYTHINGKIND${ status.count }" value="${item.THINGKIND }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="15" onchange="buyFactorysPerAndSum('${ status.count }')" name="BUYMONTHINGOPRICE" id="BUYMONTHINGOPRICE${ status.count }" value="<fmt:formatNumber value="${item.MONTHINGOPRICE }" pattern="#,#00.00" />" style="text-align: center" size="10"></td>
											<c:set var="BUYFACTORYOR_ALL" value="${ item.MONTHINGOPRICE +BUYFACTORYOR_ALL }"></c:set>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="15" name="BUYPERCENTGRAVE" id="BUYPERCENTGRAVE${ status.count }" value="<fmt:formatNumber value="${item.PERCENTGRAVE }" pattern="#,#00.00" />" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="35" name="BUYPAYCONDITIONS" id="BUYPAYCONDITIONS${ status.count }" value="${item.PAYCONDITIONS }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="checkbox" name="BUYFACTORYORDER" id="BUYFACTORYORDER${ status.count }" value="${ status.count }"></td>
										</tr>
										</c:forEach>

										<!-- 加入总计 -->
										<tr>
											<td colspan="3"  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												&nbsp;
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												合计
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="center"><input type="text" size="35" name="BUYFACTORYOR_ALL" id="BUYFACTORYOR_ALL" value="<fmt:formatNumber value='${BUYFACTORYOR_ALL}' pattern='#,#00.00' />" size="8"></td>
										</tr>
										
									</table>
								</td>			
							</tr>
							<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
											说明
											</td>
											<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<textarea id="ALLBUYREMARK" name="ALLBUYREMARK" rows="3" cols="100"><c:forEach items="${BuyFactoriesList}" var="item" varStatus="status">${item.ALLBUYREMARK }</c:forEach></textarea>
											</td>
										</tr>
						</table>
					</td>
				</tr>
				<!-- 
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectCellFactory">
										<tr >
											<td colspan="3" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												销货厂商
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addpriorCellFactorys();">添加</a>
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="right">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deletepriorCellFactorys();">删除</a>
											</td>
										</tr>
										<tr>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂商名称
											</td>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												厂商地点
											</td>
											<td width="15%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												商品总种类
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												月往来金额
											</td>
											<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												比重%
											</td>
											<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												收款条件
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="checkbox" id="priorProjectCellFactorys" name="priorProjectCellFactorys" onclick="getAllCellFactory();">
											</td>												
										</tr>	
										<c:forEach items="${CellFactoriesList}" var="item" varStatus="status">
										<tr>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="30" name="CELLFACTORYNAME" id="CELLFACTORYNAME${ status.count }" value="${item.FACTORYNAME }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="30" name="CELLFACTORYADDR" id="CELLFACTORYADDR${ status.count }" value="${item.FACTORYADDR }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="30" name="CELLTHINGKIND" id="CELLTHINGKIND${ status.count }" value="${item.THINGKIND }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="15" name="CELLMONTHINGOPRICE" id="CELLMONTHINGOPRICE${ status.count }" value="<fmt:formatNumber value="${item.MONTHINGOPRICE }" pattern="#,#00.00" />" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="15" name="CELLPERCENTGRAVE" id="CELLPERCENTGRAVE${ status.count }" value="<fmt:formatNumber value="${item.PERCENTGRAVE }" pattern="#,#00.00" />" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="text" size="25" name="CELLPAYCONDITIONS" id="CELLPAYCONDITIONS${ status.count }" value="${item.PAYCONDITIONS }" style="text-align: center" size="10"></td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center"><input type="checkbox" name="CELLFACTORYORDER" id="CELLACTORYORDER${ status.count }" value="${ status.count }"></td>
										</tr>
										</c:forEach>
									</table>
								</td>			
							</tr>
							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
										说明
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
										<textarea id="ALLCELLREMARK" name="ALLCELLREMARK" rows="3" cols="100">${CellFactoriesAllRemarkMap.ALLCELLREMARK }</textarea>
								</td>
							</tr>
							 -->
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >

							<tr >
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
									内销比重
								</td>
								<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
									<input type="text" id="INPERCENTGRAVE" onblur="setOUTPERCENTGRAVE()" name="INPERCENTGRAVE" value="<fmt:formatNumber value="${CellFactoriesAllRemarkMap.INPERCENTGRAVE }" pattern="#,#00.00" />" style="text-align: center"/>%
								</td>
								<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
									外销比重
								</td>
								<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
									<input type="text" id="OUTPERCENTGRAVE" onblur="setINPERCENTGRAVE()" name="OUTPERCENTGRAVE" value="<fmt:formatNumber value="${CellFactoriesAllRemarkMap.OUTPERCENTGRAVE }" pattern="#,#00.00" />" style="text-align: center"/>%
								</td>
							</tr>
							
						</table>
					</td>
				</tr>
				
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"   >
							
							<tr>
								<td colspan="6"  width="100%">
								<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectBankCheckBill">
										<tr >
											<td colspan="3" width="70%" class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												银行对账单（元）
											</td>
											<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" align="right" >
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addpriorBankCheckSixBill();">添加</a>
											&nbsp;&nbsp;&nbsp;
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deletepriorBankCheckBills();">删除</a>
											</td>
											<td align="center" class="ui-state-default ui-th-ltr zc_grid_head">
												<input type="checkbox" id="priorProjectBankCheckBills" name="priorProjectBankCheckBills" onclick="getAllBankCheckBill();"/>
											</td>
										</tr>
										<c:forEach items="${BankCheckBillList}" var="item" varStatus="status">
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
													户名
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
													<input type="text" size="40" id="BANKCUSTNAME${ status.count }" name="BANKCUSTNAME" value="${item.BANKCUSTNAME }"/>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
													银行支行名称
											</td>
											<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
													<input type="text" size="40" id="BANKBRANCH${ status.count }" name="BANKBRANCH" value="${item.BANKBRANCH }"/>
											</td>
											<td rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="checkbox" id="CHECKBILLORDER" name="CHECKBILLORDER" value="${ status.count }"/>
											</td>
										</tr>
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												账号
											</td>
											<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" size="40" id="BANKCUSTCODE${ status.count }" name="BANKCUSTCODE" value="${item.BANKCUSTCODE }"/>
											</td>

											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="left" >
												<%--名称--%>
												&nbsp;
											</td>
											<td colspan="3" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<input type="text" style="display:none" size="40" id="BANKNAME${ status.count }" name="BANKNAME" value="${item.BANKNAME }"/>
											</td>		
										</tr>
										
										<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												期间（月）
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHONE" onchange="changeMonthFormat('CHECKMONTHONE${ status.count }');" id="CHECKMONTHONE${ status.count }" <c:choose><c:when test='${item.CHECKMONTHONE eq "1900-01-01 00:00:00.0"}'>value=" "</c:when><c:otherwise>value='<fmt:formatDate value="${item.CHECKMONTHONE }" pattern="yyyy-MM"/>'</c:otherwise></c:choose> style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHTWO" onchange="changeMonthFormat('CHECKMONTHTWO${ status.count }');" id="CHECKMONTHTWO${ status.count }" <c:choose><c:when test='${item.CHECKMONTHTWO eq "1900-01-01 00:00:00.0"}'>value=" "</c:when><c:otherwise>value='<fmt:formatDate value="${item.CHECKMONTHTWO }" pattern="yyyy-MM"/>'</c:otherwise></c:choose> style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHTHREE" onchange="changeMonthFormat('CHECKMONTHTHREE${ status.count }');" id="CHECKMONTHTHREE${ status.count }" <c:choose><c:when test='${item.CHECKMONTHTHREE eq "1900-01-01 00:00:00.0"}'>value=" "</c:when><c:otherwise>value='<fmt:formatDate value="${item.CHECKMONTHTHREE }" pattern="yyyy-MM"/>'</c:otherwise></c:choose> style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHFOUR" onchange="changeMonthFormat('CHECKMONTHFOUR${ status.count }');" id="CHECKMONTHFOUR${ status.count }" <c:choose><c:when test='${item.CHECKMONTHFOUR eq "1900-01-01 00:00:00.0"}'>value=" "</c:when><c:otherwise>value='<fmt:formatDate value="${item.CHECKMONTHFOUR }" pattern="yyyy-MM"/>'</c:otherwise></c:choose> style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHFIVE" onchange="changeMonthFormat('CHECKMONTHFIVE${ status.count }');" id="CHECKMONTHFIVE${ status.count }" <c:choose><c:when test='${item.CHECKMONTHFINE eq "1900-01-01 00:00:00.0"}'>value=" "</c:when><c:otherwise>value='<fmt:formatDate value="${item.CHECKMONTHFINE }" pattern="yyyy-MM"/>'</c:otherwise></c:choose> style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHSIX" onchange="changeMonthFormat('CHECKMONTHSIX${ status.count }');" id="CHECKMONTHSIX${ status.count }" <c:choose><c:when test='${item.CHECKMONTHSIX eq "1900-01-01 00:00:00.0"}'>value=" "</c:when><c:otherwise>value='<fmt:formatDate value="${item.CHECKMONTHSIX }" pattern="yyyy-MM"/>'</c:otherwise></c:choose> style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" rowspan="2">
												累计
											</td>
									</tr>
									<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" >
												上期结余
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="LASTSUMONE" id="LASTSUMONE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.LASTSUMONE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="LASTSUMTWO" id="LASTSUMTWO${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.LASTSUMTWO }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="LASTSUMTHREE" id="LASTSUMTHREE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.LASTSUMTHREE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="LASTSUMFOUR" id="LASTSUMFOUR${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.LASTSUMFOUR }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="LASTSUMFIVE" id="LASTSUMFIVE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.LASTSUMFINE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="LASTSUMSIX" id="LASTSUMSIX${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.LASTSUMSIX }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
									</tr>
									<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" >
												每月收入
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONTHINCOMEONE" id="MONTHINCOMEONE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHINCOMEONE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONTHINCOMETWO" id="MONTHINCOMETWO${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHINCOMETWO }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONTHINCOMETHREE" id="MONTHINCOMETHREE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHINCOMETHREE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONTHINCOMEFOUR" id="MONTHINCOMEFOUR${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHINCOMEFOUR }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONTHINCOMEFIVE" id="MONTHINCOMEFIVE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHINCOMEFINE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONTHINCOMESIX" id="MONTHINCOMESIX${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHINCOMESIX }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" id="MONTHINCOME_TOTAL${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHINCOMEONE+item.MONTHINCOMETWO+item.MONTHINCOMETHREE+item.MONTHINCOMEFOUR+item.MONTHINCOMEFINE+item.MONTHINCOMESIX }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
									</tr>
									<tr>
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" >
												每月支出
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHCOSTONE" id="CHECKMONTHCOSTONE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHCOSTONE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHCOSTTWO" id="CHECKMONTHCOSTTWO${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHCOSTTWO }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHCOSTTHREE" id="CHECKMONTHCOSTTHREE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHCOSTTHREE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHCOSTFOUR" id="CHECKMONTHCOSTFOUR${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHCOSTFOUR }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHCOSTFIVE" id="CHECKMONTHCOSTFIVE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHCOSTFINE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="CHECKMONTHCOSTSIX" id="CHECKMONTHCOSTSIX${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHCOSTSIX }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" id="CHECKMONTHCOST_TOTAL${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONTHCOSTSIX+item.MONTHCOSTFINE+item.MONTHCOSTFOUR+item.MONTHCOSTTHREE+item.MONTHCOSTTWO+item.MONTHCOSTONE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
									</tr>
									<tr>
											
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" >
												本期结余
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="THISSUMONE" id="THISSUMONE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.THISSUMONE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="THISSUMTWO" id="THISSUMTWO${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.THISSUMTWO }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="THISSUMTHREE" id="THISSUMTHREE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.THISSUMOTHREE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="THISSUMFOUR" id="THISSUMFOUR${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.THISSUMFOUR }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="THISSUMFIVE" id="THISSUMFIVE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.THISSUMFINE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="THISSUMSIX" id="THISSUMSIX${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.THISSUMSIX }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" id="THISSUM_TOTAL${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.THISSUMSIX+item.THISSUMFINE+item.THISSUMFOUR+item.THISSUMOTHREE+item.THISSUMTWO+item.THISSUMONE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
									</tr>
									<tr>
											
											<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%" >
												现金流入
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONEYFLOWINONE" id="MONEYFLOWINONE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONEYFLOWINONE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONEYFLOWINTWO" id="MONEYFLOWINTWO${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONEYFLOWINTWO }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONEYFLOWINTHREE" id="MONEYFLOWINTHREE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONEYFLOWINTHREE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONEYFLOWINFOUR" id="MONEYFLOWINFOUR${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONEYFLOWIFOUR }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONEYFLOWINFIVE" id="MONEYFLOWINFIVE${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONEYFLOWINFINE }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
											
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" width="14%">
												<input type="text" name="MONEYFLOWINSIX" id="MONEYFLOWINSIX${ status.count }" onchange="computeSum('${ status.count }');" value="<fmt:formatNumber value="${item.MONEYFLOWINSIX }" pattern="#,#00.00" />" style="text-align: center" size="10">
											</td>
									</tr>
									<tr >
										<td  class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												说明
										</td>
										<td colspan="7" class="ui-state-default ui-th-ltr zc_grid_head" align="center" >
												<textarea id="BANK_REMARK${ status.count }" name="BANK_REMARK" rows="3" cols="100" >${item.REMARK }</textarea>
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
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab111"  >
							<tr>
								<td colspan="6"  width="100%">
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
										<tr >
											<td class="ui-state-default ui-th-ltr zc_grid_head" align="left" width="75.5%">
												<strong>过往项目</strong>
											</td>
											<td class="ui-state-default ui-th-ltr zc_grid_head"  align="right" >
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addpriorProjects();">添加</a>
												</td>
												<td class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deletepriorProjects();">删除</a>
											</td>
											
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 0}">
									<tr>
										<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="checkbox" name="priorProjects_check" id="priorProjects_check" value="${status.count }"> 项目名称：
										</td>
										<td width="81%" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="PROJECT_NAME0" value="${item.PROJECT_NAME }"
												style="width: 200px;">
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr">
											内容：
											<input type='button' value='加' onClick='controllerTextArea("add", "PROJECT_CONTENT0${status.count }");' />
											<input type='button' value='减' onClick='controllerTextArea("del", "PROJECT_CONTENT0${status.count }");' />
										</td>
										<td class="ui-widget-content jqgrow ui-row-ltr">
											<textarea name="PROJECT_CONTENT0" id="PROJECT_CONTENT0${status.count }"
													style="width: 500px; height: 50px; font-size: 12px"
													class="txtk">${item.PROJECT_CONTENT }</textarea>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
				<%-- <tr>
					<td>
						<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="thisProjectsTab">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<b>本次租赁意见总结</b>
								</td>
								<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head"> 
								</td>
							</tr>
							<c:if test="${empty creditPriorProject}">
								<tr>
										<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
											项目名称：
										</td>
										<td width="81%" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="PROJECT_NAME1"  
												style="width: 400px;">
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr">
											内容：
											<input type='button' value='加' onClick='controllerTextArea("add", "PROJECT_CONTENT00");' />
											<input type='button' value='减' onClick='controllerTextArea("del", "PROJECT_CONTENT00");' />
										</td>
										<td colspan="5"class="ui-widget-content jqgrow ui-row-ltr">
											<textarea name="PROJECT_CONTENT1" id="PROJECT_CONTENT00"
													style="width: 500px; height: 50px; font-size: 12px"
													class="txtk"></textarea>
										</td>
									</tr>
							</c:if>
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 1}">
									<tr>
										<td width="19%" class="ui-widget-content jqgrow ui-row-ltr"> 
											项目名称：
										</td>
										<td width="81%" colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="PROJECT_NAME1"   value="${item.PROJECT_NAME }"
												style="width: 400px;">
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr">
											内容：
											<input type='button' value='加' onClick='controllerTextArea("add", "PROJECT_CONTENT0${status.count }");' />
											<input type='button' value='减' onClick='controllerTextArea("del", "PROJECT_CONTENT0${status.count }");' />
										</td>
										<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
											<textarea name="PROJECT_CONTENT1" id="PROJECT_CONTENT0${status.count }"
													style="width: 500px; height: 50px; font-size: 12px"
													class="txtk">${item.PROJECT_CONTENT }</textarea>
										</td>
									</tr>
								</c:if> 
							</c:forEach>	
							<!--<c:if test="${creditMap.CUST_TYPE eq 1999}">  <tr>    
								<th width="19%"  class="ui-state-default ui-th-ltr zc_grid_head" align="left">
									项目名称
								</th>
								<th colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head">
									财务情况说明 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位（千元）
								</th>
							</tr> 
							<tr>
								<td width="20%" class="ui-widget-content jqgrow ui-row-ltr">
									项目
									<jsp:useBean id="now" class="java.util.Date" /> 
									<jsp:setProperty name="now" property="month" value="${now.month-1}"/>
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
									<c:choose>
										<c:when test="${empty v1}">
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME11" value="<fmt:formatDate value="${now}" pattern="yyyy年MM月" />" style="width: 130px">
										</c:when>
										<c:otherwise>
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME11" value="${v1.PROJECT_NAME}" style="width: 130px">
									 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v1.PCFS_ID}">
										</c:otherwise>
									</c:choose>
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr"> 
								<jsp:setProperty name="now" property="month" value="${now.month-12}"/>
									<c:choose>
										<c:when test="${empty v2}">
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME22" value="<fmt:formatDate value="${now}" pattern="yyyy年" />" style="width: 130px">
										</c:when>
										<c:otherwise>
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME22" value="${v2.PROJECT_NAME}" style="width: 130px">
									 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v2.PCFS_ID}">
										</c:otherwise>
									</c:choose>
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
									<jsp:setProperty name="now" property="month" value="${now.month-12}"/>
									<c:choose>
										<c:when test="${empty v3}">
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME33" value="<fmt:formatDate value="${now}" pattern="yyyy年" />" style="width: 130px">
										</c:when>
										<c:otherwise>
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME33" value="${v3.PROJECT_NAME}" style="width: 130px">
									 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v3.PCFS_ID}">
										</c:otherwise>
									</c:choose>
								</td>
								<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
									<jsp:setProperty name="now" property="month" value="${now.month-12}"/>
									<c:choose>
										<c:when test="${empty v4}">
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME44" value="<fmt:formatDate value="${now}" pattern="yyyy年" />" style="width: 130px">
										</c:when>
										<c:otherwise>
											 <input type="text" name="PROJECT_NAME" id="PROJECT_NAME44" value="${v4.PROJECT_NAME}" style="width: 130px">
									 		 <input type="hidden" name="PCFS_ID" id="PCFS_ID1" value="${v4.PCFS_ID}">
										</c:otherwise>
									</c:choose>
								</td>
								<td width="20%" align="center" class="ui-widget-content jqgrow ui-row-ltr">
									备注<input type="hidden" name="PROJECT_NAME" id="PROJECT_NAME55" value="备注">
									    <input type="hidden" name="PCFS_ID" id="PCFS_ID5" value="${cFS_Remark.PCFSR_ID}">
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									货币资金
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS1" value="${v1.MONEY_FUNDS}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS2" value="${v2.MONEY_FUNDS}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS3" value="${v3.MONEY_FUNDS}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS4" value="${v4.MONEY_FUNDS}" style="width: 130px;text-align: right;">
								</td>
								<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="MONEY_FUNDS" id="MONEY_FUNDS5" value="${cFS_Remark.MONEY_FUNDS}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									应收账款
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE1" value="${v1.ACCOUNTS_RECEIVABLE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE2" value="${v2.ACCOUNTS_RECEIVABLE}"  style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE3" value="${v3.ACCOUNTS_RECEIVABLE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE4" value="${v4.ACCOUNTS_RECEIVABLE}" style="width: 130px;text-align: right;">
								</td>
								<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_RECEIVABLE" id="ACCOUNTS_RECEIVABLE5" value="${cFS_Remark.ACCOUNTS_RECEIVABLE}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									存货
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="STOCK" id="STOCK1" value="${v1.STOCK}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="STOCK" id="STOCK2" value="${v2.STOCK}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="STOCK" id="STOCK3" value="${v3.STOCK}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="STOCK" id="STOCK4" value="${v4.STOCK}" style="width: 130px;text-align: right;">
								</td>
								<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="STOCK" id="STOCK5" value="${cFS_Remark.STOCK}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									固定资产（净值）
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS1" value="${v1.CAPITAL_ASSERTS}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS2" value="${v2.CAPITAL_ASSERTS}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS3" value="${v3.CAPITAL_ASSERTS}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS4" value="${v4.CAPITAL_ASSERTS}" style="width: 130px;text-align: right;">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_ASSERTS" id="CAPITAL_ASSERTS5" value="${cFS_Remark.CAPITAL_ASSERTS}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									总资产
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS1" value="${v1.TOTAL_ASSERTS}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS2" value="${v2.TOTAL_ASSERTS}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS3" value="${v3.TOTAL_ASSERTS}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS4" value="${v4.TOTAL_ASSERTS}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_ASSERTS" id="TOTAL_ASSERTS5" value="${cFS_Remark.TOTAL_ASSERTS}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									短期借款
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN1" value="${v1.SHORTTIME_LOAN}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN2" value="${v2.SHORTTIME_LOAN}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN3" value="${v3.SHORTTIME_LOAN}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN4" value="${v4.SHORTTIME_LOAN}" style="width: 130px;text-align: right;">
								</td>
								<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SHORTTIME_LOAN" id="SHORTTIME_LOAN5" value="${cFS_Remark.SHORTTIME_LOAN}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
									应付账款
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE1" value="${v1.ACCOUNTS_PAYABLE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE2" value="${v2.ACCOUNTS_PAYABLE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE3" value="${v3.ACCOUNTS_PAYABLE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE4" value="${v4.ACCOUNTS_PAYABLE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="ACCOUNTS_PAYABLE" id="ACCOUNTS_PAYABLE5" value="${cFS_Remark.ACCOUNTS_PAYABLE}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									总负债
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_OWES" id="TOTAL_OWES1" value="${v1.TOTAL_OWES}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_OWES" id="TOTAL_OWES2" value="${v2.TOTAL_OWES}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_OWES" id="TOTAL_OWES3" value="${v3.TOTAL_OWES}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_OWES" id="TOTAL_OWES4" value="${v4.TOTAL_OWES}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="TOTAL_OWES" id="TOTAL_OWES5" value="${cFS_Remark.TOTAL_OWES}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									实收资本
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL1" value="${v1.CONTRIBUTED_CAPITAL}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL2" value="${v2.CONTRIBUTED_CAPITAL}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL3" value="${v3.CONTRIBUTED_CAPITAL}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL4" value="${v4.CONTRIBUTED_CAPITAL}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="CONTRIBUTED_CAPITAL" id="CONTRIBUTED_CAPITAL5" value="${cFS_Remark.CONTRIBUTED_CAPITAL}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									资本公积
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE1" value="${v1.CAPITAL_RESERVE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE2" value="${v2.CAPITAL_RESERVE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE3" value="${v3.CAPITAL_RESERVE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE4" value="${v4.CAPITAL_RESERVE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="CAPITAL_RESERVE" id="CAPITAL_RESERVE5" value="${cFS_Remark.CAPITAL_RESERVE}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									未分配利润
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT1" value="${v1.UNDISTRIBUTED_PROFIT}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT2" value="${v2.UNDISTRIBUTED_PROFIT}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT3" value="${v3.UNDISTRIBUTED_PROFIT}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT4" value="${v4.UNDISTRIBUTED_PROFIT}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="UNDISTRIBUTED_PROFIT" id="UNDISTRIBUTED_PROFIT5" value="${cFS_Remark.UNDISTRIBUTED_PROFIT}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									销售收入
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_REVENUE" id="SALES_REVENUE1" value="${v1.SALES_REVENUE}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_REVENUE" id="SALES_REVENUE2" value="${v2.SALES_REVENUE}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_REVENUE" id="SALES_REVENUE3" value="${v3.SALES_REVENUE}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_REVENUE" id="SALES_REVENUE4" value="${v4.SALES_REVENUE}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="SALES_REVENUE" id="SALES_REVENUE5" value="${cFS_Remark.SALES_REVENUE}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									销售成本
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING1" value="${v1.COST_OF_MARKETING}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING2" value="${v2.COST_OF_MARKETING}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING3" value="${v3.COST_OF_MARKETING}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING4" value="${v4.COST_OF_MARKETING}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="COST_OF_MARKETING" id="COST_OF_MARKETING5" value="${cFS_Remark.COST_OF_MARKETING}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									期间费用
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE1" value="${v1.PERIOD_EXPENSE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE2" value="${v2.PERIOD_EXPENSE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE3" value="${v3.PERIOD_EXPENSE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE4" value="${v4.PERIOD_EXPENSE}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="PERIOD_EXPENSE" id="PERIOD_EXPENSE5" value="${cFS_Remark.PERIOD_EXPENSE}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
									利润总额
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT1" value="${v1.TOTAL_PROFIT}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT2" value="${v2.TOTAL_PROFIT}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT3" value="${v3.TOTAL_PROFIT}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT4" value="${v4.TOTAL_PROFIT}" onchange="changeDEBTR();" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="TOTAL_PROFIT" id="TOTAL_PROFIT5" value="${cFS_Remark.TOTAL_PROFIT}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									资产负债率
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="DEBTR" id="DEBTR1" value="${v1.DEBTR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="DEBTR" id="DEBTR2" value="${v2.DEBTR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="DEBTR" id="DEBTR3" value="${v3.DEBTR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="DEBTR" id="DEBTR4" value="${v4.DEBTR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="DEBTR" id="DEBTR5" value="${cFS_Remark.DEBTR}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									销售净利率
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN1" value="${v1.PROFIT_MARGIN}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN2" value="${v2.PROFIT_MARGIN}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN3" value="${v3.PROFIT_MARGIN}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN4" value="${v4.PROFIT_MARGIN}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="PROFIT_MARGIN" id="PROFIT_MARGIN5" value="${cFS_Remark.PROFIT_MARGIN}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									毛利率
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TTM" id="TTM1" value="${v1.TTM}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TTM" id="TTM2" value="${v2.TTM}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TTM" id="TTM3" value="${v3.TTM}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="TTM" id="TTM4" value="${v4.TTM}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="TTM" id="TTM5" value="${cFS_Remark.TTM}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									销售增长率
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_GROWTH" id="SALES_GROWTH1" value="${v1.SALES_GROWTH}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_GROWTH" id="SALES_GROWTH2" value="${v2.SALES_GROWTH}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_GROWTH" id="SALES_GROWTH3" value="${v3.SALES_GROWTH}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="SALES_GROWTH" id="SALES_GROWTH4" value="${v4.SALES_GROWTH}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="SALES_GROWTH" id="SALES_GROWTH5" value="${cFS_Remark.SALES_GROWTH}" style="width: 150px">
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									净资产增长率
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="NAGR" id="NAGR1" value="${v1.NAGR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="NAGR" id="NAGR2" value="${v2.NAGR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="NAGR" id="NAGR3" value="${v3.NAGR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<input type="text" name="NAGR" id="NAGR4" value="${v4.NAGR}" style="width: 130px;text-align: right;">
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="text" name="NAGR" id="NAGR5" value="${cFS_Remark.NAGR}" style="width: 150px">
								</td>
							</tr>     </c:if>   

						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="otherProjectsTab">
							<tr>
								<td  class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>其他调查说明</strong>
								</td>
								<td width="75.5%"  class="ui-state-default ui-th-ltr zc_grid_head">
									<table border="0" cellspacing="0" cellpadding="0" align="right">
										<tr >
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												相关操作：
												<img src="${ctx }/images/u100.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="addOtherProjects();">添加</a>
											</td>
											<td  class="ui-state-default ui-th-ltr zc_grid_head">
												<img src="${ctx }/images/u103.gif">
												&nbsp;
												<a href="javaScript:void(0);" onclick="deleteOtherProjects();">删除</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 2}">
									<tr>
										<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="checkbox" name="otherProjects_check" id="otherProjects_check" value="${status.count }"> 项目名称：
										</td>
										<td width="81%" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="text" name="PROJECT_NAME2"  value="${item.PROJECT_NAME }"
												style="width: 200px;">
										</td>
									</tr> 
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr">
											内容：
											<input type='button' value='加' onClick='controllerTextArea("add", "PROJECT_CONTENT2${status.count }");' />
											<input type='button' value='减' onClick='controllerTextArea("del", "PROJECT_CONTENT2${status.count }");' />
										</td>
										<td class="ui-widget-content jqgrow ui-row-ltr">
											<textarea name="PROJECT_CONTENT2" id="PROJECT_CONTENT2${status.count }"
													style="width: 500px; height: 50px; font-size: 12px"
													class="txtk">${item.PROJECT_CONTENT }</textarea>
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
						<table width="100%" id="pingshenyijianTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<b>说明</b>
								</td>
								<td colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								</td>
							</tr>
							<c:forEach items="${creditPriorProject}" var="item" varStatus="status">
								<c:if test="${item.STATE eq 3}">
									 
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr">
											意见：
											<input type='button' value='加' onClick='controllerTextArea("add", "PROJECT_CONTENT3${status.count }");' />
											<input type='button' value='减' onClick='controllerTextArea("del", "PROJECT_CONTENT3${status.count }");' />
										</td>
										<td class="ui-widget-content jqgrow ui-row-ltr">
										<input type="hidden" name="PROJECT_NAME3" value=""
												style="width: 200px;">
  
 
											<textarea name="PROJECT_CONTENT3" id="PROJECT_CONTENT3${status.count }"
 
													style="width: 500px; height: 50px; font-size: 12px"
													class="txtk">${item.PROJECT_CONTENT }</textarea>
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
						<table width="100%"cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="pingshenyijianTab">
							<tr>
								<td  class="ui-state-default ui-th-ltr zc_grid_head">
									<b>说明</b>
								</td>
								<td colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head"> 
								</td>
							</tr>
								
									<tr>
										<td width="19%" height="50" class="ui-widget-content jqgrow ui-row-ltr">
											意见：
											<input type='button' value='加' onClick='controllerTextArea("add", "PROJECT_CONTENT3");' />
											<input type='button' value='减' onClick='controllerTextArea("del", "PROJECT_CONTENT3");' />
										</td>
										<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
											<input type="hidden" name="PROJECT_NAME3"  
												style="width: 200px;">
											<textarea name="PROJECT_CONTENT3"  id="PROJECT_CONTENT3"
													style="width: 500px; height: 50px; font-size: 12px"
													class="txtk"></textarea>
										</td>
									</tr>
						</table>
					</td>		
				</tr> 
			</c:if>
--> 						</table>
					</td>
				</tr> --%>

				<c:if test="${not empty memoList}">
				<tr>
					<td>
				<table cellspacing="0" cellpadding="0" border="0"  class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
						<td style="background-color: #e8e8e8;" width="608"><strong>审核意见</strong></td>
						<td style="background-color: #e8e8e8;" width="120"><strong>审核人</strong></td>
						<td style="background-color: #e8e8e8;" width="50"><strong>时间</strong></td>
					</tr>
							
					<c:forEach items="${memoList}" var="item" varStatus="status" >														
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="width: 50px;"><strong>${status.count}</strong></td>
							<td width="59" align="center">${item.MEMO}</td>
							<td width="121" align="center">${item.NAME}</td>
							<td width="50" align="center"><fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd"/></td>
						</tr>	
					</c:forEach>				
				</table>
					</td>		
				</tr> 
			</c:if>
			
			
				<tr>
					<td align="center">
						<input type="button" name="sub" value="保  存" onclick="submitPriorRecords();" class="ui-state-default ui-corner-all">
						<input type="reset" name="res" value="重  置" class="ui-state-default ui-corner-all">
					</td>
				</tr>
			 </table>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
