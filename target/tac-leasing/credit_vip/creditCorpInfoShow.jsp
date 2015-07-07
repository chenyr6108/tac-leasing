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
			<input type="hidden" name="__action"
				value="creditCustomerCorpVip.createOrUpdateCreditCustomerCorp">
			<input type="hidden" name="credit_id" value="${creditMap.ID }">
			<input type="hidden" name="creditCustomerCorp_id"
				value="${creditCustomerCorpMap.PJCCC_ID }">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
			<div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr>
					<td width="100%" height="26" class="ui-jqgrid-htable zc_grid_title">
						  <strong   style="color : #015798">基本承租人信息</strong> 
					</td>
				</tr>
				<tr>
					<td width="100%" class="ui-jqgrid-labels">
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<td width="3%" rowspan="13" class="ui-state-default ui-th-ltr zc_grid_head">
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
								<td width="13%" rowspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									单位名称
								</td>
								<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr">
									中文：
								</td>
								<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr" >
									${creditCustomerCorpMap.CORP_NAME_CN } &nbsp;
								</td>
								<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
									职工人数：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.EMPLOYEE_COUNT }  &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									英文：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.CORP_NAME_EN } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									企业类型：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
								<%-- ${creditCustomerCorpMap.CORP_TYPE } --%>
								
									<c:forEach items="${corpTypeList}" var="item">
													<c:if test="${item.CODE eq creditCustomerCorpMap.CORP_TYPE}">
														${item.FLAG }
													</c:if> 
													
									</c:forEach>  &nbsp; 
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									本业从业经验：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 0 or empty creditCustomerCorpMap.EXPERIENCE}">0~5年</c:if>
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 5}">5(含)~10年</c:if>
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 10}">10(含)~15年</c:if>
										<c:if test="${creditCustomerCorpMap.EXPERIENCE eq 15}">15(含)及以上</c:if>&nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									是否上市：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
										<c:if test="${creditCustomerCorpMap.ISLISTED eq 'N' or empty creditCustomerCorpMap.ISLISTED}">否</c:if>
										<c:if test="${creditCustomerCorpMap.ISLISTED eq 'Y'}">是</c:if>&nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									营业执照注册号：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.BUSINESS_LICENCE_CODE } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									营业期限：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.BUSINESS_TIME_LIMIT } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									组织机构代码证号：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.ORGANIZATION_CODE_CERTIFICATE } &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									年检情况：
								</td>
								<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.ROAD_WORTHINESS_INSPECTION } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									税务编号：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.TAX_CODE } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									税务登记号：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.TAX_REGISTRATION_NUMBER } &nbsp;
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									成立日期：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									<fmt:formatDate value="${creditCustomerCorpMap.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/>
								 &nbsp;</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									注册资本(千元)：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.REGISTERED_CAPITAL } &nbsp;
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
									实收资本(千元)：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.CONTRIBUTED_CAPITAL } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td class="ui-widget-content jqgrow ui-row-ltr">
									公司注册地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.REGISTERED_OFFICE_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									公司常用地址：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
								${creditCustomerCorpMap.COMMON_OFFICE_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									经营范围：
								</td>
								<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.MANAGING_SCOPE } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td class="ui-widget-content jqgrow ui-row-ltr">
									公司电话：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.TELEPHONE } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									传真：
								</td>
								<td colspan="3" class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.FAX } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td class="ui-widget-content jqgrow ui-row-ltr">
									网址：
								</td>
								<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.URL } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.POSTCODE } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td height="80" class="ui-widget-content jqgrow ui-row-ltr">
									备注：
								</td>
								<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr">
									<pre>${creditCustomerCorpMap.MEMO} &nbsp;</pre>
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td rowspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									法
									<br />
									人
									<br />
									代
									<br />
									表
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									法定代表人：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.LEGAL_PERSON } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
										 <c:if test="${empty creditCustomerCorpMap.LEGAL_IDCARD_FLAG  }">身份证</c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 0}">身份证  </c:if>   
									<c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 1}">港澳台通行证  </c:if>   
									<c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 2}">护照  </c:if>  
									<c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 3}">其他证件 </c:if>   
								
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
										 <c:if test="${empty creditCustomerCorpMap.LEGAL_IDCARD_FLAG  }"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 0}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 1}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									  <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 2}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LEGAL_IDCARD_FLAG eq 3}"> ${creditCustomerCorpMap.LEGAL_ID_CARD }  </c:if>    
								&nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.LEGAL_TELEPHONE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.LEGAL_POSTCODE } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									常住地址：
								</td>
								<td colspan="6"    class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.LEGAL_HOME_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.LEGAL_MOBILE_NUMBER1 } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.LEGAL_MOBILE_NUMBER2 } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td rowspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
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
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									实际经营者：
								</td>
								<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.NAME } &nbsp;
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									 <c:if test="${empty trueContact.CARD_FLAG  }">身份证</c:if>   
									 <c:if test="${trueContact.CARD_FLAG eq 0}">身份证  </c:if>   
									<c:if test="${trueContact.CARD_FLAG eq 1}">港澳台通行证  </c:if>  
									<c:if test="${trueContact.CARD_FLAG eq 2}">护照  </c:if> 
									<c:if test="${trueContact.CARD_FLAG eq 3}">其他证件 </c:if>
									
								
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									  ${trueContact.CARD_ID }   
								&nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.TELEPHONE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.POSTCODE } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									常住地址：
								</td>
								<td colspan="6"    class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.ADDRESS } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.PHONE1 } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.PHONE2 } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									EMAIL：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.EMAIL } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									MSN：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									${trueContact.MSN } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td rowspan="5"  class="ui-state-default ui-th-ltr zc_grid_head">
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
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									联系人姓名： 
								</td>
