//查找一条资料用于查看
function showFile(id){
	location.href='../servlet/defaultDispatcher?__action=fileService.getFileByIdForShow&refi_id='+id;
}
//作废一条资料记录
function invalidFile(id){
	if(confirm('确认作废该条记录？')){
		location.href='../servlet/defaultDispatcher?__action=fileService.invalid&refi_id='+id;
	}else{
		return false;
	}	
}
//进入添加页面
function addFile() {
	location.href='../servlet/defaultDispatcher?__action=fileService.getCreateFileJsp';
}

//添加资料页面    验证    js
function addFileInfor(){ 
	if(trim(by("FILE_NAME").value)==""){	
		alert("资料名称为必填项");
		$("#FILE_NAME").focus();
		return false;
	}
	var select1=document.getElementById("FILE_TYPE");
	if(select1.value==0){
		alert("请选择资料类型");
		return false;
	}
	
	
	var str = trim(document.getElementById("WANT_COUNT").value);    
    reg=/^[0-9]+$/;     
    if(!reg.test(str)){    
        alert("应征份数为数字!"); 
        $("#WANT_COUNT").focus();
        return false;    
    }
	$("#form1").submit();
}
//更新资料    验证
function updateFileInfor(){
	if(trim(by("FILE_NAME").value)==""){	
		alert("资料名称为必填项");
		$("#FILE_NAME").focus();
		return false;
	}
	var select1=document.getElementById("FILE_TYPE");
	if(select1.value==0){
		alert("请选择资料类型");
		return false;
	}
	$("#form1").submit();
}

//查找并回显一条资料记录 更新
function preUpdateFile(id){
	location.href='../servlet/defaultDispatcher?__action=fileService.getFileById&refi_id='+id;
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


//改变为合同资料时，显示合同类型
function changeContractType(){
	var tab=document.getElementById("ContractTypeId");
	var checkText=$("#FILE_TYPE").find("option:selected").text(); 
		if(checkText=='合同资料'){
			var row=tab.insertRow(tab.rows.length);
			row.id='addContractType';
			var cell=row.insertCell(0);
			cell.className = "ui-widget-content jqgrow ui-row-ltr";
			cell.align='center';
			cell.innerHTML='合同资料';
			
			
			cell=row.insertCell(1);
			cell.className = "ui-widget-content jqgrow ui-row-ltr";
			cell.align='left';
			//cell.colSpan=2;
			cell.innerHTML='<select name=\"FILE_CONTRACT_TYPE\"  id=\"FILE_CONTRACT_TYPE\" style=\"width: 150px\">'
							+'<option value=\"1\">一般合同</option>'
							+'<option value=\"2\">委托合同</option>'
							+'<option value=\"3\">回租合同</option>'
							+'<option value=\"4\">重车合同</option>'
							+'<option value=\"5\">重车回租合同</option>'
							+'<option value=\"6\">新品回租合同</option>'
							+'<option value=\"7\">乘用车回租合同</option>'
							+'<option value=\"8\">直接租赁合同</option>'
							+'<option value=\"9\">乘用车租赁合同</option>'
							+'<option value=\"10\">设备售后回租合同</option>'
							+'<option value=\"11\">新车回租合同</option>'
							+'<option value=\"13\">二手车回租合同</option>'
							+'<option value=\"14\">原车回租合同</option>'
							+'<option value=\"15\">二手车委贷合同</option>'
							+'</select>';
		}else{
			$("#addContractType").remove();
		}
}