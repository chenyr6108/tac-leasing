<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改拨款方式（交机前后）</title>
<script type="text/javascript">
	
	$(function (){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});
	
	function doUpdatePayWay(){
		var PAYPERCENT_0 = $("#PAYPERCENT_0").val();
		var PAYPERCENT_1 = $("#PAYPERCENT_1").val();
		PAYPERCENT_0 = PAYPERCENT_0 == "" ? 0 : parseFloat(PAYPERCENT_0);
		PAYPERCENT_1 = PAYPERCENT_1 == "" ? 0 : parseFloat(PAYPERCENT_1);
		if((PAYPERCENT_0 + PAYPERCENT_1) != 100){
			alert("交机前后拨款比例总和必须为100%");
		} else {
			$("#__action").val("businessSupport.doUpdatePayWay");
			$("#thisForm").submit();
		}
	}
	
	
	function updateData(type, e){
		var PAYPERCENT = $("#PAYPERCENT_" + type).val();
		var APPRORIATEMON = $("#APPRORIATEMON_" + type).val();
		var totalPayMoney = parseFloat($("#totalPayMoney").val());
		PAYPERCENT = PAYPERCENT == "" ? 0 : parseFloat(PAYPERCENT);
		APPRORIATEMON = APPRORIATEMON == "" ? 0 : parseFloat(APPRORIATEMON);
		if("p" == e){
			if(PAYPERCENT == 0){
				$("#APPRORIATEMON_" + type).val("");
				$("#PAYPERCENT_" + type).val("");
				$("#APPRORIATENAME_" + type).val("");
			} else {
				APPRORIATEMON = totalPayMoney * PAYPERCENT / 100;
				$("#APPRORIATEMON_" + type).val(APPRORIATEMON);
			}
			
		}
		if("m" == e){
			if(APPRORIATEMON == 0){
				$("#APPRORIATEMON_" + type).val("");
				$("#PAYPERCENT_" + type).val("");
				$("#APPRORIATENAME_" + type).val("");
			} else {
				PAYPERCENT = APPRORIATEMON / totalPayMoney * 100;
				$("#PAYPERCENT_" + type).val(PAYPERCENT.toFixed(2));
			}
			
		}
	}

</script>
</head>
<body>
<form action="${ctx }/servlet/defaultDispatcher" method="post" id="thisForm">
<input type="hidden" name="__action" id="__action" value="businessSupport.showUpdatePayWay"/>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改拨款方式（交机前后）</span>
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
		<table class="panel_table" align="left" style="width: 80%">
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
				<th>总拨款金额：</th>
				<td>${totalPayMoney }<input type="hidden" id="totalPayMoney" value="${totalPayMoney }"/></td>
			</tr>
			<tr>
				<th>介绍人：</th>
				<td><input type="text" class="panel_text" style="width: 250px;" name="SPONSOR" value="${scMap.SPONSOR }"/></td>
			</tr>
			<tr>
				<th>发票人：</th>
				<td><input type="text" class="panel_text" style="width: 250px;" name="INVOICE_PERSON" value="${scMap.INVOICE_PERSON }"/></td>
			</tr>
			<tr>
				<th rowspan="2">拨款方式（交机前后）：</th>
				<td>
					交机前：比例<input type="text" class="panel_text" style="width: 50px;" id="PAYPERCENT_0" name="PAYPERCENT_0" value="${PAYPERCENT_0 }" onchange="updateData(0, 'p');"/>%
					,金额<input type="text" class="panel_text" style="width: 100px;" id="APPRORIATEMON_0" name="APPRORIATEMON_0" value="${APPRORIATEMON_0 }" onchange="updateData(0, 'm');"/>
					,拨款给<input type="text" class="panel_text" style="width: 250px;" id="APPRORIATENAME_0" name="APPRORIATENAME_0" value="${APPRORIATENAME_0 }"/>
				</td>
			</tr>
			<tr>
				<td>
					交机后：比例<input type="text" class="panel_text" style="width: 50px;" id="PAYPERCENT_1" name="PAYPERCENT_1" value="${PAYPERCENT_1 }" onchange="updateData(1, 'p');"/>%
					,金额<input type="text" class="panel_text" style="width: 100px;" id="APPRORIATEMON_1" name="APPRORIATEMON_1" value="${APPRORIATEMON_1 }" onchange="updateData(1, 'm');"/>
					,拨款给<input type="text" class="panel_text" style="width: 250px;" id="APPRORIATENAME_1" name="APPRORIATENAME_1" value="${APPRORIATENAME_1 }"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="修  改" onclick="doUpdatePayWay();" class="panel_button" />
				</th>
			</tr>
		</table>
	</c:if>
	
	
	
</div>
</div>
</form>
</body>
</html>