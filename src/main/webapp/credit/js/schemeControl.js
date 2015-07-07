function changeField(){
	changeLeaseTopric();
	updatePledgePrice();
	updateManagementFee();
	updateLeaseRZE();
    updatePrice1();
}
// 根据租赁物件清单中的单价修改融资租赁总价值
function changeLeaseTopric() {
    var form = document.schemeForm;
    var thingPrice = form.UNIT_PRICE;
    var thingNum = form.AMOUNT;
    var totalPrice=form.TOTAL;

    var thingTable = document.getElementById('equipmentTab');
    var value = 0;
    if (thingTable.rows.length == 5) {
        // 单行情况
        if (positive(thingPrice, '租赁物单价')||checkBlank(thingNum.value)) {
            value = 0;
        } else {
            value = parseFloat(thingPrice.value) * parseInt(thingNum.value, 10); 
        } 
        setFormatCurrency(thingPrice);  
        totalPrice.value=value;
        setFormatCurrency(totalPrice);
    } else if (thingTable.rows.length > 5) {
        // 多行情况
        for (var i = 0; i < thingPrice.length; i++) {
            var num = 0;
            if (thingPrice[i].value==''||positive(thingPrice[i], '租赁物单价')) {
                //value = 0;
            } else {
                num = parseFloat(thingPrice[i].value) * parseInt(thingNum[i].value, 10); 
            }
            	setFormatCurrency(thingPrice[i]);  
            if (num) {
                value += num; 
	        	totalPrice[i].value=num;
	        	setFormatCurrency(totalPrice[i]);
            }
        }
    }
    // 求和，计算租赁物件总价值
    form.LEASE_TOPRIC.value = parseInt(Math.round(value));
    //总价值变化后计算交机 比例
   // updateAppropiate0();
   // updateAppropiate1();
    
    setFormatCurrency(form.LEASE_TOPRIC);
    changeLeaseTopricBig();
//    alert(form.LEASE_TOPRIC.value);
    var custlastprice=$("#custgrantprice").val();
    var custprice=$("#custgrantprices").val();
    
    
    if(custlastprice==""){
    	custlastprice=0;   	
    }else{
     	var custlastprices=custlastprice.split("E");
     	
     	if(custlastprices.length==2){
    		custlastprice=parseFloat(custlastprices[0])*Math.pow(10,parseInt(custlastprices[1]));
   		}
    }
    
    if(custprice==""){
    	custprice=0;   	
    }else{  		
    	var custprices=custprice.split("E");
    	if(custprices.length==2){
    		custprice=parseFloat(custprices[0])*Math.pow(10,parseInt(custprices[1]));
    	}
    }
   
   
    if((parseInt(custlastprice)-parseInt(value))>=0){ 
    	//alert(parseInt(custlastprice)-parseInt(value));
    	var info="客户的授信额度："+parseFloat(custprice).toFixed(2)+"，剩余额度："+parseFloat(custlastprice).toFixed(2)+"客户的授信余足够租赁以上设备";  	
    	$("#showcustgrant").html(info);
    }else{
    	if(custprice==0){
  		 var info="<font color='red'>该客户没有授信</font>"; 
   		 $("#showcustgrant").html(info);
   		 }else{
   		 var info="<font color='red'>客户的授信额度："+parseFloat(custprice).toFixed(2)+"，剩余额度："+parseFloat(custlastprice).toFixed(2)+"客户的授信余额已不够租赁以上设备</font>"; 
   		 $("#showcustgrant").html(info);
   		 }
    };
    $("#custgrant").show();
}
function changeLeaseTopricBig() {
    // 修改大写金额
    var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value);
    document.getElementById('leaseTopricBig').innerHTML = atoc(value);
}

