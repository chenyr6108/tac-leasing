function changeProjectItemVc(){
	$("#showProject_itemVc1").html($("#project_itemVc1").val());
	$("#showProject_itemVc2").html($("#project_itemVc2").val());
	$("#showProject_itemVc3").html($("#project_itemVc3").val());
}
function sumZiChanZongEVc(){ 
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessssVc("ca_short_InvestVc",i)
	      		+getValuessssVc("ca_bills_shouldVc",i)
	      		+getValuessssVc("ca_Funds_shouldVc",i)
	      		+getValuessssVc("ca_other_Funds_shouldVc",i)
	     		+getValuessssVc("ca_Goods_stockVc",i)
	     		+getValuessssVc("ca_cash_priceVc",i)
	     		+getValuessssVc("ca_otherVc",i);
		  $("#ca_sumVc"+i).val(value1); 
		  value2=0;
		  value2=getValuessssVc("fa_landVc",i)
		         +getValuessssVc("fa_buildingsVc",i)
		         +getValuessssVc("fa_equipmentsVc",i)
		         +getValuessssVc("fa_rent_AssetsVc",i)
		         +getValuessssVc("fa_transportsVc",i)
		         +getValuessssVc("fa_otherVc",i)
		         -getValuessssVc("fa_DepreciationsVc",i)
		         +getValuessssVc("fa_Incompleted_projectsVc",i);
		  $("#fa_sumVc"+i).val(value2);
		  value3=0;
		  value3=getValuessssVc("ca_sumVc",i)
		  +getValuessssVc("fa_sumVc",i)
		  +getValuessssVc("lang_InvestVc",i)
		  +getValuessssVc("other_AssetsVc",i);  
		  $("#capital_sumVc"+i).val(Math.round(value3 * 100) / 100.00);   
	}
}

function sumFuZaiZongEVc(){
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessssVc("sd_short_debtVc",i)
	      		+getValuessssVc("sd_bills_shouldVc",i)
	      		+getValuessssVc("sd_funds_shouldVc",i)
	     		+getValuessssVc("sd_other_payVc",i)
	     		+getValuessssVc("sd_shareholdersVc",i)
	     		+getValuessssVc("sd_one_yearVc",i)
	     		+getValuessssVc("sd_otherVc",i);
		  $("#sd_sumVc"+i).val(value1);
		   value2=0;
		    value2=getValuessssVc("lang_debtVc",i)
		         +getValuessssVc("other_long_debtVc",i) 
		  $("#ld_sumVc"+i).val(value2);
		   value3=0;
		  value3=getValuessssVc("sd_sumVc",i)
		  +getValuessssVc("ld_sumVc",i) 
		  +getValuessssVc("other_debtVc",i);  
		  $("#debt_sumVc"+i).val(value3);   
	}
}

function sumJingZhiZongEVc(){
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessssVc("share_capitalVc",i)
	      		+getValuessssVc("surplus_CapitalVc",i)
	      		+getValuessssVc("surplus_incomeVc",i)
	     		+getValuessssVc("this_lostsVc",i) 
	     		+getValuessssVc("project_changedVc",i);
		  $("#real_sumVc"+i).val(value1);   
	}
}

function initAllDataVc(){ 
	$("#capitalAndDebtTabVc tr").each(function(n){
		if(n>=2){
			parents=(Math.round($(this).find("td").eq(1).find("input").val()*10000/$("#capital_sumVc1").val()))/100.0;
			$(this).find("td").eq(2).html(parents+"%");
			parents=(Math.round($(this).find("td").eq(4).find("input").val()*10000/$("#capital_sumVc2").val()))/100.0;
			$(this).find("td").eq(5).html(parents+"%");
			parents=(Math.round($(this).find("td").eq(7).find("input").val()*10000/$("#capital_sumVc3").val()))/100.0;
			$(this).find("td").eq(8).html(parents+"%");
			chayi1=parseFloat($(this).find("td").eq(1).find("input").val())-parseFloat($(this).find("td").eq(4).find("input").val());
			$(this).find("td").eq(3).html(chayi1);
			chayi2=parseFloat($(this).find("td").eq(4).find("input").val())-parseFloat($(this).find("td").eq(7).find("input").val());
			$(this).find("td").eq(6).html(chayi2);
		}
	});
}


