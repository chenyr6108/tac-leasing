function checkAndCancelAll(id,name) {
	var checkbox = document.getElementsByTagName("input");
	if($("#" + id).attr("checked")) {
		for ( var i = 0; i < checkbox.length; i++) {
			if (checkbox[i].type == "checkbox" && checkbox[i].name == name) {
				checkbox[i].checked = true;
			}
		}
	}else{
		for ( var i = 0; i < checkbox.length; i++) {
			if (checkbox[i].type == "checkbox" && checkbox[i].name == name) {
				checkbox[i].checked = false;
			}
		}
	}
	
}

function checkContract(){
	   sub1 = true;
	var rcode = $.trim($("#DELV_CODE").val());
	if (rcode == "") {
		alert("发货通知单编号不能为空，请填写！");
		
	  return  false;
	}else{
		return  true;
	}
};

//验证是否为数字         并且不能为空
function isNumber(number) {
	var num = $.trim(number.value);
	if(isNaN(num)) {
		alert("必须为数字，请重新填写");
		number.value = "";
		return;
	}
};
//非空验证
function checForm(){
	
		
			if ((trim($("#datebegin").val())).length == 0) {
				
				alert("发货时间不能为空");
				
				return  false;
			}
			if ((trim($("#RECEIVING_UNIT").val())).length == 0) {
				
				alert("收货单位不能为空");
				
				return  false;
			}
			if ((trim($("#RECEIVING_ADDR").val())).length == 0) {
				
				alert("收货地点不能为空");
				
				return  false;
			}
			if ((trim($("#BALLOT_UNIT").val())).length == 0) {
				
				alert("开票单位不能为空");
				
				return  false;
			}
			if ((trim($("#DELIVERY_LINKMAN").val())).length == 0) {
				alert("发货联系人不能为空");
				return  false;
			}
			if ((trim($("#RECEIVING_LINKMAN").val())).length == 0) {
				alert("收货联系人不能为空");
				return  false;
			}
			if ((trim($("#FINANCELEASE_LINKMAN").val())).length == 0) {
				alert(" 融资租赁公司联系人不能为空");
				return  false;
			}
			if ((trim($("#FINANCELEASE_SIGN").val())).length == 0) {
				alert("融资公司签字不能为空");
				return  false;
			}
			if ((trim($("#RECEIVING_SIGN").val())).length == 0) {
				alert("承租方签字不能为空");
				return  false;
			}
			if ((trim($("#DELIVERY_SIGN").val())).length == 0) {
				alert("厂商签字不能为空");
				return  false;
			}	
		return true;
};

//电话或手机号
function checkTelNumber(){
		
				var telNo = $('#DELIVERY_LINKPHONE').val();
				if (!phones(telNo)) {
					alert("发货联系人联系电话不正确");
					return  false;
				}
				telNo = $('#RECEIVING_LINKPHONE').val();
				if (!phones(telNo)) {
					alert("收货联系人联系电话不正确");
					return  false;
				}
				telNo = $('#FINANCELEASE_LINKPHONE').val();
				if (!phones(telNo)) {
					alert("融资租赁公司联系人联系电话不正确");
					return  false;
				}
			return true;
};


function phones(elementt){
	var mmob=/^((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})){1}\d{8}$/;
	var mtel = /^(0[0-9]{2,3}(\-)?)?([2-9]{1}[0-9]{6,7}){1}(\-[0-9]{1,4})?$/;
	if(elementt==null || elementt=="" ){
		return false;
	}
	if(elementt.match(mmob)){
		return true;
	}
	if(elementt.match(mtel)){
		return true;
	}
		return false;
	
};

//日期
function checkDate(){ 
		
			//alert("ch1Date"); 厂商签字
			if (!(strDateTime($("#datebegin").val()))) {
				alert("请将发货日期格式填写为 2008-08-08的格式");
				return  false;
				
			}
			if (!(strDateTime($("#datebegin2").val()))) {
				alert("请将融资公司签字日期格式填写为 2008-08-08的格式");
				return  false;
			}
			if (!(strDateTime($("#datebegin3").val()))) {
				alert("请将承租方签字日期格式填写为 2008-08-08的格式");
				
				return  false;
			}
			if (!(strDateTime($("#datebegin4").val()))) {
				alert("请将厂商签字日期格式填写为 2008-08-08的格式");
				
				return  false;
			}
		return true;
};	
			
function strDateTime(str) 
      { 
         var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
         if(r==null)return false; 
         var d= new Date(r[1], r[3]-1, r[4]); 
         return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]); 
      }; 

function subForm(name) {
	var obj = $("input[name=" + name + "]:checked");
	if(obj.size() == 0) {
		return false;
	}else{
		$("#form").submit();
	}
};

//提交发货通知单

function subNotice() {
	 
	test();  
	
	                    //check 发货通知单编号    
	//if(!checkContract()){ return false; };  // sub1= false 为上一项验证未通过，
		
	if(!checForm()){ return false; };						// 表单非空验证
			           	//电话或手机号
	if(!checkTelNumber()){ return false; };
	                   //日期
	if(checkDate()) {
		$("#addform").submit();
	}else{
		return false;
	}
};
function updateNotice() {
	 
	testUpdate();  
			
	if(!checForm()){ return false; };						// 表单非空验证
			           	//电话或手机号
	if(!checkTelNumber()){ return false; };
	                   //日期
	if(checkDate()) {
		$("#updateform").submit();
	}else{
		return false;
	}
};