//根据质押金比例 计算质押金金额
function updatePledgePrice(){ 
	form =document.schemeForm;
	rate=form.PLEDGE_PRICE_RATE.value; 
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
	form.PLEDGE_PRICE.value=value/100*rate;
	setFormatCurrency(form.PLEDGE_PRICE);
	
	updateLeaseRZE();
	updatePledgeRealPrice();
}
function updatePledgeRealPrice(){
	form =document.schemeForm;
	// var PLEDGE_PRICE = parseCurrency(form.PLEDGE_PRICE.value);
	
	var PLEDGE_AVE_PRICE = parseCurrency(form.PLEDGE_AVE_PRICE.value);
	var PLEDGE_LAST_PRICE = parseCurrency(form.PLEDGE_LAST_PRICE.value);
	
	form.PLEDGE_REALPRIC.value = PLEDGE_AVE_PRICE + PLEDGE_LAST_PRICE;
	setFormatCurrency(form.PLEDGE_REALPRIC);
}

var formatCurrency = function(value) {
    if (MRound(value, 6) == 0) {
        return "0.00";
    }

    var v = '' + value;
    v = v.replace(/[￥,]/g, '');
    var s = '';
    if (v.indexOf(".") != -1) {
        var index = v.indexOf(".");
        s = v.substring(index);
        if (s.length > 3) {
            var num = parseInt(s.substring(1, 3), 10);
            if (parseInt(s.substring(3, 4), 10) > 4) {
                num++; // 四舍五入
            }
            s = "." + num;
        } else if (s.length == 2) {
            s += '0';
        }
        v = v.substring(0, index);
    } else {
        s = '.00';
    }
    var len = v.length;

    while (len > 3) {
        s = ',' + v.substring(len - 3) + s;
        v = v.substring(0, len - 3);
        len -= 3;
    }
    s = v + s;

    return s;
}

//根据质押金金额 计算质押金比例 
function updatePledgePriceRate(){
	form =document.schemeForm;
	var pledgePrice=form.PLEDGE_PRICE.value;
	pledgePrice = parseCurrency(pledgePrice);
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
    setFormatCurrency(form.PLEDGE_PRICE);
	//form.PLEDGE_PRICE_RATE.value=number(pledgePrice*100/value); 
	form.PLEDGE_PRICE_RATE.value=forDight(pledgePrice*100/value);
	// updateLeaseRZE();
}



//四舍五入 最多保留四位小数
function forDight(value){
	var result = Math.round(value*10000)/10000;
	return result;
}



// 首期款
function updateHeadHire() {
	form =document.schemeForm;
	rate=form.HEAD_HIRE_PERCENT.value;
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
	form.HEAD_HIRE.value=value/100*rate;
	setFormatCurrency(form.HEAD_HIRE);
	updateLeaseRZE();
}
function updateHeadHirePercent() {
	form =document.schemeForm;
	headHire=parseCurrency(form.HEAD_HIRE.value);
	var value = document.schemeForm.LEASE_TOPRIC.value;
    value = parseCurrency(value); 
    setFormatCurrency(form.HEAD_HIRE);
	form.HEAD_HIRE_PERCENT.value=number(headHire*100/value); 
	updateLeaseRZE();
}

//
function valueIsNumber1(field) {
	var value = field.value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
         field.value = value;
    } else {
         field.value = 0;
    }
}

