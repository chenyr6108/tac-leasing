
//允许提交          为true
var isSubmit = true;
//是否有分公司
var isHaveChild = true;
//分公司的个数
var childCount = 0;

//查找一条公司记录
function showCompany(id){
	location.href='../servlet/defaultDispatcher?__action=companyManage.getCompanyByIdForShow&decp_id='+id;
}

//作废一条公司记录
function invalidCompany(id){
	loadChildrenCount(id);
	if(childCount == 0) {
		if(confirm('确认作废该条记录？')){
			location.href='../servlet/defaultDispatcher?__action=companyManage.invalid&decp_id='+id;
		}else{
			return false;
		}
	}else{
		alert("此公司还有下属分公司，必须先删除下面的分公司，才能删除此公司！！");
		return false;
	}
	
}
function loadChildrenCount(id) {
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=companyManage.getChildCountByParentId&decp_id=' + id,
		dataType:'json',
		async: false,
		success: function(dataBack){
		//alert(11);
		childCount = dataBack.count;
		//alert(childCount);
		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
}

//添加公司页面             js
function createParentCompanyDisplay(obj) {
	
	var value = $(obj).val();
	if(value == 1) {
		$("#parentList").css("display","none");
	}else{
		$("#parentList").css("display","");
	}
}

//验证手机号码
function tel(field, name) {
    var value = field.value;
    value = trim(value);
	if (value != "") {
		if (!checkTelPhone(value)) {
			alert(name + '必须是手机号码');
			field.focus();
			return true;
		}
		else {
			field.value = value;
			return false;
		}
	}
	return false;
}
function checkTelPhone(checkStr)
{
    var regex1 = /^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})){1}\d{8}$/;
    return regex1.test(checkStr);
}

//验证电话号码
function Phone(field, name) {
    var value = field.value;
    value = trim(value);
		if (!checkPhone(value)) {
			alert(name + '必须为正确的格式');
			field.focus();
			return true;
		}
		else {
			field.value = value;
			return false;
		}
}

function checkPhone(checkStr)
{
    var regex2 = /^(0[0-9]{2,3}(\-)?)?([2-9]{1}[0-9]{6,7}){1}(\-[0-9]{1,4})?$/;
    return regex2.test(checkStr);
}

