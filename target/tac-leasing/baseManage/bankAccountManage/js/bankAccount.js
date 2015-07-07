 
//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    

        if(event.keyCode==13)
        {
               doSearch();
                return false;                               
        }
 } 



function AccountCode(field, name) {
    var value = $.trim(field.value);
    value = value.replace(/[￥,]/g, '');	
		if ( !/^\d+(\.\d+)?$/.test(value)) {
			alert(name + '只能输入数字！');
			field.focus();
			return true;
		}
		else {
			value = '' + parseFloat(value);
			field.value = value
			return false;
		}
	return false;
}
//允许提交          为true
var isSubmit = true;
//是否有子账户
var isHaveChild = true;
//子账户个数
var childCount = 0;
function loadChildrenCount(id) {
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=bankAccount.getAccountCountByParentId&baba_id=' + id,
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

//添加账户页面       是否 显示下拉选列表
function createParentAccountDisplay(obj) {
	var value = $(obj).val();
	 $("#parent_id").val(0);
	if(value == 0) {
		$("#parentList").css("display","none");
		$("#bankList").css("display","");
		$("#bankByPAccount").css("display","none");
	}else{
		$("#parentList").css("display","");
		$("#bankList").css("display","none");
		$("#bankByPAccount").css("display","");
	}
}
//添加账户页面    验证            
function addBankAccount() {
	var form = document.form1;
   // if (AccountCode(form.account_no, '账号')) {
   	//   return false;
   //}
    if (blank(form.account_name, '开户人')) {
   	   return false;
   	}
   // if (blank(form.account_alias, '账户别名：')) {
   //	   return false;
  // 	}
    /*
     * modify by xuyuefei
     * 
     */
    if(blank(form.account_no,'账号')){
    	return false;
    }
    if (blank(form.accountCode, '编码')){
    	return false;
    }
    if(form.accountProperty.value==0){
    	alert("请选择帐号性质！");
    	return false;
    }
	//if(form.account_type.value==0){
	//	alert("请选择账号类型！");
	//	return false;
	//}
	if(form.babi_id.value==0){
		alert("请选择银行！");
		return false;
	}
		$.post("../servlet/defaultDispatcher?__action=bankAccount.checkNo",{no:form.account_no.value},function(data){
			if(data.suc=="fail"){
				alert("账号已存在，请重新填写!")
				return false;
			}
			if(data.suc=="ok"){
				$("#form1").submit();
				
			}
		},'json');
		
    
	//var obj = $("input[type='radio']");
	//for(var i = 0; i<obj.length;i++) {
	//	if(obj[i].checked) {
	//		if(obj[i].value == 1){
	//			if(by("parent_id").value == 0 ){
	//				alert("请选择主账户！");
	//				return false;
	//			}
	//		}
	//		if(obj[i].value == 0){
	//			if (by("babi_id").value == 0) {
	//				alert("请选择银行！");
	//				return false;
	//			}
	//		}
//		}
//	}
}
//显示指定id的银行账户
function showBankAccount(id){	
	location.href='../servlet/defaultDispatcher?__action=bankAccount.getBankAccountByIdForShow&baba_id='+id;
}
//删除指定id的账户
function invalidBankAccount(id){
		loadChildrenCount(id);
	if(childCount == 0) {
		if(confirm('确认删除该条记录？')){
			location.href='../servlet/defaultDispatcher?__action=bankAccount.invalid&baba_id='+id;
		}else{
			return false;
		}
	}else{
		alert("该账户还有子账户，不能删除");
		return false;
	}	
}

//查找并显示指定id的银行账户
function preUpdateBankAccount(id){	
	location.href='../servlet/defaultDispatcher?__action=bankAccount.getBankAccountById&baba_id='+id;
}

//修改
function parentBankAccountDisplay(obj,id) {
	
	var value = $(obj).val();
	$("#parent_id").val(0)
	if(value == 0) {
		$("#parent_account").css("display","none");
		$("#bankList").css("display","");
		$("#bankByPAccount").css("display","none");
		isSubmit = true;
		isHaveChild = true;
	}else{
		$("#parent_account").css("display","");
		$("#bankList").css("display","none");
		$("#bankByPAccount").css("display","");
		loadChildrenCount(id);
		if(childCount == 0) {
			isSubmit = true;
			isHaveChild = true;
		}else{
			alert("此账户还有子账户，不能设为子账户！");
			$("input[name='type'][value='0']").attr("checked",true);
			isSubmit = false;
			isHaveChild = false;
			return;
		}
	}
}

//更新银行账户 并验证
function updateBankAccount(){
	var form = document.form1;
    //if (AccountCode(form.account_no, '账号')) {
   	//   return false;
   	//}
    if (blank(form.account_name, '开户人')) {
   	   return false;
   	}
    if(blank(form.account_no,'账号')){
    	return false;
    }
    if (blank(form.accountCode, '编码')){
    	return false;
    }
    if(form.accountProperty.value==0){
    	alert("请选择帐号性质！");
    	return false;
    }
	if(form.babi_id.value==0){
		alert("请选择银行！");
		return false;
	}
	if(form.currency.value==""){
		alert("请选择币种!");
		return false;
	}
	if(form.oldNo.value!=form.account_no.value){
		$.post("../servlet/defaultDispatcher?__action=bankAccount.checkNo",{no:form.account_no.value},function(data){
			if(data.suc=="fail"){
				alert("账号已存在，请重新填写!")
				return false;
			}
			if(data.suc=="ok"){
				$("#form1").submit();
				
			}
		},'json');
	}else{
		$("#form1").submit();
	}

   // if (blank(form.account_alias, '账户别名')) {
   //	   return false;
  // 	}	
	//if(form.account_type.value==0){
	//	alert("请选择账号类型！");
	//	return false;
	//}
	//var obj = $("input[type='radio']");
	//for(var i = 0; i<obj.length;i++) {
	//	if(obj[i].checked) {
	//		if(obj[i].value == 1){
	//			if(by("parent_id").value == 0 ){
	//				alert("请选择主账户！");
	//				return false;
	//			}
	//		}
	//		if(obj[i].value == 0){
	//			if (by("babi_id").value == 0) {
	//				alert("请选择银行！");
	//				return false;
	//			}
	//		}
	//	}
	//}
}