function verifyNumber1(field) {
    var value = field.value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        field.value = value;
        //setFormatCurrency(field);
    } else {
        field.value = 0;
    }
}
function valueIsNumber2(id) {
	var value = document.getElementById(id).value;
    value = value.trim();
    var m=/^(\d)+$/;
    if(value.match(m)) {
         document.getElementById(id).value = value;
    } else {
         document.getElementById(id).value = 1;
    }
}
function verifyNumber2(id) {
    var value = document.getElementById(id).value;
    value = value.trim();
    value = value.replace(/[￥,]/g, '');

    if (checkNumber(value)) {
        if (value.substring(0,1) != '0') {
            value = value.replace(/^0+/g, '');
        }
        document.getElementById(id).value = formatCurrency(value);
    } else {
        document.getElementById(id).value = 0;
    }
}
// 小计 wjw 2010-07-14 
function updateTotal(index) {
	verifyNumber2("UNIT_PRICE"+index);
	valueIsNumber2("AMOUNT"+index);
	var price = parseCurrency(document.getElementById("UNIT_PRICE"+index).value);
	var amount = document.getElementById("AMOUNT"+index).value;
	document.getElementById("TOTAL"+index).value = formatCurrency(price * amount);
	
	changeField();
}
// 小计 hzq 2011-02-28 
function hunewupdateTotal(index,CONTRACT_TYPE) {
	
	verifyNumber2("SHUI_PRICE"+index);
	valueIsNumber2("AMOUNT"+index);
	CONTRACT_TYPE=$("#contract_typew").val();
	//Modify Michael 2012 07-12 重车回租 含税单价与未税单价一致  乘用车也是 含税单价与未税单价一致 
	if(CONTRACT_TYPE=="0"||CONTRACT_TYPE=="2"||CONTRACT_TYPE=="3"||CONTRACT_TYPE=="4" ||CONTRACT_TYPE=="6"||CONTRACT_TYPE=="7"||CONTRACT_TYPE=="8"||CONTRACT_TYPE=="9"||CONTRACT_TYPE=="10"||CONTRACT_TYPE=="11"
		||CONTRACT_TYPE=="12"||CONTRACT_TYPE=="13"||CONTRACT_TYPE=="14"){
		//alert("含税价就是单价");
	var price = parseCurrency(document.getElementById("SHUI_PRICE"+index).value);
	var amount = document.getElementById("AMOUNT"+index).value;
	//alert(price+amount);
	document.getElementById("TOTAL"+index).value = formatCurrency(price * amount);
	document.getElementById("UNIT_PRICE"+index).value = price;
	changeField();
	}else if(CONTRACT_TYPE=="1"||CONTRACT_TYPE=="5"){	
	var price = parseCurrency(document.getElementById("SHUI_PRICE"+index).value);
	//Marked by Michael 2011 12/5 单价四舍五入后取整
	price= formatCurrency(parseInt(Math.round(price/1.17)));
	var amount = document.getElementById("AMOUNT"+index).value;
	document.getElementById("TOTAL"+index).value = formatCurrency(price * amount);
	document.getElementById("UNIT_PRICE"+index).value = price;
	changeField();
	}
	
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
function updateYearInterest() {
	var form = document.schemeForm;
	valueIsNumber1(form.LEASE_TERM);
	var lease_period = form.LEASE_TERM.value;
	var lease_term = form.LEASE_COURSE.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_COURSE.focus();
    	return;
	}
	verifyNumber1(form.FLOAT_RATE);
	var float_rate = form.FLOAT_RATE.value;
	
	form.YEAR_INTEREST.value = Math.round(getBaseRate(lease_period * lease_term) * (1 + float_rate / 100)*Math.pow(10,6))/Math.pow(10,6);
}
function updateFloatRate(){
	var form = document.schemeForm;
	valueIsNumber1(form.LEASE_TERM);
	var lease_period = form.LEASE_TERM.value;
	var lease_term = form.LEASE_COURSE.value;
	if (lease_term == 0) {
		alert("请选择租赁周期!");
    	form.LEASE_COURSE.focus();
    	return;
	}
	verifyNumber1(form.YEAR_INTEREST);
	var year_interest = form.YEAR_INTEREST.value;
	
	form.FLOAT_RATE.value = Math.round((year_interest/getBaseRate(lease_period * lease_term) - 1) * 100 * Math.pow(10,6))/Math.pow(10,6); 
}
//
function updateLeaseRZE () {
	form =document.schemeForm;
	var value = document.schemeForm.LEASE_TOPRIC.value;
	PLEDGE_AVE_PRICE=form.PLEDGE_AVE_PRICE.value;
	PLEDGE_LAST_PRICE = form.PLEDGE_LAST_PRICE.value;
	PLEDGE_BACK_PRICE=form.PLEDGE_BACK_PRICE.value
	
    value = parseCurrency(value); 
    PLEDGE_AVE_PRICE = parseCurrency(PLEDGE_AVE_PRICE); 
    PLEDGE_LAST_PRICE = parseCurrency(PLEDGE_LAST_PRICE); 
    PLEDGE_BACK_PRICE=parseCurrency(PLEDGE_BACK_PRICE); 
	
	//Add by Michael 增加影响概算成本计算费用
    var TAX_PLAN_CODE= parseCurrency(form.TAX_PLAN_CODE.value);
    
	var totalFeeRZE=0;
	 $("input[feeListRZE='feeListRZE']").each(function(){
		 if (TAX_PLAN_CODE=="2"){
			 totalFeeRZE=totalFeeRZE+parseInt(Math.round(parseCurrency($(this).val())/1.06));
		 }else if (TAX_PLAN_CODE=="1"||TAX_PLAN_CODE=="3"||TAX_PLAN_CODE=="4"||TAX_PLAN_CODE=="5"||TAX_PLAN_CODE=="6"||TAX_PLAN_CODE=="7"||TAX_PLAN_CODE=="8"){
			 totalFeeRZE=totalFeeRZE+parseInt(Math.round(parseCurrency($(this).val())/1.06));
		 }
	 });
	 if(TAX_PLAN_CODE=="5") {
		 if($("#incomePayTax").val()=="") {
			 totalFeeRZE=totalFeeRZE-parseInt(Math.round(parseCurrency($("#pay__money").val())))-parseInt(Math.round(parseCurrency($("#pay__money").val())))*0.055
		 } else {
		//如果是乘用车税费方案需要扣除佣金,佣金税费,手续费税费
		 totalFeeRZE=totalFeeRZE-parseInt(Math.round(parseCurrency($("#pay__money").val())))-parseInt(Math.round(parseCurrency($("#pay__money").val())))*0.055
		 -parseInt(Math.round(parseCurrency($("#incomePayTax").val())));
		 }
	 }   
	var pay_way = form.PAY_WAY.value;
	
	if (pay_way == 11 || pay_way == 12 || pay_way == 13) {
		var head_hire = parseCurrency(form.HEAD_HIRE.value);
		//form.LEASE_RZE.value= value - PLEDGE_AVE_PRICE - PLEDGE_LAST_PRICE - head_hire;
		form.LEASE_RZE.value= value - PLEDGE_AVE_PRICE - PLEDGE_LAST_PRICE-PLEDGE_BACK_PRICE - head_hire-totalFeeRZE;
	} else {
		//form.LEASE_RZE.value= value - PLEDGE_AVE_PRICE - PLEDGE_LAST_PRICE;
		form.LEASE_RZE.value= value - PLEDGE_AVE_PRICE-PLEDGE_BACK_PRICE  - PLEDGE_LAST_PRICE-totalFeeRZE;
		form.HEAD_HIRE_PERCENT.value=0.0;
		form.HEAD_HIRE.value=0.0;
	}

	setFormatCurrency(form.LEASE_RZE);

	var leaseRze = parseCurrency(form.LEASE_RZE.value);
	var leasetopic  = parseCurrency($("#LEASE_TOPRIC").val()); 
	if(leasetopic>0){
		var result = Math.round(leaseRze*10000)/leasetopic/100;
		$("#leaseRzePrecent").html(result+'%');
	}else{
		$("#leaseRzePrecent").html("");
	}

}

