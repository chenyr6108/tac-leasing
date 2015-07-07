var sign = false;

function validateTagForm(){
	var tagName = $.trim($("#tag_name").val());
	var tagCode= $.trim($("#tag_code").val());
	if(tagName == ""){
		alert("标签名称不能为空！");
		return false;
	}
	
	if(tagCode == ""){
		alert("标签CODE不能为空！");
		return false;
	}
	if(sign){
		alert("标签名称已存在");
		return false;
	}
	return true;
}



function checkTagName(tagName,oldTagName){
	tagName = $.trim(tagName);
	oldTagName =  $.trim(oldTagName);
	
	if(tagName ==""){
		return;
	}
	if(oldTagName != ""){
		if(tagName == oldTagName){
			sign = false;
			return;
		}
	}
	
	$("#process").dialog({ draggable: false,resizable:false, modal: true,closeOnEscape: false ,title: "数据加载中..."});
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=tagManageCommand.checkTagName&tagName='+tagName,
		dataType:'json',
		success: function(data){
			$("#process").dialog("close" );
			sign = data.isExist;
			if(sign){
				$("#tagNameMSG").html("<img src=\'../images/wtq.gif\'/><font color=\'red\'>标签名称已存在</font>");
		
			}else{
				$("#tagNameMSG").html("<img src=\'../images/ytq.gif\'/>");
			}					
			
		}
	}); 				
}

/* 			
function checkTagCode(tagCode){
	$.ajax({
		type:'post',
		url:'${ctx}/servlet/defaultDispatcher',
		data:'__action=tagManageCommand.checkTagName&tagCode='+tagCode,
		dataType:'json',
		success: function(data){
			
		}
	}); 				
}
*/
function editTag(){
	
	if(validateTagForm()){
		$("#process").dialog({ draggable: false,resizable:false, modal: true,closeOnEscape: false ,title: "数据加载中..."});
		var param = $("#tagForm").serialize();
		$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:param,
				dataType:'json',
				success:function(data){
					$("#process").dialog("close" );
					var success = data.success;
					if(success){
						alert("操作成功");
						location.href='../servlet/defaultDispatcher?__action=tagManageCommand.getTags';
						
					}else{
						alert("操作失败");
					}					
				}
		});									
	}
}


