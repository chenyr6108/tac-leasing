<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改供应商保证</title>
<script type="text/javascript">
	
	$(function (){
		//dataDictionaryDropDownList($("#SUPL_TRUE"), "供应商保证");
	});
	
	function doUpdateSuplPledge(){
		$("#__action").val("businessSupport.doUpdateSuplPledge");
		$('#thisForm').submit();
	}

</script>
</head>
<body>
<form action="${ctx }/servlet/defaultDispatcher" method="post" id="thisForm">
<input type="hidden" name="__action" id="__action" value="businessSupport.showUpdateSuplPledge"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改供应商保证</span>
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
				案件号：<input type="text" name="credit_runcode" value="${credit_runcode }" class="panel_text">&nbsp;&nbsp;
				合同号：<input type="text" name="lease_code" value="${lease_code }" class="panel_text">
			
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
		<input type="hidden" name="old_supl_true" value="${item.SUPL_TRUE }"/>
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
				<th>客户名称：</th>
				<td>${item.CUST_NAME }</td>
			</tr>
			<tr>
				<th>供应商：</th>
				<td>${item.SUPL_NAME }</td>
			</tr>
			<tr>
				<th>供应商保证：</th>
				<td>
					<%-- <input type="text" name="SUPL_TRUE" value="${item.SUPL_TRUE }" class="panel_select" id="SUPL_TRUE"/> --%>
					<tac:dropdownListTag name="SUPL_TRUE" item="${suplPledges }" displayValue="${item.SUPL_TRUE }" className="panel_select"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="修  改" onclick="doUpdateSuplPledge();" class="panel_button" />
				</th>
			</tr>
		</table>
	</c:if>
	
	
	
</div>
</div>
</form>
</body>
</html>