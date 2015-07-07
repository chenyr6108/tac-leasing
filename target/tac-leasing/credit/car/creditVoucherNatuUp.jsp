<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 自然人 -->
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<c:forEach items="${natuList}" var="item" varStatus="status">
	<form action="../servlet/defaultDispatcher?__action=creditVoucher.UpCreditNatu" method="post" id="upNatuForm${status.index }">
	<input type="hidden" name="credit_id" value="${prcd_id }">
	<input type="hidden" name="showFlag" value="${showFlag }">
	<input type="hidden" name="pron_id" value="${item.PRON_ID }">
	<input type="hidden" name="VOUCH_TYPE" value="0">
	<table width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id='natu${status.index }'>
		<tr>
			<th class="ui-state-default ui-th-ltr zc_grid_head" rowspan="100" width="4%" style="font-size: 14px;">自<br>然<br>人<br>担<br>保<br></th>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td width="13%" style="font-size: 14px;">担保人姓名&nbsp;&nbsp;<font color="red">*</font></td>
			<td style="font-size: 14px;"><input type="text" name="cust_name" id="natu_name${status.index }" value="${item.CUST_NAME }"></td>
			<td width="13%" style="font-size: 14px;">性别</td>
			<td style="font-size: 14px;"><input type="text" name="natu_gender" id="natu_gender${status.index }" value="${item.NATU_GENDER }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">年龄</td>
			<td style="font-size: 14px;"><input type="text" name="natu_age" id="natu_age${status.index }" value="${item.NATU_AGE }"></td>
			<td style="font-size: 14px;">邮编</td>
			<td style="font-size: 14px;"><input type="text" name="natu_zip" id="natu_zip${status.index }" value="${item.NATU_ZIP }"></td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="flagPermit" onchange="changeType(this.value,${status.index });">
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
				<font color="red">*</font>
			</td>
			
			<td id="natudiv0${status.index }" <c:if test="${item.FLAGPERMIT ne 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="hidden" name="natu_idcard" id="natu_idcard${status.index }" <c:if test="${item.FLAGPERMIT eq 0}">value="${item.NATU_IDCARD }"</c:if>>
			</td>
			<td id="natudiv1${status.index }" <c:if test="${item.FLAGPERMIT eq 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="otherPermit" id="otherPermitZ${status.index }" <c:if test="${item.FLAGPERMIT ne 0}">value="${item.NATU_IDCARD }"</c:if>>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">家庭电话</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"><input type="text" name="natu_phone" id="natu_phone${status.index }" value="${item.NATU_PHONE }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">开户银行</td>
			<td style="font-size: 14px;"><input type="text" name="open_bank" id="natu_open_bank${status.index }" value="${item.OPEN_BANK }"></td>
			<td style="font-size: 14px;">银行帐号</td>
			<td style="font-size: 14px;"><input type="text" name="bank_accounts" id="natu_bank_accounts${status.index }" value="${item.BANK_ACCOUNTS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">手机号码&nbsp;&nbsp;<font color="red">*</font></td>
			<td style="font-size: 14px;"><input type="text" name="natu_mobile" id="natu_mobile${status.index }" value="${item.NATU_MOBILE }"></td>
			<td style="font-size: 14px;">传真</td>
			<td style="font-size: 14px;"><input type="text" name="natu_fax" id="natu_fax${status.index }" value="${item.NATU_FAX }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">家庭地址</td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="natu_home_address" id="natu_home_address${status.index }" value="${item.NATU_HOME_ADDRESS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">身份证地址</td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="natu_idcard_address" id="natu_idcard${status.index }" value="${item.NATU_IDCARD_ADDRESS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">工作单位</td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="natu_work_units" id="natu_work_units${status.index }" value="${item.NATU_WORK_UNITS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">单位地址</td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="natu_work_address" id="natu_work_address${status.index }" value="${item.NATU_WORK_ADDRESS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶姓名</td>
			<td style="font-size: 14px;"><input type="text" name="natu_mate_name" id="natu_mate_name${status.index }" value="${item.NATU_MATE_NAME }"></td>
			<td style="font-size: 14px;">配偶性别</td>
			<td style="font-size: 14px;"><input type="text" name="natu_mate_gender" id="natu_mate_gender${status.index }" value="${item.NATU_MATE_GENDER }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶年龄</td>
			<td style="font-size: 14px;"><input type="text" name="natu_mate_age" id="natu_mate_age${status.index }" value="${item.NATU_MATE_AGE }"></td>
			<td style="font-size: 14px;">配偶邮编</td>
			<td style="font-size: 14px;"><input type="text" name="natu_mate_zip" id="natu_mate_zip${status.index }" value="${item.NATU_MATE_ZIP }"></td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<select name="mate_flag_permit" onchange="changeMateType(this.value,${status.index });">
					<c:forEach items="${natuTypeList}" var="items">
						<c:choose>
							<c:when test="${items.CODE eq item.MATE_FLAG_PERMIT}">
								<option value="${items.CODE }" selected='selected'>${items.FLAG }</option>
							</c:when>
							<c:otherwise>
								<option value="${items.CODE }">${items.FLAG }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
			<td id="natuMatediv0${status.index }" <c:if test="${item.MATE_FLAG_PERMIT ne 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="hidden" name="natu_mate_idcard" id="natu_mate_idcard${status.index }" <c:if test="${item.MATE_FLAG_PERMIT eq 0}">value="${item.NATU_MATE_IDCARD }"</c:if>>
			</td>
			<td id="natuMatediv1${status.index }" <c:if test="${item.MATE_FLAG_PERMIT eq 0}">style="display: none;"</c:if> class="ui-widget-content jqgrow ui-row-ltr">
				<input type="text" name="mate_other_permit" id="mate_other_permit${status.index }" <c:if test="${item.MATE_FLAG_PERMIT ne 0}">value="${item.NATU_MATE_IDCARD }"</c:if>>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">配偶家庭电话</td>
			<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"><input type="text" name="natu_mate_phone" id="natu_mate_phone${status.index }" value="${item.NATU_MATE_PHONE }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶开户银行</td>
			<td style="font-size: 14px;"><input type="text" name="open_mate_bank" id="open_mate_bank${status.index }" value="${item.OPEN_MATE_BANK }"></td>
			<td style="font-size: 14px;">配偶银行帐号</td>
			<td style="font-size: 14px;"><input type="text" name="bank_accounts_mate" id="bank_accounts_mate${status.index }" value="${item.BANK_ACCOUNTS_MATE }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶手机号码</td>
			<td style="font-size: 14px;"><input type="text" name="natu_mate_mobile" id="natu_mate_mobile${status.index }" value="${item.NATU_MATE_MOBILE }"></td>
			<td style="font-size: 14px;">配偶传真</td>
			<td style="font-size: 14px;"><input type="text" name="natu_mate_fax" id="natu_mate_fax${status.index }" value="${item.NATU_MATE_FAX }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶家庭地址</td>
			<td style="font-size: 14px;"><input type="text" style="width: 500" name="natu_mate_home_address" id="natu_mate_home_address${status.index }" value="${item.NATU_MATE_HOME_ADDRESS }"></td>
			<td style="font-size: 14px;">是否联合担保</td>
			<td style="font-size: 14px;"><input type="radio" name="istogether" value="1" <c:if test="${item.ISTOGETHER == 1 }">checked="checked"</c:if>>是<input type="radio" name="istogether" value="0"  <c:if test="${item.ISTOGETHER == 0 }">checked="checked"</c:if>>否</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶身份证地址</td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="natu_mate_idcard_address" id="natu_mate_idcard${status.index }" value="${item.NATU_MATE_IDCARD_ADDRESS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶工作单位</td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="natu_mate_work_units" id="natu_mate_work_units${status.index }" value="${item.NATU_MATE_WORK_UNITS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">配偶单位地址</td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="natu_mate_work_address" id="natu_mate_work_address${status.index }" value="${item.NATU_MATE_WORK_ADDRESS }"></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			<td style="font-size: 14px;">备注 </td>
			<td colspan="3" style="font-size: 14px;"><input type="text" style="width: 500" name="remark" id="remark${status.index }" value="${item.REMARK }"></td>
		</tr>
		<tr>
			<td colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
				<strong style="font-size: 14px;">名下资产</strong>
			</td>
			<td   colspan="2" class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
				<table border="0" cellspacing="0" cellpadding="5" align="right">
					<tr >
						<td  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
							相关操作：
							<img src="${ctx }/images/u100.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="addOtherProrerty('kkkkk${status.index }','${fn:length(natuProperty)}');">添加</a>
						</td>
						<td  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size: 14px;">
							<img src="${ctx }/images/u103.gif">
							&nbsp;
							<a href="javaScript:void(0);" onclick="deleteOtherProrerty();">删除</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:forEach items="${natuProperty}" var="items" varStatus="s">
		  <c:if test="${item.PRON_ID eq items.VOUCH_ID }">
			<input type="hidden" name="ID" value="${items.ID }">
			<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<td style="font-size: 14px;">房产名称</td>
				<td width="30%" style="font-size: 14px;"><input type="text" id="HOUSE_NAME" name="HOUSE_NAME" value="${items.HOUSE_NAME }"></td>
				<td style="font-size: 14px;">产权人</td>
				<td style="font-size: 14px;">本人<input type='radio' onClick='$("#PROPERTY_OWNER${s.count}").val(this.value)' value='1' name='PROPERTY_OWNER${s.count}' id='PROPERTY_OWNER' <c:if test="${items.PROPERTY_OWNER==1 }">checked="checked"</c:if>/> 配偶<input type='radio' onClick='$("#PROPERTY_OWNER${s.count}").val(this.value)'  value='2' name='PROPERTY_OWNER${s.count}' id='PROPERTY_OWNER'  <c:if test="${items.PROPERTY_OWNER==2 }">checked="checked"</c:if>>  共同共有<input type='radio' onClick='$("#PROPERTY_OWNER${s.count}").val(this.value)'  value='3' name='PROPERTY_OWNER${s.count}' id='PROPERTY_OWNER'  <c:if test="${items.PROPERTY_OWNER==3 }">checked="checked"</c:if>><input type="hidden" value="${items.PROPERTY_OWNER}" name="PROPERTY_OWNER" id="PROPERTY_OWNER${s.count}"/></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<td style="font-size: 14px;">房产坐落地点</td>
				<td width="30%" style="font-size: 14px;"><input style="width: 500" name="HOUSE_ADDRESS"  type="text" id="HOUSE_ADDRESS" value="${items.HOUSE_ADDRESS }"></td>
				<td style="font-size: 14px;">面积</td>
				<td style="font-size: 14px;"><input type="text" id="HOUSE_AREA" name="HOUSE_AREA" value="${items.HOUSE_AREA }" ></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<td style="font-size: 14px;">国土证/房产证</td>
				<td width="30%" style="font-size: 14px;"><input style="width: 500" type="text" id="HOUSE_PROVE" name="HOUSE_PROVE" value="${items.HOUSE_PROVE }"></td>
				<td style="font-size: 14px;">他项权利</td>
				<td style="font-size: 14px;"><input type="text" id="HOUSE_OTHERRIGHT" name="HOUSE_OTHERRIGHT" value="${items.HOUSE_OTHERRIGHT }"></td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
				<td style="font-size: 14px;">备注 </td>
				<td colspan="3" style="font-size: 14px;"><textarea class="txtk" style="width: 500px; height: 50px; font-size: 12px" name="NOTES" id="NOTES">${items.NOTES }</textarea><img src="${ctx }/images/u103.gif">&nbsp;<a href="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.deleteNatuProperty&credit_id=${prcd_id }&id=${items.ID }';">删除</a>
				</td>
			</tr>
		  </c:if>
		</c:forEach>
		<tr>
			<td style="text-align: center;" colspan="5">
				<div id="kkkkk${status.index }" style="font-size: 14px;"></div>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="5">
				<input type="button" class="ui-state-default ui-corner-all" value="保存" onclick="upNatu(${status.index });"></input>
				<input type="button" value="删除" onclick="delNatu('natu${status.index }','${item.PRON_ID }');" class="ui-state-default ui-corner-all">
			</td>
		</tr>
	</table>
	</form>
	</c:forEach>
	</div>
	</div>
