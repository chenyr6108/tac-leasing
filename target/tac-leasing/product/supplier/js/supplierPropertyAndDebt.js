function changeProjectItem(){
	$("#showProject_item1").html($("#project_item1").val());
	$("#showProject_item2").html($("#project_item2").val());
	$("#showProject_item3").html($("#project_item3").val());
}

function sumZiChanZongE(){ 
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessss("ca_short_Invest",i)
	      		+getValuessss("ca_bills_should",i)
	      		+getValuessss("ca_Funds_should",i)
	      		+getValuessss("ca_other_Funds_should",i)
	     		+getValuessss("ca_Goods_stock",i)
	     		+getValuessss("ca_cash_price",i)
	     		+getValuessss("ca_other",i);
		  $("#ca_sum"+i).val(value1); 
		  value2=0;
		  value2=getValuessss("fa_land",i)
		         +getValuessss("fa_buildings",i)
		         +getValuessss("fa_equipments",i)
		         +getValuessss("fa_rent_Assets",i)
		         +getValuessss("fa_transports",i)
		         +getValuessss("fa_other",i)
		         -getValuessss("fa_Depreciations",i)
		         +getValuessss("fa_Incompleted_projects",i);
		  $("#fa_sum"+i).val(value2);
		  value3=0;
		  value3=getValuessss("ca_sum",i)
		  +getValuessss("fa_sum",i)
		  +getValuessss("lang_Invest",i)
		  +getValuessss("other_Assets",i);  
		  $("#capital_sum"+i).val(value3);   
	}
}

function sumFuZaiZongE(){
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessss("sd_short_debt",i)
	      		+getValuessss("sd_bills_should",i)
	      		+getValuessss("sd_funds_should",i)
	     		+getValuessss("sd_other_pay",i)
	     		+getValuessss("sd_shareholders",i)
	     		+getValuessss("sd_one_year",i)
	     		+getValuessss("sd_other",i);
		  $("#sd_sum"+i).val(value1);
		   value2=0;
		    value2=getValuessss("lang_debt",i)
		         +getValuessss("other_long_debt",i) 
		  $("#ld_sum"+i).val(value2);
		   value3=0;
		  value3=getValuessss("sd_sum",i)
		  +getValuessss("ld_sum",i) 
		  +getValuessss("other_debt",i);  
		  $("#debt_sum"+i).val(value3);   
	}
}

function sumJingZhiZongE(){
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessss("share_capital",i)
	      		+getValuessss("surplus_Capital",i)
	      		+getValuessss("surplus_income",i)
	     		+getValuessss("this_losts",i) 
	     		+getValuessss("project_changed",i);
		  $("#real_sum"+i).val(value1);   
	}
}

function initAllData(){ 
	$("#capitalAndDebtTab tr").each(function(n){
		if(n>=2){
			parents=(Math.round($(this).find("td").eq(1).find("input").val()*100000/$("#capital_sum1").val()))/1000.0;
			$(this).find("td").eq(2).html(parents+"%");
			parents=(Math.round($(this).find("td").eq(4).find("input").val()*100000/$("#capital_sum2").val()))/1000.0;
			$(this).find("td").eq(5).html(parents+"%");
			parents=(Math.round($(this).find("td").eq(7).find("input").val()*100000/$("#capital_sum3").val()))/1000.0;
			$(this).find("td").eq(8).html(parents+"%");
			chayi1=parseFloat($(this).find("td").eq(1).find("input").val())-parseFloat($(this).find("td").eq(4).find("input").val());
			$(this).find("td").eq(3).html(chayi1);
			chayi2=parseFloat($(this).find("td").eq(4).find("input").val())-parseFloat($(this).find("td").eq(7).find("input").val());
			$(this).find("td").eq(6).html(chayi2);
		}
	});
}


