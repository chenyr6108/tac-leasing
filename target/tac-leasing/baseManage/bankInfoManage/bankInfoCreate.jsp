<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/jquery-1.3.2.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/baseManage/bankInfoManage/js/bankInfo.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
		<title>新建银行信息页面</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">
			<input type="hidden" name="__action" value="bankInfo.create">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;添加银行信息</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>银行名称：</td>
					<td><input type="text" name="bank_name" id="bank_name" > <font color="#ff0080">*</font></td>
					<td>银行编号：</td>
					<td><input type="text" name="bank_code"  id="bank_code" > <font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>联系人：</td>
					<td><input type="text" name="bank_linkman"  id="bank_linkman" ></td>
					<td>联系电话：</td>
					<td><input type="text" name="bank_phone" id="bank_phone" ></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>邮编：</td>
					<td><input type="text" name="post_code"  id="post_code" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="this.className='txtk'"></td>
					<td>银行类型：</td>
					<td><input type="radio" name="type" value="0" checked="checked" onclick="createParentBankDisplay(this)">总行<input type="radio" name="type" value="1" onclick="createParentBankDisplay(this)">分行</td>
				</tr>
				<tr id="parentList" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
					<td>选择父银行名称</td>
					<td colspan="3"><select id="parent_id" name="parent_id"><option value="0">----请选择------</option><c:forEach items="${parentBank}" var="parentBank"><option value="${parentBank.BABI_ID }">${parentBank.BANK_NAME }</option></c:forEach></select> <font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>公司地址：</td>
					<td colspan="3"><input type="text" name="bank_address" size="100" id="bank_address" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="this.className='txtk'"></td>
				</tr>
			</table>
				<div align="center">
					<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onclick="addBank();">
					<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
				</div>
				</div>
				</div>
			</div>
		</form>
	</body>
</html>