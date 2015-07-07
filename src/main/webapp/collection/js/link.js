
function number(value) {
    var num = parseInt(value * 100);
    var first = parseInt(num / 100) + "";
    var last = (num % 100) + "";
    return first + "." + last;
}
function valueIsNumber(field) {
	var value = field.value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
         field.value = value;
    } else {
         field.value = 0;
    }
}
function verifyNumber(field) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        // setFormatCurrency(field);
    } else {
        field.value = 0;
    }
}
// RZE
changeRZE = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var PLEDGE_AVE_PRICE = parseCurrency(form.PLEDGE_AVE_PRICE.value);
	var PLEDGE_LAST_PRICE = parseCurrency(form.PLEDGE_LAST_PRICE.value);
	var PLEDGE_BACK_PRICE = parseCurrency(form.PLEDGE_BACK_PRICE.value);
	
	var pay_way = form.PAY_WAY.value;
	if (pay_way == 11 || pay_way == 12 || pay_way == 13) {
		var head_hire = parseCurrency(form.HEAD_HIRE.value);
		form.LEASE_RZE.value = number(total_price - PLEDGE_AVE_PRICE - PLEDGE_LAST_PRICE - PLEDGE_BACK_PRICE - head_hire);
	} else {
		form.LEASE_RZE.value = number(total_price - PLEDGE_AVE_PRICE - PLEDGE_LAST_PRICE - PLEDGE_BACK_PRICE);
	}
	
	
	setFormatCurrency(form.LEASE_RZE);
}
// 租赁质押金
changePledgePrice = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var pledge_price_rate = form.PLEDGE_PRICE_RATE.value;
	form.PLEDGE_PRICE.value = number(total_price * pledge_price_rate / 100);
	setFormatCurrency(form.PLEDGE_PRICE);
}
changePledgeRealPrice = function(){
	var form = document.payForm;
	PLEDGE_AVE_PRICE = parseCurrency(form.PLEDGE_AVE_PRICE.value); 
    PLEDGE_LAST_PRICE = parseCurrency(form.PLEDGE_LAST_PRICE.value); 
    
    form.PLEDGE_REALPRIC.value = Number(PLEDGE_AVE_PRICE)+Number(PLEDGE_LAST_PRICE);
    setFormatCurrency(form.PLEDGE_REALPRIC);
}
//
changePledgePriceRate = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var pledge_price = parseCurrency(form.PLEDGE_PRICE.value);
	form.PLEDGE_PRICE_RATE.value = Math.round((pledge_price/total_price)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeHeadHire = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var head_hire_percent = form.HEAD_HIRE_PERCENT.value;
	form.HEAD_HIRE.value = number(total_price * head_hire_percent / 100 );
	setFormatCurrency(form.HEAD_HIRE);
}
//
changHeadHirePercent = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	var head_hire = parseCurrency(form.HEAD_HIRE.value);
	form.HEAD_HIRE_PERCENT.value = Math.round((head_hire/total_price)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeManagementFee = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	verifyNumber(form.MANAGEMENT_FEE_RATE);
	var management_fee_rate = form.MANAGEMENT_FEE_RATE.value;
	
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		form.LEASE_TERM.value=1;
    	form.LEASE_TERM.focus();
    	return;
	}
	
	var value = 0;
	value = (total_price * Number(management_fee_rate) / 100 )*(lease_period * lease_term / 12);
	form.MANAGEMENT_FEE.value = number(value );
	setFormatCurrency(form.MANAGEMENT_FEE);
}
//
changeManagementFeeRate = function () {
	var form = document.payForm;
	var total_price = form.TOTAL_PRICE.value;
	verifyNumber(form.MANAGEMENT_FEE);
	var management_fee = parseCurrency(form.MANAGEMENT_FEE.value);
	
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		form.LEASE_TERM.value=1;
    	form.LEASE_TERM.focus();
    	return;
	}
	
	var value = 0;
	value = (management_fee / (lease_period * lease_term / 12)  /  total_price) * 100;
	form.MANAGEMENT_FEE_RATE.value = Math.round((value)*Math.pow(10,4))/Math.pow(10,4);
}
//
getBaseRate = function (totalMonth) {
	if (totalMonth <= 6) {
		return baseRate.SIX_MONTHS;
	} else if (totalMonth <= 12) {
		return baseRate.ONE_YEAR;
	} else if (totalMonth <= 36) {
		return baseRate.ONE_THREE_YEARS;
	} else if (totalMonth <= 60) {
		return baseRate.THREE_FIVE_YEARS;
	} else {
		return baseRate.OVER_FIVE_YEARS;
	}
}
//
changeYearInterest = function () {
	var form = document.payForm;
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.FLOAT_RATE);
	var float_rate = form.FLOAT_RATE.value;
	
	form.YEAR_INTEREST.value = Math.round(getBaseRate(lease_period * lease_term) * (1 + float_rate / 100)*Math.pow(10,4))/Math.pow(10,4);
}
// 
changFloatRate = function () {
	var form = document.payForm;
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.YEAR_INTEREST);
	var year_interest = form.YEAR_INTEREST.value;
	
	form.FLOAT_RATE.value = Math.round((year_interest/getBaseRate(lease_period * lease_term) - 1) * 100 * Math.pow(10,4))/Math.pow(10,4); 
}