function number(value) {
	  var num = parseInt(value * 100);
	  var first = parseInt(num / 100) + "";
	  var last = (num % 100) + "";
	  return first + "." + last;
}

//根据管理费比例 计算管理费金额
function updateManagementFee(){ 
	var form = document.schemeForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	verifyNumber1(form.MANAGEMENT_FEE_RATE);
	var management_fee_rate = form.MANAGEMENT_FEE_RATE.value; 
	valueIsNumber1(form.LEASE_TERM);
	var lease_period = form.LEASE_TERM.value;
	var lease_term = form.LEASE_COURSE.value;
	if (lease_term == 0) {
		form.LEASE_COURSE.value=1;
    	form.LEASE_COURSE.focus();
    	return;
	}
	
	var value = 0;
	value = (total_price * Number(management_fee_rate) / 100 )*(lease_period * lease_term / 12);
	form.MANAGEMENT_FEE.value = number(value );
	setFormatCurrency(form.MANAGEMENT_FEE);
	
}
//根据管理费金额 计算管理费比例
function updateManagementFeeRate(){
	var form = document.schemeForm;
	var total_price = parseCurrency(form.LEASE_TOPRIC.value);
	verifyNumber1(form.MANAGEMENT_FEE);
	var management_fee = parseCurrency(form.MANAGEMENT_FEE.value);
	
	valueIsNumber1(form.LEASE_TERM);
	var lease_period = form.LEASE_TERM.value;
	var lease_term = form.LEASE_COURSE.value;
	if (lease_term == 0) {
		form.LEASE_COURSE.value=1;
    	form.LEASE_COURSE.focus();
    	return;
	}
	
	var value = 0;
	value = (management_fee / (lease_period * lease_term / 12)  /  total_price) * 100;
	form.MANAGEMENT_FEE_RATE.value = Math.round((value)*Math.pow(10,6))/Math.pow(10,6);
}

