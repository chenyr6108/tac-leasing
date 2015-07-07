<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>部门管理</title>
	
	
	<link rel="stylesheet" href="${ctx}/common/js/ztree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="${ctx}/common/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctx}/common/js/ztree/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/ztree/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript">
	
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "parentId"
				},
				key: {
					name:"displayName"
				}
			},
			callback: {
				onClick: selectDept
			}
		};
		
		var deptData = null;
		var user_map = null;
		
		function manageDept(flag,deptId){
			$("#saveBtn").removeAttr("disabled");
			$("#deptName").val("");
			$("#order").val("");
			$("#deptId").val("");
			$("#deptLeader").cleanValue();
			$("#deptLevel").get(0).selectedIndex = 0;
			var title = "新增部门";
			if(flag==1){
				var companyId = $("#select_companyId").val();
				if(companyId == ''){
					alert("请先选择公司！");
					return;
				}
				var companyName = $("#select_companyId").find("option:selected").text();
				$("#parentDept").html("");
				$("#parentId").val("");
				$("#companyId").val(companyId);
				$("#company").html(companyName);
			}else if(flag==2){
				var treeObj = $.fn.zTree.getZTreeObj("depttree");
				var nodes = treeObj.getSelectedNodes();
				if (nodes.length > 0) {
					var tId = nodes[0].id;
					$("#parentDept").html(nodes[0].displayName);
					$("#parentId").val(nodes[0].id);
					$("#companyId").val(nodes[0].companyId);
					$("#company").html(nodes[0].companyName);
					
				}else{
					alert("请先选择父级部门！");
					return;
				}				
			}else if(flag==3||flag==4){
				title = "部门修改";
				if(flag==4){
					var treeObj = $.fn.zTree.getZTreeObj("depttree");
					var nodes = treeObj.getSelectedNodes();
					if(nodes.length>0){
						deptId = nodes[0].id;
					}else{
						alert("请先选择一个部门！");
						return;
					}					
				}
				$("#deptId").val(deptId);
				$(deptData).each(function(){
					if(deptId == this.id){						
						$("#deptName").val(this.name);
						$("#deptLeader").val(this.deptLeaderName);
						$("#deptLeader_dropDownList_value").val(this.deptLeader);						
						$("#order").val(this.orderNo);
						$("#parentDept").html(this.parentName);
						$("#parentId").val(this.parentId);
						$("#companyId").val(this.companyId);
						$("#company").html(this.companyName);
						var deptLevel = this.deptLevel;
						$("#deptLevel").find("option").each(function(){
							if(this.value == deptLevel){
								$(this).attr("selected",true);
							}else{
								$(this).removeAttr("selected");
							}
						});
						return false;
					}				
					
				});
			}
			
			$("#manageDept").dialog({
				title:title,
				height: 280,
				width:480,
				modal: true,
				resizable:false
			});
		}
		
		
		function saveNewDept(){
			var deptName = $("#deptName").val();
			if(deptName == ''){
				alert('部门名称不能为空！');
				return;
			}
			if( $("#deptLevel").val() == ''){
				alert('部门等级不能为空！');
				return;
			}
			var param = $("#deptForm").serializeArray();
			$("#saveBtn").attr("disabled","disabled");
			var action = "deptCommand.saveDept";
			
			if($("#deptId").val()!=""){
				action = "deptCommand.modifyDept"; 
			}
			$.ajax({
				url:"${ctx}/servlet/defaultDispatcher?__action=" + action,
				dataType:"json",
				data:param,
				type:"post",
				async:false,
				success:function(data){
					alert("操作成功");
					$("#manageDept").dialog("close");
					showDept();

				},
				error:function(){
					alert("操作失败，请联系系统管理员！");
					$("#saveBtn").removeAttr("disabled");
				}	
			});

		}

	function showDept(){
		var companyId = $("#select_companyId").val();
		if(companyId == ''){
			alert("请选择要查看的公司！");
			return;
		}
		$("#deptCompany").val(companyId);
		var param = {"companyId":companyId};
		$.ajax({
			url:"${ctx}/servlet/defaultDispatcher?__action=deptCommand.getDeptByCompany",
			dataType:"json",
			data:param,
			type:"post",
			async:false,
			success:function(data){
				deptData = data;
				$.fn.zTree.init($("#depttree"), setting, data);
				$("#deptInfo").html("");
				showDeptTable();
				$("#deptCreateBtn").show();
				$("#deptModifyBtn").show();
				
			},
			error:function(){
				alert("操作失败，请联系系统管理员！");
			}	
		});
	}
	
	$(function(){
		$.ajax({
			url : "${ctx}/servlet/defaultDispatcher",
			data : {"__action" : "employeeCommand.getAllEmpInfo"},
			dataType : "json",
			success : function (data){
				user_map = $.map(data, function (item){
					return{
						label : item.display_name,
						value : item.option_value
					};
				});
				$("#deptLeader").dropDownList(user_map);			
			}
		});		
	});
	
	function selectDept(){
		var treeObj = $.fn.zTree.getZTreeObj("depttree");
		var nodes = treeObj.getSelectedNodes();
		var deptId = nodes[0].id;
		showDeptTable(deptId);	
	}
	
	
	function showDeptTable(deptId){	
		$("#deptInfo").html("");
		$(deptData).each(function(){	
			if(!deptId){
				$("#deptInfo").append($("<tr>").append($("<td>").html(this.name))
					.append($("<td>").html(this.deptLeaderName))
					.append($("<td>").html(this.parentName))
					.append($("<td>").html(this.orderNo))
					.append($("<td>").html(this.deptLevelName))
					.append($("<td>").html(this.companyName))
					.append($("<td>").html("<a href=\"javascript:;\" onclick=\"manageDept(3,"+this.id+")\">修改</a>&nbsp;&nbsp;<a href=\"javascript:;\" onclick=\"deleteDept("+this.id+")\">删除</a>")));
			}else if(deptId == this.parentId){
				$("#deptInfo").append($("<tr>").append($("<td>").html(this.name))
						.append($("<td>").html(this.deptLeaderName))
						.append($("<td>").html(this.parentName))
						.append($("<td>").html(this.orderNo))
						.append($("<td>").html(this.deptLevelName))
						.append($("<td>").html(this.companyName))
						.append($("<td>").html("<a href=\"javascript:;\" onclick=\"manageDept(3,"+this.id+")\">修改</a>&nbsp;&nbsp;<a href=\"javascript:;\" onclick=\"deleteDept("+this.id+")\">删除</a>")));
			}		
		});
	}
	
	function deleteDept(deptId){
		if(confirm("是否要删除该部门？")){
			var param = {"deptId":deptId};
			$.ajax({
				url:"${ctx}/servlet/defaultDispatcher?__action=deptCommand.deleteDept",
				dataType:"json",
				data:param,
				type:"post",
				async:false,
				success:function(data){
					alert("操作成功");
					showDept();					
				},
				error:function(){
					alert("操作失败，请联系系统管理员！");
				}	
			});
		}
	}
