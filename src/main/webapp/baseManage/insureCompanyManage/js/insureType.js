
//险种表单验证 修改
function addInsureType(){
	if($.trim($("#intpname").val())==""){
		alert("请填写险种名称！");
		return false;
	}
	
	$("#form3").submit();
	closeDialog(insureTypeUpdate);
}
//险种修改 重置按钮重写
function newDialog(){
	var updateId = $("#intpid").val();
	closeDialog(insureTypeUpdate);
	preUpdateInsureType(updateId)
};
//作废一条保险险种记录
function deleteInsureType(intp_id){
	if(confirm('确认删除该条记录？')){
		location.href='../servlet/defaultDispatcher?__action=insureType.delete&intp_id='+intp_id;
	}else{
		return false;
	}
}

//查找并回显一条保险险种记录      更新一条记录
//function preUpdateInsureType(intp_id){
//	location.href='../servlet/defaultDispatcher?__action=insureType.getInsureTypeById&intp_id='+intp_id;
//}   insuretype  INTP_TYPE
function preUpdateInsureType(id){
	$.ajax({
		type:"get",
		url:"../servlet/defaultDispatcher",
		data:"__action=insureType.getInsureTypeById&intp_id="+id,	
		dataType:"json",
		success:function(json){
			if (json.length == 0) {
				alert("查询出错，请重试");
			}
			else { 
					$("#intpid").val("");
					$("#intpid").val(json.insuretype.INTP_ID);
					$("#intpname").val("");
					$("#intpname").val(json.insuretype.INTP_NAME);
					$("#remark1").empty();
					$("#remark1").val(json.insuretype.REMARK);
					$("#intptype").empty();
					if(json.insuretype.INTP_TYPE ==0){
						
							$("#intptype").append("<option value='0' selected='selected'>必保险种</option><option value='1'>选保险种</option>");		
									
						}else{
							
							$("#intptype").append("<option value='0' >必保险种</option><option value='1' selected='selected'>选保险种</option>");	
						};
					$("#motorflag").empty();	
					if(json.insuretype.MOTOR_FLAG ==0){
						
						$("#motorflag").append("<option value='0' selected='selected'>机动车</option><option value='1'>非机动车</option>");			
						
						}else{
							
							$("#motorflag").append("<option value='0' >机动车</option><option value='1' selected='selected'>非机动车</option>");			
							
							};				
					openAddInsureType('insureTypeUpdate');
			}
		}
	})
	
};



/**上面查看，修改，改为AJAX操作，弹出div
 * el获取值，改为AJAX填写
 * 
 * 
 */
function showInsureType(id){
	$.ajax({
		type:"get",
		url:"../servlet/defaultDispatcher",
		data:"__action=insureType.getInsureTypeById&intp_id="+id,	
		dataType:"json",
		success:function(json){
			if(json.length == 0){
				alert("查询出错，请重试");
			}else{
				var insurep= json.insuretype;
				$("#mark").empty();
				$("#mark").append("  ");
				$("#mark").append(insurep.REMARK);
				$("#inname").empty();
				$("#inname").append(insurep.INTP_NAME);
				$("#intype").empty();
				if(insurep.INTP_TYPE == 0){
					$("#intype").append("必保险种")
				}else{
					$("#intype").append("选保险种")
				}
				$("#motor").empty();
				if(insurep.MOTOR_FLAG == 0){
					$("#motor").append("机动车")
				}else{
					$("#motor").append("非机动车")
				}
				
				openAddInsureType('insureTypeShow');
			}
			
		}
	})
	
};


//查找一条保险险种记录
//function showInsureType(intp_id){
//	location.href='../servlet/defaultDispatcher?__action=insureType.getInsureTypeByIdForShow&intp_id='+intp_id;
//}



//提交添加保险险种单验证
function checkAddInsureType(){
	name=jQuery.trim($("#intp_name").val());
	if(name==""){
    	alert("请填写险种名称！");
    	return false;
    }
     $("#addInsureTypeForm").submit();
}

