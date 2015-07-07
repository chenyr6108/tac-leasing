function notPositive(field, name) {
	var field = field;
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
    if (notPositive(form.LEASE_PERIOD, '租赁期数')) {
        return false;
    } 
    if (form.LEASE_TERM.value == 0) {
    	alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return false;
    }

    if (notPositive(form.PLEDGE_PRICE_RATE, '保证金 （比率）')) {
        return false;
    }
    if (notPositive(form.PLEDGE_PRICE, '保证金 ')) {
        return false;
    }
    if (notPositive(form.PLEDGE_REALPRIC, '实际保证金 ')) {
        return false;
    }
    //
    if (notPositive(form.HEAD_HIRE_PERCENT, '首期租金（比率）')) {
        return false;
    }
    if (notPositive(form.HEAD_HIRE, '首期租金')) {
        return false;
    }
    //
    if (notPositive(form.MANAGEMENT_FEE_RATE, '管理费（比率）')) {
        return false;
    }
    if (notPositive(form.MANAGEMENT_FEE, '管理费')) {
        return false;
    }
    if (notPositive(form.FLOAT_RATE, '利率上浮比例')) {
        return false;
    }
    if (notPositive(form.LEASE_RZE, '概算成本')) {
        return false;
    }
    if (notPositive(form.BUSINESS_TRIP_PRICE, '差旅费')) {
        return false;
    }
    
    
    	
    if (blank(document.getElementById("textareas"), '支付表' )) {
   		return false;
   	}
   	
    return true;
}