function changeInsurePrice(){
	  var form = document.schemeForm;
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
	 
	  form.TOTAL_INSURE.value=value;
	  setFormatCurrency(form.TOTAL_INSURE);
	  document.getElementById('insureTotalBig').innerHTML=atoc(value);
}

function changeOtherPrice(){
	 var form = document.schemeForm;
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
	 
	  form.totalOtherPrice.value=value;
	  setFormatCurrency(form.totalOtherPrice);
	  document.getElementById('totalOtherPriceBig').innerHTML=atoc(value);
}

//初始化省份
function getCitys(){
	provinceId=$("#province_id").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#city_id option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			 $('#area_id option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });			 
			for(i=0;i<dataBack.citys.length;i++){
				$("#city_id").get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID)); 
			}
		}
	});
}
function getArea(){
	cityId=$("#city_id").val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getAreaByCityId&provinceId='+cityId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#area_id option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.area.length;i++){
				$("#area_id").get(0).options.add(new Option(dataBack.area[i].NAME,dataBack.area[i].ID)); 
			}
		}
	});
}
function checkAppropiatemon(){
	var front = parseCurrency(setzero($("#APPROPIATEMON0").val()));
	var after = parseCurrency(setzero($("#APPROPIATEMON1").val()));
	var begMoney = parseCurrency(setzero($("#BEGMONEY").val()));
	if(begMoney != (front + after)){
		alert("交机前交机后总金额与申请拨款金额不等") ;
		$("#APPROPIATEMON0").focus() ;
		return true ;
	} else {
		return false ;
	}
}

function getCitysByProvId(province_id, city_id){
	provinceId=$("#" + province_id).val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getCitysByProvinceId&provinceId='+provinceId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#' + city_id + ' option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.citys.length;i++){
				$("#" + city_id).get(0).options.add(new Option(dataBack.citys[i].NAME,dataBack.citys[i].ID)); 
			}
		}
	});
}

function getAreaByCityId(city_id, area_id){
	cityId=$("#" + city_id).val();
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getAreaByCityId&provinceId='+cityId,
		dataType:'json',
		success:function(dataBack){ 
			 $('#' + area_id + ' option').each(function(){  
			     if( $(this).val() != '-1'){  
			         $(this).remove();  
			     }  
			 });
			for(i=0;i<dataBack.area.length;i++){
				$("#" + area_id).get(0).options.add(new Option(dataBack.area[i].NAME,dataBack.area[i].ID)); 
			}
		}
	});
}
