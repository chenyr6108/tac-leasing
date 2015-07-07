
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

function submitPayForm() {
    //
    var form = document.payForm;
    
    //
    if (notPositive(form.LEASE_PERIOD, '租赁期数')) {
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
    // 保险公司
    if (form.INSURANCE_COMPANY_ID.value == 0) {
    	alert("请选择保险公司!");
    	form.INSURANCE_COMPANY_ID.focus();
    	return false;
    }
	// 
    if (notPositive(form.PLEDGE_PRICE_RATE, '保证金（比率）')) {
        return false;
    }
    if (notPositive(form.PLEDGE_PRICE, '保证金')) {
        return false;
    }
    if (notPositive(form.PLEDGE_REALPRIC, '实际使用保证金')) {
        return false;
    }    //
    //
    if (notPositive(form.PLEDGE_AVE_PRICE, '用于平均抵冲金额')) {
        return;
    }
    //
    if (notPositive(form.PLEDGE_BACK_PRICE, '用于期末退还金额')) {
        return;
    }
    //
    if (notPositive(form.PLEDGE_LAST_PRICE, '用于最后抵冲金额')) {
        return;
    }
    //
    if (notPositive(form.PLEDGE_LAST_PERIOD, '用于最后抵冲期数')) {
        return;
    }
    //
    if (notPositive(form.PLEDGE_ENTER_CMPRICE, '保证金入我司金额')) {
        return;
    }
    if (notPositive(form.PLEDGE_ENTER_MCTOAG, '我司入供应商金额')) {
        return;
    }
    if (notPositive(form.PLEDGE_ENTER_MCTOAGRATE, '我司入供应商税金')) {
        return;
    }
    if (notPositive(form.PLEDGE_ENTER_CMRATE, '保证金入我司税额')) {
        return;
    }
    if (notPositive(form.PLEDGE_ENTER_AG, '保证金入供应商金额')) {
        return;
    }
    if (notPositive(form.PLEDGE_ENTER_AGRATE, '保证金入供应商税金')) {
        return;
    }
    
    
    
    
    //
    if (notPositive(form.HEAD_HIRE_PERCENT, '首期租金（比率）')) {
        return false;
    }
    if (notPositive(form.HEAD_HIRE, '首期租金')) {
        return false;
    }
    //
//    if (notPositive(form.MANAGEMENT_FEE_RATE, '管理费（比率）')) {
//        return false;
//    }
//    if (notPositive(form.MANAGEMENT_FEE, '管理费')) {
//        return false;
//    }
    //
    if (notPositive(form.BUSINESS_TRIP_PRICE, '差旅费')) {
        return false;
    }
    //
//    if (notPositive(form.FINE_RATE, '日罚息率')) {
//        return false;
//    }
    //
    if (notPositive(form.LEASE_RZE, '概算成本（RZE）')) {
        return false;
    }
    //
    if (notPositive(form.INSURE_REBATE_RATE, '保险返利百分比')) {
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
    var insureTab = document.getElementById("insureTab");
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
    }
    
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
	/*
	var paylines = document.getElementsByName("MONTH_PRICE");
    for (var i=0;i<paylines.length;i++){
    
   	 	if (positive(form.MONTH_PRICE[i], '每期租金')) {
            return false;
        }
    }
    */
    PAY_WAY = form.PAY_WAY;
	var PAY_IRR_MONTH_PRICE = document.getElementsByName("PAY_IRR_MONTH_PRICE");
	
	if (PAY_IRR_MONTH_PRICE.length == 0 ) {
		alert("请填写应付租金！");
		return false;
	} else if (PAY_IRR_MONTH_PRICE.length == 1) {
		if (positive(form.PAY_IRR_MONTH_PRICE, '应付租金')) {
            return false;
        }
        if(PAY_WAY.value == 13 ||PAY_WAY.value == 11){
	    	//var pay_way=form.PAY_PAY_WAY.value;
	    	var head_price=HEAD_HIRE.value;
	    	var firstmonthprice=PAY_IRR_MONTH_PRICE[0].value;
	    	//alert(head_price+"==="+firstmonthprice);
	    	if(parseFloat(head_price) != parseFloat(firstmonthprice)){
	    		alert("期初方式首栏的应付租金应该等于首期租金");
	    		return false;
	    	}
    	}
	} else {
		for (var i=0;i<PAY_IRR_MONTH_PRICE.length;i++){
    
	   	 	if (positive(form.PAY_IRR_MONTH_PRICE[i], '应付租金')) {
	            return false;
	        }
	    }
	    if(PAY_WAY.value == 13 ||PAY_WAY.value == 11){
	    	//var pay_way=form.PAY_PAY_WAY.value;
	    	var head_price=HEAD_HIRE.value;
	    	var firstmonthprice=PAY_IRR_MONTH_PRICE[0].value;
	    	//alert(head_price+"==="+firstmonthprice);
	    	if(parseFloat(head_price) != parseFloat(firstmonthprice)){
	    		alert("期初方式首栏的应付租金应该等于首期租金");
	    		return false;
	    	}
    	}
	}
    
    
	var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END");
	for (var i=0;i<PAY_IRR_MONTH_PRICE_END.length;i++){
   
		if (i==PAY_IRR_MONTH_PRICE_END.length-1 && PAY_IRR_MONTH_PRICE_END[i].value != form.LEASE_PERIOD.value){
			alert("你选择的应付租金期数与租赁方案中租赁期数不符！");
			return false;
		}
    }

    
    return true;
}

