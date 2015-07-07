
function initRecordAreas(objId,objValue){
	$("#"+objId).find("option").each(function(){
		$(this).remove();
	});	
	$("#"+objId).append("<option value=\"\">--请选择--</option>");
	$.ajax({
		url:"../servlet/defaultDispatcher?__action=recordCommand.getRecordAreas",
		dataType:"json",
		type:"get",
		success:function(data){
			var selected = "";
			if(data){
				for(var i=0;i<data.length;i++){
					if(data[i].ID==objValue){
						selected = " selected=\"selected\" ";
					}else{
						selected = "";
					}
					$("#"+objId).append("<option value=\""+ data[i].ID +"\"" + selected + " >"+data[i].AREA_NAME+"</option>");
				}
			}
		},
		error:function(){
			alert("操作失败，请联系系统管理员！");
		}	
	});	
}

function resetRecordPosition(a1,a2,a3,a4){
	initRecordAreas(a1);
	resetSelect(a2);
	resetSelect(a3);
	resetSelect(a4);
}

function resetSelect(id){
	if(!id){
		return;
	}
	$("#"+id).find("option").each(function(){
		$(this).remove();
	});	
	$("#"+id).append("<option value=\"\">--请选择--</option>");
	if(id=="record_floor" || id=="return_to_floor" || id=="transfer_to_floor" || id=="batch_to_floor"){
		$("#"+id).attr("qty",0);
		if(id=="record_floor"){
			$("#record_qty").html("");
		}else if(id=="return_to_floor"){
			$("#return_qty").html("");
		}else if(id=="transfer_to_floor"){
			$("#transfer_qty").html("");
		}else if(id=="batch_to_floor"){
			$("batch_qty").html("");
		}
	}
}
function initRecordRooms(parentValue,objId,objValue,subId,subId2){
	$("#"+objId).find("option").each(function(){
		$(this).remove();
	});	
	$("#"+objId).append("<option value=\"\">--请选择--</option>");
	if(objValue ==''){
		resetSelect(subId);
		resetSelect(subId2);
	}
	if(!parentValue || parentValue ==''){
		return;
	}
	var params = {id:parentValue};
	$.ajax({
		url:"../servlet/defaultDispatcher?__action=recordCommand.getRecordRooms",
		dataType:"json",
		data:params,
		type:"get",
		success:function(data){
			var selected = "";
			if(data){
				for(var i=0;i<data.length;i++){
					if(data[i].ID==objValue){
						selected = " selected=\"selected\" ";
					}else{
						selected = "";
					}
					$("#"+objId).append("<option value=\""+ data[i].ID +"\"" + selected + " >"+data[i].ROOM_NAME+"</option>");
				}
			}
		},
		error:function(){
			alert("操作失败，请联系系统管理员！");
		}	
	});	
}

function initRecordChests(parentValue,objId,objValue,subId){
	$("#"+objId).find("option").each(function(){
		$(this).remove();
	});	
	$("#"+objId).append("<option value=\"\">--请选择--</option>");
	if(objValue ==''){
		resetSelect(subId);
	}
	var params = {id:parentValue};
	$.ajax({
		url:"../servlet/defaultDispatcher?__action=recordCommand.getRecordChests",
		dataType:"json",
		data:params,
		type:"get",
		success:function(data){
			var selected = "";
			if(data){
				for(var i=0;i<data.length;i++){
					if(data[i].ID==objValue){
						selected = " selected=\"selected\" ";
					}else{
						selected = "";
					}
					$("#"+objId).append("<option value=\""+ data[i].ID +"\"" + selected + " >"+data[i].CHEST_NAME+"</option>");
				}
			}
		},
		error:function(){
			alert("操作失败，请联系系统管理员！");
		}	
	});	
}

function initRecordFloors(parentValue,objId,objValue){
	$("#"+objId).find("option").each(function(){
		$(this).remove();
	});	
	$("#"+objId).attr("qty",0);
	$("#"+objId).append("<option value=\"\">--请选择--</option>");
	
	var params = {id:parentValue};
	$.ajax({
		url:"../servlet/defaultDispatcher?__action=recordCommand.getRecordFloors",
		dataType:"json",
		data:params,
		type:"get",
		success:function(data){
			var selected = "";
			if(data){
				for(var i=0;i<data.length;i++){
					if(data[i].ID==objValue){
						selected = " selected=\"selected\" ";
					}else{
						selected = "";
					}
					$("#"+objId).append("<option value=\""+ data[i].ID +"\"" + selected + " >"+data[i].FLOOR_NAME+"</option>");
				}
			}
		},
		error:function(){
			alert("操作失败，请联系系统管理员！");
		}	
	});	
}

function initRecordFloorsByRectId(parentValue,objId,objValue){
	$("#"+objId).find("option").each(function(){
		$(this).remove();
	});	
	$("#"+objId).attr("qty",0);
	$("#"+objId).append("<option value=\"\">--请选择--</option>");
	var rect_id = $("#rect_id").val();
	var params = {id:parentValue,rect_id:rect_id};
	$.ajax({
		url:"../servlet/defaultDispatcher?__action=recordCommand.getRecordFloors",
		dataType:"json",
		data:params,
		type:"get",
		success:function(data){
			var selected = "";
			if(data){
				for(var i=0;i<data.length;i++){
					if(data[i].ID==objValue){
						selected = " selected=\"selected\" ";
					}else{
						selected = "";
					}
					$("#"+objId).append("<option value=\""+ data[i].ID +"\"" + selected + " >"+data[i].FLOOR_NAME+"</option>");
				}
			}
		},
		error:function(){
			alert("操作失败，请联系系统管理员！");
		}	
	});	
}

function getTodayDate(){
	var date = new Date();
	return formatDate(date);
}

function formatDate(date){
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	if(month<10){
		month = "0" + month;
	}
	if(day<10){
		day = "0" + day;
	}
	return year + "-"+month + "-"+ day;
}

function addDays(days){
	var date = new Date()
	date = new Date(date.getTime() + days * 24 *3600 *1000);
	return formatDate(date);
}

function isPositiveInteger(number){
	var reg = /^\d+$/;
	if(number.match(reg)){
		if(number==0){
			return false;
		}
		return true;
	}else{
		return false;
	}
}