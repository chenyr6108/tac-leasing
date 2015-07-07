//选中字加亮
function tdTextLight(vtd){  
	$("td").css("color","black");
	vtd.style.color="red";
}
//异步加载总公司信息
function loadCompany(){ 
	$("#openFlag").val("1"); 
	$("#id").val("0");
	$("#name").val("");
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=department.getCompanys',
		dataType:'json',
		success: function(dataBack){ 
			if(dataBack.companyList.length<=5){
			     str="<tr>";
				for(i=0;i<dataBack.companyList.length;i++){ 
				 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showCompanyAndDept("+dataBack.companyList[i].DECP_ID+",\""+dataBack.companyList[i].DECP_NAME_CN+"\");tdTextLight(this);'>"+dataBack.companyList[i].DECP_NAME_CN+"</td>";
				}
			 	for(i=0;i<(5-dataBack.companyList.length);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				str=str+"</tr>";
				$("#companyTable").html(str);
			}else{
					 str="";
					 for(i=0;i<dataBack.companyList.length;i++){ 
					 	if(i%5==0){
					 		str=str+"<tr>";
					 	}
					 str=str+"<td width='20%' style='cursor: pointer;' onclick='showCompanyAndDept("+dataBack.companyList[i].DECP_ID+",\""+dataBack.companyList[i].DECP_NAME_CN+"\");tdTextLight(this);'>"+dataBack.companyList[i].DECP_NAME_CN+"</td>";
					 	if((i+1)%5==0){
					 		str=str+"</tr>";
					 	}
					}
					if(dataBack.companyList.length%5!=0){
					for(i=0;i<(5-dataBack.companyList.length%5);i++){ 
				 		str=str+"<td width='20%'>&nbsp;</td>";
				 	} 
					   str=str+"</tr>";
					}
					$("#companyTable").html(str);
			} 
			$("#secondTr").css("display","none");
			$("#therdTr").css("display","none");
			$("#fourthTr").css("display","none");
			$("#companydept").css("display","none");
			$("#fen").css("display","none");
		}
	});
}

//异步加载总公司下面的部门信息和分公司信息
function showCompanyAndDept(id,name){
	$("#node").val("1");
	$("#openFlag").val("2"); 
	$("#id").val(id);
	$("#name").val(name);
	$("#xuanze").css("display","");
	$("#xuanze2").css("display","none");
	$("#xuanze3").css("display","none");
	$("#xuanze4").css("display","none");
	$("#wei").html(name);
	//总公司下面的部门
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=department.getDept&parentId='+id,
		dataType:'json',
		success: function(dataBack){ 
			if(dataBack.deptList.length<=5){
		     str="<tr>";
			for(i=0;i<dataBack.deptList.length;i++){ 
			 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptTherd("+dataBack.deptList[i].ID+",\""+dataBack.deptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.deptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.deptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
			}
		 	for(i=0;i<(5-dataBack.deptList.length);i++){ 
		 		str=str+"<td width='20%'>&nbsp;</td>";
		 	} 
			str=str+"</tr>";
			$("#companyDept").html(str);
		}else{
			 str="";
			 for(i=0;i<dataBack.deptList.length;i++){ 
			 	if(i%5==0){
			 		str=str+"<tr>";
			 	}
			 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptTherd("+dataBack.deptList[i].ID+",\""+dataBack.deptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.deptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.deptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
			 	if((i+1)%5==0){
			 		str=str+"</tr>";
			 	}
			}
			if(dataBack.deptList.length%5!=0){
			for(i=0;i<(5-dataBack.deptList.length%5);i++){ 
		 		str=str+"<td width='20%'>&nbsp;</td>";
		 	} 
			   str=str+"</tr>";
			}
			$("#companyDept").html(str);
		} 
		$("#fen").css("display","");
		$("#companydept").css("display","");
		$("#secondTr").css("display","none");
		$("#therdTr").css("display","none");
		$("#fourthTr").css("display","none");
		}
	});	
	//分公司信息
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.getFenCompanys&parentId='+id,
			dataType:'json',
			success: function(dataBack){ 
				if(dataBack.companyFenList.length<=5){
			     str="<tr>";
				for(i=0;i<dataBack.companyFenList.length;i++){ 
				 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showCompanyXiaDept("+dataBack.companyFenList[i].DECP_ID+",\""+dataBack.companyFenList[i].DECP_NAME_CN+"\");tdTextLight(this);'>"+dataBack.companyFenList[i].DECP_NAME_CN+"</td>";
				}
			 	for(i=0;i<(5-dataBack.companyFenList.length);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				str=str+"</tr>";
				$("#fenCompany").html(str);
			}else{
					 str="";
					 for(i=0;i<dataBack.companyFenList.length;i++){ 
					 	if(i%5==0){
					 		str=str+"<tr>";
					 	}
					 str=str+"<td width='20%' style='cursor: pointer;' onclick='showCompanyXiaDept("+dataBack.companyFenList[i].DECP_ID+",\""+dataBack.companyFenList[i].DECP_NAME_CN+"\");tdTextLight(this);'>"+dataBack.companyFenList[i].DECP_NAME_CN+"</td>";
					 	if((i+1)%5==0){
					 		str=str+"</tr>";
					 	}
					}
						if(dataBack.companyFenList.length%5!=0){
						for(i=0;i<(5-dataBack.companyFenList.length%5);i++){ 
					 		str=str+"<td width='20%'>&nbsp;</td>";
					 	} 
						   str=str+"</tr>";
						}
					$("#fenCompany").html(str);
				} 
			$("#fen").css("display","");
			$("#companydept").css("display","");
			$("#secondTr").css("display","none");
			$("#therdTr").css("display","none");
			$("#fourthTr").css("display","none");
			}
		});	
}

