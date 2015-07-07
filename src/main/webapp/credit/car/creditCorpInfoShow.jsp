<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<title>尽职调查报告</title>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/tab.css">
		 
		<link rel="stylesheet" type="text/css"
			href="${ctx }/common/css/navy.css"> 
	</head>

	<body>
		<form action="../servlet/defaultDispatcher" name="corpForm" id="corpForm"
			method="post">
			<input type="hidden" name="isSalesDesk" id="isSalesDesk" value="${isSalesDesk }">
			<input type="hidden" name="__action"
				value="creditCustomerCorp.createOrUpdateCreditCustomerCorp">
			<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<input type="hidden" name="creditCustomerCorp_id"
				value="${creditCustomerCorpMap.PJCCC_ID }">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="background-color: white;">
			<div class="zc_grid_body jqgrowleft" style="background-color: white;">
			<div style="background-color: white;">
			<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td width="100%" height="26">
						  <strong   style="color : #015798;font-size: 14px">基本承租人信息</strong> 
					</td>
				</tr>
				<tr>
					<td width="100%" style="font-size: 14px;">
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td width="3%" rowspan="14" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
									法
									<br />
									人
									<br />
									基
									<br />
									本
									<br />
									信
									<br />
									息
								</td>
								<td width="13%" rowspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									单位名称
								</td>
								<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									中文：
								</td>
								<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.CORP_NAME_CN } &nbsp;
								</td>
								<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									职工人数：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.EMPLOYEE_COUNT }  &nbsp;
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									英文：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.CORP_NAME_EN } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									企业类型：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								<%-- ${creditCustomerCorpMap.CORP_TYPE } --%>
								
									<c:forEach items="${corpTypeList}" var="item">
													<c:if test="${item.CODE eq creditCustomerCorpMap.CORP_TYPE}">
														${item.FLAG }
													</c:if> 
													
									</c:forEach>  &nbsp; 
								</td>
							</tr>
							<!-- 2012/04/23 Yang Yun 增加是否上市，经营者在本业的经验（年）**********************  -->
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									本业从业经验：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 0 or empty creditCustomerCorpMap.EXPERIENCE}">0~5年</c:if>
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 5}">5(含)~10年</c:if>
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 10}">10(含)~15年</c:if>
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 15}">15(含)及以上</c:if>&nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									是否上市：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										<c:if test="${creditCustomerCorpMap.ISLISTED eq 'N' or empty creditCustomerCorpMap.ISLISTED}">否</c:if>
										<c:if test="${creditCustomerCorpMap.ISLISTED eq 'Y'}">是</c:if>&nbsp;
								</td>
							</tr>
							<!-- ***************************************************************************** -->
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									营业执照注册号：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.BUSINESS_LICENCE_CODE } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									营业期限：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.BUSINESS_TIME_LIMIT } &nbsp;
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									组织机构代码证号：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.ORGANIZATION_CODE_CERTIFICATE } &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									年检情况：
								</td>
								<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.ROAD_WORTHINESS_INSPECTION } &nbsp;
								</td>
							</tr>
							<tr>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									税务编号：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.TAX_CODE } &nbsp;
								</td>
							</tr>
							<tr>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									税务登记号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.TAX_REGISTRATION_NUMBER } &nbsp;
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									成立日期：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<fmt:formatDate value="${creditCustomerCorpMap.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/>
								 &nbsp;</td>
							</tr>
							<tr>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									注册资本(千元)：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.REGISTERED_CAPITAL }
									千元,货币：<select disabled="disabled">
									<c:forEach var="currency" items="${currencys }">
										<option value="${currency.CODE }" <c:if test="${creditCustomerCorpMap.REGISTERED_CAPITAL_CURRENCY eq  currency.CODE }">selected</c:if>>${currency.FLAG }</option>
									</c:forEach>
								</select>	
									
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									实收资本(千元)：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.CONTRIBUTED_CAPITAL } 
									千元,货币：<select disabled="disabled">
									<c:forEach var="currency" items="${currencys }">
										<option value="${currency.CODE }" <c:if test="${creditCustomerCorpMap.CONTRIBUTED_CAPITAL_CURRENCY eq  currency.CODE }">selected</c:if>>${currency.FLAG }</option>
									</c:forEach>
									</select>	
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									公司注册地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.REGISTERED_OFFICE_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									公司常用地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								${creditCustomerCorpMap.COMMON_OFFICE_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									经营范围：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.MANAGING_SCOPE } &nbsp;
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									营业概况：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<pre>${creditCustomerCorpMap.BUSINESS_SURVEY }</pre>&nbsp;
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									公司电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.TELEPHONE } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									传真：
								</td>
								<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.FAX } &nbsp;
								</td>
							</tr>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									网址：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.URL } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									邮编：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.POSTCODE } &nbsp;
								</td>
							</tr>
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
									沿革说明
								</td>
								<td colspan="7" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<pre>${creditCustomerCorpMap.MEMO} &nbsp;</pre>
								</td>
							</tr>
							<tr><td colspan="8">
			<table width="980px" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="industrialTable">
			<tr>
				<td style="text-align: left;height: 24px;" class="ui-state-default ui-th-ltr zc_grid_head" colspan="4">
					<b style="font-size: 14px;">&nbsp;&nbsp;主要产品</b>
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center;width: 220px;">
					产品
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center">
					内销比例
				</td>
			 
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center">
					外销比例
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;text-align: center">
					营收比重
				</td>
			</tr>
			<c:forEach items="${productionList }" var="item">
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						${item.PRODUCTION_NAME }
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						${item.INNER_INVERSE }%
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						${item.EXTERNAL_INVERSE }%
					</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
						${item.GAIN_INVERSE }%
					</td>
				</tr>
			</c:forEach>
		</table>
		<br><br><br>
		</td></tr>
							<tr>
								<td rowspan="4" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
									法
									<br />
									人
									<br />
									代
									<br />
									表
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									法定代表人：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.LEGAL_PERSON } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 <c:if test="${empty creditCustomerCorpMap.LEGAL_IDCARD_FLAG  }">身份证</c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 0}">身份证  </c:if>   
									<c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 1}">港澳台通行证  </c:if>   
									<c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 2}">护照  </c:if>  
									<c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 3}">其他证件 </c:if>   
								
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 <c:if test="${empty creditCustomerCorpMap.LEGAL_IDCARD_FLAG  }"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 0}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 1}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									  <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 2}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 3}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }  </c:if>    
								&nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									办公电话：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.LEGAL_TELEPHONE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									邮编：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.LEGAL_POSTCODE } &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									常住地址：
								</td>
								<td colspan="6"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.LEGAL_HOME_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									手机号码：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.LEGAL_MOBILE_NUMBER1 } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									手机号码2：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.LEGAL_MOBILE_NUMBER2 } &nbsp;
								</td>
							</tr>
							<tr>
								<td rowspan="5" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
									实
									<br />
									际
									<br />
									经
									<br />
									营
									<br />
									者
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									实际经营者：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.NAME } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 <c:if test="${empty trueContact.CARD_FLAG  }">身份证</c:if>   
									 <c:if test="${trueContact.CARD_FLAG eq 0}">身份证  </c:if>   
									<c:if test="${trueContact.CARD_FLAG eq 1}">港澳台通行证  </c:if>  
									<c:if test="${trueContact.CARD_FLAG eq 2}">护照  </c:if> 
									<c:if test="${trueContact.CARD_FLAG eq 3}">其他证件 </c:if>
									
								
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									  ${trueContact.CARD_ID }   
								&nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									办公电话：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.TELEPHONE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									邮编：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.POSTCODE } &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									常住地址：
								</td>
								<td colspan="6"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.ADDRESS } &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									手机号码：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.PHONE1 } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									手机号码2：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.PHONE2 } &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									EMAIL：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.EMAIL } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									MSN：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${trueContact.MSN } &nbsp;
								</td>
							</tr>
							<tr>
								<td rowspan="5"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
									联
									<br />
									系
									<br />
									人
									<br />
									信
									<br />
									息
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									联系人姓名： 
								</td>