function initTable2DataVc(){
	$("#capitalAndDebtTabVc2 tr").each(function(n){
		if(n==3){
			date1=DateDiff($("#s_start_dateVc1").val(),$("#project_itemVc1").val());
			date2=DateDiff($("#s_start_dateVc2").val(),$("#project_itemVc2").val()); 
			if(parseFloat($(this).find("td").eq(4).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(1).find("input").val()*365/date1-$(this).find("td").eq(1).find("input").val())
				/$(this).find("td").eq(4).find("input").val()*10000)/100.0;
			}
			$(this).find("td").eq(3).html(value1+"%"); 
			if(parseFloat($(this).find("td").eq(7).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(4).find("input").val()*365/date1-$(this).find("td").eq(4).find("input").val())
				/$(this).find("td").eq(7).find("input").val()*10000)/100.0;
			}
			$(this).find("td").eq(6).html(value1+"%"); 
		}else if(n>=4){
			s_sale_net_income1=$("#s_sale_net_incomeVc1").val();
			parents=Math.round($(this).find("td").eq(1).find("input").val()*10000/s_sale_net_income1)/100.0;
			$(this).find("td").eq(2).html(parents+"%");
			s_sale_net_income2=$("#s_sale_net_incomeVc2").val();
			parents=Math.round($(this).find("td").eq(4).find("input").val()*10000/s_sale_net_income2)/100.0;
			$(this).find("td").eq(5).html(parents+"%");
			s_sale_net_income3=$("#s_sale_net_incomeVc3").val();
			parents=Math.round($(this).find("td").eq(7).find("input").val()*10000/s_sale_net_income3)/100.0;
			$(this).find("td").eq(8).html(parents+"%");
			date1=DateDiff($("#s_start_dateVc1").val(),$("#project_itemVc1").val());
			date2=DateDiff($("#s_start_dateVc2").val(),$("#project_itemVc2").val()); 
			if(parseFloat($(this).find("td").eq(4).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(1).find("input").val()*365/date1-$(this).find("td").eq(1).find("input").val())
				/$(this).find("td").eq(4).find("input").val()*10000)/100.0;
			}
			$(this).find("td").eq(3).html(value1+"%"); 
			if(parseFloat($(this).find("td").eq(7).find("input").val())==0){
				value1="NaN";
			}else{ 
				value1=Math.round(($(this).find("td").eq(4).find("input").val()*365/date1-$(this).find("td").eq(4).find("input").val())
				/$(this).find("td").eq(7).find("input").val()*10000)/100.0;
			}
			$(this).find("td").eq(6).html(value1+"%"); 
		}
	});
}

function valueChangeTableVc1(field){ 
	if(valueIsDoubless(field)){  
		sumZiChanZongEVc(); 
		sumFuZaiZongEVc(); 
		sumJingZhiZongEVc() 
		initAllDataVc();
	}else{ 
		alert($.trim($(field).parent().parent().find("td").eq(0).html())+" 填写有误！"); 
		$(field).focus(); 
		$(field).select(); 
		return false;
	}
}

function valueChangeTableVc2(field){ 
	if(valueIsDoubless(field)){
		sumYingYeLiYiVc();
		sumShuiQianSunYiVc();
		sumShuiHouSunYiVc();
		initTable2DataVc();
	}else{ 
		alert($.trim($(field).parent().parent().find("td").eq(0).html())+" 填写有误！"); 
		$(field).focus(); 
		$(field).select(); 
		return false;
	}
}

function pressKeyFuncVc(field,event){  
		if(event.keyCode==38){ 
			$(document).scrollTop($(field).offset().top-25) ;
			if(valueIsDoubless(field)){
			 	$(".inputDataVc").eq($(".inputDataVc").index($(field))-3).select(); 
			 }else{ 
				return false;
			}
		}else if(event.keyCode==40){
			$(document).scrollTop($(field).offset().top-25) ;
			  if(valueIsDoubless(field)){
			 	$(".inputDataVc").eq($(".inputDataVc").index($(field))+3).select(); 
			 }else{ 
				return false;
			}
			 
		}else if(event.keyCode==37){
			  if(valueIsDoubless(field)){
			 		 $(".inputDataVc").eq($(".inputDataVc").index($(field))-1).select(); 
			 }else{
				return false;
			}
		 
		}else if(event.keyCode==39){
		     if(valueIsDoubless(field)){
			 	 $(".inputDataVc").eq($(".inputDataVc").index($(field))+1).select(); 
			 }else{
			     return false;
			}
			
		} 
}


