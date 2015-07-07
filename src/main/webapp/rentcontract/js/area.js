getCitys = function(){
	provinceId=$("#PROVINCE_ID").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#CITY_ID option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.citys.length;i++){
				$("#CITY_ID").get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID)); 
			}
		}
	});
}
getArea = function(){
	cityId=$("#CITY_ID").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getAreaByCityId&provinceId='+cityId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#AREA_ID option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.area.length;i++){
				$("#AREA_ID").get(0).options.add(new Option(dataBack.area[i].NAME,dataBack.area[i].ID)); 
			}
		}
	});
}