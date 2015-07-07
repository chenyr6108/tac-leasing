<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改机器设备</title>
<script type="text/javascript">
	
	function doUpdateEqmt(){
		$("#__action").val("businessSupport.doUpdateEqmt");
		$('#thisForm').submit();
	}

</script>
</head>
<body>
<form action="${ctx }/servlet/defaultDispatcher" method="post" id="thisForm">
<input type="hidden" name="__action" id="__action" value="businessSupport.showUpdateEqmt"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改机器设备</span>
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

	<c:if test="${empty list }">
		请搜索后再修改。
	</c:if>
	<c:if test="${not empty list }">
		<input type="hidden" name="ID" value="${list[0].ID }"/>
		<table class="panel_table" align="left" style="width: 80%">
			<tr>
				<th style="width: 20%">案件号：</th>
				<td style="width: 80%">${list[0].CREDIT_RUNCODE }</td>
			</tr>
			<tr>
				<th>合同号：</th>
				<td>${list[0].LEASE_CODE }</td>
			</tr>
			<tr>
				<th>客户名称：</th>
				<td>${list[0].CUST_NAME }</td>
			</tr>
			<tr>
				<th>供应商：</th>
				<td>${list[0].SUPL_NAME }</td>
			</tr>
			<tr>
				<td colspan="2">
					<table class="panel_table">
						<tr>
							<th>名称</th>
							<th>型号</th>
							<th>厂牌</th>
							<th>制造商</th>
						</tr>
						<c:forEach items="${list }" var="i">
							<tr>
								<td>
									<input type="text" name="THING_NAME_${i.PRCE_ID }" value="${i.THING_NAME }" class="panel_text" style="width: 200px;"/>
								</td>
								<td>
									<input type="text" name="MODEL_SPEC_${i.PRCE_ID }" value="${i.MODEL_SPEC }" class="panel_text" style="width: 200px;"/>
								</td>
								<td>
									<input type="text" name="THING_TYPE_${i.PRCE_ID }" value="${i.THING_TYPE }" class="panel_text" style="width: 300px;"/>
								</td>
								<td>
									<input type="text" name="MANUFACTURER_${i.PRCE_ID }" value="${i.MANUFACTURER }" class="panel_text" style="width: 300px;"/>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="修  改" onclick="doUpdateEqmt();" class="panel_button" />
				</th>
			</tr>
		</table>
	</c:if>
	
	
	
</div>
</div>
</form>
</body>
</html>