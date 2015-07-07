<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css"
			href="${ctx }/common/css/tab.css" />
		<script type="text/javascript"
			src="${ctx}/rentcontract/js/checkContract.js"></script>
		<title>融资租赁合同复核</title>
	</head>
	<body>
		<form action="${ctx }/servlet/defaultDispatcher" method="post"
			 name="rentContractForm">
			<input type="hidden" name="__action"
				value="checkContract.saveDifference">
			<input type="hidden" name="rect_id"
				value="${customerInfoMap.RECT_ID}">	
			<input type="hidden" name="credit_id"
				value="${customerInfoMap.PRCD_ID}">		
			<input type="hidden" name="recs_id"
				value="${contractSchema.RECS_ID}">	
			<center>
				<table width="98%">
					<tr>
						<td>
							<div
								class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
								style="height: 30px">
								<span class="ui-jqgrid-title"
									style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;合同复核</span>
							</div>
							<div
								class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
								id="main">
								<div class="zc_grid_body jqgrowleft">


									<table align="center" width="98%" border="0" cellspacing="1"
										cellpadding="0" class="STYLE2" bgcolor="#798d98"
										id="customerInfo">
										<tr>
											<td align="left" colspan="4" class="keda_kuang_top">
												<strong>客户基本信息---复核比对</strong>
											</td>
										</tr>
										<tr>
											<td width="16%">
												&nbsp;
											</td>
											<td width="29%" >
												<strong>A: 合同录入</strong>
											</td>
											<td width="29%" >
												<strong>B: 现场调查报告创建</strong>
											</td>
											<td width="26%">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												融资租赁合同号：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.LEASE_CODE }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_LEASE_CODE }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="LEASE_CODE" checked="checked" value="1" /> 
													B对 <input type="radio" name="LEASE_CODE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="LEASE_CODE_A" value="${customerInfoMap.LEASE_CODE }"/>
												<input type="hidden" name="LEASE_CODE_B" value="${customerInfoMap.CREDIT_LEASE_CODE }"/>
												C <input name="LEASE_CODE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												客户名称：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CUST_NAME }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_CUST_NAME }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="CUST_NAME" checked="checked" value="1" /> 
													B对 <input type="radio" name="CUST_NAME" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="CUST_NAME_A" value="${customerInfoMap.CUST_NAME }"/>
												<input type="hidden" name="CUST_NAME_B" value="${customerInfoMap.CREDIT_CUST_NAME }"/>
												C <input name="CUST_NAME_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												组织机构代码证：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CORP_ORAGNIZATION_CODE }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_CORP_ORAGNIZATION_CODE }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="CORP_ORAGNIZATION_CODE" checked="checked" value="1" /> 
													B对 <input type="radio" name="CORP_ORAGNIZATION_CODE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="CORP_ORAGNIZATION_CODE_A" value="${customerInfoMap.CORP_ORAGNIZATION_CODE }"/>
												<input type="hidden" name="CORP_ORAGNIZATION_CODE_B" value="${customerInfoMap.CREDIT_CORP_ORAGNIZATION_CODE }"/>
												C <input name="CORP_ORAGNIZATION_CODE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												开户银行：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.OPEN_BANK }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_OPEN_BANK }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="OPEN_BANK" checked="checked" value="1" /> 
													B对 <input type="radio" name="OPEN_BANK" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="OPEN_BANK_A" value="${customerInfoMap.OPEN_BANK }"/>
												<input type="hidden" name="OPEN_BANK_B" value="${customerInfoMap.CREDIT_CORP_OPEN_BANK }"/>
												C <input name="OPEN_BANK_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												银行帐号：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.BANK_ACCOUNTS }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_BANK_ACCOUNTS }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="BANK_ACCOUNTS" checked="checked" value="1" /> 
													B对 <input type="radio" name="BANK_ACCOUNTS" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="BANK_ACCOUNTS_A" value="${customerInfoMap.BANK_ACCOUNTS }"/>
												<input type="hidden" name="BANK_ACCOUNTS_B" value="${customerInfoMap.CREDIT_BANK_ACCOUNTS}"/>
												C <input name="BANK_ACCOUNTS_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												电话：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CUST_PHONE }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_CUST_PHONE }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="CUST_PHONE" checked="checked" value="1" /> 
													B对 <input type="radio" name="CUST_PHONE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="CUST_PHONE_A" value="${customerInfoMap.CUST_PHONE }"/>
												<input type="hidden" name="CUST_PHONE_B" value="${customerInfoMap.CREDIT_CUST_PHONE}"/>
												C <input name="CUST_PHONE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												传真：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CUST_FAX }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_CUST_FAX }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="CUST_FAX" checked="checked" value="1" /> 
													B对 <input type="radio" name="CUST_FAX" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="CUST_FAX_A" value="${customerInfoMap.CUST_FAX }"/>
												<input type="hidden" name="CUST_FAX_B" value="${customerInfoMap.CREDIT_CUST_FAX}"/>
												C <input name="CUST_FAX_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												联系人：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CUST_LINKMAN }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_CUST_LINKMAN }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="CUST_LINKMAN" checked="checked" value="1" /> 
													B对 <input type="radio" name="CUST_LINKMAN" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="CUST_LINKMAN_A" value="${customerInfoMap.CUST_LINKMAN }"/>
												<input type="hidden" name="CUST_LINKMAN_B" value="${customerInfoMap.CREDIT_CUST_LINKMAN}"/>
												C <input name="CUST_LINKMAN_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												邮编：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CUST_ZIP }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_CUST_ZIP }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="CUST_ZIP" checked="checked" value="1" /> 
													B对 <input type="radio" name="CUST_ZIP" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="CUST_ZIP_A" value="${customerInfoMap.CUST_ZIP }"/>
												<input type="hidden" name="CUST_ZIP_B" value="${customerInfoMap.CREDIT_CUST_ZIP}"/>
												C <input name="CUST_ZIP_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												地址：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CUST_ADDRESS }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_CUST_ADDRESS }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="CUST_ADDRESS" checked="checked" value="1" /> 
													B对 <input type="radio" name="CUST_ADDRESS" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="CUST_ADDRESS_A" value="${customerInfoMap.CUST_ADDRESS }"/>
												<input type="hidden" name="CUST_ADDRESS_B" value="${customerInfoMap.CREDIT_CUST_ADDRESS}"/>
												C <input name="CUST_ADDRESS_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<!-- 
										<tr>
											<td style="background-color: #BCE3F0">
												所属省市：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.PROVINCE_NAME }${customerInfoMap.CITY_NAME
												}
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_PROVINCE_NAME
												}${customerInfoMap.CREDIT_CITY_NAME }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>A对 <input type="radio" name="" /> B对 <input
														type="radio" name="" checked="checked" /> </span> &nbsp;C
												<input name=""
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										 -->
									</table>
									<br />
									<table  width="98%" border="0" cellspacing="1" align="center"
										cellpadding="0" class="STYLE2" bgcolor="#798d98">
										<tr>
											<td align="left"  class="keda_kuang_top" colspan="9">
												<strong>租赁设备---复核比对</strong>
											</td>
										</tr> 
										<tr>
											<td width="100%" align="left" colspan="9">
												<table  width="100%"  class="STYLE2" cellspacing="1"  bgcolor="#798d98" id="contractEquip">
													<tr>
														<td width="15%" style="background-color: #BCE3F0" align="center">
															制造商
														</td>
														<td width="15%" style="background-color: #BCE3F0"  align="center">
															产品名称
														</td>
														<td width="15%" style="background-color: #BCE3F0"  align="center">
															规格型号
														</td>
														<td width="12%" style="background-color: #BCE3F0"  align="center">
															供应商
														</td>
														<td width="7%" style="background-color: #BCE3F0"  align="center">
															留购价(元)
														</td>
														<td width="11%" style="background-color: #BCE3F0"  align="center">
															单价(元)
														<td width="5%" style="background-color: #BCE3F0"  align="center">
															数量
														</td>
														<td width="5%" style="background-color: #BCE3F0"  align="center">
															单位
														</td>
														<td width="11%" style="background-color: #BCE3F0"  align="center">
															合计
														</td>
													</tr>
													<tr>
														<td colspan="9" height="26px">
															<strong>A: 合同录入</strong>
														</td>
													</tr>
													<c:forEach items="${contractEquipments}" var="item">
														<tr> 
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.THING_KIND }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.THING_NAME }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.MODEL_SPEC }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.BRAND }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.STAYBUY_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.UNIT_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.AMOUNT }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.UNIT }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.TOTAL }" type="currency"></fmt:formatNumber>
															</td>
														</tr>	
													</c:forEach> 
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%" align="left" colspan="9">
												<table  width="100%"  class="STYLE2" cellspacing="1"  bgcolor="#798d98" id="creditEquip">
													<tr>
														<td colspan="9" height="26px">
															<strong>B: 现场调查报告创建</strong>
														</td>
													</tr>
													<c:forEach items="${creditEquipments}" var="item">
														<tr> 
															<td width="15%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.THING_KIND }
															</td>
															<td width="15%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.THING_NAME }
															</td>
															<td width="15%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.MODEL_SPEC }
															</td>
															<td width="12%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.BRAND }
															</td>
															<td width="7%" height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.STAYBUY_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td width="11%" height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.UNIT_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td width="5%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.AMOUNT }
															</td>
															<td width="5%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.UNIT }
															</td>
															<td width="11%" height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.TOTAL }" type="currency"></fmt:formatNumber>
															</td>
														</tr>
													</c:forEach>
														<tr>
															<td colspan="9" height="26px">
																A对 <input type="radio" name="EQUIPMENT" checked="checked" value="1" /> 
																B对 <input type="radio" name="EQUIPMENT" value="2" /> 
															</td>
														</tr>
														
												</table>
											</td>
										</tr>	
									</table>	
									<br/>
									<table  width="98%" border="0" cellspacing="1" align="center"
										cellpadding="0" class="STYLE2" bgcolor="#798d98"
										id="schemaInfo">
										<tr>
											<td align="left" colspan="4" class="keda_kuang_top">
												<strong>融资租赁方案---复核比对</strong>
											</td>
										</tr>
										<tr>
											<td width="16%">
												&nbsp;
											</td>
											<td width="29%" >
												<strong>A: 合同录入</strong>
											</td>
											<td width="29%" >
												<strong>B: 现场调查报告创建</strong>
											</td>
											<td width="26%">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												租赁物件总价值：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.LEASE_TOPRIC }"  type="currency"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.LEASE_TOPRIC }"  type="currency"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="LEASE_TOPRIC" checked="checked" value="1" /> 
													B对 <input type="radio" name="LEASE_TOPRIC" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="LEASE_TOPRIC_A" value="${contractSchema.LEASE_TOPRIC }"/>
												<input type="hidden" name="LEASE_TOPRIC_B" value="${creditSchema.LEASE_TOPRIC }"/>
												C <input name="LEASE_TOPRIC_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												租赁期数：
											</td> 
											<td 
												style="background-color: #EBEBEB; color: black;">
												${contractSchema.LEASE_PERIOD }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${creditSchema.LEASE_TERM }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="LEASE_PERIOD" checked="checked" value="1" /> 
													B对 <input type="radio" name="LEASE_PERIOD" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="LEASE_PERIOD_A" value="${contractSchema.LEASE_PERIOD }"/>
												<input type="hidden" name="LEASE_PERIOD_B" value="${creditSchema.LEASE_TERM }"/>
												C <input name="LEASE_PERIOD_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												租赁周期：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${contractSchema.LEASE_TERM eq 1}">月</c:if>
												<c:if test="${contractSchema.LEASE_TERM eq 2}">双月</c:if>
												<c:if test="${contractSchema.LEASE_TERM eq 3}">季</c:if>
												<c:if test="${contractSchema.LEASE_TERM eq 6}">半年</c:if>
												<c:if test="${contractSchema.LEASE_TERM eq 12}">年</c:if>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${creditSchema.LEASE_COURSE  eq 1}">月</c:if>
												<c:if test="${creditSchema.LEASE_COURSE  eq 2}">双月</c:if>
												<c:if test="${creditSchema.LEASE_COURSE  eq 3}">季</c:if>
												<c:if test="${creditSchema.LEASE_COURSE  eq 6}">半年</c:if>
												<c:if test="${creditSchema.LEASE_COURSE  eq 12}">年</c:if>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="LEASE_TERM" checked="checked" value="1" /> 
													B对 <input type="radio" name="LEASE_TERM" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="LEASE_TERM_A" value="${contractSchema.LEASE_TERM }"/>
												<input type="hidden" name="LEASE_TERM_B" value="${creditSchema.LEASE_COURSE }"/>
												C <select name="LEASE_TERM_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option>
												  	<option value="1">--月--</option>
												  	<option value="1">--双月--</option>
												  	<option value="3">--季--</option>
												  	<option value="6">--半年-</option>
												  	<option value="12">--年--</option>
												  </select>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												租赁质押金比率：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.PLEDGE_PRICE_RATE }"  pattern="#0.00"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.PLEDGE_PRICE_RATE }"  pattern="#0.00"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="PLEDGE_PRICE_RATE" checked="checked" value="1" /> 
													B对 <input type="radio" name="PLEDGE_PRICE_RATE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="PLEDGE_PRICE_RATE_A" value="${contractSchema.PLEDGE_PRICE_RATE }"/>
												<input type="hidden" name="PLEDGE_PRICE_RATE_B" value="${creditSchema.PLEDGE_PRICE_RATE }"/>
												C <input name="PLEDGE_PRICE_RATE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												租赁质押金：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.PLEDGE_PRICE }"  type="currency"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.PLEDGE_PRICE }"  type="currency"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="PLEDGE_PRICE" checked="checked" value="1" /> 
													B对 <input type="radio" name="PLEDGE_PRICE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="PLEDGE_PRICE_A" value="${contractSchema.PLEDGE_PRICE }"/>
												<input type="hidden" name="PLEDGE_PRICE_B" value="${creditSchema.PLEDGE_PRICE }"/>
												C <input name="PLEDGE_PRICE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												管理费比率：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.MANAGEMENT_FEE_RATE }"  pattern="#0.00"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.MANAGEMENT_FEE_RATE }"  pattern="#0.00"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="MANAGEMENT_FEE_RATE" checked="checked" value="1" /> 
													B对 <input type="radio" name="MANAGEMENT_FEE_RATE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="MANAGEMENT_FEE_RATE_A" value="${contractSchema.MANAGEMENT_FEE_RATE }"/>
												<input type="hidden" name="MANAGEMENT_FEE_RATE_B" value="${creditSchema.MANAGEMENT_FEE_RATE }"/>
												C <input name="MANAGEMENT_FEE_RATE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												管理费（每年）：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.MANAGEMENT_FEE }"  type="currency"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.MANAGEMENT_FEE }"  type="currency"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="MANAGEMENT_FEE" checked="checked" value="1" /> 
													B对 <input type="radio" name="MANAGEMENT_FEE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="MANAGEMENT_FEE_A" value="${contractSchema.MANAGEMENT_FEE }"/>
												<input type="hidden" name="MANAGEMENT_FEE_B" value="${creditSchema.MANAGEMENT_FEE }"/>
												C <input name="MANAGEMENT_FEE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												差旅费 ：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.BUSINESS_TRIP_PRICE }"  type="currency"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.BUSINESS_TRIP_PRICE }"  type="currency"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="BUSINESS_TRIP_PRICE" checked="checked" value="1" /> 
													B对 <input type="radio" name="BUSINESS_TRIP_PRICE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="BUSINESS_TRIP_PRICE_A" value="${contractSchema.BUSINESS_TRIP_PRICE }"/>
												<input type="hidden" name="BUSINESS_TRIP_PRICE_B" value="${creditSchema.BUSINESS_TRIP_PRICE }"/>
												C <input name="BUSINESS_TRIP_PRICE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												<!-- 利率上浮比率： -->
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<%-- <fmt:formatNumber value="${contractSchema.FLOAT_RATE }"  pattern="#0.00"/> --%>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.FLOAT_RATE }"  pattern="#0.00"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="FLOAT_RATE" checked="checked" value="1" /> 
													B对 <input type="radio" name="FLOAT_RATE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="FLOAT_RATE_A" value="${contractSchema.FLOAT_RATE }"/>
												<input type="hidden" name="FLOAT_RATE_B" value="${creditSchema.FLOAT_RATE }"/>
												C <input name="FLOAT_RATE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												合同利率类型：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${contractSchema.YEAR_INTEREST_TYPE eq 1 }">固定</c:if>
												<c:if test="${contractSchema.YEAR_INTEREST_TYPE eq 2 }">浮动</c:if>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${creditSchema.YEAR_INTEREST_TYPE eq 1 }">固定</c:if>
												<c:if test="${creditSchema.YEAR_INTEREST_TYPE eq 2 }">浮动</c:if>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="YEAR_INTEREST_TYPE" checked="checked" value="1" /> 
													B对 <input type="radio" name="YEAR_INTEREST_TYPE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="YEAR_INTEREST_TYPE_A" value="${contractSchema.YEAR_INTEREST_TYPE }"/>
												<input type="hidden" name="YEAR_INTEREST_TYPE_B" value="${creditSchema.YEAR_INTEREST_TYPE }"/>
												C <select name="YEAR_INTEREST_TYPE_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option>
												  	<option value="1">-固定-</option>
												  	<option value="2">-浮动-</option>
												  </select>		
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												合同利率比率：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.YEAR_INTEREST }"  pattern="#0.00"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.YEAR_INTEREST }"  pattern="#0.00"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="YEAR_INTEREST" checked="checked" value="1" /> 
													B对 <input type="radio" name="YEAR_INTEREST" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="YEAR_INTEREST_A" value="${contractSchema.YEAR_INTEREST }"/>
												<input type="hidden" name="YEAR_INTEREST_B" value="${creditSchema.YEAR_INTEREST }"/>
												C <input name="YEAR_INTEREST_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												日罚息率类型：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${contractSchema.FINE_TYPE eq 1 }">单利</c:if>
												<c:if test="${contractSchema.FINE_TYPE eq 2 }">复利</c:if>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${creditSchema.FINE_TYPE eq 1 }">单利</c:if>
												<c:if test="${creditSchema.FINE_TYPE eq 2 }">复利</c:if>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="FINE_TYPE" checked="checked" value="1" /> 
													B对 <input type="radio" name="FINE_TYPE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="FINE_TYPE_A" value="${contractSchema.FINE_TYPE }"/>
												<input type="hidden" name="FINE_TYPE_B" value="${creditSchema.FINE_TYPE }"/>
												C <select name="FINE_TYPE_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option>
												  	<option value="1">-单利-</option>
												  	<option value="2">-复利-</option>
												  </select>		
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												日罚息率比率：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.FINE_RATE }"  pattern="#0.00"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.FINE_RATE }"  pattern="#0.00"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="FINE_RATE" checked="checked" value="1" /> 
													B对 <input type="radio" name="FINE_RATE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="FINE_RATE_A" value="${contractSchema.FINE_RATE }"/>
												<input type="hidden" name="FINE_RATE_B" value="${creditSchema.FINE_RATE }"/>
												C <input name="FINE_RATE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												概算成本（RZE） ：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.LEASE_RZE }"  type="currency"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.LEASE_RZE }"  type="currency"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="LEASE_RZE" checked="checked" value="1" /> 
													B对 <input type="radio" name="LEASE_RZE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="LEASE_RZE_A" value="${contractSchema.LEASE_RZE }"/>
												<input type="hidden" name="LEASE_RZE_B" value="${creditSchema.LEASE_RZE }"/>
												C <input name="LEASE_RZE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												支付方式 ：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${contractSchema.PAY_WAY eq 11 }">期初等额本息支付</c:if> 
												<c:if test="${contractSchema.PAY_WAY eq 12 }">期初等额本金支付</c:if> 
												<c:if test="${contractSchema.PAY_WAY eq 13 }">期初不等额支付</c:if> 
												<c:if test="${contractSchema.PAY_WAY eq 21 }">期末等额本息支付</c:if> 
												<c:if test="${contractSchema.PAY_WAY eq 22 }">期末等额本金支付</c:if> 
												<c:if test="${contractSchema.PAY_WAY eq 23 }">期末不等额支付</c:if> 
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${creditSchema.PAY_WAY eq 11 }">期初等额本息支付</c:if> 
												<c:if test="${creditSchema.PAY_WAY eq 12 }">期初等额本金支付</c:if> 
												<c:if test="${creditSchema.PAY_WAY eq 13 }">期初不等额支付</c:if> 
												<c:if test="${creditSchema.PAY_WAY eq 21 }">期末等额本息支付</c:if> 
												<c:if test="${creditSchema.PAY_WAY eq 22 }">期末等额本金支付</c:if> 
												<c:if test="${creditSchema.PAY_WAY eq 23 }">期末不等额支付</c:if> 
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="PAY_WAY" checked="checked" value="1" /> 
													B对 <input type="radio" name="PAY_WAY" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="PAY_WAY_A" value="${contractSchema.PAY_WAY }"/>
												<input type="hidden" name="PAY_WAY_B" value="${creditSchema.PAY_WAY }"/>
												C <select name="PAY_WAY_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option>
												  	<option value="11">期初等额本息支付</option>
												  	<option value="12">期初等额本金支付</option>
												  	<option value="13">期初不等额支付</option>
												  	<option value="21">期末等额本息支付</option>
												  	<option value="22">期末等额本金支付</option>
												  	<option value="23">期末不等额支付</option>
												  </select>		
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												起租日期 ：
											</td> 
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${contractSchema.START_DATE }"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${creditSchema.START_DATE }"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="START_DATE" checked="checked" value="1" /> 
													B对 <input type="radio" name="START_DATE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="START_DATE_A" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${contractSchema.START_DATE }"/>"/>
												<input type="hidden" name="START_DATE_B" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${creditSchema.START_DATE }"/>"/>
												C <input name="START_DATE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												租赁物件设置场所 ：
											</td> 
											<td 
												style="background-color: #EBEBEB; color: black;">
												${contractSchema.EQUPMENT_ADDRESS }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${creditSchema.EQUPMENT_ADDRESS }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="EQUPMENT_ADDRESS" checked="checked" value="1" /> 
													B对 <input type="radio" name="EQUPMENT_ADDRESS" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="EQUPMENT_ADDRESS_A" value="${contractSchema.EQUPMENT_ADDRESS }"/>
												<input type="hidden" name="EQUPMENT_ADDRESS_B" value="${creditSchema.EQUPMENT_ADDRESS }"/>
												C <input name="EQUPMENT_ADDRESS_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												租赁期满处理方式：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${contractSchema.DEAL_WAY eq 1 }">留购</c:if> 
												<c:if test="${contractSchema.DEAL_WAY eq 2 }">退还</c:if> 
												<c:if test="${contractSchema.DEAL_WAY eq 3 }">续租</c:if> 
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${creditSchema.DEAL_WAY eq 1 }">留购</c:if> 
												<c:if test="${creditSchema.DEAL_WAY eq 2 }">退还</c:if> 
												<c:if test="${creditSchema.DEAL_WAY eq 3 }">续租</c:if> 
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="DEAL_WAY" checked="checked" value="1" /> 
													B对 <input type="radio" name="DEAL_WAY" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="DEAL_WAY_A" value="${contractSchema.DEAL_WAY }"/>
												<input type="hidden" name="DEAL_WAY_B" value="${creditSchema.DEAL_WAY }"/>
												C <select name="DEAL_WAY_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option>
												  	<option value="1">-留购-</option>
												  	<option value="2">-退还-</option>
												  	<option value="3">-续租-</option>
												  </select>		
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												保险公司 ：
											</td> 
											<td 
												style="background-color: #EBEBEB; color: black;">
												${contractSchema.INCP_NAME }
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												${creditSchema.INCP_NAME }
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="INSURANCE_COMPANY_ID" checked="checked" value="1" /> 
													B对 <input type="radio" name="INSURANCE_COMPANY_ID" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="INSURANCE_COMPANY_ID_A" value="${contractSchema.INSURANCE_COMPANY_ID }"/>
												<input type="hidden" name="INSURANCE_COMPANY_ID_B" value="${creditSchema.INSURANCE_COMPANY_ID }"/>
												C <select name="INSURANCE_COMPANY_ID_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option> 
												  	<c:forEach items="${insureCompanyList}" var="item">
												  		<option value="${item.INCP_ID }">${item.INCP_NAME }</option> 
												  	</c:forEach>
												  </select>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												购买方式 ：
											</td> 
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${contractSchema.BUY_INSURANCE_WAY eq 1 }">自购</c:if>
												<c:if test="${contractSchema.BUY_INSURANCE_WAY eq 2 }">代购</c:if>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${creditSchema.BUY_INSURANCE_WAY eq 1 }">自购</c:if>
												<c:if test="${creditSchema.BUY_INSURANCE_WAY eq 2 }">代购</c:if>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="BUY_INSURANCE_WAY" checked="checked" value="1" /> 
													B对 <input type="radio" name="BUY_INSURANCE_WAY" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="BUY_INSURANCE_WAY_A" value="${contractSchema.BUY_INSURANCE_WAY }"/>
												<input type="hidden" name="BUY_INSURANCE_WAY_B" value="${creditSchema.BUY_INSURANCE_WAY }"/>
												C <select name="BUY_INSURANCE_WAY_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option>
												  	<option value="1">-自购-</option>
												  	<option value="2">-代购-</option> 
												  </select>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												购买时间 ：
											</td> 
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${contractSchema.BUY_INSURANCE_TIME eq 1 }">全年购买</c:if>
												<c:if test="${contractSchema.BUY_INSURANCE_TIME eq 2 }">分年购买</c:if>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<c:if test="${creditSchema.BUY_INSURANCE_TIME eq 1 }">全年购买</c:if>
												<c:if test="${creditSchema.BUY_INSURANCE_TIME eq 2 }">分年购买</c:if>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="BUY_INSURANCE_TIME" checked="checked" value="1" /> 
													B对 <input type="radio" name="BUY_INSURANCE_TIME" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="BUY_INSURANCE_TIME_A" value="${contractSchema.BUY_INSURANCE_TIME }"/>
												<input type="hidden" name="BUY_INSURANCE_TIME_B" value="${creditSchema.BUY_INSURANCE_TIME }"/>
												C <select name="BUY_INSURANCE_TIME_C"
													style="width: 80px; height: 18px; font-size: 12">
												  	<option value="">-请选择-</option>
												  	<option value="1">全年购买</option>
												  	<option value="2">分年购买</option> 
												  </select>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0">
												保险返利比率：
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${contractSchema.INSURE_REBATE_RATE }"  pattern="#0.00"/>
											</td>
											<td 
												style="background-color: #EBEBEB; color: black;">
												<fmt:formatNumber value="${creditSchema.INSURE_REBATE_RATE }"  pattern="#0.00"/>
											</td>
											<td style="background-color: #EBEBEB;" align="right">
												<span>
													A对 <input type="radio" name="INSURE_REBATE_RATE" checked="checked" value="1" /> 
													B对 <input type="radio" name="INSURE_REBATE_RATE" value="2" /> 
												</span> &nbsp;
												<input type="hidden" name="INSURE_REBATE_RATE_A" value="${contractSchema.INSURE_REBATE_RATE }"/>
												<input type="hidden" name="INSURE_REBATE_RATE_B" value="${creditSchema.INSURE_REBATE_RATE }"/>
												C <input name="INSURE_REBATE_RATE_C"
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
									</table>
									<br />
										<table  width="98%" border="0" cellspacing="1" align="center"
										cellpadding="0" class="STYLE2" bgcolor="#798d98">
										<tr>
											<td align="left"  class="keda_kuang_top" colspan="9">
												<strong>保险信息---复核比对</strong>
											</td>
										</tr> 
										<tr>
											<td width="100%" align="left" colspan="9">
												<table  width="100%"  class="STYLE2" cellspacing="1"  bgcolor="#798d98" id="contractInsure">
													<tr>
														<td width="30%" style="background-color: #BCE3F0" align="center">
															保险项目
														</td>
														<td width="10%" style="background-color: #BCE3F0"  align="center">
															开始时间
														</td>
														<td width="10%" style="background-color: #BCE3F0"  align="center">
															结束时间
														</td>
														<td width="10%" style="background-color: #BCE3F0"  align="center">
															保险费率
														</td>
														<td width="20%" style="background-color: #BCE3F0"  align="center">
															保险费用
														</td>
														<td width="20%" style="background-color: #BCE3F0"  align="center">
															备注
														</td> 
													</tr>
													<tr>
														<td colspan="9" height="26px">
															<strong>A: 合同录入</strong>
														</td>
													</tr>
													<c:forEach items="${contractInsure}" var="item">
														<tr> 
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.INTP_NAME }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.START_DATE }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.END_DATE }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.INSURE_RATE }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.INSURE_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.MEMO }
															</td>
														</tr>	
													</c:forEach> 
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%" align="left" colspan="9">
												<table  width="100%"  class="STYLE2" cellspacing="1"  bgcolor="#798d98" id="creditInsure">
													<tr>
														<td colspan="9" height="26px">
															<strong>B: 现场调查报告创建</strong>
														</td>
													</tr>
													<c:forEach items="${creditInsure}" var="item">
														<tr> 
															<td width="30%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.INTP_NAME }
															</td>
															<td width="10%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.START_DATE }
															</td>
															<td width="10%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.END_DATE }
															</td>
															<td width="10%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.INSURE_RATE }
															</td>
															<td width="20%" height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.INSURE_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td width="20%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.MEMO }
															</td>
														</tr>	
													</c:forEach>  
														<tr>
															<td colspan="9" height="26px">
																A对 <input type="radio" name="INSURE" checked="checked" value="1" /> 
																B对 <input type="radio" name="INSURE" value="2" /> 
															</td>
														</tr>
														
												</table>
											</td>
										</tr>	
									</table>	 
									<br />
										<table  width="98%" border="0" cellspacing="1" align="center"
										cellpadding="0" class="STYLE2" bgcolor="#798d98">
										<tr>
											<td align="left"  class="keda_kuang_top" colspan="9">
												<strong>其他费用---复核比对</strong>
											</td>
										</tr> 
										<tr>
											<td width="100%" align="left" colspan="9">
												<table  width="100%"  class="STYLE2" cellspacing="1"  bgcolor="#798d98" id="contractOtherPrice">
													<tr>
														<td width="25%" style="background-color: #BCE3F0" align="center">
															费用名称
														</td>
														<td width="25%" style="background-color: #BCE3F0"  align="center">
															费用金额
														</td>
														<td width="25%" style="background-color: #BCE3F0"  align="center">
															产生费用时间
														</td>
														<td width="25%" style="background-color: #BCE3F0"  align="center">
															备注
														</td> 
													</tr>
													<tr>
														<td colspan="9" height="26px">
															<strong>A: 合同录入</strong>
														</td>
													</tr>
													<c:forEach items="${contractOtherPrice}" var="item">
														<tr> 
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.OTHER_NAME }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.OTHER_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.OTHER_DATE }
															</td>
															<td height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.MEMO }
															</td>
														</tr>	
													</c:forEach> 
												</table>
											</td>
										</tr>
										<tr>
											<td width="100%" align="left" colspan="9">
												<table  width="100%"  class="STYLE2" cellspacing="1"  bgcolor="#798d98" id="creditOtherPrice">
													<tr>
														<td colspan="9" height="26px">
															<strong>B: 现场调查报告创建</strong>
														</td>
													</tr>
													<c:forEach items="${creditOtherPrice}" var="item">
														<tr> 
															<td width="25%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.OTHER_NAME }
															</td>
															<td width="25%" height="26px" style="background-color: #EBEBEB; color: black;" align="right">
																<fmt:formatNumber value="${item.OTHER_PRICE }" type="currency"></fmt:formatNumber>
															</td>
															<td width="25%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.OTHER_DATE }
															</td>
															<td width="25%" height="26px" style="background-color: #EBEBEB; color: black;" align="center">
																${item.MEMO }
															</td>
														</tr>	
													</c:forEach>  
														<tr>
															<td colspan="9" height="26px">
																A对 <input type="radio" name="OTHERPRICE" checked="checked" value="1" /> 
																B对 <input type="radio" name="OTHERPRICE" value="2" /> 
															</td>
														</tr>
														
												</table>
											</td>
										</tr>	
									</table>	
									<div id="butdiv" style="text-align: center;">
										<input type='hidden' name='flag' vlaue='1'/>
										<input type="button" name="sub" value="通  过" class="button_keda" onclick="saveDif(1,this)">
										<input type="reset" name="res" value="驳  回" class="button_keda" onclick="saveDif(2,this)">
									</div>
									<br />
								</div>
							</div>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>
