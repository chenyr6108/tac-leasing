
function saveProject() {
	equipment = document.getElementById("equipmentTab").rows.length;
	form=document.schemeForm;
	if (equipment <= 3) {
		alert("必须添加租赁物件!");
		return false;
	}else if(equipment == 4){ 
		type=form.TYPE;
		kind=form.KIND;
		prodcut=form.PRODUCT;
		suppier=form.SUPPIER;
		unitPrice=form.UNIT_PRICE;
		staybuyPrice=form.STAYBUY_PRICE;
		amount=form.AMOUNT;
		TOTAL=form.TOTAL;
		if(type.value=='-1'){
			alert("产品类型选择有误!");
			type.focus();
			return false;
		}
		if(kind.value=='-1'){
			alert("产品名称选择有误!");
			kind.focus();
			return false;
		}
		if(prodcut.value=='-1'){
			alert("产品型号选择有误!");
			prodcut.focus();
			return false;
		}
		if(suppier.value=='-1'){
			alert("产品供应商选择有误!");
			suppier.focus();
			return false;
		}
		if(positive(staybuyPrice,'租赁物件留购价')){
			return false;
		}
		if(positive(unitPrice,'租赁物件单价')){
			return false;
		}
		if(!checkInteger(amount.value)){
			alert("租赁物件数量必须为整数!");
			amount.focus();
			return false;
		}
		TOTAL.value=parseCurrency(TOTAL.value);
	}else{
		type=form.TYPE;
		kind=form.KIND;
		prodcut=form.PRODUCT;
		suppier=form.SUPPIER;
		unitPrice=form.UNIT_PRICE;
		staybuyPrice=form.STAYBUY_PRICE;
		amount=form.AMOUNT;
		TOTAL=form.TOTAL;
		for(i=0;i<type.length;i++){
			if(type[i].value=='-1'){
				alert("产品类型选择有误!");
				type[i].focus();
				return false;
			}
			if(kind[i].value=='-1'){
				alert("产品名称选择有误!");
				kind[i].focus();
				return false;
			}
			if(prodcut[i].value=='-1'){
				alert("产品型号选择有误!");
				prodcut[i].focus();
				return false;
			}
			if(suppier[i].value=='-1'){
				alert("产品供应商选择有误!");
				suppier[i].focus();
				return false;
			}
			if(positive(staybuyPrice[i],'租赁物件留购价')){
				return false;
			}
			if(positive(unitPrice[i],'租赁物件单价')){
				return false;
			}
			if(!checkInteger(amount[i].value)){
				alert("租赁物件数量必须为整数!");
				amount[i].focus();
				return false;
			}
			TOTAL[i].value=parseCurrency(TOTAL[i].value);
		}
	} 
	LEASE_TOPRIC=form.LEASE_TOPRIC;
	LEASE_TOPRIC.value=parseCurrency(LEASE_TOPRIC.value);
	
	
	
	
	LEASE_PERIOD=form.LEASE_PERIOD;
	PLEDGE_PRICE_RATE=form.PLEDGE_PRICE_RATE;
	PLEDGE_PRICE=form.PLEDGE_PRICE;
	HEAD_HIRE_PERCENT = form.HEAD_HIRE_PERCENT;
	HEAD_HIRE = form.HEAD_HIRE;
	BUSINESS_TRIP_PRICE=form.BUSINESS_TRIP_PRICE;
	MANAGEMENT_FEE_RATE=form.MANAGEMENT_FEE_RATE;
	MANAGEMENT_FEE=form.MANAGEMENT_FEE;
	YEAR_INTEREST=form.YEAR_INTEREST;
	FLOAT_RATE=form.FLOAT_RATE;
	LEASE_RZE=form.LEASE_RZE;
	FINE_RATE=form.FINE_RATE;
	START_DATE=form.START_DATE;
	INSURE_REBATE_RATE=form.INSURE_REBATE_RATE;
	START_DATE=form.START_DATE;
	if(!checkInteger(LEASE_PERIOD.value)){
				alert("租赁期限必须为整数!");
				LEASE_TERM.focus();
				return false;
	}
	if(positive(PLEDGE_PRICE,'租赁质押金')||positive(HEAD_HIRE,'首期租金')||positive(LEASE_RZE,'概算成本')||
	positive(MANAGEMENT_FEE,'管理费')||positive(BUSINESS_TRIP_PRICE,'差旅费')){
				return false;
    } 	
    if(valueIsNotPercent(PLEDGE_PRICE_RATE,'租赁质押金比例')
    	||valueIsNotPercent(HEAD_HIRE_PERCENT,'首期租金比例')
    	||valueIsNotPercent(MANAGEMENT_FEE_RATE,'管理费比例')
    	||valueIsNotPercent(YEAR_INTEREST,'年利率')
    	||valueIsNotPercent(FLOAT_RATE,'利率上浮比例')
    	||valueIsNotPercent(FINE_RATE,'日罚息率')
    	||valueIsNotPercent(INSURE_REBATE_RATE,'保险返利百分比')){
    	return false;
    }
    if(blank(START_DATE,'起租日期')){
    	return false;
    }
    insureTab = document.getElementById("insureTab").rows.length;
    if(insureTab == 4){ 
    	INSURE_RATE=form.INSURE_RATE;
    	INSURE_PRICE=form.INSURE_PRICE;
    	if(valueIsNotPercent(INSURE_RATE,'保险费率')){
    		return false;
    	}
    	if(positive(INSURE_PRICE,'保险费金额')){
    		return false;
    	}
    }else if(insureTab>4){ 
    	INSURE_RATE=form.INSURE_RATE;
    	INSURE_PRICE=form.INSURE_PRICE;
    	for(i=0;i<INSURE_RATE.length;i++){ 
    		if(valueIsNotPercent(INSURE_RATE[i],'保险费率')){
    		return false;
    	}
    	if(positive(INSURE_PRICE[i],'保险费金额')){
    		return false;
    	}
    	}
    }
     form.submit();
}

$(function (){
	$("#datebegin").datepicker($.datepicker.regional['zh-CN']);
});
$(function (){
	 $.datepicker.regional['zh-CN'] =
     {
        clearText: '清除', clearStatus: '清除已选日期',
        closeText: '关闭', closeStatus: '不改变当前选择',
        prevText: '&lt;上月', prevStatus: '显示上月',
        nextText: '下月&gt;', nextStatus: '显示下月',
        currentText: '今天', currentStatus: '显示本月',
        monthNames: ['一月','二月','三月','四月','五月','六月',
        '七月','八月','九月','十月','十一月','十二月'],
        monthNamesShort: ['一月','二月','三月','四月','五月','六月',
        '七月','八月','九月','十月','十一月','十二月'],
        monthStatus: '选择月份', yearStatus: '选择年份',
        weekHeader: '周', weekStatus: '年内周次',
        dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
        dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
        dayNamesMin: ['日','一','二','三','四','五','六'],
        dayStatus: '设置 DD 为一周起始', dateStatus: '选择 m月 d日, DD',
        dateFormat: 'yy-mm-dd', firstDay: 1,
        initStatus: '请选择日期', isRTL: false,
		changeMonth: true,changeYear: true
   };
	  $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
	$("#dateend").datepicker();
});