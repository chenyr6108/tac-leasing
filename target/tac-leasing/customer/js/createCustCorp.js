var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		corp_hs_idcard: new IdCard('corp_hs_idcard'),
	};
});

createCustCorporation = function () {
	var cust_id = $.trim($("#cust_id").val());
	var cust_name = $.trim($("#cust_name").val());
	var trade_type = $.trim($("#trade_type").val());
	var VIRTUAL_CODE=$.trim($("#VIRTUAL_CODE").val());
	if (cust_name == ''){
		alert("请输入承租人名称！");
		return ;
	}
	
	if($.trim($("#corp_tax_code").val())==''){
		alert("请输入税务登记号！");
		return ;
	}
	
	
	//Modify by Michael 2012 4-23 组织机构代码证加限制条件	
//	var corp_oragnization_code = $.trim($("#corp_oragnization_code").val());
//	if (corp_oragnization_code.length == ''){
//		alert("请输入承租人的组织机构代码证号");
//		return ;
//	}
	
	var corp_oragnization_code = $.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val());
	if (corp_oragnization_code.length !=10){
		alert("请输入正确的法人的组织机构代码证号");
		return false;
	}		
	
	document.getElementById("corp_oragnization_code").value= $.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val());
	
	
	var province_id = $.trim($("#province_id").val());
	if (province_id == -1){
		alert("请选择承租人所在省市！");
		return ;
	}
	if(trade_type == ""){
		alert("请选择行业别！");
		return;
	}
	
	var corp_company_email = $.trim($("#corp_company_email").val())
	if(corp_company_email!='')
	{
		 if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(corp_company_email)) 
		{
			alert("公司邮箱格式不正确，请重新输入");
			return ;
		}
	}
	
	//showoverlayer();
	$.ajax({
		type:"POST",
		//Modify By Michael 2011 11/29 修改cust_type 1为法人，0为自然人
		//data:{"cust_id":cust_id,"cust_type":"0","VIRTUAL_CODE":VIRTUAL_CODE,"cust_name":cust_name,"corp_oragnization_code":corp_oragnization_code,"__action":"customer.checkCustomer"},
		data:{"cust_id":cust_id,"cust_type":"1","VIRTUAL_CODE":VIRTUAL_CODE,"cust_name":cust_name,"corp_oragnization_code":corp_oragnization_code,"__action":"customer.checkCustomer"},
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
		   //  if (callback.rss.COUNTVIRTUAL == 'VIRTUAL_CODE is null'){
			//	alert("VIRTUAL_CODE is null！");
			//	hideoverlayer();
			//   }
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
				createCustCorpFn();
			}
		},
		error:function(callback){
			alert("网络错误，请稍后重试！");
			hideoverlayer();
			return ;
		}
	});
}
createCustCorpFn= function () {
	
	var cust_id = $("#cust_id").val();

	var cust_level = $("#cust_level").val();
	var cust_name = $.trim($("#cust_name").val())

	var corp_enterprises_property = $.trim($("#corp_enterprises_property").val())
	var corp_setup_date = $.trim($("#corp_setup_date").val())
	var corp_registe_capital = $.trim($("#corp_registe_capital").val())
	var corp_paiclup_capital = $.trim($("#corp_paiclup_capital").val())
	//Modify by Michael 2012 4-23 组织机构代码证加限制条件	
	//var corp_oragnization_code = $.trim($("#corp_oragnization_code").val())
	var corp_oragnization_code = $.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val())
	var VIRTUAL_CODE = $.trim($("#VIRTUAL_CODE").val())
	var corp_business_license = $.trim($("#corp_business_license").val())
	var corp_tax_code = $.trim($("#corp_tax_code").val())
	var corp_period_validity = $.trim($("#corp_period_validity").val())
	var corp_company_zip = $.trim($("#corp_company_zip").val())
	var corp_registe_address = $.trim($("#corp_registe_address").val())
	var corp_work_address = $.trim($("#corp_work_address").val())
	var corp_company_website = $.trim($("#corp_company_website").val())
	var corp_company_email = $.trim($("#corp_company_email").val())
	var corp_other_massage = $.trim($("#corp_other_massage").val())
	var corp_business_range = $.trim($("#corp_business_range").val())
	
	var corp_head_signature = $.trim($("#corp_head_signature").val())
	var corp_hs_idcard = $.trim($("#corp_hs_idcard").val())
	var corp_hs_link_mode = $.trim($("#corp_hs_link_mode").val())
	var corp_hs_home_address = $.trim($("#corp_hs_home_address").val())
	var remark = $.trim($("#remark").val())
	var trade_type = $.trim($("#trade_type").val());
	
	var province_id = $.trim($("#province_id").val())
	var city_id = $.trim($("#city_id").val())
	var tax_code = $.trim($("#tax_code").val())
	var area_id = $.trim($("#area_id").val());
	var x_point = $.trim($("#x_point").val());
	var y_point = $.trim($("#y_point").val());
	
	var open_bank_name=$.trim($("#open_bank_name").val());
	var open_bank_account=$.trim($("#open_bank_account").val());
	var link_address=$.trim($("#link_address").val());
	var link_phone=$.trim($("#link_phone").val());
	var registe_capital_currency = $.trim($("#registe_capital_currency").val());
	var paiclup_capital_currency = $.trim($("#paiclup_capital_currency").val());
	
	var isSalesDesk=$("#isSalesDesk").val();
	var param = {"cust_id":cust_id,"cust_level":cust_level,"cust_name":cust_name,"isSalesDesk":isSalesDesk,
				"corp_enterprises_property":corp_enterprises_property,"corp_setup_date":corp_setup_date,
				"corp_registe_capital":corp_registe_capital,"corp_paiclup_capital":corp_paiclup_capital,
				"corp_oragnization_code":corp_oragnization_code,"VIRTUAL_CODE":VIRTUAL_CODE,"corp_business_license":corp_business_license,
				"corp_tax_code":corp_tax_code,"corp_period_validity":corp_period_validity,
				"corp_company_zip":corp_company_zip,"corp_registe_address":corp_registe_address,
				"corp_work_address":corp_work_address,"corp_company_website":corp_company_website,
				"corp_other_massage":corp_other_massage,"corp_head_signature":corp_head_signature,
				"corp_hs_idcard":corp_hs_idcard,"corp_hs_link_mode":corp_hs_link_mode,
				"corp_hs_home_address":corp_hs_home_address,"corp_business_range":corp_business_range,
				"province_id":province_id,"city_id":city_id,
				"tax_code":tax_code,
				"remark":remark,
				"trade_type":trade_type,
				"area_id":area_id,
				"x_point":x_point,
				"y_point":y_point,
				"open_bank_name":open_bank_name,
				"open_bank_account":open_bank_account,
				"link_address":link_address,
				"link_phone":link_phone,
				"corp_company_email":corp_company_email,"__action":"customer.createCustomerCorp",
				"registe_capital_currency":registe_capital_currency,
				"paiclup_capital_currency":paiclup_capital_currency
	};
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			if (callback.rsCount == 1){
			//	alert("操作已成功！");
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