</script>
</head>
<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;部门管理</span>
   	</div>
	<div style="margin:10 0 0 20">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				
				<tr height="30px">
					<td valign="middle">
						公司名称：<select id="select_companyId">
					 			<option value="">--请选择--</option>
					 			<c:forEach var="company" items="${companys}">
						 			<option value="${company.id }">${company.name }</option>
					 			</c:forEach>
				 			</select>
 							&nbsp;&nbsp;&nbsp;<button onclick="showDept()" >查看</button>
					</td>
				</tr>
				<tr>
					<td>
					<input type="button" onclick="manageDept(1)" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="新建父部门">
					<input type="button" id="deptCreateBtn" onclick="manageDept(2)" style="padding: 2px 10px;display:none" class="ui-state-default ui-corner-all" value="新建子部门">
					<input type="button" id="deptModifyBtn" onclick="manageDept(4)" style="padding: 2px 10px;display:none" class="ui-state-default ui-corner-all" value="修改部门信息">
					</td>
				</tr>
		</table>
		<hr>
		<ul id="depttree" class="ztree" style="width:40%;height:80%;float:left"></ul>
		<div  style="width:40%;height:80%;float:left;margin-left:20px;margin-top:10px">
			<table class="grid_table">
				<tr>
					<th>部门名称</th>
					<th>部门领导</th>
					<th>父级部门</th>
					<th>部门顺序</th>
					<th>部门等级</th>
					<th>所属公司</th>
					<th>操作</th>
				</tr>
				<tbody id="deptInfo">
				
				</tbody>
			</table> 
		</div>
	</div>
	<div id="manageDept" style="display:none">
		<form action="" method="post" id="deptForm">
		<input type="hidden" name="parentId" id="parentId"/>
		<input type="hidden" name="companyId" id="companyId"/>
		<input type="hidden" name="deptId" value="" id="deptId"/>
		<table class="panel_table">
			<tr>
				<th>部门名称：</th>
				<td>
					<input type="text" name="deptName" id="deptName"/>
				</td>
			</tr>
			<tr>
				<th>部门领导：</th>
				<td>
					<input type="text" id="deptLeader" style="width: 110px; height: 20px;" name="deptLeader">
				</td>
			</tr>
			<tr>
				<th>部门等级：</th>
				<td>
					<select name="deptLevel" id="deptLevel">
						<option value="">--请选择--</option>
						<c:forEach items="${deptLevels}" var="level">
							<option value="${level.CODE}">${level.FLAG}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>部门顺序：</th>
				<td>
					<input type="text" name="order" id="order"/>
				</td>
			</tr>
			<tr>
				<th>父级部门：</th>
				<td id="parentDept">
					
				</td>
			</tr>
			<tr>
				<th>所属公司：</th>
				<td id="company">
					
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
						<input type="button" id="saveBtn" value="确&nbsp;认" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="saveNewDept()"> &nbsp;&nbsp;
						<input type="button" value="关&nbsp;闭" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="javascript:$('#manageDept').dialog('close');">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>