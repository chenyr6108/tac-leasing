<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>客户结清数据明细表</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
			function passSettle(){
				$("#state").val("1") ;
				$("#form1").submit() ;
				$("#state").val("") ;
			}
			function rebutSettle(){
				$("#state").val("2") ;
				$("#form1").submit() ;
				$("#state").val("") ;
			}
			function rebutSettle1(){
				alert("该支付表还存在结清分解项，不能驳回！") ;
			}
		</script>
	</head>
	<body>
		<center>
			<form action="${ctx }/servlet/defaultDispatcher" method="post" id="form1" name="form1">
			<input type="hidden" name="__action" value="settleManage.updateState"> 
			<input type="hidden" value="${showSettle.RECP_ID}" name="recp_id" id="recp_id"/>
			<input type="hidden" value="${showSettle.TRSE_ID}" name="trse_id" id="trse_id"/>
			<input type="hidden" value="${showSettle.FUND_TYPE}" name="fund_type" id="fund_type"/>
			<input type="hidden" value="" name="state" id="state"/>
			<br>
				<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
					<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
				   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;客户结清数据明细表</span>
				   	</div>
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          			<div class="zc_grid_body jqgrowleft">
           				
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: left ;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<strong>基本信息</strong>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同编号：
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														客户名称：
													</td>
													<td width="35%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														组织机构证：
													</td>
													<td width="10%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														租赁期数
													</td>
													<td width="10%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														已缴期数
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${payMap.LEASE_CODE }&nbsp;
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${payMap.CUST_NAME }&nbsp;
													</td>
													<td width="40%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${payMap.CORP_ORAGNIZATION_CODE}&nbsp;
													</td>
													<td width="10%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														 ${payMap.LEASE_PERIOD }&nbsp;
													</td>
													<td width="10%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${showSettle.HAS_PERIOD_NUM}&nbsp;
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>结清明细</b>
													</td>
												</tr>
												<tr >
													<td align="center" colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														试算金额
													</td>
													<td  align="center" colspan="1" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														实际金额
													</td>
													<td  align="center" colspan="1" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														差额
													</td>
													<td  align="center" colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														付款方式
													</td>
												</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														本&nbsp;金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.OWN_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_OWN_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_OWN_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														汇&nbsp;款：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REMIT}" type="currency" />
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														利&nbsp;息
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REN_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_REN_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_REN_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														现&nbsp;金：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.CASH}" type="currency" />
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															罚&nbsp;息
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DUN_PRICE}" type="currency" />&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_DUN_PRICE}" type="currency" />&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_DUN_PRICE}" type="currency" />&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														票&nbsp;据：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.NOTE}" type="currency" />
														</td>																																					
													</tr>														
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														违约金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.BREACH_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_BREACH_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_BREACH_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														其&nbsp;它：
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.OTHER}" type="currency" />
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														损害金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DAMAGE_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_DAMAGE_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_DAMAGE_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														&nbsp;
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														期满购买金 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.STAYBUY_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_STAYBUY_PRICE}" type="currency" />
														</td>
														<td colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_STAYBUY_PRICE}" type="currency" />
														</td>
													</tr>
													<!-- Add by Michael 2012 09-17 增加法务费用 -->
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														法务费用 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.TOTAL_LAWYFEE}" type="currency" />&nbsp;
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_TOTAL_LAWYFEE}" type="currency" />&nbsp;
														</td>
														<td colspan="2"  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_TOTAL_LAWYFEE}" type="currency" />&nbsp;
														</td>
													</tr>													
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														其他费用 
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.OTHER_PRICE}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_OTHER_PRICE}" type="currency" />
														</td>
														<td colspan="2"  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_OTHER_PRICE}" type="currency" />
														</td>
													</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合&nbsp;计
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.TOTAL}" type="currency" />
														</td>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.REAL_TOTAL}" type="currency" />
														</td >
														<td colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
															<fmt:formatNumber value="${showSettle.DIFF_TOTAL}" type="currency" />
														</td >
													</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>撤票</b>
													</td>
												</tr>
												<tr >
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														张数:
													</td>
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${showSettle.BACKOUT_COUNT}
													</td>
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														票面总额：
													</td>
													<td  style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${showSettle.BACKOUT_TOTAL}" type="currency" />
													</td>
												</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														到期起迄:
														</td>
														<td colspan="3" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatDate value="${showSettle.START_DATE}" pattern="yyyy-MM-dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${showSettle.END_DATE}" pattern="yyyy-MM-dd"/>
														</td>
													</tr>
											</table>
										</td>
									</tr>
										<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>成本</b>
													</td>
												</tr>
												<tr >
													<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
													1、未摊提保费
													</td>
												</tr>
													<tr>
														<td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														2、其他未摊提成本
														</td>
													</tr>
											</table>
										</td>
									</tr>
										<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"> 
														<b>未收款项说明</b>
													</td>
												</tr>
												<tr >
													<td align="center" colspan="2" style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														未收款金额：<fmt:formatNumber value="${showSettle.NOT_RECEIVED_PRICE}" type="currency" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
									
								</table>
								
							</div>
							</div>
											
							</td>
						</tr>
						<tr align="center">
						<td align="center" colspan="2"  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
						<c:if test="${showSettle.STATE == 0}">
							<input type="button" class="ui-state-default ui-corner-all"    value="通过" onclick="passSettle() ;"> 
							<input type="button" class="ui-state-default ui-corner-all"    value="驳回" onclick="rebutSettle() ;"> 
						</c:if>
						<c:if test="${showSettle.STATE == 1 && settleDecompose == 2}">
							<input type="button" class="ui-state-default ui-corner-all"  value="驳回" onclick="rebutSettle() ;"> 
						</c:if>
						<c:if test="${showSettle.STATE == 1 && settleDecompose == 1}">
							<input type="button" class="ui-state-default ui-corner-all"  value="驳回" onclick="rebutSettle1();"> 
						</c:if>
						<input type="button" class="ui-state-default ui-corner-all"  onclick="javascript:history.back(-1);" value="返回" name="back">
						</td>	
				</table>
			</form>
		</center>
	</body>
</html>