// 首期款合计
changeShowFirstValueSpan = function () {
	var form = document.payForm;
	var pledegPrice = parseCurrency(form.PLEDGE_PRICE.value);
	var FirstValue =  pledegPrice +  parseCurrency(form.HEAD_HIRE.value) + parseCurrency(form.MANAGEMENT_FEE.value) + parseCurrency(form.BUSINESS_TRIP_PRICE.value);
	var fv = formatCurrency(FirstValue);
	$("#showFirstValueSpan").html(fv);
}
changePayIrrMonthPriceEnd = function(){

	var form = document.payForm;
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	 
	var PAY_IRR_MONTH_PRICE_END = document.getElementsByName("PAY_IRR_MONTH_PRICE_END");
	for (var i=0; i<PAY_IRR_MONTH_PRICE_END.length; i++){
		
		var selectObj = PAY_IRR_MONTH_PRICE_END[i];
		var selectLen = selectObj.options.length;

		if (lease_period > selectLen) {
			
			for (var j=1;j<=(lease_period-selectLen);j++){
				var varItem = new Option(selectLen+j,selectLen+j)
				selectObj.options[selectLen+j-1] = varItem;
				selectObj.options.add(varItem);
			}
			
		
		} else if (lease_period < selectLen) {
		
			for (var j=selectLen;j>lease_period;j--){
				$(selectObj.options[j-1]).remove();
			}
			
		}
		
		changeIrrMonthPriceEnd(selectObj);
	}

}
function changeField(eventName,field) {
 	//isDirty = true;
	if (eventName == 'PLEDGE_PRICE_RATE') {
		changePledgePrice();
		changeRZE();
		changeShowFirstValueSpan();
	} else if (eventName == 'PLEDGE_PRICE') {
		verifyNumber(field);
		changePledgePriceRate();
		changeRZE();
		 
    } else if (eventName == 'HEAD_HIRE_PERCENT') {
       	changeHeadHire();
		changeShowFirstValueSpan();
		changeRZE();
    } else if (eventName == 'HEAD_HIRE') {
		verifyNumber(field);
       	changHeadHirePercent();
		 changeRZE();
    } else if (eventName == 'MANAGEMENT_FEE_RATE') {
		changeManagementFee();   
		changeShowFirstValueSpan();   
    } else if (eventName == 'MANAGEMENT_FEE') {
    	verifyNumber(field);
        changeManagementFeeRate();
		
    } else if (eventName == 'FLOAT_RATE') {
    	verifyNumber(field);
       	changeYearInterest();
    } else if (eventName == 'YEAR_INTEREST') {
       	changFloatRate();
    } else if (eventName == 'LEASE_PERIOD') {
       	changeYearInterest();
       	changeManagementFee();
       	changePayIrrMonthPriceEnd();
    } else if (eventName == 'LEASE_TERM') {
        changeYearInterest();
        changeManagementFee();
    } else if (eventName == 'INSURE_PRICE') {
        changeInsureTotal();
    } else if (eventName == 'OTHER_PRICE') {
        changeOtherFeeTotal();
    } else if (eventName == 'PAY_WAY') {
        changeRZE();
    } 
	

    else {
        console.error('else ', eventName);
    }
	
}

changeInsureTotal = function () {
	  var form = document.payForm;
	  insurePrice=form.INSURE_PRICE;
	  var tab= document.getElementById('insureTab');
	  var value=0;
	  var n=0; 
	  if(tab.rows.length==4){
	  		if(positive(insurePrice, '保险金额')){
	  			value=0;
	  		}else{
	  			value=parseCurrency(insurePrice.value);
		  		setFormatCurrency(insurePrice);
	  		}
	  }else{
	  	 for(i=0;i<insurePrice.length;i++){
		  	if(insurePrice[i].value==''||positive(insurePrice[i], '保险金额')){
		  		n=0;
		  	}else{
		  		n=parseCurrency(insurePrice[i].value);
		  	}
		  	value=n+value;
		  	setFormatCurrency(insurePrice[i]);
		  }
	  }
	 var showSpan = formatCurrency(value);
	 document.getElementById("showInsureTotalSpan").innerHTML = showSpan;
	
	 var showUpper = atoc(value);
	 document.getElementById("showInsureTotalSpanUpper").innerHTML = showUpper;
}
//
changeOtherFeeTotal = function () {
	var form = document.payForm;
	otherPrice=form.OTHER_PRICE;
	var tab= document.getElementById('otherPriceTab');
	var value=0;
	var n=0; 
	  if(tab.rows.length==4){
	  		if(positive(otherPrice, '其他费用金额')){
	  			value=0;
	  		}else{
	  			value=parseCurrency(otherPrice.value);
		  		setFormatCurrency(otherPrice);
	  		}
	  }else{
	  	 for(i=0;i<otherPrice.length;i++){
		  	if(otherPrice[i].value==''||positive(otherPrice[i], '其他费用金额')){
		  		n=0;
		  	}else{
		  		n=parseCurrency(otherPrice[i].value);
		  	}
		  	value=n+value;
		  	setFormatCurrency(otherPrice[i]);
		  }
	  }
	 
	   var showSpan = formatCurrency(value);
	 document.getElementById("showOtherFeeTotalSpan").innerHTML = showSpan;
	
	 var showUpper = atoc(value);
	 document.getElementById("showOtherFeeTotalSpanUpper").innerHTML = showUpper;
}