function initTable2Data(){
	$("#capitalAndDebtTab2 tr").each(function(n){
		if(n==3){
			date1=DateDiff($("#s_start_date1").val(),$("#project_item1").val());
			date2=DateDiff($("#s_start_date2").val(),$("#project_item2").val()); 
			if(parseFloat($(this).find("td").eq(4).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(1).find("input").val()*365/date1-$(this).find("td").eq(1).find("input").val())
				/$(this).find("td").eq(4).find("input").val()*100000)/1000.0;
			}
			$(this).find("td").eq(3).html(value1+"%"); 
			if(parseFloat($(this).find("td").eq(7).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(4).find("input").val()*365/date1-$(this).find("td").eq(4).find("input").val())
				/$(this).find("td").eq(7).find("input").val()*100000)/1000.0;
			}
			$(this).find("td").eq(6).html(value1+"%"); 
		}else if(n>=4){
			s_sale_net_income1=$("#s_sale_net_income1").val();
			parents=Math.round($(this).find("td").eq(1).find("input").val()*100000/s_sale_net_income1)/1000.0;
			$(this).find("td").eq(2).html(parents+"%");
			s_sale_net_income2=$("#s_sale_net_income2").val();
			parents=Math.round($(this).find("td").eq(4).find("input").val()*100000/s_sale_net_income2)/1000.0;
			$(this).find("td").eq(5).html(parents+"%");
			s_sale_net_income3=$("#s_sale_net_income3").val();
			parents=Math.round($(this).find("td").eq(7).find("input").val()*100000/s_sale_net_income3)/1000.0;
			$(this).find("td").eq(8).html(parents+"%");
			date1=DateDiff($("#s_start_date1").val(),$("#project_item1").val());
			date2=DateDiff($("#s_start_date2").val(),$("#project_item2").val()); 
			if(parseFloat($(this).find("td").eq(4).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(1).find("input").val()*365/date1-$(this).find("td").eq(1).find("input").val())
				/$(this).find("td").eq(4).find("input").val()*100000)/1000.0;
			}
			$(this).find("td").eq(3).html(value1+"%"); 
			if(parseFloat($(this).find("td").eq(7).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(4).find("input").val()*365/date1-$(this).find("td").eq(4).find("input").val())
				/$(this).find("td").eq(7).find("input").val()*100000)/1000.0;
			}
			$(this).find("td").eq(6).html(value1+"%"); 
		}
	});
}

function valueChangeTable1(field){ 
	if(valueIsDoubless(field)){  
		sumZiChanZongE(); 
		sumFuZaiZongE(); 
		sumJingZhiZongE() 
		initAllData();
	}else{ 
		alert($.trim($(field).parent().parent().find("td").eq(0).html())+" 填写有误！"); 
		$(field).focus(); 
		$(field).select(); 
		return false;
	}
}

function valueChangeTable2(field){ 
	if(valueIsDoubless(field)){
		sumYingYeLiYi();
		sumShuiQianSunYi();
		sumShuiHouSunYi();
		initTable2Data();
	}else{ 
		alert($.trim($(field).parent().parent().find("td").eq(0).html())+" 填写有误！"); 
		$(field).focus(); 
		$(field).select(); 
		return false;
	}
}

function pressKeyFunc(field,event){  
		if(event.keyCode==38){ 
			$(document).scrollTop($(field).offset().top-25) ;
			if(valueIsDoubless(field)){
			 	$(".inputData").eq($(".inputData").index($(field))-3).select(); 
			 }else{ 
				return false;
			}
		}else if(event.keyCode==40){
			$(document).scrollTop($(field).offset().top-25) ;
			  if(valueIsDoubless(field)){
			 	$(".inputData").eq($(".inputData").index($(field))+3).select(); 
			 }else{ 
				return false;
			}
			 
		}else if(event.keyCode==37){
			  if(valueIsDoubless(field)){
			 		 $(".inputData").eq($(".inputData").index($(field))-1).select(); 
			 }else{
				return false;
			}
		 
		}else if(event.keyCode==39){
		     if(valueIsDoubless(field)){
			 	 $(".inputData").eq($(".inputData").index($(field))+1).select(); 
			 }else{
			     return false;
			}
			
		} 
}


