<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改客户名称</title>
<script type="text/javascript">
	
	$(function (){
		custDropDownList($("#related"));
		$("#related").attr("disabled", true);
		$("#updated").attr("disabled", true);
	});
	
	function doUpdateCustName(){
		$("#__action").val("businessSupport.doUpdateCustName");
		$('#thisForm').submit();
	}
	
	function cbReset(){
		$(".cb").each(function (){
			$(this).attr("checked", false);
			$(this).parent().next().eq(0).children().eq(0).attr("disabled", true);
			$(this).parent().next().eq(0).children().eq(0).children().attr("disabled", true);
		});
	}
	
	function selectCb(e){
		cbReset();
		$(e).attr("checked", true);
		$(e).parent().next().eq(0).children().eq(0).attr("disabled", !$(e).attr("checked"));
		$(e).parent().next().eq(0).children().eq(0).children().attr("disabled", !$(e).attr("checked"));
	}

</script>
</head>
<body>
<form action="${ctx }/servlet/defaultDispatcher" method="post" id="thisForm">
<input type="hidden" name="__action" id="__action" value="businessSupport.showUpdateCustName"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改客户名称</span>
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
				<th>
					<input type="checkbox" class="cb" onclick="selectCb(this)">修改现有客户名称：
				</th>
				<td>
					<input type="text" name="cust_name_updated" id="updated" class="panel_text" style="width: 200px;" value="${item.CUST_NAME }">
				</td>
			</tr>
			<tr>
				<th>
					<input type="checkbox" class="cb" onclick="selectCb(this)">关联新的客户名称：
				</th>
				<td>
					<input type="text" name="cust_name_related" id="related" class="panel_text" style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="修  改" onclick="doUpdateCustName();" class="panel_button" />
				</th>
			</tr>
		</table>
	</c:if>
	
	
	
</div>
</div>
</form>
</body>
</html>