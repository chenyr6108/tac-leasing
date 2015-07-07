//初始化省份
function getCitys(){
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
			 $('#area_id option').each(function(){  
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

//业务员提示
$(function() {
	
			//initInput("#clerk_name");
			// 加载数据, 并在回调函数中用返回的数据初始化autocomplete
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=employee.getEmployeesByJob&jobName=2',
				dataType:'json',
				success: initAutoComplete
			}); 
			  
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=creditCustomer.getCustomersForHint',
				dataType:'json' ,
				success: initAutoComplete2
			});
});

//承租人类型转换
function changeType(flag){ 
	if(flag==0){
		$("#cust_name").val('');
		$("#cust_idcard").val('');
		$("#corp_oragnization_code").val('');
		for (var i=0;i<18;i++) {
			$("#cust_idcard_field_"+i).val('');
		}
		$("#custDiv0").css('display','');
		id_card_type=$("#id_card_type").val();
		if(id_card_type==1){
			$("#custDiv5").hide();
			$("#custDiv1").show();
		}else{
			$("#custDiv1").hide();
			$("#custDiv5").show();
		}
		$("#custDiv2").css('display','none');
		$("#custDiv3").css('display','none');  
	}else{  
		$("#cust_name").val('');
		$("#cust_idcard").val('');
		$("#corp_oragnization_code").val('');
		for (var i=0;i<18;i++) {
			$("#cust_idcard_field_"+i).val('');
		}
		$("#custDiv2").css('display','');
		$("#custDiv3").css('display','');
		$("#custDiv5").hide();
		$("#custDiv1").css('display','none');	
		$("#custDiv0").css('display','none');	 
	}
}	

function addCustomer(){
	
	if(trim(by("cust_name").value)==""){
		alert('请填写承租人姓名！');
		return false;
	}
	if($("#cust_type0").attr('checked')){ 
		if($("#id_card_type").val()==1){
			if(trim(by("cust_idcard").value)==""){
			alert('请填写承租人身份证！');
			return false;
		}	
		}else{ 
			if(trim(by("cust_idcard2").value)==""){
			alert('请填写证件号码！');
			return false;
		} 
		}
	}else{
		if(trim(by("corp_oragnization_code").value)==""){
			alert('请填写组织结构代码证！');
		return false;
		}
	}
	if(trim(by("province_id").value)==-1||trim(by("city_id").value)==-1){
		alert('请选择承租人所在地区！');
		return false;
	}
	/*if(trim(by("clerk_name").value)==""||trim(by("clerk_mobile").value)==""){
		alert('请填写区域主管信息！');
		return false;
	}*/
	/*if(trim(by("ACTILOG_ID").value)==""||trim(by("ACTILOG_ID").value)==""){
		alert('请填写主档！');
		return false;
	}*/
	document.getElementById("saveBut").disabled=true;
	$("#form1").submit();
}	
function changeIdCardType(){
	id_card_type=$("#id_card_type").val();
	if(id_card_type==1){
		$("#custDiv5").hide();
		$("#custDiv1").show();
	}else{
		$("#custDiv1").hide();
		$("#custDiv5").show();
	}
}
