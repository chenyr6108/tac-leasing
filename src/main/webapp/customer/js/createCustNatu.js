var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		natu_idcard: new IdCard('natu_idcard'),
        natu_mate_idcard: new IdCard('natu_mate_idcard')
	};
});

createCustNatural= function () {
	var cust_id = $.trim($("#cust_id").val());
	var cust_name = $.trim($("#cust_name").val());
	var VIRTUAL_CODE=$.trim($("#VIRTUAL_CODE").val());
	var trade_type = $.trim($("#trade_type").val());
	if(trade_type == ""){
		alert("请选择行业别！");
		return;
	}
	if (cust_name == ''){
		alert("请输入承租人名称！");
		return ;
	}
	var natu_idcard = $.trim($("#natu_idcard").val());
	if (natu_idcard.length <15){
		alert("请正确输入承租人身份证号");
		return ;
	}
	var province_id = $.trim($("#province_id").val());
	if (province_id == -1){
		alert("请选择承租人所在省市！");
		return ;
	}
	var corp_company_email = $.trim($("#corp_company_email").val())
	if(corp_company_email!='')
	{
		 if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(corp_company_email)) 
		{
			alert("邮箱格式不正确，请重新输入");
			return ;
		}
	}
	//showoverlayer();
	$.ajax({
		type:"POST",
		data:{"cust_id":cust_id,"cust_type":"0","VIRTUAL_CODE":VIRTUAL_CODE,"cust_name":cust_name,"natu_idcard":natu_idcard,"__action":"customer.checkCustomer"},
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
		    if (callback.rss.COUNTVIRTUAL >0){
				alert("该虚拟帐号已使用，不可添加，请重新输入！");
				hideoverlayer();
				return ;
			   }
			if (callback.rs.COUNT == 'undefined'){
				alert("系统错误，请联系系统管理员！");
				hideoverlayer();
				return ;
			} else if (callback.rs.COUNT > 0) {
				alert("该承租人已存在，不可添加，请核实！");
				hideoverlayer();
				return ;
			} else {
				createCustNatuFn();
			}
		},
		error:function(callback){
			alert("网络错误，请稍后重试！");
			hideoverlayer();
			return ;
		}
	});
}
createCustNatuFn = function () {
	var cust_id = $("#cust_id").val();
	var cust_level = $("#cust_level").val();
	var cust_name = $.trim($("#cust_name").val())
	var natu_idcard = $.trim($("#natu_idcard").val())
	var natu_gender = $.trim($("input[name='natu_gender']:checked").val());
	var natu_age = $.trim($("#natu_idcardAge1").val())
	var natu_mobile = $.trim($("#natu_mobile").val())
	var natu_phone = $.trim($("#natu_phone").val())
	var natu_zip = $.trim($("#natu_zip").val())
	var VIRTUAL_CODE = $.trim($("#VIRTUAL_CODE").val())
	var natu_idcard_address = $.trim($("#natu_idcardAddr1").val())
	var natu_home_address = $.trim($("#natu_home_address").val())
	var natu_work_units = $.trim($("#natu_work_units").val())
	var natu_work_address = $.trim($("#natu_work_address").val())
	var natu_mate_name = $.trim($("#natu_mate_name").val())
	var natu_mate_idcard = $.trim($("#natu_mate_idcard").val())
	var natu_mate_mobile = $.trim($("#natu_mate_mobile").val())
	var natu_mate_idcard_address = $.trim($("#natu_mate_idcard_address").val())
	var natu_mate_work_units = $.trim($("#natu_mate_work_units").val())
	var natu_mate_work_address = $.trim($("#natu_mate_work_address").val())
	var remark = $.trim($("#remark").val())
	var province_id = $.trim($("#province_id").val())
	var city_id = $.trim($("#city_id").val())
	var corp_company_email= $.trim($("#corp_company_email").val())
	var trade_type = $.trim($("#trade_type").val());
	var area_id = $.trim($("#area_id").val());
	var x_point = $.trim($("#x_point").val());
	var y_point = $.trim($("#y_point").val());
	
	var isSalesDesk=$("#isSalesDesk").val();
	var param = {"cust_id":cust_id,"cust_level":cust_level,"cust_name":cust_name,"VIRTUAL_CODE":VIRTUAL_CODE,"isSalesDesk":isSalesDesk,
				"natu_idcard":natu_idcard,"natu_gender":natu_gender,"natu_age":natu_age,
				"natu_mobile":natu_mobile,"natu_phone":natu_phone,"natu_zip":natu_zip,
				"natu_idcard_address":natu_idcard_address,"natu_home_address":natu_home_address,
				"natu_work_units":natu_work_units,"natu_work_address":natu_work_address,
				"natu_mate_name":natu_mate_name,"natu_mate_idcard":natu_mate_idcard,
				"natu_mate_mobile":natu_mate_mobile,"natu_mate_idcard_address":natu_mate_idcard_address,
				"natu_mate_work_units":natu_mate_work_units,"natu_mate_work_address":natu_mate_work_address,
				"province_id":province_id,"city_id":city_id,
				"remark":remark,
				"trade_type":trade_type,
				"area_id":area_id,
				"x_point":x_point,
				"y_point":y_point,
				"corp_company_email":corp_company_email,"__action":"customer.createCustomerNatu"
	};
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			if (callback.rsCount == 1){
				//alert("操作已成功！");
				location.href='../servlet/defaultDispatcher?__action=customer.query&isSalesDesk='+callback.isSalesDesk;
				//hideoverlayer();
				return;
			} else {
				alert("操作失败，请稍后重试或联系系统管理员！");
				hideoverlayer();
				return;
			}
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			hideoverlayer();
			return ;
		}
	});

}