<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/bankAccountManage/js/bankAccount.js"></script>
		<title>查看银行账号信息页面</title>
	</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看银行账号信息</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>开户人：</td>
				<td>${account.ACCOUNT_NAME } &nbsp;</td>
				<td>账号：</td>
				<td>${account.ACCOUNT_NO } &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>账户性质：</td>
				<td>
				  <c:if test="${account.ACCOUNTPROPERTY==873 }">一般户</c:if>
				  <c:if test="${account.ACCOUNTPROPERTY==874 }">基本户</c:if>
			      <c:if test="${account.ACCOUNTPROPERTY==875 }">现金</c:if>
				  <c:if test="${account.ACCOUNTPROPERTY==876 }">纳税户</c:if>
				  <c:if test="${account.ACCOUNTPROPERTY==877 }">贷款户</c:if>
				  <c:if test="${account.ACCOUNTPROPERTY==878 }">资本金户</c:if>&nbsp;
				</td>
				<td>开户银行：</td>
				<td>${account.BANK_NAME } &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>编码：</td>
				<td>${account.ACCOUNTCODE }&nbsp;</td>
				<td>币种：</td>
				<td>
				    <c:if test="${account.CURRENCY==0}">人民币</c:if>
				    <c:if test="${account.CURRENCY==1}">美元</c:if>
				&nbsp;</td>
			</tr>
			<%-- <tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>类型：</td>
				<td><c:choose><c:when test="${account.TYPE eq 0}">主账户</c:when><c:otherwise>子账户</c:otherwise></c:choose></td>
				<td>账户类型：</td>
				<td><c:if test="${account.ACCOUNT_TYPE==1}">网银</c:if><c:if test="${account.ACCOUNT_TYPE==2}">待分解来款</c:if><c:if test="${account.ACCOUNT_TYPE==3}">承兑汇票</c:if><c:if test="${account.ACCOUNT_TYPE==4}">保证金转出</c:if><c:if test="${account.ACCOUNT_TYPE==5}">保险结余</c:if>&nbsp;</td>
			</tr>
			<c:if test="${account.TYPE == 1}">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>主账户：</td>
				<td colspan="3">${account.PARENT_ACCOUNT_NO } &nbsp;</td>
			</tr>
			</c:if> --%>
	</table>
		<div align="center">
		<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
	</div>
	</div>
				</div>
			</div>
	</body>
</html>