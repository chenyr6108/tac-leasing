//显示联系人的弹出层
showDivAddSupplLinkMan = function () {
	$('#divAddSupplLinkman').dialog({
		modal:true,
		autoOpen: false	,
		width:660,
	});
	$('#divAddSupplLinkman').dialog('open');	
}
//显示查看联系人的弹出层
 function showDivShowSupplLinkMan(culm_id) {
	$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=supplier.showSupplLinkManById&culm_id="+culm_id,
			dataType:"json",
			success:function(dataBack){
			$("#link_name_s").html(dataBack.culm.LINK_NAME);
			$("#link_gender_s").html(dataBack.culm.LINK_GENDER);
			$("#link_relation2cust_s").html(dataBack.culm.LINK_RELATION2CUST);
			$("#link_age_s").html(dataBack.culm.LINK_AGE);
			$("#link_mobile_s").html(dataBack.culm.LINK_MOBILE);
			$("#link_phone_s").html(dataBack.culm.LINK_PHONE);
			$("#link_idcard_s").html(dataBack.culm.LINK_IDCARD);
			$("#link_zip_s").html(dataBack.culm.LINK_ZIP);
			$("#link_email_s").html(dataBack.culm.LINK_EMAIL);
			$("#link_idcardAddr_s").html(dataBack.culm.LINK_IDCARD_ADDRESS);
			$("#link_home_address_s").html(dataBack.culm.LINK_HOME_ADDRESS);
			$("#link_work_units_s").html(dataBack.culm.LINK_WORK_UNITS);
			$("#link_duty_s").html(dataBack.culm.LINK_DUTY);
			$("#link_work_address_s").html(dataBack.culm.LINK_WORK_ADDRESS);
			$("#province_id_s").val(dataBack.culm.PROVINCE_ID);
			$("#city_id_s").val(dataBack.culm.CITY_ID);
			$("#area_id_s").val(dataBack.culm.AREA_ID);
			
			$('#divShowSupplLinkman').dialog({
				modal:true,
				autoOpen: false	,
				width:660,
			});
			$('#divShowSupplLinkman').dialog('open');
	    },
	});		
}

//关闭联系人的弹出层，同时将form重置
//closeDivAddCustLinkman = function(){
	//$("#divAddCustLinkman").hide();
	//hideoverlayer();
//}
//弹出层返回按钮
function closeDialog(msg){
	$(msg).dialog('close');
}

//修改联系人
function submitUpdateSupplLinkman() {
	var culm_id = $.trim($("#culm_id_u").val());
	var suppl_id = $.trim($("#suppl_id").val());
	var link_name = $.trim($("#link_name_u").val());
	var link_relation2cust = $.trim($("#link_relation2cust_u").val());
	var link_gender = $.trim($("input[name='link_gender_u']:checked").val());
	var link_age = $.trim($("#link_idcardAge_u").val());
	var link_mobile = $.trim($("#link_mobile_u").val());
	var link_phone = $.trim($("#link_phone_u").val());
	var link_idcard = $.trim($("#link_idcard_u").val());
	var link_zip = $.trim($("#link_zip_u").val());
	var link_idcard_address = $.trim($("#link_idcardAddr_u").val());
	var link_home_address = $.trim($("#link_home_address_u").val());
	var link_work_units = $.trim($("#link_work_units_u").val());
	var link_duty = $.trim($("#link_duty_u").val());
	var link_work_address = $.trim($("#link_work_address_u").val());
	var link_email=$.trim($("#link_email_u").val());
	var province_id=$.trim($("#province_id_u").val());
	var city_id=$.trim($("#city_id_u").val());
	var area_id=$.trim($("#area_id_u").val());
	if (link_name == ''){
		alert("请输入联系人的名字！");
		return ;
	}
	if (link_relation2cust == ''){
		alert("请输入联系人与承租人的关系！");
		return ;
	}
	if (link_mobile.length <11 ){
		alert("请输入正确的联系人的手机");
		return ;
	}
	if (link_mobile.length >11 ){
		alert("请输入正确的联系人的手机");
		return ;
	}
	if(link_work_address == ''){
		alert("请输入邮寄地址！");
		return;
	}
	
	$("#closeSupplLinkmanButu").click();
	
	var param = {"culm_id":culm_id,"suppl_id":suppl_id,
		"link_name":link_name,"link_relation2cust":link_relation2cust,
		"link_gender":link_gender,"link_age":link_age,
		"link_mobile":link_mobile,"link_phone":link_phone,
		"link_idcard":link_idcard,"link_zip":link_zip,
		"link_idcard_address":link_idcard_address,"link_home_address":link_home_address,
		"link_work_units":link_work_units,"link_duty":link_duty,
		"link_work_address":link_work_address,
		"link_email":link_email,
		"province_id":province_id,
		"city_id":city_id,
		"area_id":area_id,
		"__action":"supplier.updateSupplLinkManById"
	};
	
	$("#divUpdateSupplLinkman").css("z-index",0);
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(dataBack){
			if(dataBack.supplLinkman!=null){
				$("#divSupplLinkman").html(drawGridPanel(dataBack));
				alert("操作已成功！");
		    } else {
		    	alert("网络错误，请稍后重试或联系系统管理员！");
				return ;
		    }
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			return ;
		}
	
	});
}

//初始化省份
getCitys = function(){
	
	provinceId=$("#province_id").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#city_id option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.citys.length;i++){
				$("#city_id").get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID)); 
			}
		}
	});
}

function getArea(){
	cityId=$("#city_id").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getAreaByCityId&provinceId='+cityId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#area_id option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.area.length;i++){
				$("#area_id").get(0).options.add(new Option(dataBack.area[i].NAME,dataBack.area[i].ID)); 
			}
		}
	});
}

//初始化省份
getCitys_u = function(){
	
	provinceId=$("#province_id_u").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#city_id_u option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.citys.length;i++){
				$("#city_id_u").get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID)); 
			}
		}
	});
}

function getArea_u(){
	cityId=$("#city_id_u").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getAreaByCityId&provinceId='+cityId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#area_id_u option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.area.length;i++){
				$("#area_id_u").get(0).options.add(new Option(dataBack.area[i].NAME,dataBack.area[i].ID)); 
			}
		}
	});
}

