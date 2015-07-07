<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>支付表管理</title>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		$(function(){
		    $("#START_DATE").datepicker($.datepicker.regional['zh-CN']);
		    $("#FIRST_PAYDATE").datepicker($.datepicker.regional['zh-CN']);
		});
		
		
		function sub(){
		
			var ff = $("#START_DATE").val()
			var f = ff.length
			
			if(f  <1){
			
				alert("请选择日期。")
				
			}else{
				
				 $("#form11").submit(); 
			}
		}
		</script>
	</head>
	<body>
		<form action="${ctx }/servlet/defaultDispatcher" id="form11">
			<input type="hidden" name="RECP_ID" value="${paylist.RECP_ID }">
			<input type="hidden" name="__action" value="handlePaylistService.setPayDate">
			<br>
			<table width="1028" cellpadding="0" cellspacing="0" border="0"
				align="center">
				<tr>
					<td>
						<div
							class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
							style="height: 30px">
							<span class="ui-jqgrid-title"
								style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;设定起租日期</span>
						</div>
						<div
							class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
							id="main">
							<div class="zc_grid_body jqgrowleft">

								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="8" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<strong>基本信息</strong>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同号：
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.LEASE_CODE }
													</td>
													<td width="17%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														客户名称：
													</td>
													<td width="43%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.CUST_NAME }
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														支付表号：
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.RECP_CODE }
													</td>
													<td width="17%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同总金额：
													</td>
													<td width="43%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${paylist.CONTRACT_PRICE}"
															type="currency" />
														(大写：
														<script type="text/javascript">document.write(atoc(${paylist.CONTRACT_PRICE}));</script>
														)
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<%@ include file="showEquipment.jsp"%>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="10" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<b>融资租赁方案</b>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														租赁期数
													</td>
													<td width="25%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.LEASE_PERIOD }
													</td>
													<td width="17%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														租赁周期
													</td>
													<td width="43%" style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<c:if test="${paylist.LEASE_TERM eq 1 }">月份</c:if>
														<c:if test="${paylist.LEASE_TERM eq 3 }">季度</c:if>
														<c:if test="${paylist.LEASE_TERM eq 6 }">半年</c:if>
														<c:if test="${paylist.LEASE_TERM eq 12 }">年度</c:if>
													</td>
												</tr>
												<tr>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														租赁质押金
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${paylist.PLEDGE_PRICE }"
															type="currency" />
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														首期租金
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber
															value="${empty paylist.HEAD_HIRE ? 0 : paylist.HEAD_HIRE }"
															type="currency" />
													</td>
												</tr>
<!-- Add by Michael 2012 01/14 费用参数化 -->				
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b>管理费收入(影响TR计算)</b></font>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<font color="RED"><b>非管理费收入(不影响TR计算)</b></font>
			</td>
		</tr>	
		<tr>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListRZETable">
					
							<c:forEach items="${feeListRZE }" var="item"  varStatus="status">
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
								<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="updateLeaseRZE();"
										value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" >
									</td>
								</tr>
							</c:forEach>							
						<c:forEach items="${feeSetListRZE }" var="item"  varStatus="status">
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }" onchange="updateLeaseRZE();"
									value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right" feeListRZE="feeListRZE" >
								</td>
							</tr>
						</c:forEach>	
				</table>
			</td>
			<td   class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="feeListTable">
				<c:forEach items="${feeList }" var="item"  varStatus="status">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr">
							<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr">
						<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
							value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right">
						</td>
					</tr>
				</c:forEach>
				<c:forEach items="${feeSetList }" var="item"  varStatus="status">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr">
								<b>&nbsp;${item.CREATE_SHOW_NAME }</b>
							</td>
							<td class="ui-widget-content jqgrow ui-row-ltr">
							<input type="text" name="${item.CREATE_FILED_NAME }" id="${item.CREATE_FILED_NAME }"
								value="<fmt:formatNumber pattern='#,##0.00' value="${empty item.FEE?0:item.FEE }" />" style="text-align: right">
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>	
<!-- Add by Michael 2012 01/14 费用参数化 -->													
												<tr>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														差旅费
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
													<fmt:formatNumber value="${paylist.BUSINESS_TRIP_PRICE }"
															type="currency" />
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														&nbsp;&nbsp;&nbsp;
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														&nbsp;&nbsp;&nbsp;
													</td>
												</tr>
												<tr>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<!-- 利率上浮比率 -->
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<%-- ${paylist.FLOAT_RATE } % --%>
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														合同利率
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${paylist.YEAR_INTEREST }"
															pattern="0.000" />
														<font color="red">( <c:if
																test="${paylist.YEAR_INTEREST_TYPE eq 1}">浮动</c:if> <c:if
																test="${paylist.YEAR_INTEREST_TYPE eq 2}">固定</c:if> )</font>
													</td>
												</tr>
												<tr>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														日罚息率
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.FINE_RATE }
														<font color="red">( <c:if
																test="${paylist.FINE_TYPE eq 1}">单利</c:if> <c:if
																test="${paylist.FINE_TYPE eq 2}">复利</c:if> )</font>
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														概算成本（RZE）
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<fmt:formatNumber value="${paylist.LEASE_RZE }"
															type="currency" />
													</td>
												</tr>
											
												
												<tr>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														支付方式
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														<c:forEach items="${payWays}" var="item">
															<c:if test="${ paylist.PAY_WAY eq item.CODE }">${item.FLAG }</c:if>
														</c:forEach>
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														首期支付日期
													</td>
													<td style="text-align: left;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														${paylist.STR_START_DATE }&nbsp;&nbsp;&nbsp;&nbsp;起租日期:${paylist.STR_FIRST_PAYDATE }
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
												<tr>
													<td colspan="4" style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head">
														<b>设定日期</b>
													</td>
												</tr>
												<tr>
													<td width="15%" style="text-align: right;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														首期支付日期设定为：
													</td>
													<td width="15%">
														<input type="text" name="START_DATE" readonly="readonly" id="START_DATE" value="" onfocus="this.value=''"/>&nbsp;
													</td>
													<td width="15%" style="text-align: right;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
														起租日期设定为：
													</td>
													<td width="15%">
														<input type="text" name="FIRST_PAYDATE" readonly="readonly" id="FIRST_PAYDATE" value="" onfocus="this.value=''"/>&nbsp;
													</td>
												</tr>
												<tr>
													<td colspan="4" align="center" class="ui-widget-content jqgrow ui-row-ltr">
														<input type="button" onclick="sub()" name="subBut" value="确  定" class="ui-state-default ui-corner-all">
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
			</table>
		</form>
	</body>
</html>