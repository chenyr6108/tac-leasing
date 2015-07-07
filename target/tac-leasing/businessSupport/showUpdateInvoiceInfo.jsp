<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改开票资料</title>
<script type="text/javascript">
	
	$(function (){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});
	
	function doUpdateInvoiceInfo(){
		$("#__action").val("businessSupport.doUpdateInvoiceInfo");
		$('#thisForm').submit();
	}

</script>
<style type="text/css">
	.panel_text{
		width: 350px;
	}
</style>
</head>
<body>
<form action="${ctx }/servlet/defaultDispatcher" method="post" id="thisForm">
<input type="hidden" name="__action" id="__action" value="businessSupport.showUpdateInvoiceInfo"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改开票资料</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="height: 90%">
<div class="zc_grid_body jqgrowleft">
<div>
	<br>
	<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
		<tr>
			<td width="65">&nbsp;</td>
			<td width="60" class="ss_o">&nbsp;</td>
			<td width="439" class="ss_t">&nbsp;&nbsp;
				案件号：<input type="text" name="credit_runcode" value="${credit_runcode }" class="panel_text" style="width: 150px;"/>&nbsp;&nbsp;
				合同号：<input type="text" name="lease_code" value="${lease_code }" class="panel_text" style="width: 150px;"/>
			
			</td>
			<td width="55" class="ss_th" valign="top">&nbsp;</td>
			<td><a href="#" name="search" id="search"  class="blue_button" onclick="$('#thisForm').submit();">搜 索</a></td>
		</tr>
	</table>
</div>
<br/>

	<c:if test="${empty item }">
		请搜索后再修改。
	</c:if>
	<c:if test="${not empty item }">
		<input type="hidden" name="ID" value="${item.ID }"/>
		<input type="hidden" name="PJCCC_ID" value="${item.PJCCC_ID }"/>
		<input type="hidden" name="NATU_ID" value="${item.NATU_ID }"/>
		<table class="panel_table" align="left" style="width: 70%">
			<tr>
				<th style="width: 20%">案件号：</th>
				<td style="width: 80%">${item.CREDIT_RUNCODE }</td>
			</tr>
			<tr>
				<th>合同号：</th>
				<td>${item.LEASE_CODE }</td>
			</tr>
			<tr>
				<th>客户名称（法人/自然人）：</th>
				<td>${item.NAME }</td>
			</tr>
			<tr>
				<th>税务登记号/客户身份证号：</th>
				<td>
					<input type="text" name="CODE" value="${item.CODE }" class="panel_text"/>
				</td>
			</tr>
			<tr>
				<th>公司电话/联系电话：</th>
				<td>
					<input type="text" name="PHONE" value="${item.PHONE }" class="panel_text"/>
				</td>
			</tr>
			<tr>
				<th>注册地址/身份证地址：</th>
				<td>
					<input type="text" name="ADDRESS" value="${item.ADDRESS }" class="panel_text"/>
				</td>
			</tr>
			<tr>
				<th>银行账号：</th>
				<td>
					<table class="panel_table">
						<tr>
							<th style="width: 20%">类型</th>
							<th style="width: 40%">开户银行</th>
							<th style="width: 40%">账号</th>
						</tr>
						<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="bank">
								<input type="hidden" name="PCCBA_ID" value="${bank.PCCBA_ID }"/>
								<tr>
									<td>
										<c:if test="${bank.STATE eq 0 }">基本账号</c:if>
										<c:if test="${bank.STATE eq 1 }">其他账号</c:if>
									</td>
									<td>
										<input type="text" name="bank_name_${bank.PCCBA_ID }" value="${bank.BANK_NAME }" class="panel_text"/>
									</td>
									<td>
										<input type="text" name="bank_acc_${bank.PCCBA_ID }" value="${bank.BANK_ACCOUNT }" class="panel_text"/>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td>
									基本账号
								</td>
								<td>
									<input type="text" name="bank_name" class="panel_text"/>
								</td>
								<td>
									<input type="text" name="bank_acc" class="panel_text"/>
								</td>
							</tr>
						</c:otherwise>
						</c:choose>
					</table>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="修  改" onclick="doUpdateInvoiceInfo();" class="panel_button" />
				</th>
			</tr>
		</table>
	</c:if>
	
	
	
</div>
</div>
</form>
</body>
</html>