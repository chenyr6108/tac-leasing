addData=function() {
	
	window.location.href="../baseManage/dataDictionary/dictionaryAdd.jsp";
	
};

function updateData(msg){
		$("#temp1type").val(msg)
		$("#temp1").submit();
		
	}
	
	
	
	
	function deleteOne(msg){
		if(confirm("确定要删除此记录？")){
			
	$("#temp2t").val(msg)
		$("#temp2").submit();
		}
		else{
			return false;
		}
		
	} 
//添加类型页面用
function addDictionary() {
	
		
		 if(!checkNull()){
			return ;
		}
		 
		 $("#TYPE0").parent().remove();
		 $("input[name ='defaultValue']").parent().remove();
		 $("input[name^='Ve']").parent().remove();
		
		
			$("#addForm").submit();
	}
//表单验证，至少有1条数据，页面提交才能通过	
function  checkData(){
	$("#check").empty();
	if($.trim($("#FLAG1").val()).length == 0){
		$("#check").append("<font color='red'>新建类型至少需要一条数据!</font> ")
	}
	
	
};	

//判断填写是否有重复的名称 FLAG

function checkFlag(){

var fl=	$("input[name='FLAG']");
//	alert(fl.length);

	for(var i=0;i<fl.length;i++ ){
//		alert(i);
		for(var j=i+1; j<fl.length;j++){
//			alert(j);
//			alert(fl[i].value +"----"+ fl[j].value);
			if(fl[i].value == fl[j].value){
				alert("名称不能相同！！")
				
				return false;
			}
			
		}
	}
	
	return true;
	
	
}

//根据页面添加的数据条数，改变选择顺序的选项数

function changSelect(){
	
	
	
	$("select[name='LEVEL_NUM']").each(function(index){
	
		child =  $("#data1").children().eq(0);
		var len = child.children().length;
		
		var vval = $(this).val();
		
		$(this).empty();
		
		
		
		  
			
			for(var i = 1 ;i<len ;i++){
				
				
				if(i == (index+1) ){
					
					$(this).append("<OPTION VALUE='"+i +"' selected='selected'>"+i +"</OPTION>")
					
				}else{
					
					$(this).append("<OPTION VALUE='"+i +"' >"+i +"</OPTION>")
				}
				
				
			}
	 
		
		
	} )
	
	
	
	
}
	
function changSelect2(){
	
	
	
	$("select[name='LEVEL_NUM']").each(function(index){
	
		child =  $("#data2").children().eq(0);
		
		var len = child.children().length;
		
			var vval = $(this).val();
			
		$(this).empty();
		
		
		if(vval > 0){
			
			for(var i = 1 ;i<len ;i++){
				
			if(i  == vval ){
					
					$(this).append("<OPTION VALUE='"+i +"' selected='selected'>"+i +"</OPTION>")
					
				}else{
					
					$(this).append("<OPTION VALUE='"+i +"' >"+i +"</OPTION>")
				}
				
				
			}
			
		}else{
			
			for(var i = 1 ;i<len ;i++){
				
				
				if(i < (len-1) ){
					
					$(this).append("<OPTION VALUE='"+i +"' >"+i +"</OPTION>")
					
				}else{
					
						$(this).append("<OPTION VALUE='"+i +"' selected='selected'>"+i +"</OPTION>")
				}
				
				
			}
		}
		
		
	
		
	} )
	
	
	
	
}
	
	
//判断类型名称是否已存在
function check(){
		var type = $("#TYPE").val();
		if (type=="") {
			alert("请填写类型!");
			return;
		}
		$.ajax({
		type:"post",
		url:"../servlet/defaultDispatcher",
		data:"__action=dataDictionary.checkType&type="+type,
		dataType:"json",
		success:function(json){
				if(json.count>=1) {
					$("#check").html("<font color='red'>类型存在!</font>");
				} else {
					$("#check").html("<font>类型有效!</font>");
				}
		},
		error:function(){
			
		   }
	     });
		
	}
	
function delTr(){
	
		$("input[name='del']").click(function(){
				 
						$(this).parent().parent().remove();
						
						changSelect();
				}
			)
		
		
	
	}
	
	
function delTr2(){
	
		$("input[name='del']").click(function(){
				 
					$(this).parent().parent().remove();
				
					changSelect2();
				}
			)
			
	
	
	}


	
//为表单提交填写隐藏域 def开头defaultValue 的选择项 用户选择后修改
function chooseDefault(num){
	$("input[name^='DEFAULT_VALUE']").val("0");
	
	$("#DEFAULT_VALUE"+num).val("1");

}
function chooseF(num){
	$("#STATUS"+num).val("-1");
	//alert($("#STATUS"+num).val());
}	
function chooseT(num){
	$("#STATUS"+num).val("0");
	//alert($("#STATUS"+num).val());
}	
//级别的修改
function addLevel(){
	
	$("input[name='smooth']").each(function(){
		
		$(this).val();
//		alert($(this).val());
	 var sel =	($(this).parent().parent()).find("select");
	
		sel.val($(this).val());
			
	});
}







function updateSelect() {
		if(!addTypeValue()){
			return;
		}
		
//名称，标示不能为空
		if(!checkNull()){
			return ;
		}
		
		if(!checkFlag()){
			return ;
		}
		
		$("#detailForm").submit();
	}
		

function checkNull(){
	var sub = true;
		
	$("input[name='FLAG']").each(function(){
		if($.trim($(this).val()).length == 0){
			alert("名称不能为空!! 如果有空行请删除！！ ")
			
			sub = false;
			return false;
			
		}
	});
	if(!sub){
		return false;
	}
		
	$("input[name='CODE']").each(function(){
		if($.trim($(this).val()).length == 0){
			alert("标示不能为空!!")
			sub = false;
			return false;
		}
	})
	if(!sub){
		return false;
	}
	
	return true;
}	
