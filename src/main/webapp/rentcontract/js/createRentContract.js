
function notPositive(field, name) {
    var value = $.trim(field.value);
    value = value.replace(/[￥,]/g, '');
    if (!/^\d+(\.\d+)?$/.test(value)) {
        alert(name + '只能输入数字！');
        field.focus();
        return true;
    } else {
        value = '' + parseFloat(value);
        field.value = value
        return false;
    }
}

function submitForm() {
    //
    var form = document.rentContractForm;
    //
    if (form.CUST_TYPE.value == 1){
    	/*
    	if (blank(form.CORP_ORAGNIZATION_CODE, '组织机构代码证' )) {return false;}
    	if(checkNumber(form.BANK_ACCOUNTS.value)){}else{alert('银行帐号不正确！');form.BANK_ACCOUNTS.value='';}
    	if(!checkPhone(form.CUST_PHONE.value)){alert('电话格式不正确！');form.CUST_PHONE.value='';};
    	if(!checkPhone(form.CUST_FAX.value)){alert('传真格式不正确！');form.CUST_FAX.value='';};
    	if(checkNumber(form.CUST_ZIP.value)&&trimStr(form.CUST_ZIP.value).length==6){}else{alert('邮编格式不正确！');form.CUST_ZIP.value='';}
    	*/
    }
     
    if(form.LEASE_PERIOD.value == 0){
   		 alert("租赁期数不能为0");
		 return false;
    }
    //
  	if (form.DECP_ID.value == -1){
  		alert("请选择公司!");
    	form.DECP_ID.focus();
    	return false;
  	}
    //
  	if (form.PROVINCE_ID.value == -1){
  		alert("请选择合同所属省!");
    	form.PROVINCE_ID.focus();
    	return false;
  	}
  	//
  	if (form.RECT_TYPE.value == -1){
  		alert("请选择合同类型!");
    	form.RECT_TYPE.focus();
    	return false;
  	}
    
    var table = document.getElementById("equipmentTab");
    if(table.rows.length < 4){
		alert('必须添加租赁物件清单！');
		return false;
    } else if (table.rows.length == 4) {
    	if (form.TYPE.value == -1) {
    		alert("请选择产品类型！");
    		return false;
    	} 
    	if (form.KIND.value == -1) {
    		alert("请选择产品名称！");
    		return false;
    	}
    	if (form.PRODUCT.value == -1) {
    		alert("请选择规格型号！");
    		return false;
    	}
    	
    	if (blank(form.NUMBER, '产品机号')) {
    		return false;
    	}
    	
    	if (form.SUPPIER.value == -1) {
    		alert("请选择设备供应商！");
    		return false;
    	}
        if (positive(form.UNIT_PRICE, '设备单价')) {
            return false;
        }
        if (positive(form.SHUI_PRICE, '税款')) {
            return false;
        }
        if (positive(form.STAYBUY_PRICE, '设备留购价')) {
            return false;
        }

    }else {
    	//Add by Michael 2013 04-03 检查此次输入的机号是否有重复的
    	var tempThingNum="";
    	var tempProduct="";
	    for (var i = 0; i < table.rows.length-3; i++) {
	    	if (form.TYPE[i].value == -1) {
	    		alert("请选择产品类型！");
	    		return false;
	    	} 
	    	if (form.KIND[i].value == -1) {
	    		alert("请选择产品名称！");
	    		return false;
	    	}
	    	if (form.PRODUCT[i].value == -1) {
	    		alert("请选择规格型号！");
	    		return false;
	    	}

	    	if (blank(form.NUMBER[i], '产品机号')) {
	    		return false;
	    	}
	    	
	    	if (form.SUPPIER[i].value == -1) {
	    		alert("请选择设备供应商！");
	    		return false;
	    	}
	        if (positive(form.UNIT_PRICE[i], '设备单价')) {
	            return false;
	        }
	        if (positive(form.SHUI_PRICE[i], '税款')) {
	            return false;
	        }
	        if (positive(form.STAYBUY_PRICE[i], '设备留购价')) {
	            return false;
	        }
	        if(form.NUMBER[i].value!="待补机号" && form.NUMBER[i].value!="无机号" && form.NUMBER[i].value==tempThingNum && form.PRODUCT[i].value==tempProduct){
	        	alert("相同设备型号机号不允许重复！");
	        	return false;
	        }
	        tempProduct=form.PRODUCT[i].value;
	        tempThingNum=form.NUMBER[i].value;
   		}
    }

   	// 
    if (positive(form.LEASE_TOPRIC, '设备总价')) {
        return false;
    }
    //
    if (positive(form.LEASE_PERIOD, '租赁期数')) {
        return false;
    } 
    // 租赁周期
    if (form.LEASE_TERM.value == 0) {
    	alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return false;
    }
    // 支付方式
    if (form.PAY_WAY.value == 0) {
    	alert("请选择支付方式!");
    	form.PAY_WAY.focus();
    	return false;
    }
    // 支付方式
    if (form.DEAL_WAY.value == 0) {
    	alert("请选择租赁期满处理方式!");
    	form.DEAL_WAY.focus();
    	return false;
    }
    // 2011/12/21 Yang Yun 新增购买时间验证非空
    /*if (form.BUY_INSURANCE_TIME.value == 0) {
    	alert("请选购买时间!");
    	form.BUY_INSURANCE_TIME.focus();
    	return false;
    }
    // 保险公司
    if (form.INSURANCE_COMPANY_ID.value == 0) {
    	alert("请选择保险公司!");
    	form.INSURANCE_COMPANY_ID.focus();
    	return false;
    }*/
	// 
	 if (positive(form.PLEDGE_REALPRIC, '实际使用保证金')) {
        return;
    }
    //
    if (positive(form.PLEDGE_AVE_PRICE, '用于平均抵冲金额')) {
        return;
    }
    //
    if (positive(form.PLEDGE_BACK_PRICE, '用于期末退还金额')) {
        return;
    }
    //
    if (positive(form.PLEDGE_LAST_PRICE, '用于最后抵冲金额')) {
        return;
    }
    //
    if (positive(form.PLEDGE_LAST_PERIOD, '用于最后抵冲期数')) {
        return;
    }
    //
    if (positive(form.PLEDGE_ENTER_CMPRICE, '保证金入我司金额')) {
        return;
    }
    if (positive(form.PLEDGE_ENTER_CMRATE, '保证金入我司税额')) {
        return;
    }
    if (positive(form.PLEDGE_ENTER_AG, '保证金入供应商金额')) {
        return;
    }
    if (positive(form.PLEDGE_ENTER_MCTOAG, '我司入供应商税额')) {
        return;
    }
    if (positive(form.PLEDGE_ENTER_MCTOAGRATE, '我司入供应商税金')) {
        return;
    }
    if (positive(form.PLEDGE_ENTER_AGRATE, '保证金入供应商税额')) {
        return;
    }
		
    if (positive(form.PLEDGE_PRICE_RATE, '保证金（比率）')) {
        return false;
    }
    if (positive(form.PLEDGE_PRICE, '保证金')) {
        return false;
    }
    if (positive(form.PLEDGE_REALPRIC, '实际使用保证金')) {
        return false;
    }
    //
    if (positive(form.HEAD_HIRE_PERCENT, '首期租金（比率）')) {
        return false;
    }
    if (positive(form.HEAD_HIRE, '首期租金')) {
        return false;
    }
    //
    if (positive(form.MANAGEMENT_FEE_RATE, '管理费（比率）')) {
        return false;
    }
    if (positive(form.MANAGEMENT_FEE, '管理费')) {
        return false;
    }
    //
    if (positive(form.BUSINESS_TRIP_PRICE, '差旅费')) {
        return false;
    }
    //
    if (checkNumber(form.FLOAT_RATE, '利率上浮比例')) {
        return false;
    }
    //
    if (checkNumber(form.YEAR_INTEREST, '合同利率')) {
        return false;
    }
    //
  
    //
    if (positive(form.LEASE_RZE, '概算成本（RZE）')) {
        return false;
    }
    //
    /*if (positive(form.INSURE_REBATE_RATE, '保险返利百分比')) {
        return false;
    }
    */
    //
    var irrMonthPriceTab = document.getElementById("irrMonthPriceTab");
    if(irrMonthPriceTab.rows.length < 2){
    	/*
    	alert("请填写融资租赁方案测算方式一");
    	return false;
    	*/
    } else {
    	var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE");
    	for(var i=0;i<PAY_IRR_MONTH_PRICE.length;i++){
    		if (positive(PAY_IRR_MONTH_PRICE[i], '未税应付租金')) {
    			PAY_IRR_MONTH_PRICE[i].focus();
	    		return false;
	    	} else if(!valueIsDouble(PAY_IRR_MONTH_PRICE[i].value)) {
	    		PAY_IRR_MONTH_PRICE[i].focus();
	    		alert("请输入正确数字!");
	    		return false;
	    	}
    	}
    }
    
    /*var insureTab = document.getElementById("insureTab");
    if(insureTab.rows.length < 4){
		
    } else if (insureTab.rows.length == 4) {
    	if (form.INSURE_ITEM.value == 0) {
    		alert("请选择保险险种！");
    		return false;
    	}
    	if (blank(form.INSURE_START_DATE, '保险开始时间' )) {
    		return false;
    	}
    	if (blank(form.INSURE_END_DATE, '保险结束时间' )) {
    		return false;
    	}
    	if (positive(form.INSURE_RATE,'保险费率')) {
    		return false;
    	}
        if (positive(form.INSURE_PRICE, '保险费用')) {
            return false;
        }
    }else {
	    for (var i = 0; i < form.INSURE_ITEM.length; i++) {
	    	if (form.INSURE_ITEM[i].value == 0) {
	    		alert("请选择保险险种！");
	    		return false;
	    	}
	    	if (blank(form.INSURE_START_DATE[i], '保险开始时间' )) {
	    		return false;
	    	}
	    	if (blank(form.INSURE_END_DATE[i], '保险结束时间' )) {
	    		return false;
	    	}
	    	if (positive(form.INSURE_RATE[i],'保险费率')) {
	    		return false;
	    	}
	        if (positive(form.INSURE_PRICE[i], '保险费用')) {
	            return false;
	        }
	    }
    }*/
    
    var otherPriceTab = document.getElementById("otherPriceTab");
    if(otherPriceTab.rows.length < 4){
		
    } else if (otherPriceTab.rows.length == 4) {
    	if (blank(form.OTHER_NAME, '费用名称' )) {
    		return false;
    	}
    	if (positive(form.OTHER_PRICE, '费用金额' )) {
    		return false;
    	}
    	if (blank(form.OTHER_DATE, '产生费用时间' )) {
    		return false;
    	}
    }else {
	    for (var i = 0; i < form.OTHER_NAME.length; i++) {
	    	if (blank(form.OTHER_NAME[i], '费用名称' )) {
	    		return false;
	    	}
	    	if (positive(form.OTHER_PRICE[i], '费用金额' )) {
	    		return false;
	    	}
	    	if (blank(form.OTHER_DATE[i], '产生费用时间' )) {
	    		return false;
	    	}
	    }
    }

	//
  	if (blank(form.LESSOR, '出租人签字' ) || blank(form.LESSEE, '承租人签字' )) {
   		return false;
    }
    if(form.LEASE_PERIOD=="0"){
   		 alert("租赁期数不能为0");
		 return false;
    }
    if(checkPledgeAvePrice()){
		return false ;    	
    }
	if( checkPledgePrice()){
		return false ;
	}
	if(!checkStartDate()){
		return false ;
	}

	document.getElementsByName("subBut")[0].disabled=true;
    return true;
}
function checkPledgeAvePrice(){
	var pem=parseFloat($("#PLEDGE_ENTER_MCTOAG").val().replace(/[￥,]/g, ''));
	var pea=parseFloat($("#PLEDGE_ENTER_AG").val().replace(/[￥,]/g, ''));
	var pap = parseFloat($("#PLEDGE_AVE_PRICE").val().replace(/[￥,]/g, ''));
	if((pem + pea) != pap){
		alert("平均抵冲金额应为我司入供应商与入供应商之和！") ;
    	return true ;
	} else {
		return false ;
	}
}
function checkPledgePrice(){
	var pea=parseFloat($("#PLEDGE_ENTER_AG").val().replace(/[￥,]/g, ''));
	var pec = parseFloat($("#PLEDGE_ENTER_CMPRICE").val().replace(/[￥,]/g, ''));
	var pp = parseFloat($("#PLEDGE_PRICE").val().replace(/[￥,]/g, ''));
	var pap = parseFloat($("#PLEDGE_AVE_PRICE").val().replace(/[￥,]/g, ''));
	var pbp = parseFloat($("#PLEDGE_BACK_PRICE").val().replace(/[￥,]/g, ''));
	var plp = parseFloat($("#PLEDGE_LAST_PRICE").val().replace(/[￥,]/g, ''));
	if(((pea + pec) != pp) || ((pap + pbp + plp) != pp)){
		alert("保证金处理金额和保证金总额不符") ;
    	return true ;
	} else {
		return false ;
	}
}
function checkStartDate(){
	//乘用车委贷起租日不得晚于预计支付日  
	var taxPlanCode = $("#TAX_PLAN_CODE").val();
	if(taxPlanCode==5){
		var planDate = $("#ESTIMATES_PAY_DATE").val();
		var startDate = $("#START_DATE").val();
		if(planDate!="" && startDate>planDate){
			alert("乘用车委贷起租日不得晚于预计支付日.");
			return false;
		}
	}
	return true;
}