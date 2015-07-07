<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 自然人 -->
	<c:forEach items="${natuList}" var="item" varStatus="status">
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id='natu${status.index }'>
		<tr>
			<th class="ui-state-default ui-th-ltr zc_grid_head" rowspan="100" width="4%">自<br>然<br>人<br>担<br>保<br></th>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="13%">担保人姓名</td>
			<td width="30%">${item.CUST_NAME }</td>
			<td width="13%">性别 </td>
			<td width="30%">${item.NATU_GENDER }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>年龄</td>
			<td>${item.NATU_AGE }&nbsp;</td>
			<td>邮编</td>
			<td>${item.NATU_ZIP }&nbsp;</td>
		</tr>
		<tr>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<c:set var="type0" value=""></c:set>
				<c:set var="type1" value=""></c:set>
				<c:set var="type2" value=""></c:set>
				<c:set var="type3" value=""></c:set>
				<c:if test="${item.FLAGPERMIT eq 0}">
					<c:set var="type0" value="selected='selected'"></c:set>
				</c:if>
				<c:if test="${item.FLAGPERMIT eq 1}">
					<c:set var="type1" value="selected='selected'"></c:set>
				</c:if>
				<c:if test="${item.FLAGPERMIT eq 2}">
					<c:set var="type2" value="selected='selected'"></c:set>
				</c:if> 
				<c:if test="${item.FLAGPERMIT eq 3}">
					<c:set var="type3" value="selected='selected'"></c:set>
				</c:if>
				<select disabled="disabled">
						<option value="0" ${type0 }>身份证</option>
						<option value="1" ${type1 }>港澳台身份证</option>
						<option value="2" ${type2 }>护照</option>
						<option value="3" ${type3 }>其他证件</option>
				</select>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">
				<c:if test="${item.FLAGPERMIT eq 0}">
					${item.NATU_IDCARD }
				</c:if>
				<c:if test="${item.FLAGPERMIT eq 1}">
					${item.NATU_IDCARD }
				</c:if>
				<c:if test="${item.FLAGPERMIT eq 2}">
					${item.NATU_IDCARD }
				</c:if> 
				<c:if test="${item.FLAGPERMIT eq 3}">
					${item.NATU_IDCARD }
				</c:if>
			</td>
			<td class="ui-widget-content jqgrow ui-row-ltr">家庭电话 </td>
			<td class="ui-widget-content jqgrow ui-row-ltr">${item.NATU_PHONE }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>银行帐号 </td>
			<td>${item.BANK_ACCOUNTS }&nbsp;</td>
			<td>开户银行 </td>
			<td>${item.OPEN_BANK }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>手机号码 </td>
			<td>${item.NATU_MOBILE }&nbsp;</td>
			<td>传真</td>
			<td>${item.NATU_FAX }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>家庭地址 </td>
			<td colspan="3">${item.NATU_HOME_ADDRESS }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>身份证地址</td>
			<td colspan="3">${item.NATU_IDCARD_ADDRESS }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>工作单位 </td>
			<td colspan="3">${item.NATU_WORK_UNITS }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>单位地址 </td>
			<td colspan="3">${item.NATU_WORK_ADDRESS }&nbsp;</td>
		</tr>
		
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶姓名</td>
			<td>${item.NATU_MATE_NAME }&nbsp;</td>
			<td>配偶性别</td>
			<td>${item.NATU_MATE_GENDER }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td >配偶年龄</td>
			<td >${item.NATU_MATE_AGE }&nbsp;</td>
			<td>配偶邮编</td>
			<td>${item.NATU_MATE_ZIP }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td><c:forEach items="${natuTypeList}" var="items"><c:choose><c:when test="${items.CODE eq item.MATE_FLAG_PERMIT}">${items.FLAG }</c:when></c:choose></c:forEach></td>
			<td>${item.NATU_MATE_IDCARD }&nbsp;</td>
			<td>配偶家庭电话</td>
			<td>${item.NATU_MATE_PHONE }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶开户银行</td>
			<td>${item.OPEN_MATE_BANK }&nbsp;</td>
			<td>配偶银行帐号</td>
			<td>${item.BANK_ACCOUNTS_MATE }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶手机号码</td>
			<td>${item.NATU_MATE_MOBILE }&nbsp;</td>
			<td>配偶传真</td>
			<td>${item.NATU_MATE_FAX }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶家庭地址</td>
			<td>${item.NATU_MATE_HOME_ADDRESS }&nbsp;</td>
			<td>是否联合担保</td>
			<td><c:if test="${item.ISTOGETHER == 1 }">是</c:if><c:if test="${item.ISTOGETHER == 0 }">否</c:if></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶身份证地址</td>
			<td colspan="3">${item.NATU_MATE_IDCARD_ADDRESS }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶工作单位</td>
			<td colspan="3">${item.NATU_MATE_WORK_UNITS }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶单位地址</td>
			<td colspan="3">${item.NATU_MATE_WORK_ADDRESS }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>备注 </td>
			<td colspan="3">${item.REMARK }&nbsp;</td>
		</tr>
		<tr>
			<td  class="ui-state-default ui-th-ltr zc_grid_head">
				<b>名下资产</b>
			</td>
			<td colspan="3"  class="ui-state-default ui-th-ltr zc_grid_head"> 
			&nbsp;
			</td>
		</tr>
		<c:forEach items="${natuProperty}" var="items" varStatus="s">
		  <c:if test="${item.PRON_ID eq items.VOUCH_ID }">
			<input type="hidden" name="ID" value="${items.ID }">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>房产名称</td>
				<td width="30%">${items.HOUSE_NAME }&nbsp;</td>
				<td>产权人</td>
				<td>${items.PROPERTY_OWNER == 1?'本人': items.PROPERTY_OWNER == 2?'配偶': items.PROPERTY_OWNER == 3?'共同共有':'' }&nbsp;</td>
				</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>房产坐落地点</td>
				<td width="30%">${items.HOUSE_ADDRESS }&nbsp;</td>
				<td>面积</td>
				<td >${items.HOUSE_AREA }&nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>国土证/房产证</td>
				<td width="30%">${items.HOUSE_PROVE }&nbsp;</td>
				<td>他项权利</td>
				<td >${items.HOUSE_OTHERRIGHT }&nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>备注 </td>
				<td colspan="3">${items.NOTES }&nbsp;
				</td>
			</tr>
		  </c:if>
		</c:forEach>
		
		<c:if test="${flag ne 'show'}">
		<tr>
			<td style="text-align: center;" colspan="5">
				<input type="button" value="删除" onclick="delNatu('natu${status.index }','${item.PRON_ID }');" class="ui-state-default ui-corner-all">
			</td>
		</tr>
		</c:if>
	</table>
	</c:forEach>
	
