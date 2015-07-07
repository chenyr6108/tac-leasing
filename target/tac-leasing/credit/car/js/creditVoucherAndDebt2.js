function changeProjectItemVg(k){
	$("#showProject_itemV"+k+"1").html($("#project_itemV"+k+"1").val());
	$("#showProject_itemV"+k+"2").html($("#project_itemV"+k+"2").val());
	$("#showProject_itemV"+k+"3").html($("#project_itemV"+k+"3").val());
}
function sumZiChanZongEVg(k){ 
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessssVg2("ca_short_InvestV",k,i)
	      		+getValuessssVg2("ca_bills_shouldV",k,i)
	      		+getValuessssVg2("ca_Funds_shouldV",k,i)
	      		+getValuessssVg2("ca_other_Funds_shouldV",k,i)
	     		+getValuessssVg2("ca_Goods_stockV",k,i)
	     		+getValuessssVg2("ca_cash_priceV",k,i)
	     		+getValuessssVg2("ca_otherV",k,i)
		  $("#ca_sumV"+k+i).val(value1); 
		  value2=0;
		  value2=getValuessssVg2("fa_landV",k,i)
		         +getValuessssVg2("fa_buildingsV",k,i)
		         +getValuessssVg2("fa_equipmentsV",k,i)
		         +getValuessssVg2("fa_rent_AssetsV",k,i)
		         +getValuessssVg2("fa_transportsV",k,i)
		         +getValuessssVg2("fa_otherV",k,i)
		         -getValuessssVg2("fa_DepreciationsV",k,i)
		         +getValuessssVg2("fa_Incompleted_projectsV",k,i);
		  $("#fa_sumV"+k+i).val(value2);
		  value3=0;
		  value3=getValuessssVg2("ca_sumV",k,i)
		  +getValuessssVg2("fa_sumV",k,i)
		  +getValuessssVg2("lang_InvestV",k,i)
		  +getValuessssVg2("other_AssetsV",k,i);  
		  $("#capital_sumV"+k+i).val(Math.round(value3 * 100) / 100.00);   
	}
}

function sumFuZaiZongEVg(k){
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessssVg2("sd_short_debtV",k,i)
	      		+getValuessssVg2("sd_bills_shouldV",k,i)
	      		+getValuessssVg2("sd_funds_shouldV",k,i)
	     		+getValuessssVg2("sd_other_payV",k,i)
	     		+getValuessssVg2("sd_shareholdersV",k,i)
	     		+getValuessssVg2("sd_one_yearV",k,i)
	     		+getValuessssVg2("sd_otherV",k,i);
		  $("#sd_sumV"+k+i).val(value1);
		   value2=0;
		    value2=getValuessssVg2("lang_debtV",k,i)
		         +getValuessssVg2("other_long_debtV",k,i) 
		  $("#ld_sumV"+k+i).val(value2);
		   value3=0;
		  value3=getValuessssVg2("sd_sumV",k,i)
		  +getValuessssVg2("ld_sumV",k,i) 
		  +getValuessssVg2("other_debtV",k,i);  
		  $("#debt_sumV"+k+i).val(value3);   
	}
}

function sumJingZhiZongEVg(k){
	for(i=1;i<=3;i++){
		  value1=0;
	      value1=getValuessssVg2("share_capitalV",k,i)
	      		+getValuessssVg2("surplus_CapitalV",k,i)
	      		+getValuessssVg2("surplus_incomeV",k,i)
	     		+getValuessssVg2("this_lostsV",k,i) 
	     		+getValuessssVg2("project_changedV",k,i);
		  $("#real_sumV"+k+i).val(value1);   
	}
}

function initAllDataVg(k){ 
	$("#capitalAndDebtTabVg"+k+" tr").each(function(n){

		if(n>=2){
		
			parents=(Math.round($(this).find("td").eq(1).find("input").val()*10000/$("#capital_sumV"+k+"1").val()))/100.0;
			$(this).find("td").eq(2).html(parents+"%");
			parents=(Math.round($(this).find("td").eq(4).find("input").val()*10000/$("#capital_sumV"+k+"2").val()))/100.0;
			$(this).find("td").eq(5).html(parents+"%");
			parents=(Math.round($(this).find("td").eq(7).find("input").val()*10000/$("#capital_sumV"+k+"3").val()))/100.0;
			$(this).find("td").eq(8).html(parents+"%");
			chayi1=parseFloat($(this).find("td").eq(1).find("input").val())-parseFloat($(this).find("td").eq(4).find("input").val());
			$(this).find("td").eq(3).html(chayi1);
			chayi2=parseFloat($(this).find("td").eq(4).find("input").val())-parseFloat($(this).find("td").eq(7).find("input").val());
			$(this).find("td").eq(6).html(chayi2);
		}
	});
}


