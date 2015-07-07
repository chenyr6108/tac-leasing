<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/baseManage/bankInfoManage/js/bankInfo.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>		
		<title>修改银行信息页面</title>
		<%@ include file="/common/import.jsp"%>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form2" id="form2"
			method="post">
			<input type="hidden" name="__action" value="bankInfo.update">
			<input type="hidden" name="babi_id" value="${bank.BABI_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改银行信息</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	          <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>银行名称：</td>
					<td><input type="text" name="bank_name"  value="${bank.BANK_NAME }" id="bank_name" > <font color="#ff0080">*</font></td>
					<td>银行编号</td>
					<td><input type="text" name="bank_code"  value="${bank.BANK_CODE }" id="bank_code" > <font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>联系人：</td>
					<td><input type="text" name="bank_linkman"  value="${bank.BANK_LINKMAN }" id="bank_linkman" ></td>
					<td>联系电话：</td>
					<td><input type="text" name="bank_phone"  value="${bank.BANK_PHONE }" id="bank_phone" ></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>邮编：</td>
					<td><input type="text" name="post_code"  value="${bank.POST_CODE }" id="post_code" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="this.className='txtk'"></td>
					<td>银行类型：</td>
					<td><c:choose><c:when test="${bank.TYPE eq 0}"><input type="radio" name="type" value="0" checked="checked" onclick="parentBankDisplay(this,${bank.BABI_ID})">总行<input type="radio" name="type" value="1" onclick="parentBankDisplay(this,${bank.BABI_ID})">分行</c:when><c:otherwise><input type="radio" name="type" value="0" onclick="parentBankDisplay(this,${bank.BABI_ID})">总行<input type="radio" name="type" value="1" checked="checked" onclick="parentBankDisplay(this,${bank.BABI_ID})">分行</c:otherwise></c:choose></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr" id="parentList" <c:if test="${bank.TYPE eq 0}">style='display:none'</c:if>>
					<td>选择父银行名称</td>
					<td colspan="3"><select id="parent_id" name="parent_id">
								<c:forEach items="${parentBank}" var="parentBank">
									<option value="${parentBank.BABI_ID }" <c:if test="${bank.PARENT_ID eq parentBank.BABI_ID  }">selected="selected"</c:if>>${parentBank.BANK_NAME }</option>
								</c:forEach><option value="0">----请选择------</option></select> <font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>银行地址：</td>
					<td colspan="3"><input type="text" name="bank_address" size="100" value="${bank.BANK_ADDRESS }" id="bank_address" class="txtk"  onFocus="this.className='txtklan';selectContent(this);" onBlur="this.className='txtk'"></td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onclick="updateBank();">
						<input type="button" class="ui-state-default ui-corner-all" name="back" value="返 回" onclick="javascript:history.go(-1)">
					</td>
				</tr>
			</table>
			</div>
				</div>
			</div>
		</form>
	</body>
</html>