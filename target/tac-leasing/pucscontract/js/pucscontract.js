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
function isNumber(field){
	var value = $.trim(field.value);
    value = value.replace(/[￥,]/g, '');
    if (!/^\d+(\.\d+)?$/.test(value)) {
        alert('只能输入数字！');
        field.value = '';
        return true;
    } else {
        value = '' + parseFloat(value);
        field.value = value
        return false;
    }
}

function submitForm() {
    //
    var form = document.pucsContractForm;
    //
    if (blank(form.PUCT_CODE, '购销合同编号' )) {
   		return false;
   	}
   	//
    if (blank(form.SIGN_ADDRESS, '签定地点' )) {
   		return false;
   	}
   	//
    if (blank(form.SIGN_DATE, '签定时间' )) {
   		return false;
   	}
    if (date(form.SIGN_DATE, '签定时间' )) {
   		return false;
   	}
   	//
    if (blank(form.DELIVERY_DATE, '交货时间' )) {
   		return false;
   	}
    if (date(form.DELIVERY_DATE, '交货时间' )) {
   		return false;
   	}
   	//
    if (blank(form.DELIVERY_ADDRESS, '交货地点' )) {
   		return false;
   	}
   	//
    if (blank(form.RECEIVING_UNIT, '收货单位' )) {
   		return false;
   	}
   	//
    if (blank(form.LINKMAN, '联系人' )) {
   		return false;
   	}
   	//
    // if (blank(form.LINKMAN_MOBILE, '', form.LINKMAN_TEL,'')) {
    if (checkBlank(form.LINKMAN_MOBILE.value) && checkBlank(form.LINKMAN_TEL.value)) {
        alert('联系人手机和联系人电话不可同时为空！');
   		return false;
   		
   	} else {
   		 if (!checkBlank(form.LINKMAN_MOBILE.value)) {
	   		 if (mobile(form.LINKMAN_MOBILE, '联系人手机' )) {
		   		return false;
		   	 }
	   	 } else if (!checkBlank(form.LINKMAN_TEL.value)) {
	   	    if (phone(form.LINKMAN_TEL,'联系人电话')) {
		   		return false;
		   	}
	   	 } else {
	   	 
	   	 }
   	}
   	
   	//
    if (blank(form.FIRST_PRICE_RATE, '首款比例' ) ) {
   		return false;
   	}
    //
    if (positive(form.FIRST_PRICE, '首款金额')) {
           return false;
    }
    //
    if (positive(form.FIRST_PRICE_3DAYS, '买方在合同签订三日内支付金额')) {
           return false;
    }
    //
    if (positive(form.FIRST_PRICE_15DAYS, '买方在交货前十五日支付支付金额')) {
           return false;
    }
   	//
    if (blank(form.LAST_PRICE_RATE, '尾款比例' ) ) {
   		return false;
   	}
    //
    if (positive(form.LAST_PRICE, '尾款金额')) {
           return false;
    }
    //
    if (blank(form.CUST_PRICE_RATE, '承租方支付比例' ) ) {
   		return false;
   	}
   	//
    if (positive(form.CUST_PRICE, '承租方支付金额')) {
           return false;
    }
    //
    if (positive(form.CUST_PRICE_3DAYS, '承租方在合同签订三日内支付金额')) {
           return false;
    }
    //
    if (positive(form.CUST_PRICE_15DAYS, '承租方在交货前十五日支付支付金额')) {
           return false;
    }
    
    
   	//
    if (blank(form.BUYER_UNIT_NAME, '买受人单位名称' )) {
   		return false;
   	}
    return true;
}

