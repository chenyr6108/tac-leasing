 
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    

        if(event.keyCode==13)
        {
               doSearch();  
                return false;                               
        }
 } 


function telPhone(field, name) {
    var value = field.value;
    value = value.trim();
	if (value != "") {
		if (!checkTelPhone(value)) {
			alert(name + '必须是电话');
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
	var regex2 = /^(0[0-9]{2,3}(\-)?)?([2-9]{1}[0-9]{6,7}){1}(\-[0-9]{1,4})?$/;
    return regex1.test(checkStr)||regex2.test(checkStr);
}
function postCode(field, name) {
    var value = $.trim(field.value);
    value = value.replace(/[￥,]/g, '');
	if (value != "") {
		if (value.length != 6 || !/^\d+(\.\d+)?$/.test(value)) {
			alert(name + '只能输入6位数字！');
			field.focus();
			return true;
		}
		else {
			value = '' + parseFloat(value);
			field.value = value
			return false;
		}
	}
	return false;
}



//允许提交          为true
var isSubmit = true;
//是否有子银行
var isHaveChild = true;
//子类银行的个数
var childCount = 0;
function loadChildrenCount(id) {
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=bankInfo.getChildCountByParentId&babi_id=' + id,
		dataType:'json',
		async: false,
		success: function(dataBack){		
		childCount = dataBack.count;	
		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
}


//添加银行页面       根据是否总行分行 显示分行下拉选列表
function createParentBankDisplay(obj) {
	var value = $(obj).val();
	$("#parent_id").val(0);
	if(value == 0) {
		$("#parentList").css("display","none");
		
	}else{
		$("#parentList").css("display","");
	}
}

//添加银行页面    验证            
function addBank() {
	var form = document.form1;
    if (blank(form.bank_name, '银行名称')) {
   	   return false;
   	}
    if (blank(form.bank_code, '银行编号')) {
   	   return false;
   	}
    if (blank(form.bank_linkman, '联系人：')) {
   	   return false;
   	}
    if (telPhone(form.bank_phone, '联系电话：')) {
   	   return false;
   	}	
    if (postCode(form.post_code, '邮编：')) {
   	   return false;
   	}	
	var obj = $("input[type='radio']");
	for(var i = 0; i<obj.length;i++) {
		if(obj[i].checked) {
			if(obj[i].value == 1){
				if(by("parent_id").value == 0 ){
					alert("请选择父银行！");
					return false;
				}
			}
		}
	}
	$("#form1").submit();
}

//查看一条银行记录
function showBank(id){
	location.href='../servlet/defaultDispatcher?__action=bankInfo.getBankByIdForShow&babi_id='+id;
}
//查找并回显一条银行记录
function preUpdateBank(id){
	location.href='../servlet/defaultDispatcher?__action=bankInfo.getBankById&babi_id='+id;
}
//修改页面  根据银行类型 确定单选框选哪个
function parentBankDisplay(obj,id) {	
	var value = $(obj).val();
	$("#parent_id").val(0);
	if(value == 0) {
		$("#parentList").css("display","none");
		
		isSubmit = true;
		isHaveChild = true;
	}else{
	 
		loadChildrenCount(id);
		if(childCount == 0) {
			$("#parentList").css("display","");
			isSubmit = true;
			isHaveChild = true;
		}else{
			alert("此银行还有下属分行或者已有在该行开户的账号，不能设为分行！");
			$("input[name='type'][value='0']").attr("checked",true);
			isSubmit = false;
			isHaveChild = false;
			return;
		}
	}
}

//更新银行    验证
function updateBank(){
	var form = document.form2;
    if (blank(form.bank_name, '银行名称')) {
   	   return false;
   	}
    if (blank(form.bank_code, '银行编号')) {
   	   return false;
   	}
    if (blank(form.bank_linkman, '联系人：')) {
   	   return false;
   	}
    if (telPhone(form.bank_phone, '联系电话：')) {
   	   return false;
   	}
	if (postCode(form.post_code, '邮编：')) {
   	   return false;
   	}	

	var obj = $("input[type='radio']");
	for(var i = 0; i<obj.length;i++) {
		if(obj[i].checked) {
			if(obj[i].value == 1){
				if(by("parent_id").value == 0 ){
					alert("请选择父银行！");
					return false;
				}
			}
		}
	}	
	$("#form2").submit();
}
//作废一银行记录
function invalidBank(id){
	loadChildrenCount(id);
	if(childCount == 0) {
		if(confirm('确认作废该条记录？')){
			location.href='../servlet/defaultDispatcher?__action=bankInfo.invalid&babi_id='+id;
		}else{
			return false;
		}
	}else{
		alert("此银行还有下属分行或者已有在该行开户的账号，必须先删除下面的分行或账号，才能删除此银行！！");
		return false;
	}	
}


























