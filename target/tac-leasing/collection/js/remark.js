//支付表弹出备注
//ajax 查询并显示备注
function showRemarkLog(id){
	$("#remark1").empty()
	$("#unusual").empty()
	$("#RECPID").val(id);
	$.ajax({
		
		type: "post",
		url: "../servlet/defaultDispatcher",
		data: "__action=handlePaylistService.showRemarkLog&RECP_ID="+id,
		dataType: "json",
		success: function(json){
			var remark=json.remark;
			var info = json.info;
			
			if (remark == null||remark.length== 0) {
				$("#remark1").append("<tr><td>无备注信息</td></tr>")
			}
			
			if(remark != null){
				
					if(remark.length >0){
					for(var i=0 ;i<remark.length ;i++){
						$("#remark1").append("<tr  ><td class='ui-widget-content jqgrow ui-row-ltr' style='width:140px'>"+remark[i].CREATE_TIME+"&nbsp;&nbsp;</td><td class='ui-widget-content jqgrow ui-row-ltr' style='width:80px'>"+remark[i].NAME+"&nbsp;&nbsp;</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+remark[i].REMARK +"</td></tr>")
					}
				}
			}
			
			if(info == null||info.length == 0){
				$("#unusual").append("<tr><td>无备注信息</td></tr>")
			}
			
			if(info != null){
				if(info.length >0){
					for(var i=0 ;i<info.length ;i++){
						$("#unusual").append("<tr  ><td class='ui-widget-content jqgrow ui-row-ltr' style='width:140px'>"+info[i].CREATE_TIME+"&nbsp;&nbsp;</td><td class='ui-widget-content jqgrow ui-row-ltr' style='width:80px'>"+info[i].NAME+"&nbsp;&nbsp;</td><td class='ui-widget-content jqgrow ui-row-ltr'>"+info[i].REMARK +"</td></tr>")
					}
				}
			}
			
			
			
			
				
			openChangePassDiv('remarkBlog')
		},
		error: function(){
			
		}
	});
	
	
	
}
           
		   
		   
		   
// 取消
function cancel(){
		$("#remark1").empty()
	$("#unusual").empty()
	$("#remarkContent").val("")
		$("#unusualContent").val("")
		closeDialog('remarkBlog')
		
}


//确定
function saveContent(){
	
	var remark = $.trim($("#remarkContent").val())
	var unusual =  $.trim($("#unusualContent").val())
	var id = $("#RECPID").val()
	
	if(remark.length != 0 || unusual.length != 0){
		
		$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:{"__action":"handlePaylistService.conserve","remark":remark,"unusual":unusual,"id":id},
			dataType:"json",
			success: function(json){
				
				if(json.result == 1){
					
					
				}
				
				cancel()
			},
			error : function(){
				
				cancel()
			}
			
			
		});
		
	
	
	
	}
	
	cancel()
}
function checkAll(e, itemName)
{
  var aa = document.getElementsByName(itemName);
  for (var i=0; i<aa.length; i++)
   aa[i].checked = e.checked;
}
function checkItem(e, allName)
{
/*  var all = document.getElementsByName(allName)[0];*/
  if(!e.checked){ 
	  all.checked = false;
  }else{
    var aa = document.getElementsByName(e.name);
    for (var i=0; i<aa.length; i++){
     if(!aa[i].checked) return;
    }
/*    all.checked = true;*/
  }
}