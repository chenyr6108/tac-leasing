<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>理赔信息</title>
		<script type="text/javascript" src="${ctx }/common/js/check1.0.1.js"></script>
		<script type="text/javascript" src="${ctx }/insurance/js/insurance.js"></script>
		<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
		<script type="text/javascript">
		
    	 	//提交付款申请
			function subNotice() {
			if(isNaN($("#INSF_MONEY").val())){
				alert("金额只能输入数字！");
				return false;
			}
					$("#addform").submit();
			}
		</script>
		<script type="text/javascript">
			$(function (){
				$("#DANG_DATE").datepicker($.datepicker.regional['zh-CN']);
				$("#INSF_DATE").datepicker($.datepicker.regional['zh-CN']);
			});
		</script>
	</head>
	<body >
		<form id="addform" name="addform" action="../servlet/defaultDispatcher" method="post">
			<input type="hidden" name="__action" value="satisfaction.addSatisfaction">
			<input type="hidden" name="INCU_ID" value="${INCU_ID}" />
			<div style="margin:1%;">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;理赔信息</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:25%px;" class="ui-state-default ui-th-ltr zc_grid_head">设备：</th>
					<td style="text-align: left;height:24px;width:25%px;">${satisfaction.EQMT_ID }</td>
					<th style="text-align: left;height:24px;width:25%px;" class="ui-state-default ui-th-ltr zc_grid_head">出险日期：</th>
					<td style="text-align: left;height:24px;width:25%px;"><input onfocus="this.value=''" disabled="disabled" type="text" name="DANG_DATE" id="DANG_DATE" value="${satisfaction.DANG_DATE }" readonly="readonly"/>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">定损日期：</th>
					<td style="text-align: left;height:24px;width:170px;"><input onfocus="this.value=''" disabled="disabled" type="text" name="CHARGE_DATE" id="CHARGE_DATE" value="${satisfaction.CHARGE_DATE }" readonly="readonly"/>&nbsp;</td>
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">定损金额：</th>
					<td style="text-align: left;height:24px;width:170px;"><input type="text" name="CHARGE_MONEY" id="CHARGE_MONEY" disabled="disabled" value="<fmt:formatNumber value='${satisfaction.CHARGE_MONEY }' type='number' pattern='#,#00.00' />" />&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">理赔日期：</th>
					<td style="text-align: left;height:24px;width:170px;"><input onfocus="this.value=''" disabled="disabled" type="text" name="INSF_DATE" id="INSF_DATE" value="${satisfaction.INSF_DATE }" readonly="readonly"/>&nbsp;</td>
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">理赔金额：</th>
					<td style="text-align: left;height:24px;width:170px;"><input type="text" name="INSF_MONEY" id="INSF_MONEY" disabled="disabled" value="<fmt:formatNumber value='${satisfaction.INSF_MONEY }' type='number' pattern='#,#00.00' />" />&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">备注：</th>
					<td style="text-align: left;height:24px;width:170px;" colspan="3"><textarea rows="3" cols="150" disabled="disabled" name=REMARK>${satisfaction.REMARK }</textarea></td>
				</tr>
			</table>
			<center>
				<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" />
			</center>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