//异步加载总公司    部门     分部门信息
function showDeptTherd(id,name){ 
	$("#node").val("0");
	$("#openFlag").val("3");
	$("#id").val(id);
	$("#name").val(name);
	$("#wei4").html(name);
	$("#xuanze2").css("display","");
	$("#xuanze3").css("display","none");
	$("#xuanze4").css("display","none");
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.getFenDept&parentId='+id,
			dataType:'json',
			success: function(dataBack){ 
				if(dataBack.fenDeptList.length<=5){
			     str="<tr>";
				for(i=0;i<dataBack.fenDeptList.length;i++){ 
				 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptFifth2("+dataBack.fenDeptList[i].ID+",\""+dataBack.fenDeptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.fenDeptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.fenDeptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
				}
			 	for(i=0;i<(5-dataBack.fenDeptList.length);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				str=str+"</tr>";
				$("#secondDept").html(str);
			}else{
				 str="";
				 for(i=0;i<dataBack.fenDeptList.length;i++){ 
				 	if(i%5==0){
				 		str=str+"<tr>";
				 	}
				 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptFifth2("+dataBack.fenDeptList[i].ID+",\""+dataBack.fenDeptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.fenDeptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.fenDeptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
				 	if((i+1)%5==0){
				 		str=str+"</tr>";
				 	}
				}
				if(dataBack.fenDeptList.length%5!=0){
				for(i=0;i<(5-dataBack.fenDeptList.length%5);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				   str=str+"</tr>";
				}
				$("#secondDept").html(str);
			}				
			$("#secondTr").css("display","");
			$("#therdTr").css("display","none");
			$("#fourthTr").css("display","none");
			}
		});
}

//异步加载总公司    分公司     部门信息
function showCompanyXiaDept(id,name){ 
	$("#node").val("1");
	$("#openFlag").val("4");
	$("#id").val(id);
	$("#name").val(name);
	$("#wei6").html(name);
	$("#xuanze3").css("display","");
	$("#xuanze2").css("display","none");
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.getDept&parentId='+id,
			dataType:'json',
			success: function(dataBack){ 
				if(dataBack.deptList.length<=5){
			     str="<tr>";
				for(i=0;i<dataBack.deptList.length;i++){ 
				 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptFourth("+dataBack.deptList[i].ID+",\""+dataBack.deptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.deptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.deptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
				}
			 	for(i=0;i<(5-dataBack.deptList.length);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				str=str+"</tr>";
				$("#therdDept").html(str);
			}else{
				 str="";
				 for(i=0;i<dataBack.deptList.length;i++){ 
				 	if(i%5==0){
				 		str=str+"<tr>";
				 	}
				 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptFourth("+dataBack.deptList[i].ID+",\""+dataBack.deptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.deptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.deptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
				 	if((i+1)%5==0){
				 		str=str+"</tr>";
				 	}
				}
				if(dataBack.deptList.length%5!=0){
				for(i=0;i<(5-dataBack.deptList.length%5);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				   str=str+"</tr>";
				}
				$("#therdDept").html(str);
			}
			$("#therdTr").css("display","");
			$("#fourthTr").css("display","none");
			$("#secondTr").css("display","none");
			}
		});
}


//异步加载总公司    分公司     部门   分部门信息
function showDeptFourth(id,name){ 
	$("#node").val("0");
	$("#openFlag").val("5");
	$("#id").val(id);
	$("#name").val(name);
	$("#wei9").html(name);
	$("#xuanze4").css("display","");
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.getFenDept&parentId='+id,
			dataType:'json',
			success: function(dataBack){ 
				if(dataBack.fenDeptList.length<=5){
			     str="<tr>";
				for(i=0;i<dataBack.fenDeptList.length;i++){ 
				 	str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptFifth("+dataBack.fenDeptList[i].ID+",\""+dataBack.fenDeptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.fenDeptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.fenDeptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
				}
			 	for(i=0;i<(5-dataBack.fenDeptList.length);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				str=str+"</tr>";
				$("#fourthDept").html(str);
			}else{
				 str="";
				 for(i=0;i<dataBack.fenDeptList.length;i++){ 
				 	if(i%5==0){
				 		str=str+"<tr>";
				 	}
				 	 str=str+"<td width='20%' style='cursor: pointer;' onclick='showDeptFifth("+dataBack.fenDeptList[i].ID+",\""+dataBack.fenDeptList[i].DEPT_NAME+"\");tdTextLight(this);'>"+dataBack.fenDeptList[i].DEPT_NAME+"<a href='javascript:void(0);' onClick='getDeptmentChart("+dataBack.fenDeptList[i].ID+")'><img src='../images/left.gif' border='0'></a></td>";
				 	if((i+1)%5==0){
				 		str=str+"</tr>";
				 	}
				}
				if(dataBack.fenDeptList.length%5!=0){
				for(i=0;i<(5-dataBack.fenDeptList.length%5);i++){ 
			 		str=str+"<td width='20%'>&nbsp;</td>";
			 	} 
				   str=str+"</tr>";
				}
				$("#fourthDept").html(str);
			}
			$("#therdTr").css("display","");
			$("#secondTr").css("display","none");	
			$("#fourthTr").css("display","");
			}
		});
}
//终止条件 如果为6不能添加
function showDeptFifth(id,name){
	$("#node").val("0");
	$("#openFlag").val("6");
	$("#id").val(id);
	$("#name").val(name);
}
//终止条件 如果为7不能添加
function showDeptFifth2(id,name){
	$("#node").val("0");
	$("#openFlag").val("7");
	$("#id").val(id);
	$("#name").val(name);
}



function preUpdateDept(){
	$("#__action").val("department.update");
	if($("#id").val()==0){
		alert('请选择需更新的部门！');
		return false;
	} 
	if($("#node").val()==1){
		alert("您选择的是公司,请选择部门！");
		return false;
	}	
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.getDeptById&id='+$("#id").val(),
			dataType:'json',
			success: function(dataBack){
				$("#deptName").val(dataBack.userMap.DEPT_NAME);
				$("#deptCode").val(dataBack.userMap.DEPT_CODE);
				$("#id").val(dataBack.userMap.ID);
				$("#companyId").val(dataBack.userMap.DECP_ID);
				$("#parentId").val(dataBack.userMap.PARENT_ID);
				$("#memo").val(dataBack.userMap.MEMO);
				$("#addOrUpdate").val("更 新");
				$("#addOrUpdate").unbind("click");
				$("#addOrUpdate").bind("click",checkUpdateDepartment);
				$("#upperDept").html(dataBack.userMap.PARENT_NAME);
				$('#departmentDiv').dialog({
					modal:true,
					autoOpen: false,
					width: 400
				});
				$('#departmentDiv').dialog('open');
			}
	});		
}


//异步提交更新部门的表单
var checkUpdateDepartment=function (){ 
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.update&id='+$("#id").val()
			+'&deptName='+$("#deptName").val()+'&deptCode='+$("#deptCode").val()
			+'&memo='+$("#memo").val()+'&decp_id='+$("#decp_id").val()+'&PARENT_ID='+$("#parentId").val(),
			dataType:'json',
			success: function(dataBack){
				$('#departmentDiv').dialog('close');
				flag=$("#openFlag").val()-1;
				if(flag==1){
					loadCompany();
				}else if(flag==2){
					showCompanyAndDept(dataBack.shangID,dataBack.shangName);
				}else if(flag==3){
					showDeptTherd(dataBack.shangID,dataBack.shangName);
				}else if(flag==4){
					showCompanyXiaDept(dataBack.shangID,dataBack.shangName);
				}else if(flag==5){
					showDeptFourth(dataBack.shangID,dataBack.shangName);
				} else if(flag==6){
					showDeptTherd(dataBack.shangID,dataBack.shangName);
				}
		    }
	});
}

