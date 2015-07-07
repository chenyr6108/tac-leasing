//查看
function showActLog(id){
	location.href='../servlet/defaultDispatcher?__action=activityLogging.showActLog&actlog_id='+id;
}
//作废
function deleteActLog(id){
	if(confirm('确认作废该条记录？')){
		location.href='../servlet/defaultDispatcher?__action=activityLogging.deleteActLog&actlog_id='+id;
	}else{
		return false;
	}	
}
//添加页面初始化
function addActLog() {
	location.href='../servlet/defaultDispatcher?__action=activityLogging.createPreActLog';
}

//添加资料页面    验证 
function addActLogInfor(){ 
	if(trim(by("actlog_name").value)==""){	
		alert("活动日志名称不能为空");
		$("#actlog_name").focus();
		return false;
	}
	var select1=document.getElementById("actlog_type");
	if(select1.value==0){
		alert("请选择日志类型");
		return false;
	}
	$("#form1").submit();
}
//更新资料    验证
function updateActLogInfor(){
	if(trim(by("actlog_name").value)==""){	
		alert("活动日志名称不能为空");
		$("#actlog_name").focus();
		return false;
	}
	var select1=document.getElementById("actlog_type");
	if(select1.value==0){
		alert("请选择日志类型");
		return false;
	}
	$("#form1").submit();
}

//更新页面初始化
function preUpdateActLog(id){
	location.href='../servlet/defaultDispatcher?__action=activityLogging.updatePreActLog&actlog_id='+id;
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
 
  //delete rentLog
function invalidRentLog(id){
	if(confirm('确认作废该条记录？')){
		location.href='../servlet/defaultDispatcher?__action=fileService.invalidRentLog&trfl_id='+id;
	}else{
		return false;
	}	
}