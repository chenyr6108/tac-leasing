<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/jquery-1.3.2.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/baseManage/bankAccountManage/js/bankAccount.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/check.js"></script>	
		<title>添加银行账号</title>
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
			<input type="hidden" name="__action" value="bankAccount.create">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;添加银行账号</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
			
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>开户人：</td>
					<td><input type="text" name="account_name" id="account_name" > <font color="#ff0080">*</font></td>
					<td>账号：</td>
					<td><input type="text" name="account_no" id="account_no"  > <font color="#ff0080" id="checkNo">*</font></td>
				</tr>
 				<%--<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>账户别名：</td>
					<td><input type="text" name="account_alias" id="account_alias" ></td>
					<td>账号类型：</td>
					<td><select id="account_type" name="account_type"><option value="0">----请选择------</option>
								<c:forEach items="${accountType}" var="item">
									<option value="${item.CODE }">${item.FLAG }</option>
								</c:forEach>
						</select> <font color="#ff0080">*</font></td>
				</tr> --%>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<%-- <td>类型：</td>
					<td><input type="radio" name="type" value="0" checked="checked" onclick="createParentAccountDisplay(this)">主账户<input type="radio" name="type" value="1" onclick="createParentAccountDisplay(this)">子账户</td> --%>
							<td>编码</td>
							<td><input type="text" name="accountCode" id="accountCode"><font
								color="#ff0080">*</font></td>

					<td>账户性质:</td>
					<td>
					  <select name="accountProperty" id="accountProperty" ><option value="0">----请选择------</option>
					     <c:forEach items="${accountPropertyList}" var="accountProperty">
					        <option value="${accountProperty.DATA_ID }">${accountProperty.FLAG }</option>
					     </c:forEach>
					  </select><font color="#ff0080">*</font>
					</td>
				</tr>
				<tr id="bankList" class="ui-widget-content jqgrow ui-row-ltr">				
					<td>开户银行：</td>
					<td><select id="babi_id" name="babi_id"><option value="0">----请选择------</option>
								<c:forEach items="${bankList}" var="bank">
									<option value="${bank.BABI_ID }">${bank.BANK_NAME }</option>
								</c:forEach>
						</select> <font color="#ff0080">*</font></td>
						<td>币种</td>
						<td>
						 <select name="currency">
						     <option value="0">人民币</option>
						     <option value="1">美元</option>
						 </select><font color="#ff0080">*</font>
						</td>
				</tr>

						<%-- <tr id="parentList" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
					<td>主账号：</td>
					<td colspan="3"><select id="parent_id" name="parent_id" onchange="changeAccount(this);"><option value="0">----请选择------</option>
						<c:forEach items="${parentAccount}" var="parentAccount">
							<option value="${parentAccount.BABA_ID }">${parentAccount.ACCOUNT_ALIAS }</option>
						</c:forEach>
						</select> <font color="#ff0080">*</font></td>
				</tr> --%>
				<!-- <tr id="bankByPAccount" style='display:none' class="ui-widget-content jqgrow ui-row-ltr">
					<td>所属银行 ：</td>
					<td colspan="3"><span id="showBankNameSpan"></span> </td> 
				</tr> -->

				<tr>
					<td colspan="4" align="center">
						<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onclick="addBankAccount();">
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