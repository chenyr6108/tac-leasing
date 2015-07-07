<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 法人 -->
 	<script type="text/javascript">
		function showFile(num){
			var dis = $("#file_show_" + num).css("display");
			if(dis == "none"){
				$("#file_show_" + num).css("display", "block");
			}
			if(dis == "block"){
				$("#file_show_" + num).css("display", "none");
			}
		}
		
		function downloadImg(img_path, img_name){
    		$("#img_action").val("creditPriorRecordsVip.downloadImg");
    		$("#img_path").val(img_path);
    		$("#img_name").val(img_name);
    		$("#imgForm").submit();
    	}
		
		function deleteImg(file_id, num){
			if(confirm("确定要删除附件吗？")){
				$.post("${ctx }/servlet/defaultDispatcher?__action=creditVoucherVip.deleteVoucherReportFile",
						{"file_id" : file_id},
						function (data){
							if(data){
								$("#file_tr_" + num).hide();
							} else {
								alert("操作失败。");
							}
						}, "json");
			}
		}
	</script>
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<form name="imgForm" id="imgForm" method="post" action="${ctx }/servlet/defaultDispatcher">
		<input type="hidden" name="img_path" id="img_path"/>
		<input type="hidden" name="img_name" id="img_name"/>
		<input type="hidden" id="img_action" name="__action" value="creditPriorRecordsVip.downloadImg" />
	</form>
	<c:forEach items="${corpList}" var="item" varStatus="status">
	<form action="../servlet/defaultDispatcher?__action=creditVoucherVip.upCreditCorp" method="post" id="upCropForm${status.index }" enctype="multipart/form-data">
	<input type="hidden" name="credit_id" value="${prcd_id }">
	<input type="hidden" name="showFlag" value="${showFlag }">
	<input type="hidden" name="pjccc_id" value="${item.PJCCC_ID }">
	<input type="hidden" name="VOUCH_TYPE" value="1">
	<input type="hidden" name="delete_id_${status.index }"/>
	<div id="corps${status.index }">
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr>
			<td width="3%" rowspan="11" class="ui-state-default ui-th-ltr zc_grid_head">
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
			<td width="13%" rowspan="2" class="ui-widget-content jqgrow ui-row-ltr">
				单位名称
			</td>
			<td width="6%" class="ui-widget-content jqgrow ui-row-ltr">
				中文：
			</td>
			<td width="26%"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CORP_NAME_CN" id="CORP_NAME_CN${status.index }"
					value="${item.CORP_NAME_CN }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td width="13%"  class="ui-widget-content jqgrow ui-row-ltr">
				职工人数：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="EMPLOYEE_COUNT" id="EMPLOYEE_COUNT${status.index }"
					value="${item.EMPLOYEE_COUNT }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isNumber(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				英文：
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CORP_NAME_EN" 
					value="${item.CORP_NAME_EN }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				企业类型：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
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
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				营业执照注册号：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="BUSINESS_LICENCE_CODE"
					id="BUSINESS_LICENCE_CODE"
					value="${item.BUSINESS_LICENCE_CODE }"
					style="width: 230px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				营业期限：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="BUSINESS_TIME_LIMIT"
					id="BUSINESS_TIME_LIMIT"
					value="${item.BUSINESS_TIME_LIMIT }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				组织机构代码证号：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ORGANIZATION_CODE_CERTIFICATE"
					id="ORGANIZATION_CODE_CERTIFICATE"
					value="${item.ORGANIZATION_CODE_CERTIFICATE }"
					style="width: 230px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				年检情况：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ROAD_WORTHINESS_INSPECTION"
					id="ROAD_WORTHINESS_INSPECTION"
					value="${item.ROAD_WORTHINESS_INSPECTION }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				税务登记号：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TAX_REGISTRATION_NUMBER"
					id="TAX_REGISTRATION_NUMBER"
					value="${item.TAX_REGISTRATION_NUMBER }"
					style="width: 230px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				成立日期：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="INCORPORATING_DATE"
					id="INCORPORATING_DATE${status.index }"
					value="<fmt:formatDate value="${item.INCORPORATING_DATE }" pattern="yyyy-MM-dd"/> "
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				注册资本(千元)：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="REGISTERED_CAPITAL"
					id="REGISTERED_CAPITAL${status.index }"
					value="${item.REGISTERED_CAPITAL }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isDouble(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				实收资本(千元)：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="CONTRIBUTED_CAPITAL"
					id="CONTRIBUTED_CAPITAL${status.index }"
					value="${item.CONTRIBUTED_CAPITAL }"
					style="width: 100px" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				公司注册地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
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
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				经营范围：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="MANAGING_SCOPE" id="MANAGING_SCOPE"
					value="${item.MANAGING_SCOPE }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				公司电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TELEPHONE" id="TELEPHONE${status.index }"
					value="${item.TELEPHONE }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				传真：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="FAX" id="FAX${status.index }"
					value="${item.FAX }" style="width: 200px;"
					class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				网址：
			</td>
			<td colspan="2" class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="URL" id="URL"
					value="${item.URL }" style="width: 200px;"
					class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td style="text-align: center" class="ui-widget-content jqgrow ui-row-ltr">
				邮编：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="POSTCODE" id="POSTCODE${status.index }"
					value="${item.POSTCODE }"
					style="width: 200px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td height="80" class="ui-widget-content jqgrow ui-row-ltr">
				备注：
			</td>
			<td colspan="6" class="ui-widget-content jqgrow ui-row-ltr">
				<c:choose>
					<c:when test="${empty item}">
						<textarea name="MEMO" id="MEMO"
							style="width: 700px; height: 60px; font-size: 12px"
							class="txtk"
							onFocus="this.className='txtklan';selectContent(this);"
							onBlur="lnOut(this);this.className='txtk'"></textarea>
					</c:when>
					<c:otherwise> 
							<textarea name="MEMO" id="MEMO"
								style="width: 500px; height: 50px; font-size: 12px"
								class="txtk"
								onFocus="this.className='txtklan';selectContent(this);"
								onBlur="lnOut(this);this.className='txtk'">${item.MEMO}</textarea>
					 </c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td rowspan="4" class="ui-state-default ui-th-ltr zc_grid_head">
				法
				<br />
				人
				<br />
				代
				<br />
				表
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				法定代表人：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LEGAL_PERSON" id="LEGAL_PERSON${status.index }"
					value="${item.LEGAL_PERSON }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
				<span class="red">*</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
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
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				办公电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LEGAL_TELEPHONE" id="LEGAL_TELEPHONE${status.index }"
					value="${item.LEGAL_TELEPHONE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				邮编：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LEGAL_POSTCODE" id="LEGAL_POSTCODE${status.index }"
					value="${item.LEGAL_POSTCODE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				常住地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LEGAL_HOME_ADDRESS"
					id="LEGAL_HOME_ADDRESS"
					value="${item.LEGAL_HOME_ADDRESS }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				手机号码：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LEGAL_MOBILE_NUMBER1"
					id="LEGAL_MOBILE_NUMBER1${status.index }"
					value="${item.LEGAL_MOBILE_NUMBER1 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				手机号码2：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LEGAL_MOBILE_NUMBER2"
					id="LEGAL_MOBILE_NUMBER2${status.index }"
					value="${item.LEGAL_MOBILE_NUMBER2 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
			</td>
		</tr>
		<!-- <tr>
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
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				实际经营者：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="NAME" id="NAME"
					value="${trueContact.NAME }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'" />
				<span class="red">*</span>    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
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
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				办公电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="TELEPHONE" id="TELEPHONE"
					value="${trueContact.TELEPHONE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);isPhone(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				邮编：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="POSTCODE" id="POSTCODE"
					value="${trueContact.POSTCODE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				常住地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="ADDRESS"
					id="ADDRESS"
					value="${trueContact.ADDRESS }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				手机号码：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PHONE1"
					id="PHONE1"
					value="${trueContact.PHONE1 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'">
				<span class="red">*</span>
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				手机号码2：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="PHONE2"
					id="PHONE2"
					value="${trueContact.PHONE2 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);mobileTels(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				EMAIL：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="EMAIL" id="EMAIL"
					value="${trueContact.EMAIL }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				MSN：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="MSN" id="MSN"
					value="${trueContact.MSN }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);valueIsNotNull(this);this.className='txtk'">
			</td>
		</tr> -->
		<tr>
			<td rowspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
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
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				联系人姓名
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_MAN" id="LINK_MAN"
					value="${item.LINK_MAN }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'" />
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
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
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				办公电话：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_TELEPHONE" id="LINK_TELEPHONE${status.index }"
					value="${item.LINK_TELEPHONE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPhone(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				职务：
			</td>
			<td width="15%"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_JOB" id="LINK_JOB"
					value="${item.LINK_JOB }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td width="6%"  class="ui-widget-content jqgrow ui-row-ltr">
				邮编：
			</td>
			<td width="21%"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_POSTCODE" id="LINK_POSTCODE${status.index }"
					value="${item.LINK_POSTCODE }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);isPostCode(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				邮寄地址：
			</td>
			<td colspan="6"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_MAILING_ADDRESS"
					id="LINK_MAILING_ADDRESS"
					value="${item.LINK_MAILING_ADDRESS }"
					style="width: 650px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				手机号码：
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_MOBILE_NUMBER1"
					id="LINK_MOBILE_NUMBER1${status.index }"
					value="${item.LINK_MOBILE_NUMBER1 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
			</td>
			<td  class="ui-widget-content jqgrow ui-row-ltr">
				手机号码2：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_MOBILE_NUMBER2"
					id="LINK_MOBILE_NUMBER2${status.index }"
					value="${item.LINK_MOBILE_NUMBER2 }"
					style="width: 100px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);mobileTels(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				EMAIL:
			</td>
			<td colspan="2"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_EMAIL" id="LINK_EMAIL"
					value="${item.LINK_EMAIL }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				MSN：
			</td>
			<td colspan="3"  class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="LINK_MSN" id="LINK_MSN"
					value="${item.LINK_MSN }"
					style="width: 150px;" class="txtk"
					onFocus="this.className='txtklan';selectContent(this);"
					onBlur="lnOut(this);this.className='txtk'">
			</td>
		</tr>
		<tr>
			<td class="ui-state-default ui-th-ltr zc_grid_head">
				其
				<br />
				他
				<br />
				信
				<br />
				息
			</td>
			<td colspan="7"  class="ui-widget-content jqgrow ui-row-ltr">
				<c:choose>
					<c:when test="${empty item}">
						<textarea name="OTHER_INFO" id="OTHER_INFO"
							style="width: 700px; height: 60px; font-size: 12px"
							class="txtk"
							onFocus="this.className='txtklan';selectContent(this);"
							onBlur="lnOut(this);this.className='txtk'"></textarea>
					</c:when>
					<c:otherwise>
						<textarea name="OTHER_INFO" id="OTHER_INFO"
							style="width: 700px; height: 60px; font-size: 12px"
							class="txtk"
							onFocus="this.className='txtklan';selectContent(this);"
							onBlur="lnOut(this);this.className='txtk'">${item.OTHER_INFO}</textarea>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	
	
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<!-- 财务报表文件  -->
		<tr class="ui-jqgrid-labels">
			<th colspan="6" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left;">
				<strong>财务报表</strong>
			</th>
		</tr>
		<c:forEach items="${item.fileList }" var="file" varStatus="index">
			<tr class="ui-jqgrid-labels" id="file_tr_${index.count }">
				<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
					附件${index.count }：
					<a href="javascript:void(0);" onclick="showFile('${index.count }');">${file.FILE_NAME_STR}</a>
					&nbsp;&nbsp;
					<a href="javascript:void(0);" onclick="downloadImg('${fn:replace(file.FILE_PATH, '\\', '/')}', '${file.FILE_NAME_STR}');">
						<img src="${ctx }/images/attach.jpg" title="下载"/>下载</a>
					&nbsp;
					<a href="javascript:void(0);" onclick="deleteImg('${file.ID}', '${index.count }');">
						<img src="${ctx }/images/u103.gif" title="删除" />删除</a>
				</td>
			</tr>
			<tr class="ui-jqgrid-labels" id="file_show_${index.count }" style="display: none;">
				<c:choose>
					<c:when test="${file.FILE_TYPE eq 'jpg' or file.FILE_TYPE eq 'jpeg' or file.FILE_TYPE eq 'gif' or file.FILE_TYPE eq 'png' }">
						<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
							<div style="text-align: center; max-width: 600px;" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
								<img src="${ctx }/showImg?file_name=${file.FILE_PATH}" alt="财报" style="max-width: 800px;">
							</div>
						</td>
					</c:when>
					<c:otherwise>
						<th align="center" class="ui-widget-content jqgrow ui-row-ltr" style="width: 100%; text-align: center;">
							<br/>
								<font color="red">无预览。</font>
							<br/>
						</th>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
		<tr class="ui-jqgrid-labels">
			<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
				上传文件：<input type="file" name="upLoadFile1" size="40" style="height: 25px;"/>重命名：<input type="text" name="upLoadFile1_name"/>
			</td>
		</tr>
		<tr class="ui-jqgrid-labels">
			<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
				上传文件：<input type="file" name="upLoadFile2" size="40" style="height: 25px;"/>重命名：<input type="text" name="upLoadFile2_name"/>
			</td>
		</tr>
		<tr class="ui-jqgrid-labels">
			<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: left;">
				上传文件：<input type="file" name="upLoadFile3" size="40" style="height: 25px;"/>重命名：<input type="text" name="upLoadFile3_name"/>
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
			<%@ include file="creditCorpInfoCreatesUp.jsp"%>
			<%-- <%@ include file="creditPriorRecordsCreatesUp.jsp"%> --%>
			<br/>
		    </c:if>
		   
				
			
			
				
			
		
	</c:forEach>
	
	
	<center>
		<input type="button" class="ui-state-default ui-corner-all" value="提交" onclick="upCorp(${status.index });"></input>
		<input type="button" value="删除" onclick="delCorp('corps${status.index }','${item.PJCCC_ID }');" class="ui-state-default ui-corner-all">
	</center>
	</div>
	</form>
	</c:forEach>
	</div>
	</div>
