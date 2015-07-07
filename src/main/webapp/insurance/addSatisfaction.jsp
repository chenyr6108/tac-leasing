<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
	<title>添加理赔信息</title>
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
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;添加理赔信息</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			 <div class="zc_grid_body jqgrowleft">
	  		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">出险日期：</th>
					<td style="text-align: left;height:24px;width:170px;"><input onfocus="this.value=''"  type="text" name="DANG_DATE" id="DANG_DATE">&nbsp;</td>
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">理赔日期：</th>
					<td style="text-align: left;height:24px;width:170px;"><input onfocus="this.value=''"  type="text" name="INSF_DATE" id="INSF_DATE">&nbsp;</td>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">赔款金额：</th>
					<td style="text-align: left;height:24px;width:170px;"><input type="text" name="INSF_MONEY" id="INSF_MONEY"  />&nbsp;</td>
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">选择设备：</th>
					<td colspan="4"><select name="EQMT_ID"><c:forEach items="${eqmts}" var="eqmt">
						<option value="${eqmt.EQMT_ID }">${eqmt.THING_NAME }<c:if test="${not empty eqmt.THING_NUMBER }">_${eqmt.THING_NUMBER }</c:if></option>
					</c:forEach></select></td>
					</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<th style="text-align: left;height:24px;width:170px;" class="ui-state-default ui-th-ltr zc_grid_head">理赔备注：</th>
					<td colspan="5"><textarea rows="3" cols="150" name=REMARK>${satisfaction.REMARK }</textarea>&nbsp;</td>

				</tr>

			</table>
			<center>
				<input type="button" value="提  交" class="ui-state-default ui-corner-all" onclick="javascript:subNotice();" />
				<input type="button" value="返  回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" />
			</center>
			</div>
			</div>
			</div>
			</div>
		</form>
	</body>
</html>
