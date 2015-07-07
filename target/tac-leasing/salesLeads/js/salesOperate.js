
// 新增
function creatSales(){

	if(!valueIsNotNull(by('principal'))){
		alert("请填写负责人");
		by('principal').focus();
		return false;
	}
	if(!valueIsNotNull(by('theme'))){
		alert("请填写主题");
		by('theme').focus();
		return false;
	}
	if(!valueIsNotNull(by('cust_info'))){
		alert("请填写客户");
		by('cust_info').focus();
		return false;
	}
	if(!valueIsNotNull(by('finish_date'))){
		alert("请填写预计完成日期");
		by('finish_date').focus();
		return false;
	}
	if(!valueIsNotNull(by('chance_stage_id'))){
		alert("请选择机会阶段");
		by('chance_stage_id').focus();
		return false;
	}
	if(!isDouble(by('expect_money'))){
		alert("请填写正确金额");
		by('expect_money').focus();
		return false;
	}
	if(!valueIsNotNull(by('expect_money'))){
		alert("请填写预期金额");
		by('expect_money').focus();
		return false;
	}
	
	if(valueIsNotNull(by('possibility'))){
		if(!isPercent(by('possibility'))){
			alert("请填写正确数字");
			by('possibility').focus();
			return false;
		}
		return true;
	}
	
	if(!isDouble(by('expect_income_money'))){
		alert("请填写正确金额");
		by('expect_income_money').focus();
		return false;
	}
	if(!valueIsNotNull(by('currency_id'))){
		alert("请选择货币");
		by('currency_id').focus();
		return false;
	}
	$("#addForm").submit();
}

// 客户提示
$(function() {
	// 加载数据, 并在回调函数中用返回的数据初始化autocomplete
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=salesLeads.selectCustomer',
		dataType:'json',
		success: initAutoComplete
	}); 
	  
	$("#cust_info").blur(function(){
		var s = $("#cust_id").val();
		if(s==""){
			return;
		}
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher?cust_id='+s,
			data:'__action=salesLeads.selectLinkMan',
			dataType:'json' ,
			success: initAutoComplete2
		});
	});
});

// 修改
function upSales(){
	
	if(!valueIsNotNull(by('principal'))){
		alert("请填写负责人");
		by('principal').focus();
		return false;
	}
	if(!valueIsNotNull(by('theme'))){
		alert("请填写主题");
		by('theme').focus();
		return false;
	}
	if(!valueIsNotNull(by('cust_info'))){
		alert("请填写客户");
		by('cust_info').focus();
		return false;
	}
	if(!valueIsNotNull(by('finish_date'))){
		alert("请填写预计完成日期");
		by('finish_date').focus();
		return false;
	}
	if(!valueIsNotNull(by('chance_stage_id'))){
		alert("请选择机会阶段");
		by('chance_stage_id').focus();
		return false;
	}
	if(!isDouble(by('expect_money'))){
		alert("请填写正确金额");
		by('expect_money').focus();
		return false;
	}
	if(!valueIsNotNull(by('expect_money'))){
		alert("请填写预期金额");
		by('expect_money').focus();
		return false;
	}
	if(!isPercent(by('possibility'))){
		alert("请填写正确数字");
		by('possibility').focus();
		return false;
	}
	if(!isDouble(by('expect_income_money'))){
		alert("请填写正确金额");
		by('expect_income_money').focus();
		return false;
	}
	if(!valueIsNotNull(by('currency_id'))){
		alert("请选择货币");
		by('currency_id').focus();
		return false;
	}
	$("#modifyForm").submit();
}