//添加公司页面    验证            js
function addCompany() { 
	var form = document.form1;
	if(trim(by("DECP_NAME_CN").value)==""){	
		alert("公司名称(中文)为必填项");
		$("#DECP_NAME_CN").focus();
		return false;
	}
	if(trim(by("BUSINESS_LICENCE_CODE").value)==""){	
		alert("营业执照注册号为必填项");
		$("#BUSINESS_LICENCE_CODE").focus();
		return false;
	}
	if(trim(by("REGISTERED_OFFICE_ADDRESS").value)==""){	
		alert("公司注册地址为必填项");
		$("#REGISTERED_OFFICE_ADDRESS").focus();
		return false;
	}
	if(trim(by("ALIAS").value)==""){	
		alert("简称为必填项且为字母或数字");
		$("#ALIAS").focus();
		return false;
	}				
     var str = trim(document.getElementById("ALIAS").value);    
      if(str.length!=0){    
      reg=/^[a-zA-Z0-9]+$/;     
      if(!reg.test(str)){    
          alert("简称为必填项且为字母或数字!"); 
          $("#ALIAS").focus();
          return false;    
      }  
	}
	
	if (Phone(form.TELEPHONE, '公司电话：')) {
		   return false;
		}
	if(trim(by("OPEN_ACCOUNT_BANK").value)==""){	
		alert("开户行为必填项");
		$("#OPEN_ACCOUNT_BANK").focus();
		return false;
	}	
	if (document.getElementById("BANK_ACCOUNT").value.search("^-?\\d+$") != 0) {
		   alert("帐号为数字");
		   $("#BANK_ACCOUNT").focus();
		   return false;
		}
	if (Phone(form.LEGAL_TELEPHONE, '法人办公电话：')) {
		   return false;
		}
	if (tel(form.LEGAL_MOBILE_NUMBER, '手机号码：')) {
		   return false;
		}	
	if(trim(by("LEGAL_PERSON").value)==""){	
		alert("法定代表人为必填项");
		$("#LEGAL_PERSON").focus();
		return false;
	}		
	if(trim(by("LEGAL_ID_CARD").value)!=""){	
		if(document.getElementById('LEGAL_ID_CARD').value.length!=18){	
			alert("法人身份证号不对");
			$("#LEGAL_ID_CARD").focus();
			return false;
		}	
	}	
	if(trim(by("REGISTERED_CAPITAL").value)!=""){
	if (document.getElementById("REGISTERED_CAPITAL").value.search("^-?\\d+$") != 0) {
		   alert("注册资本(万元)为数字");
		   $("#REGISTERED_CAPITAL").focus();
		   return false;
		}	
	}
	if(trim(by("INCORPORATING_DATE").value)==""){	
		alert("成立日期为必填项");
		$("#INCORPORATING_DATE").focus();
		return false;
	}	
	if(trim(by("FAX").value)!=""){
		if (Phone(form.FAX, '公司传真：')) {
			   return false;
			}	
	}	
	if(trim(by("EMPLOYEE_COUNT").value)!=""){
		if (document.getElementById("EMPLOYEE_COUNT").value.search("^-?\\d+$") != 0) {
			   alert("职工人数为数字");
			   $("#EMPLOYEE_COUNT").focus();
			   return false;
			}	
	}
	if(trim(by("POSTCODE").value)!=""){
		 var str = document.getElementById("POSTCODE").value;    
	     if(str.length!=0){    
		     reg=/^[0-9]{6}$/;
		     if(!reg.exec(str)){ 
		         alert("对不起，您输入的公司所在地邮编格式不正确!");
		         $("#POSTCODE").focus();
				   return false;
				}	
	     }
	}
	if(trim(by("LEGAL_POSTCODE").value)!=""){
		 var str = document.getElementById("LEGAL_POSTCODE").value;    
	     if(str.length!=0){    
		     reg=/^[0-9]{6}$/;
		     if(!reg.exec(str)){ 
		         alert("对不起，您输入的法人常住地址邮编格式不正确!");
		         $("#LEGAL_POSTCODE").focus();
				   return false;
				}	
	     }
	}	
	
	var obj = $("input[type='radio']");
	for(var i = 0; i<obj.length;i++) {
		if(obj[i].checked) {
			if(obj[i].value == 2){
				if(by("PARENT_ID").value == 0 ){
					alert("请选择总公司！");
					return false;
				}
			}
		}
	}
	$("#form1").submit();
}
//更新公司    验证
function updateCompany(){
	var form = document.form1;
	if(trim(by("DECP_NAME_CN").value)==""){	
		alert("公司名称(中文)为必填项");
		$("#DECP_NAME_CN").focus();
		return false;
	}
	if(trim(by("BUSINESS_LICENCE_CODE").value)==""){	
		alert("营业执照注册号为必填项");
		$("#BUSINESS_LICENCE_CODE").focus();
		return false;
	}
	if(trim(by("REGISTERED_OFFICE_ADDRESS").value)==""){	
		alert("公司注册地址为必填项");
		$("#REGISTERED_OFFICE_ADDRESS").focus();
		return false;
	}
	
	if(trim(by("ALIAS").value)==""){	
		alert("简称为必填项且为字母或数字");
		$("#ALIAS").focus();
		return false;
	}				
     var str = trim(document.getElementById("ALIAS").value);    
      if(str.length!=0){    
      reg=/^[a-zA-Z0-9]+$/;     
      if(!reg.test(str)){    
          alert("简称为必填项且为字母或数字!"); 
          $("#ALIAS").focus();
          return false;    
      }  
	}	
	if (Phone(form.TELEPHONE, '公司电话：')) {
		   return false;
		}
	if(trim(by("OPEN_ACCOUNT_BANK").value)==""){	
		alert("开户行为必填项");
		$("#OPEN_ACCOUNT_BANK").focus();
		return false;
	}	
	if (document.getElementById("BANK_ACCOUNT").value.search("^-?\\d+$") != 0) {
		   alert("帐号为数字");
		   $("#BANK_ACCOUNT").focus();
		   return false;
		}
	if (Phone(form.LEGAL_TELEPHONE, '法人办公电话：')) {
		   return false;
		}
	if (tel(form.LEGAL_MOBILE_NUMBER, '手机号码：')) {
		   return false;
		}	
	if(trim(by("LEGAL_PERSON").value)==""){	
		alert("法定代表人为必填项");
		$("#LEGAL_PERSON").focus();
		return false;
	}		
	if(trim(by("LEGAL_ID_CARD").value)!=""){	
		if(document.getElementById('LEGAL_ID_CARD').value.length!=18){	
			alert("法人身份证号不对");
			$("#LEGAL_ID_CARD").focus();
			return false;
		}	
	}	
	if(trim(by("REGISTERED_CAPITAL").value)!=""){
		if (document.getElementById("REGISTERED_CAPITAL").value.search("^-?\\d+$") != 0) {
			   alert("注册资本(万元)为数字");
			   $("#REGISTERED_CAPITAL").focus();
			   return false;
			}	
	}
	if(trim(by("INCORPORATING_DATE").value)==""){	
		alert("成立日期为必填项");
		$("#INCORPORATING_DATE").focus();
		return false;
	}
	if(trim(by("FAX").value)!=""){
		if (Phone(form.FAX, '公司传真：')) {
			   return false;
			}	
	}	
	if(trim(by("EMPLOYEE_COUNT").value)!=""){
		if (document.getElementById("EMPLOYEE_COUNT").value.search("^-?\\d+$") != 0) {
			   alert("职工人数为数字");
			   $("#EMPLOYEE_COUNT").focus();
			   return false;
			}	
	}
	if(trim(by("POSTCODE").value)!=""){
		 var str = document.getElementById("POSTCODE").value;    
	     if(str.length!=0){    
		     reg=/^[0-9]{6}$/;
		     if(!reg.exec(str)){ 
		         alert("对不起，您输入的公司所在地邮编格式不正确!");
		         $("#POSTCODE").focus();
				   return false;
				}	
	     }
	}
	if(trim(by("LEGAL_POSTCODE").value)!=""){
		 var str = document.getElementById("LEGAL_POSTCODE").value;    
	     if(str.length!=0){    
		     reg=/^[0-9]{6}$/;
		     if(!reg.exec(str)){ 
		         alert("对不起，您输入的法人常住地址邮编格式不正确!");
		         $("#LEGAL_POSTCODE").focus();
				   return false;
				}	
	     }
	}

	if(isHaveChild == false) {
		alert("此公司还有分公司，不能设为分公司！");
		return false;
	}else if(isSubmit == false) {
		if(by("PARENT_ID").value==0){
			alert("请选择总公司！");
			return false;
		}
	}
	$("#form1").submit();
}



//查找并回显一条公司记录
function preUpdateCompany(id){
	location.href='../servlet/defaultDispatcher?__action=companyManage.getCompanyById&decp_id='+id;
}


function parentCompanyDisplay(obj,id) {
	var value = $(obj).val();
	if(value == 1) {
		$("#parent_account").css("display","none");
		isSubmit = true;
		isHaveChild = true;
	}else{
		loadChildrenCount(id);
		if(childCount == 0) {
			isSubmit = true;
			isHaveChild = true;
		}else{
			alert("此公司还有分公司，不能设为分公司！");
			isSubmit = false;
			isHaveChild = false;
			return;
		}
		$("#parent_account").css("display","");
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
//得到公司的父ID       
function changeAccount(obj){
	var value = $(obj).val();
	$("#FU").val(value);
}        