<%--2011/12/21 Yang Yun Update to get default link man. Start--%>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<%--${creditCustomerCorpMap.LINK_MAN } &nbsp;--%>
									${linkMan.LINK_NAME } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									身份证号：
									<%-- <c:if test="${empty creditCustomerCorpMap.LINK_IDCARD_FLAG  }"> 身份证 </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 0}">  身份证  </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 1}">  港澳台通行证 </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 2}">  护照 </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 3}">  其他证件 </c:if>	 --%>
								
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 <%-- <c:if test="${empty creditCustomerCorpMap.LINK_IDCARD_FLAG  }"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 0}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 1}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if> 
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 2}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if>    
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 3}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if> --%>
									 ${linkMan.LINK_IDCARD }    
							 &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									办公电话：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<%--${creditCustomerCorpMap.LINK_MAN } &nbsp;--%>
									${linkMan.LINK_PHONE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									职务：
								</td>
								<td width="15%"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<%--${creditCustomerCorpMap.LINK_JOB } &nbsp;--%>
									${linkMan.LINK_DUTY } &nbsp;
								</td>
								<td width="6%"     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									邮编：
								</td>
								<td width="21%"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<%--${creditCustomerCorpMap.LINK_POSTCODE } &nbsp;--%>
									${linkMan.LINK_ZIP} &nbsp;
								</td>
							</tr> 
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									邮寄地址：
								</td>
								<td colspan="6"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<%--${creditCustomerCorpMap.LINK_MAILING_ADDRESS } &nbsp;--%>
									${linkMan.LINK_WORK_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									手机号码：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<%--${creditCustomerCorpMap.LINK_MOBILE_NUMBER1 } &nbsp;--%>
									${linkMan.LINK_MOBILE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									手机号码2：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								${creditCustomerCorpMap.LINK_MOBILE_NUMBER2 } &nbsp;
								</td>
							</tr>
							<tr>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									EMAIL：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<%--${creditCustomerCorpMap.LINK_EMAIL } &nbsp;--%>
									${linkMan.LINK_EMAIL }  &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									MSN：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									${creditCustomerCorpMap.LINK_MSN } &nbsp;
								</td>
							</tr>
<%--2011/12/21 Yang Yun Update to get default link man. Start--%>
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
									其
									<br />
									他
									<br />
									信
									<br />
									息
								</td>
								<td colspan="7"   class="ui-widget-content jqgrow ui-row-ltr">
									<pre style="font-size: 14px;">${creditCustomerCorpMap.OTHER_INFO} &nbsp;</pre>
								</td>
							</tr>
						</table></c:if>
							<c:if test="${creditMap.CUST_TYPE eq 0 }"><table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">  
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" width="13%" style="font-size: 14px;">
									承租人姓名：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" width="35%" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_NAME } ${creditCustomerCorpMap.CORP_NAME_CN } &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" width="13%" style="font-size: 14px;">
									 性别：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.SEX }${creditCustomerCorpMap.NATU_GENDER } &nbsp;
								</td>
								
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 1 }">身份证号码</c:if>
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 2 }">港澳台通行证</c:if>
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 3 }">护照</c:if>
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 4 }">其他</c:if>：
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
								 ${creditCustomerCorpMap.NATU_IDCARD}&nbsp;</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									年龄：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_AGE }${creditCustomerCorpMap.AGE }&nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									家庭电话：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_PHONE }${creditCustomerCorpMap.HOME_PHONE } &nbsp;
									
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									手机：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_MOBILE }${creditCustomerCorpMap.MOBILE_PHONE } &nbsp;
									
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									传真：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.FAX }${creditCustomerCorpMap.NATU_FAX } &nbsp;
									
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									邮编：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_ZIP } &nbsp;
										 
									
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									家庭住址：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_HOME_ADDRESS }${creditCustomerCorpMap.HOME_ADDR } &nbsp;
								</td>
							</tr>
					 
					  
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									工作单位：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_WORK_UNITS }${creditCustomerCorpMap.WORK_UNIT } 
										 &nbsp;
								</td>
							</tr>
					 
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									配偶姓名：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_MATE_NAME }${creditCustomerCorpMap.MATE_NAME } &nbsp;
										 
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									年龄：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.MATE_AGE } &nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									身份证号码：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									  ${creditCustomerCorpMap.NATU_MATE_IDCARD }${creditCustomerCorpMap.MATE_IDCARD }&nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									联系电话：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.NATU_MATE_MOBILE }${creditCustomerCorpMap.MATE_MOBILE }  
										  &nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									工作单位：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									
									${creditCustomerCorpMap.NATU_MATE_WORK_UNITS }${creditCustomerCorpMap.MATE_WORK_UNIT}
										  &nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									联系人：
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${creditCustomerCorpMap.LINK_NAME }${creditCustomerCorpMap.NATU_LINKMAN} 
										 	 &nbsp;
								</td>
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									联系人电话：
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 ${creditCustomerCorpMap.LINK_MOBILE }${creditCustomerCorpMap.LINKMAN_PHONE} 
										 &nbsp;
								</td>
							</tr>
					 </table>
					 </c:if> 
					</td>
				</tr>
				<tr>
					<td width="100%">
					<br><br>
						<table width="100%" id="bankTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" height="26" style="font-size: 14px;">开户银行</td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;"> 
									&nbsp; 
								</td>
		
							</tr>
							<c:if test="${empty corpBankAccount}">
								<tr>
									<td width="13%"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										基本账户
										<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
											style="width: 150px;">
									</td>
									<td width="10%"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										开户银行：
									</td>
									<td width="27%"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 
									&nbsp;
									</td>
									<td width="11%"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										账号：
									</td>
									<td colspan="3"       class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									&nbsp;
									</td>
								</tr>
							</c:if>
							<c:if test="${not empty corpBankAccount}">
								<c:forEach items="${corpBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr>
											<td width="13%"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
												基本账户
												<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
													style="width: 150px;" value="${item.PCCBA_ID }">
											</td>
											<td width="10%"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
												开户银行：
											</td>
											<td width="27%"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
												 ${item.BANK_NAME } 
											</td>
											<td width="11%"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
												账号：
											</td>
											<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
												 ${item.BANK_ACCOUNT } 
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(corpBankAccount) >1}">
								<tr>
									<td rowspan="${fn:length(corpBankAccount)}" id="bankTd"      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										其他账户
									</td>
								</tr>
							</c:if>
							<c:forEach items="${corpBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr>
										<td      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											 开户银行：
										</td>
										<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											 ${item.BANK_NAME } 
										</td>
										<td      class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											账号：
										</td>
										<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
											 ${item.BANK_ACCOUNT } 
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
					<br><br>
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table width="100%" id="shareholderTab" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td colspan="5" height="26" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong style="font-size: 14px;">公司股东及份额</strong>
								</td>
								<td width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
									 &nbsp; 
								</td>
								<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head"> 
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="3%"    class="ui-widget-content jqgrow ui-row-ltr" align="center">
									<input type="checkbox" name="checkbox4" id="checkbox4" disabled="disabled">
								</td>
								<td width="23%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									股东名称：
								</td>
								<td width="15%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									出资情况（千元）：
								</td>
								<td width="18%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									出资方式：
								</td>
								<td width="12%"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									股权比例：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									备注：
								</td>
							</tr>
							<c:set value="0" var="total"></c:set>
							<c:forEach items="${corpSharholder}" var="item">
								<tr>
									<td align="center"   class="ui-widget-content jqgrow ui-row-ltr">
										<input type="checkbox" name="scheck_id" id="scheck_id0" disabled="disabled">
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 ${item.HOLDER_NAME } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 ${item.HOLDER_CAPITAL } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 ${item.HOLDER_WAY } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 ${item.HOLDER_RATE }% &nbsp;
									</td>
									<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 ${item.HOLDER_MOME } &nbsp;
									</td>
								</tr>
								<c:set value="${item.HOLDER_CAPITAL+total }" var="total"></c:set>
							</c:forEach>
							<tr>
								<td colspan="5"    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									合计：<fmt:formatNumber value="${total}" type="currency" />
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
							</tr>
						</table></c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }"><table  cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab2">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong style="font-size: 14px;">家庭其他成员及亲戚情况说明：（包含个人工作学习单位、电话等）</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									 
									&nbsp;
									 
								</td>
								 
							</tr>
							<tr>
								<td width="8%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">亲属姓名</strong>
								</td>
								<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">与承租人关系</strong>
								</td>
								<td width="15%"class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">联系方式</strong>
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">家庭住址</strong>
								</td>
								<td width="16%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">备注</strong>
								</td>
							</tr>
							<c:forEach items="${natufam}" var="item">
								<tr > 
									<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">   ${item.FAM_NAME } 	&nbsp;</td>
									<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">  ${item.FAM_RELATION } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">   ${item.FAM_LINK } 	&nbsp;</td>
									<td    class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">   ${item.FAM_ADDR } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">    ${item.REMARK } 	&nbsp;</td>
								
								</tr>
							</c:forEach>
						</table></c:if>
					</td>
				</tr>
				<tr>
					<td width="100%">
					<br><br>
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table width="100%" id="projectTab" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<strong style="font-size: 14px;">公司成立、历次变动的情况</strong>
								</td>
								<td width="81%" >
									<table cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
										<tr >
											<td   class="ui-widget-content jqgrow ui-row-ltr"> 
												&nbsp; 
											</td>
											<td    class="ui-widget-content jqgrow ui-row-ltr"> 
												&nbsp; 
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<c:forEach items="${corpProject}" var="item" varStatus="status">
								<tr>
									<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
										<input type="checkbox" name="pcheck_id" id="pcheck_id0" disabled="disabled"
											value="${status.count }">
										项目名称：
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 ${item.PROJECT_NAME } &nbsp;
									</td>
								</tr>
								<tr>
									<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
										  起止时间： 
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
									 ${item.PROJECT_DATE } &nbsp;
									</td>
								</tr>
								<tr>
									<td width="19%" height="50" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
										&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：
										 
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
										 <pre>${item.PROJECT_CONTENT }</pre> &nbsp;
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td align="center" colspan="2">
									<%-- <input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 拿财务报表
									onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCorpReportsForShow&credit_id=${creditMap.ID }&showFlag=2&showStatus=1&commit_flag=${commit_flag}&examineFlag=${examineFlag}'"/> --%>
								<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
					onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCreditPriorRecordsForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}&showFlag=2&isSalesDesk=${isSalesDesk }'"/>
								</td>
							</tr>
						</table></c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }"><table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab3">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong style="font-size: 14px;">社会关系情况说明：（包含个人身份、工作单位、电话等）</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									&nbsp;
								</td>
	
							</tr>
							<tr>
								<td width="9%"  class="ui-widget-content jqgrow ui-row-ltr">
									 <strong  style="color : #015798;font-size: 14px;">姓名</strong>
								</td>
								<td width="30%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">工作单位</strong>
								</td>
								<td  width="12%" class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">职务</strong>
								</td>
								<td width="18%"class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798;font-size: 14px;">联系方式</strong>
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									<strong style="color : #015798;font-size: 14px;">备注</strong>
								</td>
							
							</tr>
							<c:forEach items="${natusoc}" var="item">
								<tr > 
									<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">    ${item.SOCI_NAME } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">    ${item.SOCI_WORK } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 	 ${item.SOCI_POSITION }	&nbsp; </td>
									<td   class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 	 ${item.SOCI_LINK } 	&nbsp;</td>
									<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 	  ${item.SOCI_REMARK } 	&nbsp;</td>
								</tr> 
							</c:forEach>
							</table>
							<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" >
							<tr> 
								<td align="center" colspan="2">
									<%-- <input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
									onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCreditPriorRecordsForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}'"/> --%>
									<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
					onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecords.getCreditPriorRecordsForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}&showFlag=2&isSalesDesk=${isSalesDesk }'"/>
								</td>
							</tr>
						</table></c:if>
					</td>
				</tr>
			</table>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