function initTable2DataVg(k){
	$("#capitalAndDebtTabVg2"+k+" tr").each(function(n){
		if(n==3){
			date1=DateDiff($("#s_start_dateV"+k+"1").val(),$("#project_itemV"+k+"1").val());
			date2=DateDiff($("#s_start_dateV"+k+"2").val(),$("#project_itemV"+k+"2").val()); 
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
			s_sale_net_income1=$("#s_sale_net_incomeV"+k+"1").val();
			parents=Math.round($(this).find("td").eq(1).find("input").val()*10000/s_sale_net_income1)/100.0;
			$(this).find("td").eq(2).html(parents+"%");
			s_sale_net_income2=$("#s_sale_net_incomeV"+k+"2").val();
			parents=Math.round($(this).find("td").eq(4).find("input").val()*10000/s_sale_net_income2)/100.0;
			$(this).find("td").eq(5).html(parents+"%");
			s_sale_net_income3=$("#s_sale_net_incomeV"+k+"3").val();
			parents=Math.round($(this).find("td").eq(7).find("input").val()*10000/s_sale_net_income3)/100.0;
			$(this).find("td").eq(8).html(parents+"%");
			date1=DateDiff($("#s_start_dateV"+k+"1").val(),$("#project_itemV"+k+"1").val());
			date2=DateDiff($("#s_start_dateV"+k+"2").val(),$("#project_itemV"+k+"2").val()); 
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

function valueChangeTableVg1(field,k){ 
	if(valueIsDoublessVg(field,k)){  
		sumZiChanZongEVg(k); 
		sumFuZaiZongEVg(k); 
		sumJingZhiZongEVg(k) 
		initAllDataVg(k);
	}else{ 
		alert($.trim($(field).parent().parent().find("td").eq(0).html())+" 填写有误！"); 
		$(field).focus(); 
		$(field).select(); 
		return false;
	}
}

function valueChangeTableVg2(field,k){ 
	if(valueIsDoublessVg(field,k)){
		sumYingYeLiYiVg(k);
		sumShuiQianSunYiVg(k);
		sumShuiHouSunYiVg(k);
		initTable2DataVg(k);
	}else{ 
		alert($.trim($(field).parent().parent().find("td").eq(0).html())+" 填写有误！"); 
		$(field).focus(); 
		$(field).select(); 
		return false;
	}
}

function pressKeyFuncVg(field,event,k){  
		if(event.keyCode==38){ 
			$(document).scrollTop($(field).offset().top-25) ;
			if(valueIsDoublessVg(field)){
			 	$(".inputData"+k).eq($(".inputData"+k).index($(field))-3).select(); 
			 }else{ 
				return false;
			}
		}else if(event.keyCode==40){
			$(document).scrollTop($(field).offset().top-25) ;
			  if(valueIsDoublessVg(field)){
			 	$(".inputData"+k).eq($(".inputData"+k).index($(field))+3).select(); 
			 }else{ 
				return false;
			}
			 
		}else if(event.keyCode==37){
			  if(valueIsDoublessVg(field)){
			 		 $(".inputData"+k).eq($(".inputData"+k).index($(field))-1).select(); 
			 }else{
				return false;
			}
		 
		}else if(event.keyCode==39){
		     if(valueIsDoublessVg(field)){
			 	 $(".inputData"+k).eq($(".inputData"+k).index($(field))+1).select(); 
			 }else{
			     return false;
			}
			
		} 
}


function pressKeyFuncVg2(field,event,k){  
		if(event.keyCode==38){ 
			$(document).scrollTop($(field).offset().top-25) ;
			if(valueIsDoublessVg(field)){
			 	$(".inputData2"+k).eq($(".inputData2"+k).index($(field))-3).select(); 
			 }else{ 
				return false;
			}
		}else if(event.keyCode==40){
			$(document).scrollTop($(field).offset().top-25) ;
			  if(valueIsDoublessVg(field)){
			 	$(".inputData2"+k).eq($(".inputData2"+k).index($(field))+3).select(); 
			 }else{ 
				return false;
			}
			 
		}else if(event.keyCode==37){
			  if(valueIsDoublessVg(field)){
			 		 $(".inputData2"+k).eq($(".inputData2"+k).index($(field))-1).select(); 
			 }else{
				return false;
			}
		 
		}else if(event.keyCode==39){
		     if(valueIsDoublessVg(field)){
			 	 $(".inputData2"+k).eq($(".inputData2"+k).index($(field))+1).select(); 
			 }else{
			     return false;
			}
			
		} 
}

function sumYingYeLiYiVg(k){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessssVg2("s_sale_net_incomeV",k,i)
		  -getValuessssVg2("s_sale_costV",k,i)
		  +getValuessssVg2("s_other_gross_profitV",k,i);
		  $("#s_sgp_sumV"+k+i).val(value1);
		  value2=0;
		  value2=getValuessssVg2("s_sgp_sumV",k,i)
		  -getValuessssVg2("s_operating_expensesV",k,i);
		  $("#s_bp_sumV"+k+i).val(value2);
	}	  
}

function sumShuiQianSunYiVg(k){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessssVg2("s_interest_expenseV",k,i)
		  +getValuessssVg2("s_other_nonbusiness_expenseV",k,i);
		  $("#s_nbe_sumV"+k+i).val(value1);
		  value2=0;
		  value2=getValuessssVg2("s_nonbusiness_incomeV",k,i)
		  +getValuessssVg2("s_bp_sumV",k,i)
		  -getValuessssVg2("s_nbe_sumV",k,i);
		  $("#s_before_sumV"+k+i).val(value2);
	}	
}
function sumShuiHouSunYiVg(k){
	for(i=1;i<=3;i++){
		  value1=0;
		  value1=getValuessssVg2("s_before_sumV",k,i)
		  -getValuessssVg2("s_income_tax_expenseV",k,i);
		  $("#s_after_sumV"+k+i).val(value1); 
	}	
}

function valueIsDoublessVg(xx,k)
{
	value=xx+""; 
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

function getValuessssVg1(name,id){
	value=0.0 ;
	value=$("#"+name+id).val(); 
	return parseFloat(value);
}
function getValuessssVg2(name,k,id){
	value=0.0 ;
	value=$("#"+name+k+id).val(); 
	return parseFloat(value);
}
function DateDiff(asStartDate,asEndDate){

    var miStart=Date.parse(asStartDate.replace(/\-/g,'/'));

    var miEnd=Date.parse(asEndDate.replace(/\-/g,'/'));

    return (miEnd-miStart)/(1000*24*3600);

} 
function cutdownVg(index,k,col){
	if(index==1 && col==1){
		$("#capitalAndDebtTabVg"+k+" tr").each(function(n){
			if(n>=2){
			 	var td2value = $(this).find("td").eq(1).find("input").val();
				$(this).find("td").eq(4).find("input").val(td2value);
				$(this).find("td").eq(1).find("input").val(0.0);
			}
		});
		valueChangeTableVg1(this);
	}if(index==1 && col==2){
		$("#capitalAndDebtTabVg"+k+" tr").each(function(n){
			if(n>=2){
				var td2value = $(this).find("td").eq(4).find("input").val();
				$(this).find("td").eq(7).find("input").val(td2value);
				$(this).find("td").eq(4).find("input").val(0.0);
			}
		});
		valueChangeTableVg1(this);
	}
	if(index==2 && col==1){
		$("#capitalAndDebtTabVg2"+k+" tr").each(function(n){
			if(n>=3){
				var td2value = $(this).find("td").eq(1).find("input").val();
				$(this).find("td").eq(4).find("input").val(td2value);
				$(this).find("td").eq(1).find("input").val(0.0);
			}
		});
		valueChangeTableVg2(this);
	}
	if(index==2 && col==2){
		$("#capitalAndDebtTabV2"+k+" tr").each(function(n){
			if(n>=3){
				var td2value = $(this).find("td").eq(4).find("input").val();
				$(this).find("td").eq(7).find("input").val(td2value);
				$(this).find("td").eq(4).find("input").val(0.0);
			}
		});
		valueChangeTableVg2(this);
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