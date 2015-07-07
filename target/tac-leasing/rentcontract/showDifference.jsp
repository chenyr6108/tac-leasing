<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="${ctx }/common/css/tab.css" /> 
		<script type="text/javascript" src="${ctx}/rentcontract/js/difference.js"></script>
		<title>融资租赁合同查看差异</title>
	</head>
	<body>
		<form action="${ctx }/servlet/defaultDispatcher" method="post"
			 name="rentContractForm"> 
			<center>
				<table width="98%">
					<tr>
						<td>
							<div
								class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
								style="height: 30px">
								<span class="ui-jqgrid-title"
									style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;合同复核差异</span>
							</div>
							<div
								class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
								id="main">
								<div class="zc_grid_body jqgrowleft">


									<table align="center" width="98%" border="0" cellspacing="0"
										cellpadding="0" class="ui-jqgrid-htable zc_grid_title" bgcolor="#798d98"
										id="customerInfo">
										<tr>
											<td align="left" colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												<strong>客户基本信息---复核差异</strong>
											</td>
										</tr>
										<tr>
											<td width="16%"  class="ui-widget-content jqgrow ui-row-ltr">
												&nbsp;
											</td>
											<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr" height="26">
												<strong>A: 合同录入</strong>
											</td>
											<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr" height="26">
												<strong>B: 现场调查报告创建</strong>
											</td>
											<td width="32%" class="ui-widget-content jqgrow ui-row-ltr">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												融资租赁合同号：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.LEASE_CODE_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.LEASE_CODE_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.LEASE_CODE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_CODE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_CODE_STATUS eq 3 }">
														复核录入正确 :${differenceMap.LEASE_CODE_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
												 
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												客户名称：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_NAME_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_NAME_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CUST_NAME_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CUST_NAME_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CUST_NAME_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CUST_NAME_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												组织机构代码证：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CORP_ORAGNIZATION_CODE_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CORP_ORAGNIZATION_CODE_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CORP_ORAGNIZATION_CODE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CORP_ORAGNIZATION_CODE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CORP_ORAGNIZATION_CODE_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CORP_ORAGNIZATION_CODE_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												开户银行：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.OPEN_BANK_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.OPEN_BANK_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.OPEN_BANK_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.OPEN_BANK_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.OPEN_BANK_STATUS eq 3 }">
														复核录入正确 :${differenceMap.OPEN_BANK_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												银行帐号：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.BANK_ACCOUNTS_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.BANK_ACCOUNTS_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.BANK_ACCOUNTS_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.BANK_ACCOUNTS_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.BANK_ACCOUNTS_STATUS eq 3 }">
														复核录入正确 :${differenceMap.BANK_ACCOUNTS_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												身份证号：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.NATU_IDCARD_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.NATU_IDCARD_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.NATU_IDCARD_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.NATU_IDCARD_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.NATU_IDCARD_STATUS eq 3 }">
														复核录入正确 :${differenceMap.NATU_IDCARD_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												配偶：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.NATU_MATE_NAME_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.NATU_MATE_NAME_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.NATU_MATE_NAME_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.NATU_MATE_NAME_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.NATU_MATE_NAME_STATUS eq 3 }">
														复核录入正确 :${differenceMap.NATU_MATE_NAME_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												配偶身份证号：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.NATU_MATE_IDCARD_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.NATU_MATE_IDCARD_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.NATU_MATE_IDCARD_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.NATU_MATE_IDCARD_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.NATU_MATE_IDCARD_STATUS eq 3 }">
														复核录入正确 :${differenceMap.NATU_MATE_IDCARD_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												电话：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_PHONE_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_PHONE_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CUST_PHONE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CUST_PHONE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CUST_PHONE_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CUST_PHONE_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												传真：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_FAX_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_FAX_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CUST_FAX_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CUST_FAX_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CUST_FAX_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CUST_FAX_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												联系人：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_LINKMAN_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_LINKMAN_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CUST_LINKMAN_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CUST_LINKMAN_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CUST_LINKMAN_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CUST_LINKMAN_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												邮编：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_ZIP_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CUST_ZIP_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CUST_ZIP_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CUST_ZIP_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CUST_ZIP_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CUST_ZIP_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												注册地址：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CORP_REGISTE_ADDRESS_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CORP_REGISTE_ADDRESS_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CORP_REGISTE_ADDRESS_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CORP_REGISTE_ADDRESS_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CORP_REGISTE_ADDRESS_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CORP_REGISTE_ADDRESS_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												实际经营地：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CORP_WORK_ADDRESS_A }&nbsp;
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.CORP_WORK_ADDRESS_B }&nbsp;
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.CORP_WORK_ADDRESS_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.CORP_WORK_ADDRESS_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.CORP_WORK_ADDRESS_STATUS eq 3 }">
														复核录入正确 :${differenceMap.CORP_WORK_ADDRESS_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<!-- 
										<tr>
											<td style="background-color: #BCE3F0">
												所属省市：
											</td>
											<td 
												style="background: #EBEBEB; color: black;">
												${customerInfoMap.PROVINCE_NAME }${customerInfoMap.CITY_NAME
												}
											</td>
											<td 
												style="background: #EBEBEB; color: black;">
												${customerInfoMap.CREDIT_PROVINCE_NAME
												}${customerInfoMap.CREDIT_CITY_NAME }
											</td>
											<td style="background: #EBEBEB;" align="left">
												<span>A对 <input type="radio" name="" /> B对 <input
														type="radio" name="" checked="checked" /> </span> &nbsp;C
												<input name=""
													style="width: 80px; height: 18px; font-size: 12" />
											</td>
										</tr>
										 -->
									</table>
									<br />
									<table  width="98%" border="0" cellspacing="0" align="center"
										cellpadding="0" class="ui-jqgrid-htable zc_grid_title" bgcolor="#798d98" id="equipments">
										<tr>
											<td align="left"  class="ui-state-default ui-th-ltr zc_grid_head" height="26"  colspan="9">
												<strong>租赁设备---复核差异</strong>
											</td>
										</tr> 
										<tr>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr" height="26">
												<c:if test="${differenceMap.EQUIPMENT_STATUS eq 0}">
													无差异
												</c:if>
												<c:if test="${differenceMap.EQUIPMENT_STATUS eq 1}">
													A正确
												</c:if>
												<c:if test="${differenceMap.EQUIPMENT_STATUS eq 2}">
													B正确
												</c:if>
											</td>	 
										</tr> 
									</table>	
									<br/>
									<table  width="98%" border="0" cellspacing="0" align="center"
										cellpadding="0" class="ui-jqgrid-htable zc_grid_title" bgcolor="#798d98"
										id="schemaInfo">
										<tr>
											<td align="left" colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												<strong>融资租赁方案---复核差异</strong>
											</td>
										</tr>
										<tr>
											<td width="16%" class="ui-widget-content jqgrow ui-row-ltr" height="26">
												&nbsp;
											</td>
											<td width="26%" class="ui-widget-content jqgrow ui-row-ltr" height="26">
												<strong>A: 合同录入</strong>
											</td>
											<td width="26%" class="ui-widget-content jqgrow ui-row-ltr" height="26">
												<strong>B: 现场调查报告创建</strong>
											</td>
											<td width="32%" class="ui-widget-content jqgrow ui-row-ltr" height="26">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												租赁物件总价值：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.LEASE_TOPRIC_A }"  type="currency"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.LEASE_TOPRIC_B }"  type="currency"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.LEASE_TOPRIC_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_TOPRIC_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_TOPRIC_STATUS eq 3 }">
														复核录入正确 :${differenceMap.LEASE_TOPRIC_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												租赁期数：
											</td> 
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.LEASE_PERIOD_A }
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.LEASE_PERIOD_B }
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.LEASE_PERIOD_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_PERIOD_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_PERIOD_STATUS eq 3 }">
														复核录入正确 :${differenceMap.LEASE_PERIOD_C}
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												租赁周期：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.LEASE_TERM_A eq 1}">月</c:if>
												<c:if test="${differenceMap.LEASE_TERM_A eq 3}">季</c:if>
												<c:if test="${differenceMap.LEASE_TERM_A eq 6}">半年</c:if>
												<c:if test="${differenceMap.LEASE_TERM_A eq 12}">年</c:if>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.LEASE_TERM_B  eq 1}">月</c:if>
												<c:if test="${differenceMap.LEASE_TERM_B  eq 3}">季</c:if>
												<c:if test="${differenceMap.LEASE_TERM_B  eq 6}">半年</c:if>
												<c:if test="${differenceMap.LEASE_TERM_B  eq 12}">年</c:if>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.LEASE_TERM_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_TERM_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_TERM_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.LEASE_TERM_C  eq 1}">月</c:if>
														<c:if test="${differenceMap.LEASE_TERM_C  eq 3}">季</c:if>
														<c:if test="${differenceMap.LEASE_TERM_C  eq 6}">半年</c:if>
														<c:if test="${differenceMap.LEASE_TERM_C  eq 12}">年</c:if>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												保证金比率：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.PLEDGE_PRICE_RATE_A }"  pattern="#0.00"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.PLEDGE_PRICE_RATE_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.PLEDGE_PRICE_RATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.PLEDGE_PRICE_RATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.PLEDGE_PRICE_RATE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.PLEDGE_PRICE_RATE_C }"  pattern="#0.00"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												保证金：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.PLEDGE_PRICE_A }"  type="currency"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.PLEDGE_PRICE_B }"  type="currency"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.PLEDGE_PRICE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.PLEDGE_PRICE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.PLEDGE_PRICE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.PLEDGE_PRICE_C }"  type="currency"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												保证金处理方式：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.PLEDGE_WAY_A eq 1}">用于平均抵冲金额</c:if>
												<c:if test="${differenceMap.PLEDGE_WAY_A eq 0}">用于期末退还金额</c:if>
												<c:if test="${differenceMap.PLEDGE_WAY_A eq 2}">用于最后抵冲含税金额/期数</c:if>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.PLEDGE_WAY_B  eq 1}">用于平均抵冲金额</c:if>
												<c:if test="${differenceMap.PLEDGE_WAY_B  eq 0}">用于期末退还金额</c:if>
												<c:if test="${differenceMap.PLEDGE_WAY_B  eq 2}">用于最后抵冲含税金额/期数</c:if>

											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.PLEDGE_WAY_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.PLEDGE_WAY_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.PLEDGE_WAY_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.PLEDGE_WAY_C  eq 1}">用于平均抵冲金额</c:if>
														<c:if test="${differenceMap.PLEDGE_WAY_C  eq 0}">用于期末退还金额</c:if>
														<c:if test="${differenceMap.PLEDGE_WAY_C  eq 2}">用于最后抵冲含税金额/期数</c:if>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												营业税比率：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.SALES_TAX_RATE_A }"  pattern="#0.00"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.SALES_TAX_RATE_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.SALES_TAX_RATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.SALES_TAX_RATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.SALES_TAX_RATE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.SALES_TAX_RATE_C }"  pattern="#0.00"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												营业税比率：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.SALES_TAX_RATE_A }"  pattern="#0.00"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.SALES_TAX_RATE_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.SALES_TAX_RATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.SALES_TAX_RATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.SALES_TAX_RATE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.SALES_TAX_RATE_C }"  pattern="#0.00"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												保险费比率：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.INSURE_BASE_RATE_A }"  pattern="#0.00"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.INSURE_BASE_RATE_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr"> 
												<c:choose>
													<c:when test="${differenceMap.INSURE_BASE_RATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.INSURE_BASE_RATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.INSURE_BASE_RATE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.INSURE_BASE_RATE_C }"  pattern="#0.00"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												管理费（每年）：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.MANAGEMENT_FEE_A }"  type="currency"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.MANAGEMENT_FEE_B }"  type="currency"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.MANAGEMENT_FEE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.MANAGEMENT_FEE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.MANAGEMENT_FEE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.MANAGEMENT_FEE_C }"  type="currency"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												差旅费 ：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.BUSINESS_TRIP_PRICE_A }"  type="currency"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.BUSINESS_TRIP_PRICE_B }"  type="currency"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.BUSINESS_TRIP_PRICE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.BUSINESS_TRIP_PRICE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.BUSINESS_TRIP_PRICE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.BUSINESS_TRIP_PRICE_C }"  type="currency"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												<!-- 利率上浮比率： -->
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<%-- <fmt:formatNumber value="${differenceMap.FLOAT_RATE_A }"  pattern="#0.00"/> --%>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.FLOAT_RATE_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.FLOAT_RATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.FLOAT_RATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.FLOAT_RATE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.FLOAT_RATE_C }"  pattern="#0.00"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												合同利率类型：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.YEAR_INTEREST_TYPE_A eq 1 }">固定</c:if>
												<c:if test="${differenceMap.YEAR_INTEREST_TYPE_A eq 2 }">浮动</c:if>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.YEAR_INTEREST_TYPE_B eq 1 }">固定</c:if>
												<c:if test="${differenceMap.YEAR_INTEREST_TYPE_B eq 2 }">浮动</c:if>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.YEAR_INTEREST_TYPE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.YEAR_INTEREST_TYPE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.YEAR_INTEREST_TYPE_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.YEAR_INTEREST_TYPE_C eq 1 }">固定</c:if>
														<c:if test="${differenceMap.YEAR_INTEREST_TYPE_C eq 2 }">浮动</c:if>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												合同利率比率：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.YEAR_INTEREST_A }"  pattern="#0.00"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.YEAR_INTEREST_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.YEAR_INTEREST_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.YEAR_INTEREST_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.YEAR_INTEREST_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.YEAR_INTEREST_C }"  pattern="#0.00"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												日罚息率类型：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.FINE_TYPE_A eq 1 }">单利</c:if>
												<c:if test="${differenceMap.FINE_TYPE_A eq 2 }">复利</c:if>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.FINE_TYPE_B eq 1 }">单利</c:if>
												<c:if test="${differenceMap.FINE_TYPE_B eq 2 }">复利</c:if>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.YEAR_INTEREST_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.YEAR_INTEREST_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.YEAR_INTEREST_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.FINE_TYPE_C eq 1 }">单利</c:if>
														<c:if test="${differenceMap.FINE_TYPE_C eq 2 }">复利</c:if>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												日罚息率比率：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.FINE_RATE_A }"  pattern="#0.00"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.FINE_RATE_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.FINE_RATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.FINE_RATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.FINE_RATE_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.FINE_RATE_C eq 1 }">单利</c:if>
														<c:if test="${differenceMap.FINE_RATE_C eq 2 }">复利</c:if>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												概算成本（RZE） ：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.LEASE_RZE_A }"  type="currency"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.LEASE_RZE_B }"  type="currency"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.LEASE_RZE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_RZE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.LEASE_RZE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.LEASE_RZE_C }"  type="currency"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												支付方式 ：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.PAY_WAY_A eq 11 }">期初等额本息支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_A eq 12 }">期初等额本金支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_A eq 13 }">期初不等额支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_A eq 21 }">期末等额本息支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_A eq 22 }">期末等额本金支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_A eq 23 }">期末不等额支付</c:if> 
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.PAY_WAY_B eq 11 }">期初等额本息支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_B eq 12 }">期初等额本金支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_B eq 13 }">期初不等额支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_B eq 21 }">期末等额本息支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_B eq 22 }">期末等额本金支付</c:if> 
												<c:if test="${differenceMap.PAY_WAY_B eq 23 }">期末不等额支付</c:if> 
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.PAY_WAY_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.PAY_WAY_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.PAY_WAY_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.PAY_WAY_C eq 11 }">期初等额本息支付</c:if> 
														<c:if test="${differenceMap.PAY_WAY_C eq 12 }">期初等额本金支付</c:if> 
														<c:if test="${differenceMap.PAY_WAY_C eq 13 }">期初不等额支付</c:if> 
														<c:if test="${differenceMap.PAY_WAY_C eq 21 }">期末等额本息支付</c:if> 
														<c:if test="${differenceMap.PAY_WAY_C eq 22 }">期末等额本金支付</c:if> 
														<c:if test="${differenceMap.PAY_WAY_C eq 23 }">期末不等额支付</c:if> 
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>			
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												起租日期 ：
											</td> 
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${differenceMap.START_DATE_A }"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${differenceMap.START_DATE_B }"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.START_DATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.START_DATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.START_DATE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatDate pattern="yyyy-MM-dd" value="${differenceMap.START_DATE_C }"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												租赁物件设置场所 ：
											</td> 
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.EQUPMENT_ADDRESS_A }
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.EQUPMENT_ADDRESS_B }
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.EQUPMENT_ADDRESS_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.EQUPMENT_ADDRESS_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.EQUPMENT_ADDRESS_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatDate pattern="yyyy-MM-dd" value="${differenceMap.EQUPMENT_ADDRESS_C }"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												租赁期满处理方式：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.DEAL_WAY_A eq 1 }">留购</c:if> 
												<c:if test="${differenceMap.DEAL_WAY_A eq 2 }">退还</c:if> 
												<c:if test="${differenceMap.DEAL_WAY_A eq 3 }">续租</c:if> 
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.DEAL_WAY_B eq 1 }">留购</c:if> 
												<c:if test="${differenceMap.DEAL_WAY_B eq 2 }">退还</c:if> 
												<c:if test="${differenceMap.DEAL_WAY_B eq 3 }">续租</c:if> 
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.EQUPMENT_ADDRESS_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.EQUPMENT_ADDRESS_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.EQUPMENT_ADDRESS_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.DEAL_WAY_C eq 1 }">留购</c:if> 
														<c:if test="${differenceMap.DEAL_WAY_C eq 2 }">退还</c:if> 
														<c:if test="${differenceMap.DEAL_WAY_C eq 3 }">续租</c:if> 
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>		
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												保险公司 ：
											</td> 
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.INCP_NAME_A }
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												${differenceMap.INCP_NAME_B }
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.INSURANCE_COMPANY_ID_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.INSURANCE_COMPANY_ID_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.INSURANCE_COMPANY_ID_STATUS eq 3 }">
														复核录入正确 :
														${differenceMap.INCP_NAME_C }
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>		
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												购买方式 ：
											</td> 
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.BUY_INSURANCE_WAY_A eq 1 }">自购</c:if>
												<c:if test="${differenceMap.BUY_INSURANCE_WAY_A eq 2 }">代购</c:if>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.BUY_INSURANCE_WAY_B eq 1 }">自购</c:if>
												<c:if test="${differenceMap.BUY_INSURANCE_WAY_B eq 2 }">代购</c:if>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.BUY_INSURANCE_WAY_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.BUY_INSURANCE_WAY_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.BUY_INSURANCE_WAY_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.BUY_INSURANCE_WAY_C eq 1 }">自购</c:if>
														<c:if test="${differenceMap.BUY_INSURANCE_WAY_C eq 2 }">代购</c:if>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												购买时间 ：
											</td> 
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.BUY_INSURANCE_TIME_A eq 1 }">全年购买</c:if>
												<c:if test="${differenceMap.BUY_INSURANCE_TIME_A eq 2 }">分年购买</c:if>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<c:if test="${differenceMap.BUY_INSURANCE_TIME_B eq 1 }">全年购买</c:if>
												<c:if test="${differenceMap.BUY_INSURANCE_TIME_B eq 2 }">分年购买</c:if>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.BUY_INSURANCE_TIME_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.BUY_INSURANCE_TIME_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.BUY_INSURANCE_TIME_STATUS eq 3 }">
														复核录入正确 :
														<c:if test="${differenceMap.BUY_INSURANCE_TIME_C eq 1 }">全年购买</c:if>
														<c:if test="${differenceMap.BUY_INSURANCE_TIME_C eq 2 }">分年购买</c:if>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
										<tr>
											<td style="background-color: #BCE3F0" class="ui-state-default ui-th-ltr zc_grid_head" height="26">
												保险返利比率：
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.INSURE_REBATE_RATE_A }"  pattern="#0.00"/>
											</td>
											<td 
												style="background: #EBEBEB; color: black;" class="ui-widget-content jqgrow ui-row-ltr">
												<fmt:formatNumber value="${differenceMap.INSURE_REBATE_RATE_B }"  pattern="#0.00"/>
											</td>
											<td style="background: #EBEBEB;" align="left" class="ui-widget-content jqgrow ui-row-ltr">
												<c:choose>
													<c:when test="${differenceMap.INSURE_REBATE_RATE_STATUS eq 1 }">
														A正确	
													</c:when>
													<c:when test="${differenceMap.INSURE_REBATE_RATE_STATUS eq 2 }">
														B正确	
													</c:when>
													<c:when test="${differenceMap.INSURE_REBATE_RATE_STATUS eq 3 }">
														复核录入正确 :
														<fmt:formatNumber value="${differenceMap.INSURE_REBATE_RATE_C }"  pattern="#0.00"/>
													</c:when>
													<c:otherwise>
														ALLRIGHT
													</c:otherwise>
												</c:choose>	
											</td>
										</tr>
									</table>
									<br />
										<table  width="98%" border="0" cellspacing="0" align="center"
										cellpadding="0" class="ui-jqgrid-htable zc_grid_title" bgcolor="#798d98" id="insure">
										<tr>
											<td align="left"  class="ui-state-default ui-th-ltr zc_grid_head" height="26" colspan="9">
												<strong>保险信息---复核比对</strong>
											</td>
										</tr> 
										<tr> 
											<td style="background: #EBEBEB;" align="left"  class="ui-widget-content jqgrow ui-row-ltr" height="26">
												<c:if test="${differenceMap.INSURE_STATUS eq 0}">
													无差异
												</c:if>
												<c:if test="${differenceMap.INSURE_STATUS eq 1}">
													A正确
												</c:if>
												<c:if test="${differenceMap.INSURE_STATUS eq 2}">
													B正确
												</c:if>
											</td>	  
										</tr>	
									</table>	 
									<br />
										<table  width="98%" border="0" cellspacing="0" align="center"
										cellpadding="0" class="ui-jqgrid-htable zc_grid_title" bgcolor="#798d98" id="otherprice">
										<tr>
											<td align="left"  class="ui-state-default ui-th-ltr zc_grid_head" height="26" colspan="9">
												<strong>其他费用---复核比对</strong>
											</td>
										</tr> 
										<tr>
											 <td style="background: #EBEBEB;" align="left"  class="ui-widget-content jqgrow ui-row-ltr" height="26">
												<c:if test="${differenceMap.INSURE_STATUS eq 0}">
													无差异
												</c:if>
												<c:if test="${differenceMap.INSURE_STATUS eq 1}">
													A正确
												</c:if>
												<c:if test="${differenceMap.INSURE_STATUS eq 2}">
													B正确
												</c:if>
											</td>	  
										</tr>	
									</table>	 
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
