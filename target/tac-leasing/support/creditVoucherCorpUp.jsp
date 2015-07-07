<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 法人 -->
 
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<c:forEach items="${corpList}" var="item" varStatus="status">
	<form action="../servlet/defaultDispatcher" method="post" id="upCropForm${status.index }">
	<input type="hidden" name="credit_id" value="${prcd_id }">
	<input type="hidden" name="showFlag" value="${showFlag }">
	<input type="hidden" name="pjccc_id" value="${item.PJCCC_ID }">
	<input type="hidden" name="VOUCH_TYPE" value="1">
	<input type="hidden" name="__action" value="creditVoucher.upCreditCorpForSupport" id="__action${status.index }">
	<div id="corps${status.index }">
	<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr>
			<td width="3%" rowspan="11" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
				担
				<br />
				保
				<br />
				人
				<br />
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
			<td width="13%" rowspan="2" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				单位名称
			</td>
			<td width="6%" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				中文：
			</td>
			<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="CORP_NAME_CN" id="CORP_NAME_CN${status.index }"
					value="${item.CORP_NAME_CN }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				职工人数：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="EMPLOYEE_COUNT" id="EMPLOYEE_COUNT${status.index }"
					value="${item.EMPLOYEE_COUNT }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isNumber(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				英文：
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="CORP_NAME_EN" 
					value="${item.CORP_NAME_EN }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				企业类型：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<input type="text" name="CORP_TYPE" id="CORP_TYPE"	value="${item.CORP_TYPE }"	style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			<!-- 
				<select name="CORP_TYPE" id="CORP_TYPE">
						<c:forEach items="${corpTypeList}" var="itemdd">
						<c:choose>
							<c:when test="${item.CORP_TYPE eq itemdd.CODE}">
								<option value="${itemdd.CODE }" selected="selected">${itemdd.FLAG }</option>
							</c:when>
							<c:otherwise>
								<option value="${itemdd.CODE }">${itemdd.FLAG }</option>
							</c:otherwise>
						</c:choose>
						</c:forEach>
				</select>
				 -->
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				营业执照注册号：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="BUSINESS_LICENCE_CODE"
					id="BUSINESS_LICENCE_CODE"
					value="${item.BUSINESS_LICENCE_CODE }"
					style="width: 230px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				营业期限：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="BUSINESS_TIME_LIMIT"
					id="BUSINESS_TIME_LIMIT"
					value="${item.BUSINESS_TIME_LIMIT }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				组织机构代码证号：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="ORGANIZATION_CODE_CERTIFICATE"
					id="ORGANIZATION_CODE_CERTIFICATE"
					value="${item.ORGANIZATION_CODE_CERTIFICATE }"
					style="width: 230px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				年检情况：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="ROAD_WORTHINESS_INSPECTION"
					id="ROAD_WORTHINESS_INSPECTION"
					value="${item.ROAD_WORTHINESS_INSPECTION }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				税务登记号：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="TAX_REGISTRATION_NUMBER"
					id="TAX_REGISTRATION_NUMBER"
					value="${item.TAX_REGISTRATION_NUMBER }"
					style="width: 230px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				成立日期：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="INCORPORATING_DATE"
					id="INCORPORATING_DATE${status.index }"
					value="<fmt:formatDate value="${item.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/> "
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				注册资本(千元)：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="REGISTERED_CAPITAL"
					id="REGISTERED_CAPITAL${status.index }"
					value="${item.REGISTERED_CAPITAL }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isDouble(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				实收资本(千元)：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="CONTRIBUTED_CAPITAL"
					id="CONTRIBUTED_CAPITAL${status.index }"
					value="${item.CONTRIBUTED_CAPITAL }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				公司注册地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="REGISTERED_OFFICE_ADDRESS"
					id="REGISTERED_OFFICE_ADDRESS${status.index }"
					value="${item.REGISTERED_OFFICE_ADDRESS }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				经营范围：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="MANAGING_SCOPE" id="MANAGING_SCOPE"
					value="${item.MANAGING_SCOPE }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				公司电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="TELEPHONE" id="TELEPHONE${status.index }"
					value="${item.TELEPHONE }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				传真：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="FAX" id="FAX${status.index }"
					value="${item.FAX }" style="width: 200px;"
					class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				网址：
			</td>
			<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="URL" id="URL"
					value="${item.URL }" style="width: 200px;"
					class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				邮编：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="POSTCODE" id="POSTCODE${status.index }"
					value="${item.POSTCODE }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td height="80" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				备注：
			</td>
			<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<c:choose>
					<c:when test="${empty item}">
						<textarea name="MEMO" id="MEMO"
							style="width: 700px; height: 60px; font-size: 14px"
							class="txtk"
							onFocus="this.className='txtklan';selectContent(this);"
							onBlur="lnOut(this);this.className='txtk'"></textarea>
					</c:when>
					<c:otherwise> 
							<textarea name="MEMO" id="MEMO"
								style="width: 500px; height: 50px; font-size: 14px"
								class="txtk"
								onFocus="this.className='txtklan';selectContent(this);"
								onBlur="lnOut(this);this.className='txtk'">${item.MEMO}</textarea>
					 </c:otherwise>
				</c:choose>
			</td>
		</tr>
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
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				法定代表人：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LEGAL_PERSON" id="LEGAL_PERSON${status.index }"
					value="${item.LEGAL_PERSON }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
				<span class="red">*</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="flagPermit" onchange="changeType3(this.value,${status.index });">
					<c:forEach items="${natuTypeList}" var="items">
						<c:choose>
							<c:when test="${items.CODE eq item.FLAGPERMIT}">
								<option value="${items.CODE }" selected='selected'>${items.FLAG }</option>
							</c:when>
							<c:otherwise>
								<option value="${items.CODE }">${items.FLAG }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
			<td colspan="3" id="corpdiv0${status.index }" <c:if test="${item.FLAGPERMIT ne 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="hidden" name="LEGAL_ID_CARD" id="LEGAL_ID_CARD_Crop${status.index }" <c:if test="${item.FLAGPERMIT eq 0}">value="${item.LEGAL_ID_CARD }"</c:if>>
			</td>
			<td colspan="3" id="corpdiv1${status.index }" <c:if test="${item.FLAGPERMIT eq 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="otherPermit" id="otherPermit${status.index }" <c:if test="${item.FLAGPERMIT ne 0}">value="${item.LEGAL_ID_CARD }"</c:if>>
			</td>
				
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				办公电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LEGAL_TELEPHONE" id="LEGAL_TELEPHONE${status.index }"
					value="${item.LEGAL_TELEPHONE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				邮编：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LEGAL_POSTCODE" id="LEGAL_POSTCODE${status.index }"
					value="${item.LEGAL_POSTCODE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				常住地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LEGAL_HOME_ADDRESS"
					id="LEGAL_HOME_ADDRESS"
					value="${item.LEGAL_HOME_ADDRESS }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				手机号码：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LEGAL_MOBILE_NUMBER1"
					id="LEGAL_MOBILE_NUMBER1${status.index }"
					value="${item.LEGAL_MOBILE_NUMBER1 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				手机号码2：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LEGAL_MOBILE_NUMBER2"
					id="LEGAL_MOBILE_NUMBER2${status.index }"
					value="${item.LEGAL_MOBILE_NUMBER2 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
			</td>
		</tr>
		<!-- <tr>
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
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				实际经营者：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="NAME" id="NAME"
					value="${trueContact.NAME }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
				<span class="red">*</span>    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				 <select id="CARD_FLAG" name="CARD_FLAG" onchange="">
					<c:forEach items="${natuTypeList}" var="items">
						<c:choose>
							<c:when test="${items.CODE eq trueContact.CARD_FLAG}">
								<option value="${items.CODE }" selected='selected'>${items.FLAG }</option>
							</c:when>
							<c:otherwise>
								<option value="${items.CODE }">${items.FLAG }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr"   <c:if test=""> style="display:none"  </c:if>     >
				  <input type="hidden" style="width: 200px;" name="CARD_ID" id="CARD_ID1" value="" >  
			</td>
			
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				办公电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="TELEPHONE" id="TELEPHONE"
					value="${trueContact.TELEPHONE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);isPhone(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				邮编：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="POSTCODE" id="POSTCODE"
					value="${trueContact.POSTCODE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				常住地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="ADDRESS"
					id="ADDRESS"
					value="${trueContact.ADDRESS }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				手机号码：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="PHONE1"
					id="PHONE1"
					value="${trueContact.PHONE1 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				手机号码2：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="PHONE2"
					id="PHONE2"
					value="${trueContact.PHONE2 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				EMAIL：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="EMAIL" id="EMAIL"
					value="${trueContact.EMAIL }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				MSN：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="MSN" id="MSN"
					value="${trueContact.MSN }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
			</td>
		</tr> -->
		<tr>
			<td rowspan="5" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
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
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				联系人姓名
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_MAN" id="LINK_MAN"
					value="${item.LINK_MAN }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'" />
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="linkflagPermit" onchange="changeType4(this.value,${status.index });">
					<c:forEach items="${natuTypeList}" var="items">
						<c:choose>
							<c:when test="${items.CODE eq item.LINKFLAGPERMIT}">
								<option value="${items.CODE }" selected='selected'>${items.FLAG }</option>
							</c:when>
							<c:otherwise>
								<option value="${items.CODE }">${items.FLAG }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
			
			<td colspan="3" id="custcorpdiv0${status.index }" <c:if test="${item.LINKFLAGPERMIT ne 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="hidden" name="LINK_ID_CARD" id="LINK_ID_CARD_Crop${status.index }" <c:if test="${item.LINKFLAGPERMIT eq 0}">value="${item.LINK_ID_CARD }"</c:if>>
			</td>
			<td colspan="3" id="custcorpdiv1${status.index }" <c:if test="${item.LINKFLAGPERMIT eq 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="linkPermit" id="linkPermit${status.index }" <c:if test="${item.LINKFLAGPERMIT ne 0}">value="${item.LINK_ID_CARD }"</c:if>>
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				办公电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_TELEPHONE" id="LINK_TELEPHONE${status.index }"
					value="${item.LINK_TELEPHONE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				职务：
			</td>
			<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_JOB" id="LINK_JOB"
					value="${item.LINK_JOB }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				邮编：
			</td>
			<td width="21%"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_POSTCODE" id="LINK_POSTCODE${status.index }"
					value="${item.LINK_POSTCODE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				邮寄地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_MAILING_ADDRESS"
					id="LINK_MAILING_ADDRESS"
					value="${item.LINK_MAILING_ADDRESS }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				手机号码：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_MOBILE_NUMBER1"
					id="LINK_MOBILE_NUMBER1${status.index }"
					value="${item.LINK_MOBILE_NUMBER1 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				手机号码2：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_MOBILE_NUMBER2"
					id="LINK_MOBILE_NUMBER2${status.index }"
					value="${item.LINK_MOBILE_NUMBER2 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				EMAIL:
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_EMAIL" id="LINK_EMAIL"
					value="${item.LINK_EMAIL }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				MSN：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<input type="text" name="LINK_MSN" id="LINK_MSN"
					value="${item.LINK_MSN }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
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
			<td colspan="7"  class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<c:choose>
					<c:when test="${empty item}">
						<textarea name="OTHER_INFO" id="OTHER_INFO"
							style="width: 700px; height: 60px; font-size: 14px"
							class="txtk"
							onFocus="this.className='txtklan';selectContent(this);"
							onBlur="lnOut(this);this.className='txtk'"></textarea>
					</c:when>
					<c:otherwise>
						<textarea name="OTHER_INFO" id="OTHER_INFO"
							style="width: 700px; height: 60px; font-size: 14px"
							class="txtk"
							onFocus="this.className='txtklan';selectContent(this);"
							onBlur="lnOut(this);this.className='txtk'">${item.OTHER_INFO}</textarea>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	<c:forEach items="${list}" var="items" varStatus="statu">
		<c:if test="${status.index == statu.index}">
			<c:set var="corpBankAccount" value="${items.bankAccountList}"></c:set>
			<c:set var="corpSharholder" value="${items.shareholderList}"></c:set>
			<c:set var="corpProject" value="${items.projectList}"></c:set>
			<c:set var="creditPriorProject" value="${items.creditPriorProject}"></c:set>
<!--  		<c:set var="v1" value="${items.v1}"></c:set>
			<c:set var="v2" value="${items.v2}"></c:set>
			<c:set var="v3" value="${items.v3}"></c:set>
			<c:set var="v4" value="${items.v4}"></c:set>
			<c:set var="v5" value="${items.v5}"></c:set>     baiman- 财务信息-->
			<%@ include file="../credit/creditCorpInfoCreatesUp.jsp"%>
			<%@ include file="../credit/creditPriorRecordsCreatesUp.jsp"%>
			<br/>
		    </c:if>
		   
				
			
			
				
			
		
	</c:forEach>
	
	
	<center>
		<input type="button" class="ui-state-default ui-corner-all" value="保存" onclick="upCorp(${status.index });"></input>
		<input type="button" value="删除" onclick="delCorp('corps${status.index }','${item.PJCCC_ID }');" class="ui-state-default ui-corner-all">
	</center>
	</div>
	</form>
	</c:forEach>
	</div>
	</div>
