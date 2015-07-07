//判断是否要添加二级菜单
function showFirstResource(){
	type=$("#type").val();
	if(type==1){
		$("#showAddDiv").css("height",230);
		$("#showTr").css("display","none");
	}else{
		$("#showAddDiv").css("height",260);
		$("#showTr").css("display","");
	}
}
//弹出添加角色的层
			function openAddRole(){
				$('#addRoleDiv').dialog({
					modal:true,
					autoOpen: false,
					width: 400
				});
				$('#addRoleDiv').dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
			//根据角色ID异步查询该角色，回显数据用于更新
			function preUpdateRole(id){
				$.ajax({
					type:"post",
					url:"../servlet/defaultDispatcher",
					data:"__action=role.getRoleByID&id="+id,
					dataType:"json",
					success:function(dataBack){
						$("#update_name").val(dataBack.rs.NAME);
						$("#update_memo").val(dataBack.rs.MEMO);
						 $("#update_id").val(dataBack.rs.ID);
						
						$('#updateRoleDiv').dialog({
							modal:true,
							autoOpen: false,
							width: 400
						});
						$('#updateRoleDiv').dialog('open');
					},
					error:function(){
						alert("加载数据出现错误！");
					}
				});
			}
//弹出添加资源的层
			function openAddResource(){
				$('#addResourceDiv').dialog({
					modal:true,
					autoOpen: false,
					width: 500
				});
				$('#addResourceDiv').dialog('open');
			}
			//根据资源id查找该资源，弹出更新资源的层
			 function updateResource(id){
				$.ajax({
				type:"post",
				url:"../servlet/defaultDispatcher",
				data:"__action=permission.getResourceById&id="+id,
				dataType:"json",
				success:function(dataBack){
				    $("#update_id").val(dataBack.rs.ID);
					$("#update_name").val(dataBack.rs.NAME);
					$("#update_layout").val(dataBack.rs.LAYOUT);
					$("#update_code").val(dataBack.rs.PERMISSION_CODE);
					if(dataBack.rs.PARENT_ID==0){ 
						$("#update_type").val(1);
						$("#showUpdateDiv").css("height",230);
						$("#showTr2").css("display","none");
						
					}else{
						$("#update_type").val(2);
						$("#showUpdateDiv").css("height",260);
						$("#showTr2").css("display","");
						$("#update_parent_id").val(dataBack.rs.PARENT_ID);
					}
					$("#update_levelNum").val(dataBack.rs.LEVEL_NUM);
					$("#update_memo").val(dataBack.rs.MEMO);
					
					$('#updateResourceDiv').dialog({
						modal:true,
						autoOpen: false,
						width: 400
					});
					$('#updateResourceDiv').dialog('open');
				}
				});
			 }
//按照条件搜索资源。将当前页置为1
function doSearch(){
    $("#__currentPage").val("1");
	$("#form1").submit();
}

//弹出确认对话框，避免误操作作废
function deleteResource(id, resName){
	if(confirm('确认作废?')){
		location.href='../servlet/defaultDispatcher?__action=permission.invalidResource&id=' + id + "&resName=" + resName;
	}else{
		return false;
	}
}
 
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    
		
        if(event.keyCode==13)
        {
                document.getElementById("search").click();   
                return false;                               
        }
 } 
 //提交添加资源表单时验证
 function addResource(){
 	name=jQuery.trim($("#name").val());
    layout=jQuery.trim($("#layout").val());
    var code = jQuery.trim($("#code").val());
    if(code==""){
    	alert("请填写资源编号！");
    	return false;
    }
    if(name==""){
    	alert("请填写资源名称！");
    	return false;
    }
     if(layout==""){
    	alert("请填写资源地址！");
    	return false;
    }
    $("#addResourceForm").submit();
 }
 
 
 //判断是否要添加二级菜单
function showFirstResource2(){
	type=$("#update_type").val();
	if(type==1){
		
		$("#showUpdateDiv").css("height",230);
		$("#showTr2").css("display","none");
	}else{
	
		$("#showUpdateDiv").css("height",260);
		$("#showTr2").css("display","");
	}
}


 //提交更新资源表单时验证
 function update(){
 	name=jQuery.trim($("#update_name").val());
    layout=jQuery.trim($("#update_layout").val());
    if(name==""){
    	alert("请填写资源名称！");
    	return false;
    }
     if(layout==""){
    	alert("请填写资源地址！");
    	return false;
    }
    $("#updateResourceForm").submit();
 }
 
 

//提交添加角色时表单验证
function checkAddRole(){
	name=jQuery.trim($("#add_name").val());
	if(name==""){
    	alert("请填写角色名称！");
    	return false;
    }
     $("#addRoleForm").submit();
}



//提交更新角色时表单验证
function checkUpdateRole(){
	name=jQuery.trim($("#update_name").val());
	if(name==""){
    	alert("请填写角色名称！");
    	return false;
    }
     $("#updateRoleForm").submit();
}

//根据资源id将该资源从角色中去除
function invalidResource(resourceId){
	roleId=$("#id").val();
	location.href="../servlet/defaultDispatcher?__action=role.invalidResource&roleId="
	+roleId+"&resourceId="+resourceId;
 
}

//根据资源id将该资源添加到角色中
function validResource(resourceId){
	roleId=$("#id").val();
	location.href="../servlet/defaultDispatcher?__action=role.validResource&roleId="
	+roleId+"&resourceId="+resourceId;
}

//添加用户角色对应关系
function validUser2Role(employeeId){
	roleId=$("#id").val();
	var content = $("input[name='content']").val();
	location.href="../servlet/defaultDispatcher?__action=role.validUser2Role&roleId="
	+roleId+"&employeeId="+employeeId+"&content="+content;
}

//删除用户角色对应关系
function invalidUser2Role(employeeId){
	roleId=$("#id").val();
	location.href="../servlet/defaultDispatcher?__action=role.invalidUser2Role&roleId="
	+roleId+"&employeeId="+employeeId;
}

//作废角色
function invalidRole(roleId, roleName){ 
	if(confirm('确认作废？')){
		location.href="../servlet/defaultDispatcher?__action=role.invalidRole&roleId="
		+roleId + "&roleName=" + roleName;
	}
}