<%--2011/12/21 Yang Yun Update to get default link man. Start--%>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									<%--${creditCustomerCorpMap.LINK_MAN } &nbsp;--%>
									${linkMan.LINK_NAME } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									身份证号：
									<%-- <c:if test="${empty creditCustomerCorpMap.LINK_IDCARD_FLAG  }"> 身份证 </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 0}">  身份证  </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 1}">  港澳台通行证 </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 2}">  护照 </c:if>	
								<c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 3}">  其他证件 </c:if>	 --%>
								
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									 <%-- <c:if test="${empty creditCustomerCorpMap.LINK_IDCARD_FLAG  }"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 0}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if>   
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 1}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if> 
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 2}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if>    
									 <c:if test="${creditCustomerCorpMap.LINK_IDCARD_FLAG eq 3}"> ${creditCustomerCorpMap.LINK_ID_CARD }   </c:if> --%>
									 ${linkMan.LINK_IDCARD }    
							 &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									办公电话：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									<%--${creditCustomerCorpMap.LINK_MAN } &nbsp;--%>
									${linkMan.LINK_PHONE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									职务：
								</td>
								<td width="15%"   class="ui-widget-content jqgrow ui-row-ltr">
									<%--${creditCustomerCorpMap.LINK_JOB } &nbsp;--%>
									${linkMan.LINK_DUTY } &nbsp;
								</td>
								<td width="6%"     class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td width="21%"   class="ui-widget-content jqgrow ui-row-ltr">
									<%--${creditCustomerCorpMap.LINK_POSTCODE } &nbsp;--%>
									${linkMan.LINK_ZIP} &nbsp;
								</td>
							</tr> 
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									邮寄地址：
								</td>
								<td colspan="6"   class="ui-widget-content jqgrow ui-row-ltr">
									<%--${creditCustomerCorpMap.LINK_MAILING_ADDRESS } &nbsp;--%>
									${linkMan.LINK_WORK_ADDRESS } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									手机号码：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									<%--${creditCustomerCorpMap.LINK_MOBILE_NUMBER1 } &nbsp;--%>
									${linkMan.LINK_MOBILE } &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									手机号码2：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
								${creditCustomerCorpMap.LINK_MOBILE_NUMBER2 } &nbsp;
								</td>
							</tr>
							<tr class="ui-jqgrid-labels">
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									EMAIL：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									<%--${creditCustomerCorpMap.LINK_EMAIL } &nbsp;--%>
									${linkMan.LINK_EMAIL }  &nbsp;
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									MSN：
								</td>
								<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
									${creditCustomerCorpMap.LINK_MSN } &nbsp;
								</td>
							</tr>
<%--2011/12/21 Yang Yun Update to get default link man. Start--%>
							<tr class="ui-jqgrid-labels">
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									其
									<br />
									他
									<br />
									信
									<br />
									息
								</td>
								<td colspan="7"   class="ui-widget-content jqgrow ui-row-ltr">
									<pre>${creditCustomerCorpMap.OTHER_INFO} &nbsp;</pre>
								</td>
							</tr>
						</table></c:if>
							<c:if test="${creditMap.CUST_TYPE eq 0 }"><table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">  
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr" width="13%" >
									承租人姓名：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr" width="35%">
									 ${creditCustomerCorpMap.NATU_NAME } ${creditCustomerCorpMap.CORP_NAME_CN } &nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" width="13%" >
									 性别：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.SEX }${creditCustomerCorpMap.NATU_GENDER } &nbsp;
								</td>
								
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 1 }">身份证号码</c:if>
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 2 }">港澳台通行证</c:if>
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 3 }">护照</c:if>
									<c:if test="${creditCustomerCorpMap.ID_CARD_TYPE eq 4 }">其他</c:if>：
								</td>
								<td class="ui-widget-content jqgrow ui-row-ltr">
								 ${creditCustomerCorpMap.NATU_IDCARD}&nbsp;</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									年龄：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_AGE }${creditCustomerCorpMap.AGE }&nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									家庭电话：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_PHONE }${creditCustomerCorpMap.HOME_PHONE } &nbsp;
									
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									手机：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_MOBILE }${creditCustomerCorpMap.MOBILE_PHONE } &nbsp;
									
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									传真：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.FAX }${creditCustomerCorpMap.NATU_FAX } &nbsp;
									
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									邮编：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_ZIP } &nbsp;
										 
									
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									家庭住址：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_HOME_ADDRESS }${creditCustomerCorpMap.HOME_ADDR } &nbsp;
								</td>
							</tr>
					 
					  
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									工作单位：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_WORK_UNITS }${creditCustomerCorpMap.WORK_UNIT } 
										 &nbsp;
								</td>
							</tr>
					 
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									配偶姓名：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_MATE_NAME }${creditCustomerCorpMap.MATE_NAME } &nbsp;
										 
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									年龄：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.MATE_AGE } &nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									身份证号码：
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr" >
									  ${creditCustomerCorpMap.NATU_MATE_IDCARD }${creditCustomerCorpMap.MATE_IDCARD }&nbsp;
								</td>
								<td  class="ui-widget-content jqgrow ui-row-ltr">
									联系电话：
								</td>
								<td    class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.NATU_MATE_MOBILE }${creditCustomerCorpMap.MATE_MOBILE }  
										  &nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									工作单位：
								</td>
								<td  colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
									
									${creditCustomerCorpMap.NATU_MATE_WORK_UNITS }${creditCustomerCorpMap.MATE_WORK_UNIT}
										  &nbsp;
								</td>
							</tr>
					 	<tr>	
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									联系人：
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
									 ${creditCustomerCorpMap.LINK_NAME }${creditCustomerCorpMap.NATU_LINKMAN} 
										 	 &nbsp;
								</td>
					 		<td  class="ui-widget-content jqgrow ui-row-ltr">
									联系人电话：
								</td>
								<td     class="ui-widget-content jqgrow ui-row-ltr">
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
						<table width="100%" id="bankTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head" height="26">开户银行</td>
								<td width="18%" class="ui-state-default ui-th-ltr zc_grid_head"> 
									&nbsp; 
								</td>
		
							</tr>
							<c:if test="${empty corpBankAccount}">
								<tr>
									<td width="13%"      class="ui-widget-content jqgrow ui-row-ltr">
										基本账户
										<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
											style="width: 150px;">
									</td>
									<td width="10%"      class="ui-widget-content jqgrow ui-row-ltr">
										开户银行：
									</td>
									<td width="27%"      class="ui-widget-content jqgrow ui-row-ltr"> 
									&nbsp;
									</td>
									<td width="11%"      class="ui-widget-content jqgrow ui-row-ltr">
										账号：
									</td>
									<td colspan="3"       class="ui-widget-content jqgrow ui-row-ltr" >
									&nbsp;
									</td>
								</tr>
							</c:if>
							<c:if test="${not empty corpBankAccount}">
								<c:forEach items="${corpBankAccount}" var="item">
									<c:if test="${item.STATE eq 0}">
										<tr>
											<td width="13%"      class="ui-widget-content jqgrow ui-row-ltr">
												基本账户
												<input type="hidden" name="B_PCCBA_ID" id="B_PCCBA_ID"
													style="width: 150px;" value="${item.PCCBA_ID }">
											</td>
											<td width="10%"      class="ui-widget-content jqgrow ui-row-ltr">
												开户银行：
											</td>
											<td width="27%"   class="ui-widget-content jqgrow ui-row-ltr">
												 ${item.BANK_NAME } 
											</td>
											<td width="11%"      class="ui-widget-content jqgrow ui-row-ltr">
												账号：
											</td>
											<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
												 ${item.BANK_ACCOUNT } 
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(corpBankAccount) >1}">
								<tr>
									<td rowspan="${fn:length(corpBankAccount)}" id="bankTd"      class="ui-widget-content jqgrow ui-row-ltr">
										其他账户
									</td>
								</tr>
							</c:if>
							<c:forEach items="${corpBankAccount}" var="item">
								<c:if test="${item.STATE eq 1}">
									<tr>
										<td      class="ui-widget-content jqgrow ui-row-ltr">
											 开户银行：
										</td>
										<td   class="ui-widget-content jqgrow ui-row-ltr">
											 ${item.BANK_NAME } 
										</td>
										<td      class="ui-widget-content jqgrow ui-row-ltr">
											账号：
										</td>
										<td colspan="3"   class="ui-widget-content jqgrow ui-row-ltr">
											 ${item.BANK_ACCOUNT } 
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table width="100%" id="shareholderTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td colspan="5" height="26" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司股东及份额</strong>
								</td>
								<td width="16%" class="ui-state-default ui-th-ltr zc_grid_head">
									 &nbsp; 
								</td>
								<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head"> 
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="3%"    class="ui-widget-content jqgrow ui-row-ltr">
									<input type="checkbox" name="checkbox4" id="checkbox4" disabled="disabled">
								</td>
								<td width="23%"    class="ui-widget-content jqgrow ui-row-ltr">
									股东名称：
								</td>
								<td width="15%"    class="ui-widget-content jqgrow ui-row-ltr">
									出资情况（千元）：
								</td>
								<td width="18%"    class="ui-widget-content jqgrow ui-row-ltr">
									出资方式：
								</td>
								<td width="12%"    class="ui-widget-content jqgrow ui-row-ltr">
									股权比例：
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									备注：
								</td>
							</tr>
							<c:set value="0" var="total"></c:set>
							<c:forEach items="${corpSharholder}" var="item">
								<tr>
									<td align="center"   class="ui-widget-content jqgrow ui-row-ltr">
										<input type="checkbox" name="scheck_id" id="scheck_id0" disabled="disabled">
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${item.HOLDER_NAME } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${item.HOLDER_CAPITAL } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${item.HOLDER_WAY } &nbsp;
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${item.HOLDER_RATE }% &nbsp;
									</td>
									<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
										 ${item.HOLDER_MOME } &nbsp;
									</td>
								</tr>
								<c:set value="${item.HOLDER_CAPITAL+total }" var="total"></c:set>
							</c:forEach>
							<tr>
								<td colspan="5"    class="ui-widget-content jqgrow ui-row-ltr">
									合计：<fmt:formatNumber value="${total}" type="currency" />
								</td>
								<td colspan="2"   class="ui-widget-content jqgrow ui-row-ltr">
									&nbsp;
								</td>
							</tr>
						</table></c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }"><table  cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab2">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>家庭其他成员及亲戚情况说明：（包含个人工作学习单位、电话等）</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									 
									&nbsp;
									 
								</td>
								 
							</tr>
							<tr>
								<td width="8%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">亲属姓名</strong>
								</td>
								<td width="10%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">与承租人关系</strong>
								</td>
								<td width="15%"class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">联系方式</strong>
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">家庭住址</strong>
								</td>
								<td width="16%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">备注</strong>
								</td>
							</tr>
							<c:forEach items="${natufam}" var="item">
								<tr > 
									<td     class="ui-widget-content jqgrow ui-row-ltr">   ${item.FAM_NAME } 	&nbsp;</td>
									<td    class="ui-widget-content jqgrow ui-row-ltr">  ${item.FAM_RELATION } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr">   ${item.FAM_LINK } 	&nbsp;</td>
									<td    class="ui-widget-content jqgrow ui-row-ltr">   ${item.FAM_ADDR } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr">    ${item.REMARK } 	&nbsp;</td>
								
								</tr>
							</c:forEach>
						</table></c:if>
					</td>
				</tr>
				<tr>
					<td width="100%">
						<c:if test="${creditMap.CUST_TYPE eq 1 }"><table width="100%" id="projectTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>公司成立、历次变动的情况</strong>
								</td>
								<td width="81%" >
									<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" align="right">
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
									<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head">
										<input type="checkbox" name="pcheck_id" id="pcheck_id0" disabled="disabled"
											value="${status.count }">
										项目名称：
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${item.PROJECT_NAME } &nbsp;
									</td>
								</tr>
								<tr>
									<td width="19%" class="ui-state-default ui-th-ltr zc_grid_head">
										  起止时间： 
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
									 ${item.PROJECT_DATE } &nbsp;
									</td>
								</tr>
								<tr>
									<td width="19%" height="50" class="ui-state-default ui-th-ltr zc_grid_head">
										&nbsp;&nbsp;&nbsp; 内&nbsp; &nbsp;容：
										 
									</td>
									<td   class="ui-widget-content jqgrow ui-row-ltr">
										 ${item.PROJECT_CONTENT } &nbsp;
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td align="center" colspan="2">
									<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
									onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecordsVip.getCorpReportsForShow&credit_id=${creditMap.ID }&showFlag=2&showStatus=1&commit_flag=${commit_flag}&examineFlag=${examineFlag}'"/>
								</td>
							</tr>
						</table></c:if>
						<c:if test="${creditMap.CUST_TYPE eq 0 }"><table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="shareholderTab3">
							<tr>
								<td colspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>社会关系情况说明：（包含个人身份、工作单位、电话等）</strong>
								</td>
								<td width="16%"  class="ui-state-default ui-th-ltr zc_grid_head">
									&nbsp;
								</td>
	
							</tr>
							<tr>
								<td width="9%"  class="ui-widget-content jqgrow ui-row-ltr">
									 <strong  style="color : #015798">姓名</strong>
								</td>
								<td width="30%"  class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">工作单位</strong>
								</td>
								<td  width="12%" class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">职务</strong>
								</td>
								<td width="18%"class="ui-widget-content jqgrow ui-row-ltr">
									<strong  style="color : #015798">联系方式</strong>
								</td>
								<td   class="ui-widget-content jqgrow ui-row-ltr">
									<strong style="color : #015798">备注</strong>
								</td>
							
							</tr>
							<c:forEach items="${natusoc}" var="item">
								<tr > 
									<td     class="ui-widget-content jqgrow ui-row-ltr">    ${item.SOCI_NAME } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr">    ${item.SOCI_WORK } 	&nbsp;</td>
									<td     class="ui-widget-content jqgrow ui-row-ltr"> 	 ${item.SOCI_POSITION }	&nbsp; </td>
									<td   class="ui-widget-content jqgrow ui-row-ltr"> 	 ${item.SOCI_LINK } 	&nbsp;</td>
									<td  class="ui-widget-content jqgrow ui-row-ltr"> 	  ${item.SOCI_REMARK } 	&nbsp;</td>
								</tr> 
							</c:forEach>
							</table>
							<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
							<tr> 
								<td align="center" colspan="2">
									<input type="button" name="sub" value="下一页" class="ui-state-default ui-corner-all" 
									onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditPriorRecordsVip.getCorpReportsForShow&credit_id=${creditMap.ID }&examineFlag=${examineFlag}&commit_flag=${commit_flag}'"/>
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
