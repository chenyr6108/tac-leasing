<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/bankInfoManage/js/bankInfo.js"></script>
		<title>查看银行信息页面</title>
	</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看银行信息</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>银行名称：</td>
				<td>${bank.BANK_NAME } &nbsp;</td>
				<td>银行编号</td>
				<td>${bank.BANK_CODE } &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>联系人：</td>
				<td>${bank.BANK_LINKMAN } &nbsp;</td>
				<td>联系电话：</td>
				<td>${bank.BANK_PHONE } &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>邮编：</td>
				<td>${bank.POST_CODE } &nbsp;</td>
				<td>上级银行名称</td>
				<td>${bank.PARENT_NAME } &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>银行类型：</td>
				<td><c:choose><c:when test="${bank.TYPE eq 0}">银行</c:when><c:otherwise>分行</c:otherwise></c:choose></td>
				<td>公司地址：</td>
				<td colspan="3">${bank.BANK_ADDRESS } &nbsp;</td>			
			</tr>
	</table>
	<div align="center">
		<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
	</div>
	</div>
				</div>
			</div>
	</body>
</html>