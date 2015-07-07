<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>自然人担保查看</title>
	</head>
	<body>
<!-- 自然人 -->
	
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;自然人担保查看</span>
   	</div>	
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
		<div style="margin: 6 0 6 0px;">   
	<c:forEach items="${natuList}" var="item" varStatus="status">		
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id='natu${status.index }'>
		<tr>
			<th class="ui-state-default ui-th-ltr zc_grid_head" rowspan="16" width="4%">自<br>然<br>人<br>担<br>保<br></th>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="13%">担保人姓名 </td>
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
			<td>身份证号码</td>
			<td>${item.NATU_MATE_IDCARD }&nbsp;</td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>配偶手机号码</td>
			<td colspan="3">${item.NATU_MATE_MOBILE }&nbsp;</td>
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
			<td style="text-align: center;" colspan="5">
				<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
			</td>
		</tr>
	</table>
	</c:forEach>
			</div>
				</div>
			</div>		
	</body>
</html>	