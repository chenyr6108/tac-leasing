<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/jquery-1.3.2.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/baseManage/bankAccountManage/js/bankAccount.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>			
		<title>更新银行账号信息页面</title>
		<script type="text/javascript">
			var bankTypeData = ${parentAccountJson}
			function changeAccount(obj){
				for(var i = 0 ; i<bankTypeData.length ; i++){
					if ( bankTypeData[i].BABA_ID == obj.value	){
						$("#showBankNameSpan").html(bankTypeData[i].BANK_NAME); 
						$("#babi_id").val(bankTypeData[i].BABI_ID);			
					}
				}	
			}			
		</script>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" value="bankAccount.update">
			<input type="hidden" name="baba_id" value="${account.BABA_ID }">
			<input type="hidden" name="oldNo" value="${account.ACCOUNT_NO }">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改银行账号</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">	
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>开户人：</td>
					<td><input type="text" name="account_name"  value="${account.ACCOUNT_NAME }" id="account_name" > <font color="#ff0080">*</font></td>
					<td>账号：</td>
					<td><input type="text" name="account_no"  value="${account.ACCOUNT_NO }" id="account_no" > <font color="#ff0080">*</font></td>
				</tr>
				<%-- <tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>账户别名：</td>
					<td><input type="text" name="account_alias"  value="${account.ACCOUNT_ALIAS }" id="account_alias" ></td>
					<td>账户类型：</td>
					<td><select id="account_type" name="account_type"><option value="0">----请选择------</option>
								<c:forEach items="${accountType}" var="accountType">
									<option value="${accountType.CODE }" <c:if test="${account.ACCOUNT_TYPE eq accountType.CODE }">selected="selected"</c:if>>${accountType.FLAG }</option>
								</c:forEach></select> <font color="#ff0080">*</font></td>
				</tr> --%>
				<!-- modify by xuyuefei 2014/8/22-->
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>编码：</td>
					<td><input type="text" name="accountCode"  value="${account.ACCOUNTCODE }" id="account_alias" ><font color="#ff0080">*</font></td>
					<td>账户性质：</td>
					<td><select id="account_property" name="accountProperty"><option value="0">----请选择------</option>
								<c:forEach items="${accountProperty}" var="accountProperty">
									<option value="${accountProperty.DATA_ID }" <c:if test="${accountProperty.DATA_ID eq account.ACCOUNTPROPERTY }">selected="selected"</c:if>>${accountProperty.FLAG}</option>
								</c:forEach></select> <font color="#ff0080">*</font></td>
				</tr>
				<%-- <tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>类型：</td>
					<td colspan="3"><c:choose><c:when test="${account.TYPE eq 0}"><input type="radio" name="type" value="0" checked="checked" onclick="parentBankAccountDisplay(this,${account.BABA_ID })">主账户<input type="radio" name="type" value="1" onclick="parentBankAccountDisplay(this,${account.BABA_ID })">子账户</c:when><c:otherwise><input type="radio" name="type" value="0" onclick="parentBankAccountDisplay(this,${account.BABA_ID })">主账户<input type="radio" name="type" value="1" checked="checked" onclick="parentBankAccountDisplay(this,${account.BABA_ID })">子账户	</c:otherwise></c:choose><input id="type_id" type="hidden" name="type_id" value="${account.TYPE}"  /></td>					

				</tr> --%>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				   <td>币种</td>
				   <td colspan="3">
				      <select name="currency">
				         <option value="" <c:if test="${empty account.CURRENCY}">selected="selected"</c:if>>----请选择------</option>
				         <option value="0" <c:if test="${account.CURRENCY==0}">selected="selected"</c:if>>人民币</option>
				         <option value="1" <c:if test="${account.CURRENCY==1}">selected="selected"</c:if>>美元</option>
				      </select><font color="#ff0080">*</font>
				   </td>
				</tr>
				<%-- <tr class="ui-widget-content jqgrow ui-row-ltr" id="parent_account" <c:if test="${account.TYPE eq 0}">style='display:none'</c:if>>
					<td>所属主账号：</td>
					<td colspan="3"><select id="parent_id" name="parent_id" onchange="changeAccount(this);"><option value="0">----请选择------</option>
								<c:forEach items="${parentAccount}" var="parentAccount">
									<option value="${parentAccount.BABA_ID }" <c:if test="${parentAccount.BABA_ID eq account.PARENT_ID }">selected="selected"</c:if>>${parentAccount.ACCOUNT_ALIAS }</option>
								</c:forEach></select> <font color="#ff0080">*</font></td>
				</tr> --%>
				<tr id="bankList" class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${account.TYPE eq 1}">style='display:none'</c:if>>
				    <td>开户银行：</td>
					<td colspan="3"><select id="babi_id" name="babi_id"><option value="0">----请选择------</option>
						<c:forEach items="${bank}" var="bank">
							<option value="${bank.BABI_ID }" <c:if test="${account.BABI_ID eq bank.BABI_ID }">selected="selected"</c:if>>${bank.BANK_NAME }</option>
						</c:forEach></select> <font color="#ff0080">*</font></td>
				</tr>
				<%-- <tr id="bankByPAccount" <c:if test="${account.TYPE eq 0}">style='display:none'</c:if> class="ui-widget-content jqgrow ui-row-ltr">
					<td>所属银行 ：</td>
					<td colspan="3"><span id="showBankNameSpan"><c:forEach items="${parentAccount}" var="parentAccount"><c:if test="${parentAccount.BABA_ID eq account.PARENT_ID }">${parentAccount.BANK_NAME}</c:if></c:forEach></span> </td> 
				</tr> --%>
				<tr>
					<td colspan="4" align="center">
						<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onclick="updateBankAccount();">
						<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
					</td>
				</tr>
			</table>
			</div>
				</div>
			</div>
		</form>
	</body>
</html>