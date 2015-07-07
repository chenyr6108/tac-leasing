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
function verifyNumber(field) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        setFormatCurrency(field);
    } else {
        field.value = 0;
    }
}
function verifyInteger(field) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');
	if (checkNumber(value)){
	    if (checkNegative(value)) {
	    	field.value = 0;
	    } else {
	    	if (value > 100) {
	    		field.value = 100;
	    	}
	      /* if (value.substring(0,2) != '0.') {
	           value = value.replace(/^0+/g, '');
	       }
	       field.value = value;*/
	    }
    } else {
   	  field.value = 0;
    }
}
//
changeFirstPrice = function () {
	var form = document.pucsContractForm;
	var first_price_rate = form.FIRST_PRICE_RATE.value;
	var total = form.TOTAL.value;
	form.FIRST_PRICE.value = number(total * first_price_rate / 100);
	setFormatCurrency(form.FIRST_PRICE);
}
//
changeFirstPriceRate = function () {
	var form = document.pucsContractForm;
	var total = form.TOTAL.value;
	var first_price = parseCurrency(form.FIRST_PRICE.value);

	form.FIRST_PRICE_RATE.value = Math.round((first_price/total)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeLastPrice = function () {
	var form = document.pucsContractForm;
	var last_price_rate = form.LAST_PRICE_RATE.value;
	var total = form.TOTAL.value;
	form.LAST_PRICE.value = number(total * last_price_rate / 100);
	setFormatCurrency(form.LAST_PRICE);
}
//
changeLastPriceRate = function () {
	var form = document.pucsContractForm;
	var total = form.TOTAL.value;
	var last_price = parseCurrency(form.LAST_PRICE.value);
	
	form.LAST_PRICE_RATE.value = Math.round((last_price/total)*Math.pow(10,4))/Math.pow(10,4)*100;
}
//
changeCustPrice = function () {
	var form = document.pucsContractForm;
	var cust_price_rate = form.CUST_PRICE_RATE.value;
	var total = form.TOTAL.value;
	form.CUST_PRICE.value = number(total * cust_price_rate / 100);
	setFormatCurrency(form.CUST_PRICE);
}
//
function changeField(eventName,field) {
 	//isDirty = true;
 	if (eventName == 'FIRST_PRICE_RATE') {
 		var form  = document.pucsContractForm;
 		
 		verifyInteger(field);
 		changeFirstPrice();
		//
 		form.LAST_PRICE_RATE.value = 100 - form.FIRST_PRICE_RATE.value;
 		changeLastPrice();
 		//
 		form.CUST_PRICE_RATE.value = form.FIRST_PRICE_RATE.value;
 		changeCustPrice();
 		//
 		form.FIRST_PRICE_3DAYS.value = form.FIRST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_3DAYS);
		//
		form.FIRST_PRICE_15DAYS.value = form.LAST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_15DAYS);
 		
 	} else if (eventName == 'LAST_PRICE_RATE') {
 		var form  = document.pucsContractForm;
 		
 		verifyInteger(field);
 		//
 		changeLastPrice();
 		//
 		form.FIRST_PRICE_RATE.value = 100 - form.LAST_PRICE_RATE.value;
 		changeFirstPrice();
 		//
 		form.CUST_PRICE_RATE.value = form.FIRST_PRICE_RATE.value;
 		changeCustPrice();
 		//
 		form.FIRST_PRICE_3DAYS.value = form.FIRST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_3DAYS);
		//
		form.FIRST_PRICE_15DAYS.value = form.LAST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_15DAYS);
		
 	} else if (eventName == 'FIRST_PRICE') {
 		var form  = document.pucsContractForm;
 		//
 		verifyNumber(field);
 		
 		changeFirstPriceRate();
 		//
 		//
 		form.LAST_PRICE_RATE.value = 100 - form.FIRST_PRICE_RATE.value;
 		changeLastPrice();
 		//
 		form.CUST_PRICE_RATE.value = form.FIRST_PRICE_RATE.value;
 		changeCustPrice();
 		//
 		form.FIRST_PRICE_3DAYS.value = form.FIRST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_3DAYS);
		//
		form.FIRST_PRICE_15DAYS.value = form.LAST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_15DAYS);
 		
 		
 	} else if (eventName == 'LAST_PRICE') {
		var form  = document.pucsContractForm;
 		//
 		verifyNumber(field);
 		changeLastPriceRate();
 		//
 		form.FIRST_PRICE_RATE.value = 100 - form.LAST_PRICE_RATE.value;
 		changeFirstPrice();
 		//
 		form.CUST_PRICE_RATE.value = form.FIRST_PRICE_RATE.value;
 		changeCustPrice();
 		//
 		form.FIRST_PRICE_3DAYS.value = form.FIRST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_3DAYS);
		//
		form.FIRST_PRICE_15DAYS.value = form.LAST_PRICE.value;
		setFormatCurrency(form.FIRST_PRICE_15DAYS);
 		
 		
 		
	}
    else {
        console.error('else ', eventName);
    }
}