function pressKeyFunc2(field,event){  
		if(event.keyCode==38){ 
			$(document).scrollTop($(field).offset().top-25) ;
			if(valueIsDoubless(field)){
			 	$(".inputData2").eq($(".inputData2").index($(field))-3).select(); 
			 }else{ 
				return false;
			}
		}else if(event.keyCode==40){
			$(document).scrollTop($(field).offset().top-25) ;
			  if(valueIsDoubless(field)){
			 	$(".inputData2").eq($(".inputData2").index($(field))+3).select(); 
			 }else{ 
				return false;
			}
			 
		}else if(event.keyCode==37){
			  if(valueIsDoubless(field)){
			 		 $(".inputData2").eq($(".inputData2").index($(field))-1).select(); 
			 }else{
				return false;
			}
		 
		}else if(event.keyCode==39){
		     if(valueIsDoubless(field)){
			 	 $(".inputData2").eq($(".inputData2").index($(field))+1).select(); 
			 }else{
			     return false;
			}
			
		} 
}

function sumYingYeLiYi(){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessss("s_sale_net_income",i)
		  -getValuessss("s_sale_cost",i)
		  +getValuessss("s_other_gross_profit",i);
		  $("#s_sgp_sum"+i).val(value1);
		  value2=0;
		  value2=getValuessss("s_sgp_sum",i)
		  -getValuessss("s_operating_expenses",i);
		  $("#s_bp_sum"+i).val(value2);
	}	  
}

function sumShuiQianSunYi(){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessss("s_interest_expense",i)
		  +getValuessss("s_other_nonbusiness_expense",i);
		  $("#s_nbe_sum"+i).val(value1);
		  value2=0;
		  value2=getValuessss("s_nonbusiness_income",i)
		  +getValuessss("s_bp_sum",i)
		  -getValuessss("s_nbe_sum",i);
		  $("#s_before_sum"+i).val(value2);
	}	
}
function sumShuiHouSunYi(){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessss("s_before_sum",i)
		  -getValuessss("s_income_tax_expense",i);
		  $("#s_after_sum"+i).val(value1); 
	}	
}

function valueIsDoubless(xx)
{
	value=xx.value+""; 
    var m=/^[\+\-]?\d+(\.\d+)?$/;
    value = value.replace(/,/g, '');	
	if((value.match(m)||valueIsNumber(value)))
	{
		return true;
	}
	else
	{   
		return false;
	}
}

function valueIsNumber(value)
{
	var m=/^(\d)+$/;
	value = value.replace(/,/g, '');
    if(value.match(m))
    {
		return true;
	}
	else
	{
		return false;
	}
}

function getValuessss(name,id){
	value=0.0 ;
	value=$("#"+name+id).val(); 
	return parseFloat(value);
}

function DateDiff(asStartDate,asEndDate){

    var miStart=Date.parse(asStartDate.replace(/\-/g,'/'));

    var miEnd=Date.parse(asEndDate.replace(/\-/g,'/'));

    return (miEnd-miStart)/(1000*24*3600);

} 
function cutdown(index,col){
	if(index==1 && col==1){
		$("#capitalAndDebtTab tr").each(function(n){
			if(n>=2){
				var td2value = $(this).find("td").eq(1).find("input").val();
				$(this).find("td").eq(4).find("input").val(td2value);
				$(this).find("td").eq(1).find("input").val(0.0);
			}
		});
		valueChangeTable1(this);
	}
	if(index==1 && col==2){
		$("#capitalAndDebtTab tr").each(function(n){
			if(n>=2){
				var td2value = $(this).find("td").eq(4).find("input").val();
				$(this).find("td").eq(7).find("input").val(td2value);
				$(this).find("td").eq(4).find("input").val(0.0);
			}
		});
		valueChangeTable1(this);
	}
	if(index==2 && col==1){
		$("#capitalAndDebtTab2 tr").each(function(n){
			if(n>=3){
				var td2value = $(this).find("td").eq(1).find("input").val();
				$(this).find("td").eq(4).find("input").val(td2value);
				$(this).find("td").eq(1).find("input").val(0.0);
			}
		});
		valueChangeTable2(this);
	}
	if(index==2 && col==2){
		$("#capitalAndDebtTab2 tr").each(function(n){
			if(n>=3){
				var td2value = $(this).find("td").eq(4).find("input").val();
				$(this).find("td").eq(7).find("input").val(td2value);
				$(this).find("td").eq(4).find("input").val(0.0);
			}
		});
		valueChangeTable2(this);
	}
}



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