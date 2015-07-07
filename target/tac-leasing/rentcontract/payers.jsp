<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function addPayer(creditId){
	$("#creditId").val(creditId);
	$("#payerId").val("");
	$("#linkmanName").val("");
	$("#linkmanMobile").val("");
	$("#addDiv").dialog({
		title:"新增缴款通知人",
		height: 160,
		width:350,
		modal: true,
		resizable:false
	});
}
function validateMobile(obj){
	var reg = /^(\d{11})?$/;
	if(!$(obj).val().match(reg)){
		alert("您输入的手机号码格式不正确！");
		$(obj).val("");
	}	
}
function savePayer(){
	if($.trim($("#linkmanName").val())==""){
		alert("缴款通知人不能为空！");
		$("#linkmanName").focus();
		return;
	}
	var reg = /^(\d{11})?$/;
	if($("#linkmanMobile").val()==""){
		alert("手机号码不能为空！");
		$("#linkmanMobile").focus();
		return;
	}
	if(!$("#linkmanMobile").val().match(reg)){
		alert("您输入的手机号码格式不正确！");
		$("#linkmanMobile").focus();
		return;
	}
	$.ajax({
		url:"${ctx}/servlet/defaultDispatcher",
		data:$("#payerForm").serialize(),
		dataType:"json",
		type:"post",
		async:false,
		success:function(data){	
			alert("操作成功");
			$("#addDiv").load("${ctx}/servlet/defaultDispatcher?__action=payerCommand.getPayers&creditId="+data.creditId);
		},
		error:function(){
			alert("操作失败，请联系系统管理员！");
		}	
	});
}
function updatePayer(name,mobile,id){
	$("#payerId").val(id);
	$("#linkmanName").val(name);
	$("#linkmanMobile").val(mobile);
	$("#payerDiv").show();
}

function deletePayer(id,creditId){
	if(confirm("确定要删除？")){
		var param ={"payerId":id};
		$.ajax({
			url:"${ctx}/servlet/defaultDispatcher?__action=payerCommand.deletePayer",
			data:param,
			dataType:"json",
			type:"post",
			async:false,
			success:function(data){	
				alert("操作成功");
				$("#addDiv").load("${ctx}/servlet/defaultDispatcher?__action=payerCommand.getPayers&creditId="+creditId);
			},
			error:function(){
				alert("操作失败，请联系系统管理员！");
			}	
		});
	}
}
function showAddPayer(){
	$("#payerId").val("");
	$("#linkmanName").val("");
	$("#linkmanMobile").val("");
	$("#payerDiv").show();
}
</script>
<div style="height:300;overflow-y: auto;">
<table class="grid_table">
	<tr>
		<th>
			缴款通知人
		</th>
		<th>
			手机号码
		</th>
		<th>
			<img src="${ctx }/images/u100.gif"><span onclick="showAddPayer()" style="cursor: pointer">增加</span>	
		</th>
	</tr>
	<c:forEach items="${payers }" var="item">
	<tr>
		<td style="text-align:center">${item.linkmanName}</td>
		<td style="text-align:center">${item.linkmanMobile}</td>
		<td style="text-align:center">
			<a href="javascript:void(0)" onclick="updatePayer('${item.linkmanName}','${item.linkmanMobile}',${item.id})" style="cursor: pointer">修改</a> 
		 	<a href="javascript:void(0)" onclick="deletePayer(${item.id},${item.creditId})" style="cursor: pointer">删除</a>		
		</td>
	</tr>
	</c:forEach>
</table>
</div>	
<div style="height:20">
</div>
<div style="height:60;display:none" id="payerDiv" >
	<form id="payerForm">
	<input type="hidden" name="creditId" id="creditId" value="${creditId }">
	<input type="hidden" name="payerId" id="payerId" value="">
	<input type="hidden" name="__action" value="payerCommand.savePayer">
	<table class="panel_table" >
		<tr>
			<th>缴款通知人：</th>
			<td><input type="text" name="name" id="linkmanName"></td>
		</tr>
		<tr>
			<th>手机号码：</th>
			<td><input type="text" name="mobile" id="linkmanMobile" onblur="validateMobile(this)" maxlength="11"></td>
		</tr>
		<tr>
			<td style="text-align:center" colspan="2">
				<input type="button" value="保&nbsp;存" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="savePayer()"> 	
			</td>
		</tr>
	</table>
	</form>
</div>
