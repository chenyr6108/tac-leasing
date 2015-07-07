<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"></link>
<script type="text/javascript" src="${ctx }/creditSpecial/js/creditSpecial.js"></script>
<html>
<head>
<style type="text/css">
	td {font-family: 微软雅黑;}
</style>
<script type="text/javascript">
	$(function () {
		$("input[name=startDateDescr]").datepicker($.datepicker.regional['zh-CN']);
		$("input[name=endDateDescr]").datepicker($.datepicker.regional['zh-CN']);
	});
	
	function showAddDiv() {
		$("#startDateDescr").val('');
		$("#endDateDescr").val('');
		$("#addDiv").dialog({modal:true, autoOpen:false, width:400, hide:'slide', show:'slide'});
		$("#addDiv").dialog("open");
	}
	
	function addCreditSpecialGroup() {
		if($("#creditSpecialName").val()=="") {
			alert("专案名称不能为空!");
			return;
		}
		if($("#creditSpecialCode").val()=="") {
			alert("专案代码不能为空!");
			return;
		}else{
			 var reg = /^\d{10}$/;	
			 var codeValue = $("#creditSpecialCode").val();
			 if(!codeValue.match(reg)){
					alert("专案代码必须为10位数字!");
					return;
			 }			 
		}
		if($("#startDateDescr").val()=="") {
			alert("启始日期不能为空!");
			return;
		}
		if($("#endDateDescr").val()=="") {
			alert("结束日期不能为空!");
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditSpecialCommand.checkCreditSpecialGroup&creditSpecialName='+$("#creditSpecialName").val()+'&creditSpecialCode='+$("#creditSpecialCode").val()+'&startDateDescr='+$("#startDateDescr").val()+'&endDateDescr='+$("#endDateDescr").val(),
			dataType:'json',
			success: function(flag) {
				if(flag) {
					$("#form1").submit();
				} else {
					alert("专案名称或者代号重复,启始日期应小于结束日期!");
				}
			}
		});
	}
	
	function del(code) {
		if(confirm("确认删除?")) {
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=creditSpecialCommand.deleteCreditSpecialGroup&creditSpecialCode='+code,
				dataType:'json',
				success: function(flag) {
					if(flag) {
						alert("删除成功!");
						$("#form").submit();
					} else {
						alert("删除失败!");
					}
				}
			});
		}
	}
	
	function updateCreditSpecialGroup() {
		if($("#LEASE_PRODUCTION_NAME").val()==""&&$("input[name=row1]").eq(0).attr("checked")) {
			alert("租赁物名称不能为空!");
			return;
		}
		for(var i=0;i<$("input[name=SUPPLIER_ID]").length;i++) {
			if($("input[name=SUPPLIER_ID]").eq(i).val()==""&&$("input[name=row5]").eq(0).attr("checked")) {
				alert("供应商栏位不能为空!");
				return;
			}
		}
		for(var i=0;i<$("input[name=LEASE_PRODUCTION_BRAND]").length;i++) {
			if($("input[name=LEASE_PRODUCTION_BRAND]").eq(i).val()==""&&$("input[name=row2]").eq(0).attr("checked")) {
				alert("租赁物品牌栏位不能为空!");
				return;
			}
		}
		if(parseInt($("#LEASE_PERIOD_1").val())>parseInt($("#LEASE_PERIOD_2").val())&&$("input[name=row12]").eq(0).attr("checked")) {
			alert("租赁期数结束月要大于开始月!");
			return;
		}
		if(parseFloat($("#LEASE_TR_1").val())>parseFloat($("#LEASE_TR_2").val())&&$("input[name=row13]").eq(0).attr("checked")) {
			alert("租赁TR结束TR要大于开始TR!");
			return;
		}
		if($("#TOTAL_MONEY").val()==""&&$("input[name=row11]").eq(0).attr("checked")) {
			alert("专案总承做金额不能为空!");
			return;
		}
		if($("#SINGLE_MONEY").val()==""&&$("input[name=row15]").eq(0).attr("checked")) {
			alert("单案金额不能为空!");
			return;
		}
		if($("#CUSTOMER_MONEY_TOPLIMIT").val()==""&&$("input[name=row16]").eq(0).attr("checked")) {
			alert("承租人归户金额上限不能为空!");
			return;
		}
		if($("#CUSTOMER_REGISTER_PERIOD").val()==""&&$("input[name=row17]").eq(0).attr("checked")) {
			alert("承租人成立年限不能为空!");
			return;
		}
		$("#form2").submit();
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" id="form" method="post">
		<input type="hidden" name="__action" id="__action" value="${__action }">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   <span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;专案维护</span>
	</div>
	<div class="ui-state-default ui-jqgrid" style="background: white">
		<br><input type="button" value="添加专案" class="ui-state-default ui-corner-all" onclick="showAddDiv()" style="cursor: pointer;"><br>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px;">
					序号
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					专案名称
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					专案代号
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					专案启始日期
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					专案结束日期
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					最后修改人员
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					最后修改时间
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					操作
				</th>
			</tr>
			<c:forEach items="${resultList }" var="item" varStatus="index">
			<tr class="ui-widget-content jqgrow ui-row-ltr" style="cursor:pointer;">
				<td style="text-align:center;">${index.count }</td>
				<td style="text-align:center;">${item.creditName }</td>
				<td style="text-align:center;">${item.creditCode }</td>
				<td style="text-align:center;">${item.startDateDescr }</td>
				<td style="text-align:center;">${item.endDateDescr }</td>
				<td style="text-align:center;">${item.name }</td>
				<td style="text-align:center;">${item.modifyDateDescr }</td>
				<td style="text-align:center;"><a href="javascript:void(0)" onclick="showUpdateDiv('${item.startDateDescr }','${item.endDateDescr }','${item.creditCode }')">维护专案</a>|<a href="javascript:void(0)" onclick="del('${item.creditCode }')">删除</a></td>
			</tr>
			</c:forEach>
		</table>
     </div>
	 </form>
	 <div style="display: none" id="addDiv" title="添加专案">
		<form action="../servlet/defaultDispatcher?__action=creditSpecialCommand.addCreditSpecialGroup" method="post" id="form1">
        	<div>
				<table cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">专案名称：</td>
						<td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input id="creditSpecialName" name="creditSpecialName" maxlength="50" style="width: 172px;"></td>
					</tr>
					<tr>
						<td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">专案代码：</td>
						<td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input id="creditSpecialCode" name="creditSpecialCode" maxlength="10" style="width: 172px;"></td>
					</tr>
					<tr>
						<td style="text-align:right" class="ui-widget-content jqgrow ui-row-ltr">专案期限：</td>
						<td style="text-align:left" class="ui-widget-content jqgrow ui-row-ltr"><input name="startDateDescr" id="startDateDescr" readonly="readonly" style="width: 80px;">到<input name="endDateDescr" id="endDateDescr" readonly="readonly" style="width: 80px;"></td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<font color="red">*</font>注意:专案名称,专案代码一经创建不能修改<br>
							<input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" style="cursor: pointer;" onclick="addCreditSpecialGroup()">
							&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#addDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	 <div style="display: none;" id="updateDiv" title="<font style='font-family: 微软雅黑'>维护专案</font>">
		<form action="../servlet/defaultDispatcher?__action=creditSpecialCommand.configCreditSpecialGroup" method="post" id="form2">
		<input type="hidden" id="id" name="creditSpecialCode">
        	<div>
        		<div class="ui-state-default ui-jqgrid" style="background: white;width: 472px;margin-left: 1px;">
        		<table cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
        			<tr>
        				<td>
        					专案启始日期：
        				</td>
        				<td>
        					<input name="startDateDescr" id="startDate" readonly="readonly" style="width: 80px;">
        				</td>
        				<td>
        					专案结束日期：
        				</td>
        				<td>
        					<input name="endDateDescr" id="endDate" readonly="readonly" style="width: 80px;">
        				</td>
        			</tr>
        		</table>
        		</div>
        		<table id="updateTable" cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
        			
        		</table>
				<table cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td align="center">
							<br>
							<input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" style="cursor: pointer;" onclick="updateCreditSpecialGroup()">
							&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#updateDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>