//删除部门  判断该部门还有子部门或者员工
function deleteDept(){
	if($("#id").val()==0){
		alert("请选择要删除的部门！");
		return false;
	}
	if($("#node").val()==1){
		alert("您选择的是公司,请选择部门！");
		return false;
	}
	if(confirm('确认删除？')){
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.delete&id='+$("#id").val(),
			dataType:'json',
			success: function(dataBack){ 
				if(dataBack.deptListsize!=0 || dataBack.userListsize!=0){
					alert("该部门还有子部门或者有员工,不能删除！");
					return false;
				}
				else{
					delDept();
				}
				
		    }
	});
	}else{
		return false;
	}
}
//删除部门 执行
function delDept(){
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.delDept&id='+$("#id").val(),
			dataType:'json',
			success: function(dataBack){ 	
				flag=$("#openFlag").val()-1;
				if(flag==1){
					loadCompany();
				}else if(flag==2){
					showCompanyAndDept(dataBack.shangID,dataBack.shangName);
				}else if(flag==3){
					showDeptTherd(dataBack.shangID,dataBack.shangName);
				}else if(flag==4){
					showCompanyXiaDept(dataBack.shangID,dataBack.shangName);
				}else if(flag==5){
					showDeptFourth(dataBack.shangID,dataBack.shangName);
				} else if(flag==6){
					showDeptTherd(dataBack.shangID,dataBack.shangName);
				}			
		    }
	});
}
//添加部门前的处理
function preAddDept(){
	 if($("#openFlag").val()==6	||	$("#openFlag").val()==7){
		alert("此部门下不能再添加下属部门！");
	 	return false;
	 } 
	$("#__action").val("department.add");
	if($("#id").val()==0){
		$("#parentId").val("0");
	}else{
		$("#parentId").val($("#id").val());
	}
	$("#parentId").val();
	$("#upperDept").html($("#name").val());
	$("#addOrUpdate").val("添 加");
	$("#addOrUpdate").unbind("click");
	$("#addOrUpdate").bind("click",checkAddDepartment);
	
	$('#departmentDiv').dialog({
		modal:true,
		autoOpen: false,
		width: 400
	});
	$('#departmentDiv').dialog('open');
}
//异步提交添加部门的表单
var checkAddDepartment=function (){
	$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=department.add&parentId='+$("#parentId").val()
			+'&deptName='+$("#deptName").val()+'&deptCode='+$("#deptCode").val()
			+'&memo='+$("#memo").val()+'&id='+$("#id").val()+'&node='+$("#node").val(),
			dataType:'json',
			success: function(){
				$('#departmentDiv').dialog('close');
				flag=$("#openFlag").val();
				if(flag==1){
					loadCompany();
				}else if(flag==2){
					showCompanyAndDept($("#id").val(),$("#name").val());
				}else if(flag==3){
					showDeptTherd($("#id").val(),$("#name").val());
				}else if(flag==4){
					showCompanyXiaDept($("#id").val(),$("#name").val());
				}else {
					showDeptFourth($("#id").val(),$("#name").val());
				}
		    }
	});
}
function closeDialog(msg){
	$(msg).dialog('close');
}

//取得部门结构图
function getDeptmentChart(id) {
	window.open('../servlet/defaultDispatcher?__action=department.getDepartmentChart&id='+id);
}
//取得所有部门的结构图
function getAllDeptmentChart() {
	window.open('../servlet/defaultDispatcher?__action=department.getAllDeptmentChart');
}