function pressKeyFuncVc2(field,event){  
		if(event.keyCode==38){ 
			$(document).scrollTop($(field).offset().top-25) ;
			if(valueIsDoubless(field)){
			 	$(".inputDataVc2").eq($(".inputDataVc2").index($(field))-3).select(); 
			 }else{ 
				return false;
			}
		}else if(event.keyCode==40){
			$(document).scrollTop($(field).offset().top-25) ;
			  if(valueIsDoubless(field)){
			 	$(".inputDataVc2").eq($(".inputDataVc2").index($(field))+3).select(); 
			 }else{ 
				return false;
			}
			 
		}else if(event.keyCode==37){
			  if(valueIsDoubless(field)){
			 		 $(".inputDataVc2").eq($(".inputDataVc2").index($(field))-1).select(); 
			 }else{
				return false;
			}
		 
		}else if(event.keyCode==39){
		     if(valueIsDoubless(field)){
			 	 $(".inputDataVc2").eq($(".inputDataVc2").index($(field))+1).select(); 
			 }else{
			     return false;
			}
			
		} 
}

function sumYingYeLiYiVc(){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessssVc("s_sale_net_incomeVc",i)
		  -getValuessssVc("s_sale_costVc",i)
		  +getValuessssVc("s_other_gross_profitVc",i);
		  $("#s_sgp_sumVc"+i).val(value1);
		  value2=0;
		  value2=getValuessssVc("s_sgp_sumVc",i)
		  -getValuessssVc("s_operating_expensesVc",i);
		  $("#s_bp_sumVc"+i).val(value2);
	}	  
}

function sumShuiQianSunYiVc(){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessssVc("s_interest_expenseVc",i)
		  +getValuessssVc("s_other_nonbusiness_expenseVc",i);
		  $("#s_nbe_sumVc"+i).val(value1);
		  value2=0;
		  value2=getValuessssVc("s_nonbusiness_incomeVc",i)
		  +getValuessssVc("s_bp_sumVc",i)
		  -getValuessssVc("s_nbe_sumVc",i);
		  $("#s_before_sumVc"+i).val(value2);
	}	
}
function sumShuiHouSunYiVc(){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessssVc("s_before_sumVc",i)
		  -getValuessssVc("s_income_tax_expenseVc",i);
		  $("#s_after_sumVc"+i).val(value1); 
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

function getValuessssVc(name,id){
	value=0.0 ;
	value=$("#"+name+id).val(); 
	return parseFloat(value);
}

function DateDiff(asStartDate,asEndDate){

    var miStart=Date.parse(asStartDate.replace(/\-/g,'/'));

    var miEnd=Date.parse(asEndDate.replace(/\-/g,'/'));

    return (miEnd-miStart)/(1000*24*3600);

} 
function cutdownVc(index,col){
	if(index==1 && col==1){
		$("#capitalAndDebtTabVc tr").each(function(n){
			if(n>=2){
				var td2value = $(this).find("td").eq(1).find("input").val();
				$(this).find("td").eq(4).find("input").val(td2value);
				$(this).find("td").eq(1).find("input").val(0.0);
			}
		});
		valueChangeTableVc1(this);
	}
	if(index==1 && col==2){
		$("#capitalAndDebtTabVc tr").each(function(n){
			if(n>=2){
				var td2value = $(this).find("td").eq(4).find("input").val();
				$(this).find("td").eq(7).find("input").val(td2value);
				$(this).find("td").eq(4).find("input").val(0.0);
			}
		});
		valueChangeTableVc1(this);
	}
	if(index==2 && col==1){
		$("#capitalAndDebtTabVc2 tr").each(function(n){
			if(n>=3){
				var td2value = $(this).find("td").eq(1).find("input").val();
				$(this).find("td").eq(4).find("input").val(td2value);
				$(this).find("td").eq(1).find("input").val(0.0);
			}
		});
		valueChangeTableVc2(this);
	}
	if(index==2 && col==2){
		$("#capitalAndDebtTabVc2 tr").each(function(n){
			if(n>=3){
				var td2value = $(this).find("td").eq(4).find("input").val();
				$(this).find("td").eq(7).find("input").val(td2value);
				$(this).find("td").eq(4).find("input").val(0.0);
			}
		});
		valueChangeTableVc2(this);
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