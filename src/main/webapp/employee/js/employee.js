//加载公司人员信息
$(function () {
	$.ajax({type:"post", url:"../servlet/defaultDispatcher", data:"__action=employee.getAllEmployee", dataType:"json", success:initCompleteUpperName});
});

function initCompleteUpperName(data) {
	dataList = data.employeeList;
	$("#upper_name").autocomplete(dataList, options);
	$("#upper_name").result(function (event, data, formatted) {
		if (data != null) {
			$("#upper_user").val(data.ID);
		}
	});
}

//initCompleteUpperName  公司人员信息
var options = {
		minChars : 1,
		max : 20,
		mustMatch: true,
		matchContains: true,
		formatItem : function(row, i, max) {
			var rs = row.NAME;
			return rs;
		},
		formatMatch : function(row, i, max) {
			return row.id + " " + row.NAME;
		},
		formatResult : function(row) {
			return row.NAME;
		}
	};
//	$.ajax({
//		type:'post',
//		url:'../servlet/defaultDispatcher',
//		data:'__action=employee.getAllEmployee',
//		dataType:'json',
//		success:function(dataBack){
//			zhuguanList=dataBack; 
//		}
//	});
	
	
function getChangeJob(){ 
	if($("#job").val()=='1'){
		$("#showUpper").html(" 主管姓名: "); 
		$("<select id='upper_user' name='upper_user'></select>   ").appendTo("#showUpper");
		for(i=0;i<zhuguanList.zhuguan.length;i++){ 
			$("#upper_user").get(0).options.add(new Option(zhuguanList.zhuguan[i].NAME,zhuguanList.zhuguan[i].ID));
		}
	}else{
		$("#showUpper").html("");
	}
}
/*function loadCompanyInfo(){
		var chang=$("#decp_id2").find("option").length;
		for(var j=0;j<=chang;j++){	
			$("#decp_id2>option:eq(1)").remove();
		}
		var chang2=$("#dept_id").find("option").length;
		for(var j=0;j<=chang2;j++){	
			$("#dept_id>option:eq(1)").remove();
		}		
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employee.getCompany&decp_id='+by("decp_id").value,
		dataType:'json',
		success: function(dataBack){ 
			for(i=0;i<dataBack.companys.length;i++){
			 	$("#decp_id2").get(0).options.add(new Option(dataBack.companys[i].DECP_NAME_CN,dataBack.companys[i].DECP_ID));
			} 
		}
	});
}

//加载部门信息
function loadDeptInfo(){
		var chang=$("#dept_id").find("option").length;
		for(var j=0;j<=chang;j++){	
			$("#dept_id>option:eq(1)").remove();
		}
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employee.getDept&decp_id2='+by("decp_id2").value,
		dataType:'json',
		success: function(dataBack){ 
			for(i=0;i<dataBack.depts.length;i++){
			 	$("#dept_id").get(0).options.add(new Option(dataBack.depts[i].DEPT_NAME,dataBack.depts[i].ID));
			}
		}
	});
	
}
*/

//加载公司信息
function loadCompanyInfo(item_id){
		var chang=$("#decp_id2_" + item_id).find("option").length;
		for(var j=0;j<=chang;j++){	
			$("#decp_id2_" + item_id + ">option:eq(0)").remove();
		}
		var chang2=$("#dept_id_" + item_id).find("option").length;
		for(var j=0;j<=chang2;j++){	
			$("#dept_id_" + item_id + ">option:eq(0)").remove();
		}		
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employee.getCompany&decp_id='+by("decp_id_" + item_id).value,
		dataType:'json',
		success: function(dataBack){ 
			$("#decp_id2_" + item_id).get(0).options.add(new Option("--请选择--",""));
			for(var i=0;i<dataBack.companys.length;i++){
			 	$("#decp_id2_" + item_id).get(0).options.add(new Option(dataBack.companys[i].DECP_NAME_CN,dataBack.companys[i].DECP_ID));
			}
			
		}
	});
}

//加载部门信息
function loadDeptInfo(item_id){
		var chang=$("#dept_id_" + item_id).find("option").length;
		for(var j=0;j<=chang;j++){	
			$("#dept_id_" + item_id + ">option:eq(0)").remove();
		}
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employee.getDept&decp_id2='+by("decp_id2_" + item_id).value,
		dataType:'json',
		success: function(dataBack){ 
			$("#dept_id_" + item_id).get(0).options.add(new Option("--请选择--",""));
			for(var i=0;i<dataBack.depts.length;i++){
			 	$("#dept_id_" + item_id).get(0).options.add(new Option(dataBack.depts[i].DEPT_NAME,dataBack.depts[i].ID));
			}
		}
	});
}

//添加员工表单验证
function addEmployee(dept_count){
	if(trim(by("name").value)==""||trim(by("code").value)==""||trim(by("password").value)==""||trim(by("password2").value)==""||trim(by("job").value)==""||trim(by("upper_name").value)==""){
		alert("请填写必填项！");
		return false;
	}
	if($("#id_cardAge").val()=="未知")
	{
		alert("请填写年龄");
		return false;
	}
	/*if(by("decp_id").value==-1){
		alert("请选择公司类型！");
		return false;
	}
	if(by("decp_id2").value==-1){
		alert("请选择所在公司！");
		return false;
	}		
	if(by("dept_id").value==-1){
		alert("请选择所在部门！");
		return false;
	}*/
	
	var flag = false;
	for ( var i = 1; i <= dept_count; i++) {
		var comp = $("select[id=decp_id_" + i + "]").val();
		var comp_2 = $("select[id=decp_id2_" + i + "]").val();
		var dept = $("select[id=dept_id_" + i + "]").val();
		if(comp != "" && comp_2 != "" && dept != ""){
			flag = true;
		}
	}
	
	if(!flag){
		alert("请选择所在部门！");
		return false;
	}
	
	if($("#job").val() == -1 ){
		alert("请选择员工职务！");
		$("#job").focus();
		return false;
	}
	
	if(!isAlike(by("password"),by("password2"))){
		alert("两次输入密码不一致！");
		return false;
	}
	if(by("NODE").value==-1){
		alert("请选择功能标识！");
		return false;
	}	
	$("#form1").submit();
}


function setPassword(){
	$("#password").val(CalcuMD5("password","form1",false));
}

function checkPassword(){
	$("#password2").val(CalcuMD5("password2","form1",false));
}

//作废一条员工记录
function invalidEmployee(id, userName){
	if(confirm('确认作废该条记录？')){
		location.href='../servlet/defaultDispatcher?__action=employee.invalid&id='+id + '&userName=' + userName;
	}else{
		return false;
	}
}

//查找并回显一条员工记录
function preUpdateEmployee(id){
	location.href='../servlet/defaultDispatcher?__action=employee.getEmployeeById&id='+id;
}

//查找一条员工记录
function showEmployee(id){
	location.href='../servlet/defaultDispatcher?__action=employee.getEmployeeByIdForShow&id='+id;
}

//重置密码
function resetPass(id){	
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=employee.resetPass&id='+id,
		dataType:'json',
		success: function(){ 
			alert("重置密码成功!");
		}
	});
}

