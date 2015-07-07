<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<script type="text/javascript">
	function showAddDiv() {
		$("#addDiv").dialog({modal:true, autoOpen:false, width:440});
		$("#addDiv").dialog("open");
	}
	
	function showUpdateDiv(id) {
		$("#form2 input[name=propertyName]").val($("#propertyName"+id).val());
		$("#form2 input[name=id]").val(id);
		if($("#isNeed"+id).val()=="Y") {
			$("#form2 input[name=isNeed]").eq(0).attr("checked","checked");
		} else {
			$("#form2 input[name=isNeed]").eq(1).attr("checked","checked");
		}
		$("#updateDiv").dialog({modal:true, autoOpen:false, width:440});
		$("#updateDiv").dialog("open");
	}
	
	function saveCreditSpecial() {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=creditSpecialCommand.checkIsDuplicate&propertyCode='+$("#propertyCode").val(),
			dataType:'json',
			success: function(flag) {
				if(!flag) {
					if($("#propertyCode").val()=="") {
						alert("专案代码不能为空!");
						return;
					}
					if($("#propertyName").val()=="") {
						alert("专案名称不能为空!");
						return;
					}
					$("#form1").submit();
				} else {
					alert("专案代码已存在,请修改!");
					$("#propertyCode").val("");
					$("#propertyCode").focus();
				}
			}
		});
	}
	
	function up(id,status) {
		var content="";
		if(status==-1) {
			content="删除";
		} else {
			content="启用";
		}
		if(confirm("确认"+content+"?")) {
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=creditSpecialCommand.updateCreditSpecialProperty&id='+id+'&creditStatus='+status,
				dataType:'json',
				success: function(flag) {
					if(flag) {
						alert(content+"成功!");
						$("#form").submit();
					} else {
						alert(content+"失败!");
					}
				}
			});
		}
	}
	
	function updateCreditSpecial() {
		$("#form2").submit();
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" id="form" method="post">
		<input type="hidden" name="__action" id="__action" value="creditSpecialCommand.queryCreditSpecialProperty">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   <span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;专案项目维护</span>
	</div>
	<div class="ui-state-default ui-jqgrid" style="background: white">
		<br><input type="button" value="添加项目" class="ui-state-default ui-corner-all" onclick="showAddDiv()" style="cursor: pointer;"><br>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" style="width: 50px;">
					序号
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					专案项目名称
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					专案项目代码
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					是否必要条件
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					最后修改人员
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					最后修改时间
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					专案项目状态
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					操作
				</th>
			</tr>
			<c:forEach items="${resultList }" var="item" varStatus="index">
			<input type="hidden" value="${item.id }" id="id${item.id }">
			<input type="hidden" value="${item.propertyName }" id="propertyName${item.id }">
			<input type="hidden" value="${item.isNeed }" id="isNeed${item.id }">
			<tr class="ui-widget-content jqgrow ui-row-ltr" style="cursor:pointer;">
				<td style="text-align:center;">${index.count }</td>
				<td style="text-align:center;">${item.propertyName }</td>
				<td style="text-align:center;">${item.propertyCode }</td>
				<td style="text-align:center;"><c:if test="${item.isNeed eq 'Y'}"><b style="color: #2E6E9E">是</b></c:if><c:if test="${item.isNeed eq 'N'}">否</c:if></td>
				<td style="text-align:center;">${item.name }</td>
				<td style="text-align:center;">${item.modifyDateDescr }</td>
				<td style='text-align:center;<c:if test="${item.status eq '-1'}">color:red</c:if>'><c:if test="${item.status eq '0'}">可用</c:if><c:if test="${item.status eq '-1'}">已删除</c:if></td>
				<td style="text-align:center;"><a href="javascript:void(0)" onclick="showUpdateDiv('${item.id}')">更新</a>|<c:if test="${item.status eq '0'}"><a href="javascript:void(0)" onclick="up('${item.id}','-1')">删除</a></c:if><c:if test="${item.status eq '-1'}"><a href="javascript:void(0)" onclick="up('${item.id}','0')">启用</a></c:if></td>
			</tr>
			</c:forEach>
		</table>
     </div>
	 </form>
	 <div style="display: none" id="addDiv" title="添加专案项目">
		<form action="../servlet/defaultDispatcher?__action=creditSpecialCommand.addCreditSpecialProperty" method="post" id="form1">
        	<div>
				<table cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">专案项目名称</td>
						<td style="text-align:center;" class="ui-state-default ui-th-ltr zc_grid_head">专案项目代码</td>
						<td style="text-align:center;" class="ui-state-default ui-th-ltr zc_grid_head">是否必要条件<br><font style="font-weight: normal;font-size: 11px;">(<font color="red">*</font>如果是必要条件,则在专案中此内容不能选否)</font></td>
					</tr>
					<tr>
						<td style="text-align:center" class="ui-widget-content jqgrow ui-row-ltr"><input name="propertyName" maxlength="50" style="width: 80px"></td>
						<td style="text-align:center" class="ui-widget-content jqgrow ui-row-ltr"><input name="propertyCode" maxlength="50" style="width: 80px" id="propertyCode"></td>
						<td style="text-align:center;width: 280px" class="ui-widget-content jqgrow ui-row-ltr">是<input type="radio" checked="checked" name="isNeed" style="cursor: pointer;" value="Y">&nbsp;否<input type="radio" name="isNeed" style="cursor: pointer;" value="N"></td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<br>
							<input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" style="cursor: pointer;" onclick="saveCreditSpecial()">
							&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#addDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<div style="display: none" id="updateDiv" title="更新专案项目">
		<form action="../servlet/defaultDispatcher?__action=creditSpecialCommand.configCreditSpecialProperty" method="post" id="form2">
		<input name="id" type="hidden">
        	<div>
				<table cellspacing="1" cellpadding="1" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td style="text-align:center" class="ui-widget-content jqgrow ui-row-ltr">专案项目名称</td>
						<td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr"><input name="propertyName" maxlength="50" style="width: 80px"></td>
						<td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">是否必要条件</td>
						<td style="text-align:center;" class="ui-widget-content jqgrow ui-row-ltr">是<input type="radio" name="isNeed" style="cursor: pointer;" value="Y">&nbsp;否<input type="radio" name="isNeed" style="cursor: pointer;" value="N"></td>
					</tr>
					<tr>
						<td align="center" colspan="4">
							<br>
							<input type="button" class="ui-state-default ui-corner-all" value="保&nbsp;存" style="cursor: pointer;" onclick="updateCreditSpecial()">
							&nbsp;<input type="button" class="ui-state-default ui-corner-all" onclick="$('#updateDiv').dialog('close');" value="关&nbsp;闭" style="cursor: pointer;">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>   	
</body>
</html>