function selectContent(th) {
	th.setAttribute('autocomplete','off');
	th.select();
}
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
function valueIsNumber1(field) {
	var value = field.value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
        // field.value = value;
    } else {
         field.value = 1;
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
	var form = document.rentContractForm;
	var value = parseCurrency(form.LEASE_TOPRIC.value);

	var PLEDGE_AVE_PRICE=form.PLEDGE_AVE_PRICE.value;
	var PLEDGE_LAST_PRICE = form.PLEDGE_LAST_PRICE.value;
	var PLEDGE_BACK_PRICE = form.PLEDGE_BACK_PRICE.value;
	
    PLEDGE_AVE_PRICE = parseCurrency(PLEDGE_AVE_PRICE); 
    PLEDGE_LAST_PRICE = parseCurrency(PLEDGE_LAST_PRICE); 
    PLEDGE_BACK_PRICE = parseCurrency(PLEDGE_BACK_PRICE); 
	
	var pay_way = form.PAY_WAY.value;
	
	if (pay_way == 11 || pay_way == 12 || pay_way == 13) {
		var head_hire = parseCurrency(form.HEAD_HIRE.value);
		form.LEASE_RZE.value= value - Number(PLEDGE_AVE_PRICE) - Number(PLEDGE_LAST_PRICE) - Number(PLEDGE_BACK_PRICE) - Number(head_hire);
	} else {
		form.LEASE_RZE.value= value - Number(PLEDGE_AVE_PRICE) - Number(PLEDGE_LAST_PRICE) - Number(PLEDGE_BACK_PRICE);
	}

	setFormatCurrency(form.LEASE_RZE);
}
// 租赁质押金
changePledgePrice = function () {
	var form = document.rentContractForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	var pledge_price_rate = form.PLEDGE_PRICE_RATE.value;
	form.PLEDGE_PRICE.value = number(total_price * pledge_price_rate / 100);
	setFormatCurrency(form.PLEDGE_PRICE);
}
changePledgeRealPrice = function(){
	var form = document.rentContractForm;
	PLEDGE_AVE_PRICE = parseCurrency(form.PLEDGE_AVE_PRICE.value); 
    PLEDGE_LAST_PRICE = parseCurrency(form.PLEDGE_LAST_PRICE.value); 
    
    form.PLEDGE_REALPRIC.value = Number(PLEDGE_AVE_PRICE)+Number(PLEDGE_LAST_PRICE);
    setFormatCurrency(form.PLEDGE_REALPRIC);
}
//
changePledgePriceRate = function () {
	var form = document.rentContractForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	var pledge_price = parseCurrency(form.PLEDGE_PRICE.value);
	form.PLEDGE_PRICE_RATE.value = Math.round((pledge_price/total_price)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeHeadHire = function () {
	var form = document.rentContractForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	var head_hire_percent = form.HEAD_HIRE_PERCENT.value;
	form.HEAD_HIRE.value = number(total_price * head_hire_percent / 100 );
	setFormatCurrency(form.HEAD_HIRE);
}
//
changHeadHirePercent = function () {
	var form = document.rentContractForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	var head_hire = parseCurrency(form.HEAD_HIRE.value);
	form.HEAD_HIRE_PERCENT.value = Math.round((head_hire/total_price)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeManagementFee = function () {
	var form = document.rentContractForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	verifyNumber(form.MANAGEMENT_FEE_RATE);
	var management_fee_rate = form.MANAGEMENT_FEE_RATE.value;
	
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		// alert("请选择租赁周期!");
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
	var form = document.rentContractForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	verifyNumber(form.MANAGEMENT_FEE);
	var management_fee = parseCurrency(form.MANAGEMENT_FEE.value);
	
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		// alert("请选择租赁周期!");
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
	var form = document.rentContractForm;
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		// alert("请选择租赁周期!");
		form.LEASE_TERM.value=1;
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.FLOAT_RATE);
	var float_rate = form.FLOAT_RATE.value;
	
	form.YEAR_INTEREST.value = Math.round(getBaseRate(lease_period * lease_term) * (1 + float_rate / 100)*Math.pow(10,6))/Math.pow(10,6);
}
// 
changFloatRate = function () {
	var form = document.rentContractForm;
	valueIsNumber(form.LEASE_PERIOD);
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		// alert("请选择租赁周期!");
		form.LEASE_TERM.value=1;
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.YEAR_INTEREST);
	var year_interest = form.YEAR_INTEREST.value;
	
	form.FLOAT_RATE.value = Math.round((year_interest/getBaseRate(lease_period * lease_term) - 1) * 100 * Math.pow(10,6))/Math.pow(10,6); 
}

// 首期款合计
changeShowFirstValueSpan = function () {

}
changeUnitPrice = function () {
	var form = document.rentContractForm;
	verifyNumber(form.UNIT_PRICE);
	valueIsNumber1(form.AMOUNT);
	var unitPrice = form.UNIT_PRICE.value;
	var lease_period = form.LEASE_PERIOD.value;
	var lease_term = form.LEASE_TERM.value;
	if (lease_term == 0) {
		// alert("请选择租赁周期!");
		form.LEASE_TERM.value=1;
    	form.LEASE_TERM.focus();
    	return;
	}
	verifyNumber(form.YEAR_INTEREST);
	var year_interest = form.YEAR_INTEREST.value;
	
	form.FLOAT_RATE.value = Math.round((year_interest/getBaseRate(lease_period * lease_term) - 1) * 100 * Math.pow(10,6))/Math.pow(10,6); 
}
//
function changeField(eventName,field) {
 	//isDirty = true;
 	if (eventName == 'UNIT_PRICE') {
 		verifyNumber(field);
 		changeLeaseTopic();
 	} else if (eventName == 'AMOUNT') {
 		valueIsNumber1(field);
 		changeLeaseTopic();
 	} else if (eventName == 'LEASE_TOPRIC') {
 		changeLeaseTopic();
 		changePledgePrice();
 	} else if (eventName == 'PLEDGE_PRICE_RATE') {
		changePledgePrice();
		changeRZE();
	} else if (eventName == 'PLEDGE_PRICE') {
		verifyNumber(field);
		changePledgePriceRate();
		changeRZE();
    } else if (eventName == 'HEAD_HIRE_PERCENT') {
       	changeHeadHire();
       	changeRZE();
    } else if (eventName == 'HEAD_HIRE') {
		verifyNumber(field);
       	changHeadHirePercent();
       	changeRZE();
    } else if (eventName == 'MANAGEMENT_FEE_RATE') {
		changeManagementFee();     
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
function changeFields(eventName,field,contracttype) {
		
		verifyNumber(field);
 		changeHuLeaseTopic(contracttype);
}

changeHuLeaseTopic = function (contracttype) {
	
  	var form = document.rentContractForm;
  	//修改合计错误问题
    var thingNum = form.AMOUNT;//数量
    
   var shuiPrice = form.SHUI_PRICE;//税前价
    var thingPrice = form.UNIT_PRICE;//单价
    
    var totalPrice = form.TOTAL;//单项总价
   // var thingNum=document.getElementById("AMOUNT");
    //var shuiPrice = document.getElementById("SHUI_PRICE");
    //var thingPrice = document.getElementById("UNIT_PRICE");
   //var totalPrice = document.getElementById("TOTAL");
   
   //修改完毕
   
    var table = document.getElementById("equipmentTab");
    var len = table.rows.length-3;
    var value = 0;
    if (len == 1) {
        //单行
        if (positive(thingPrice, '租赁物单价') || largerThanOne(thingNum,'租赁物件数量')) {
            value = 0;
        } else {
           if(contracttype=='0'||contracttype=='2'){
           	
            value = parseFloat(shuiPrice.value) * parseInt(thingNum.value, 10);
            thingPrice.value=parseFloat(shuiPrice.value);
           }else if(contracttype=='1'){
           	 value = (parseFloat(shuiPrice.value)/1.17) * parseInt(thingNum.value, 10);
             thingPrice.value=parseFloat(shuiPrice.value)/1.17;
           }
          
            totalPrice.value = value;
            setFormatCurrency(thingPrice);
            setFormatCurrency(totalPrice);
        }
    } else if (len >1 ) {
        //多行
        for (var i = 0; i < len; i++) {
            var num = 0;
            if (positive(thingPrice[i],'租赁物单价') || largerThanOne(thingNum[i],'租赁物件数量')) {
                //value = 0;
            } else {
           	 if(contracttype=='0'||contracttype=='2'){
           		//修改合计错误问题
           		//num = parseFloat(shuiPrice[i].value) * parseInt(thingNum[i].value, 10);
                num = parseFloat(shuiPrice[i].value.replace(/[￥,]/g, '')) * parseInt(thingNum[i].value, 10);
                
                thingPrice[i].value = shuiPrice[i].value;
			 }else if(contracttype=='1'){
			 	num = (parseFloat(shuiPrice[i].value)/1.17) * parseInt(thingNum[i].value, 10);
                thingPrice[i].value = parseFloat(shuiPrice[i].value)/1.17;
                
			 }
				totalPrice[i].value = num;
				
				setFormatCurrency(thingPrice[i]);
				setFormatCurrency(totalPrice[i]);
            }
			
            if (!isNaN(num)) {
                value += num;
            }
			
        }
    } else if(len < 1){
		alert('必须添加租赁物件清单！');
		value = 0;
    }
    //求和
//	var showSpan = formatCurrency(value);
	var showSpan = parseInt(Math.round(value));
	
	document.getElementById("LEASE_TOPRIC").value = showSpan;
	var showUpper = atoc(value);
	document.getElementById("totalUpper").innerHTML = showUpper;
	
	changePledgePrice();
	changeRZE();
	changeHeadHire();
	changeManagementFee(); 
}

changeLeaseTopic = function () {
  	var form = document.rentContractForm;
    var thingNum = form.AMOUNT;
    var thingPrice = form.UNIT_PRICE;
    var totalPrice = form.TOTAL;
    var table = document.getElementById("equipmentTab");
    var len = table.rows.length-3;
    var value = 0;
    if (len == 1) {
        //单行
        if (positive(thingPrice, '租赁物单价') || largerThanOne(thingNum,'租赁物件数量')) {
            value = 0;
        } else {
            value = parseFloat(thingPrice.value) * parseInt(thingNum.value, 10);
            totalPrice.value = value;
            setFormatCurrency(thingPrice);
            setFormatCurrency(totalPrice);
        }
    } else if (len >1 ) {
        //多行
        for (var i = 0; i < len; i++) {
            var num = 0;
            if (positive(thingPrice[i],'租赁物单价') || largerThanOne(thingNum[i],'租赁物件数量')) {
                //value = 0;
            } else {
                num = parseFloat(thingPrice[i].value) * parseInt(thingNum[i].value, 10);
				totalPrice[i].value = num;
				setFormatCurrency(thingPrice[i]);
				setFormatCurrency(totalPrice[i]);
            }
			
            if (!isNaN(num)) {
                value += num;
            }
			
        }
    } else if(len < 1){
		alert('必须添加租赁物件清单！');
		value = 0;
    }
    //求和
//	var showSpan = formatCurrency(value);
	var showSpan = parseInt(Math.round(value));
	
	document.getElementById("LEASE_TOPRIC").value = showSpan;
	var showUpper = atoc(value);
	document.getElementById("totalUpper").innerHTML = showUpper;
	
	changePledgePrice();
	changeRZE();
	changeHeadHire();
	changeManagementFee(); 
}
changeInsureTotal = function () {
	  var form = document.rentContractForm;
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
	var form = document.rentContractForm;
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
