function initReportConfirmData(){
	$("#rc_project_item1").html($("#project_item1").val());
	$("#rc_project_item2").html($("#project_item2").val());
	$("#rc_project_item3").html($("#project_item3").val());
	$("#rc_ca_sum1").html(Math.round($("#ca_sum1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_ca_sum2").html(Math.round($("#ca_sum2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_ca_sum3").html(Math.round($("#ca_sum3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_fa_sum1").html(Math.round($("#fa_sum1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_fa_sum2").html(Math.round($("#fa_sum2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_fa_sum3").html(Math.round($("#fa_sum3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_lang_Invest1").html(Math.round($("#lang_Invest1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_lang_Invest2").html(Math.round($("#lang_Invest2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_lang_Invest3").html(Math.round($("#lang_Invest3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_other_Assets1").html(Math.round($("#other_Assets1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_other_Assets2").html(Math.round($("#other_Assets2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_other_Assets3").html(Math.round($("#other_Assets3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_sd_sum1").html(Math.round($("#sd_sum1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_sd_sum2").html(Math.round($("#sd_sum2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_sd_sum3").html(Math.round($("#sd_sum3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_ld_sum1").html(Math.round($("#ld_sum1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_ld_sum2").html(Math.round($("#ld_sum2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_ld_sum3").html(Math.round($("#ld_sum3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_other_debt1").html(Math.round($("#other_debt1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_other_debt2").html(Math.round($("#other_debt2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_other_debt3").html(Math.round($("#other_debt3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_real_sum1").html(Math.round($("#real_sum1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#rc_real_sum2").html(Math.round($("#real_sum2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#rc_real_sum3").html(Math.round($("#real_sum3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#rc_project_item21").html($("#project_item1").val());
	$("#rc_project_item22").html($("#project_item2").val());
	$("#rc_project_item23").html($("#project_item3").val());
	$("#ziyouzibenbilv1").html(Math.round($("#real_sum1").val()/$("#capital_sum1").val()*100000)/1000.0+"%");
	$("#ziyouzibenbilv2").html(Math.round($("#real_sum2").val()/$("#capital_sum2").val()*100000)/1000.0+"%");
	$("#ziyouzibenbilv3").html(Math.round($("#real_sum3").val()/$("#capital_sum3").val()*100000)/1000.0+"%");
	$("#gudingbilv1").html(Math.round((parseFloat($("#fa_sum1").val())+parseFloat($("#lang_Invest1").val()))/(parseFloat($("#real_sum1").val())+parseFloat($("#ld_sum1").val()))*100000)/1000.0+"%");
	$("#gudingbilv2").html(Math.round((parseFloat($("#fa_sum2").val())+parseFloat($("#lang_Invest2").val()))/(parseFloat($("#real_sum2").val())+parseFloat($("#ld_sum2").val()))*100000)/1000.0+"%");
	$("#gudingbilv3").html(Math.round((parseFloat($("#fa_sum3").val())+parseFloat($("#lang_Invest3").val()))/(parseFloat($("#real_sum3").val())+parseFloat($("#ld_sum3").val()))*100000)/1000.0+"%");
	$("#fuzhaibilv1").html(Math.round($("#debt_sum1").val()/$("#real_sum1").val()*100000)/1000.0+"%");
	$("#fuzhaibilv2").html(Math.round($("#debt_sum2").val()/$("#real_sum2").val()*100000)/1000.0+"%");
	$("#fuzhaibilv3").html(Math.round($("#debt_sum3").val()/$("#real_sum3").val()*100000)/1000.0+"%");
	date1=DateDiff($("#s_start_date1").val(),$("#project_item1").val());
	date2=DateDiff($("#s_start_date2").val(),$("#project_item2").val()); 
	date3=DateDiff($("#s_start_date3").val(),$("#project_item3").val()); 
	var data1=Math.round($("#s_sale_net_income1").val()/(parseFloat($("#ca_Funds_should1").val())+parseFloat($("#ca_bills_should1").val())+parseFloat($("#ca_Funds_should2").val())+parseFloat($("#ca_bills_should2").val()))*2*365/date1*1000)/1000.0;
	var data2=Math.round($("#s_sale_net_income2").val()/(parseFloat($("#ca_Funds_should2").val())+parseFloat($("#ca_bills_should2").val())+parseFloat($("#ca_Funds_should3").val())+parseFloat($("#ca_bills_should3").val()))*2*365/date2*1000)/1000.0;
	var data3=Math.round($("#s_sale_net_income3").val()/(parseFloat($("#ca_Funds_should3").val())+parseFloat($("#ca_bills_should3").val()))*2*365/date3*1000)/1000.0;
	$("#yingshouzhangkuanzhouzhuanlv1").html(data1+"次");
	$("#yingshouzhangkuanzhouzhuanlv2").html(data2+"次");
	$("#yingshouzhangkuanzhouzhuanlv3").html(data3+"次");
	$("#yingshouzhangkuanzhouzhuanlv4").html(Math.round(365/data1*1000)/1000.0+"天");
	$("#yingshouzhangkuanzhouzhuanlv5").html(Math.round(365/data2*1000)/1000.0+"天");
	$("#yingshouzhangkuanzhouzhuanlv6").html(Math.round(365/data3*1000)/1000.0+"天"); 
    data1=Math.round($("#s_sale_cost1").val()/(parseFloat($("#ca_Goods_stock1").val())+parseFloat($("#ca_Goods_stock2").val()))*2*365/date1*1000)/1000.0;
	data2=Math.round($("#s_sale_cost2").val()/(parseFloat($("#ca_Goods_stock2").val())+parseFloat($("#ca_Goods_stock3").val()))*2*365/date2*1000)/1000.0;
	data3=Math.round($("#s_sale_cost3").val()/(parseFloat($("#ca_Goods_stock3").val()))*2*365/date3*1000)/1000.0;
	$("#cunhuozhouzhuanlv1").html(data1+"次");
	$("#cunhuozhouzhuanlv2").html(data2+"次");
	$("#cunhuozhouzhuanlv3").html(data3+"次");
	$("#cunhuozhouzhuanlv4").html(Math.round(365/data1*1000)/1000.0+"天");
	$("#cunhuozhouzhuanlv5").html(Math.round(365/data2*1000)/1000.0+"天");
	$("#cunhuozhouzhuanlv6").html(Math.round(365/data3*1000)/1000.0+"天");
	data1=Math.round($("#s_sale_cost1").val()/(parseFloat($("#sd_bills_should1").val())+parseFloat($("#sd_funds_should1").val())+parseFloat($("#sd_bills_should2").val())+parseFloat($("#sd_funds_should2").val()))*2*365/date1*1000)/1000.0;
	data2=Math.round($("#s_sale_cost2").val()/(parseFloat($("#sd_bills_should2").val())+parseFloat($("#sd_funds_should2").val())+parseFloat($("#sd_bills_should3").val())+parseFloat($("#sd_funds_should3").val()))*2*365/date2*1000)/1000.0;
	data3=Math.round($("#s_sale_cost3").val()/(parseFloat($("#sd_bills_should3").val())+parseFloat($("#sd_funds_should3").val()))*2*365/date3*1000)/1000.0;
	$("#yingfuzhangkuanzhouzhuanlv1").html(data1+"次");
	$("#yingfuzhangkuanzhouzhuanlv2").html(data2+"次");
	$("#yingfuzhangkuanzhouzhuanlv3").html(data3+"次");
	$("#yingfuzhangkuanzhouzhuanlv4").html(Math.round(365/data1*1000)/1000.0+"天");
	$("#yingfuzhangkuanzhouzhuanlv5").html(Math.round(365/data2*1000)/1000.0+"天");
	$("#yingfuzhangkuanzhouzhuanlv6").html(Math.round(365/data3*1000)/1000.0+"天");
    data1=Math.round($("#s_sale_net_income1").val()/(parseFloat($("#capital_sum1").val())+parseFloat($("#capital_sum2").val()))*2*365/date1*1000)/1000.0;
    data2=Math.round($("#s_sale_net_income2").val()/(parseFloat($("#capital_sum2").val())+parseFloat($("#capital_sum3").val()))*2*365/date2*1000)/1000.0;
    data3=Math.round($("#s_sale_net_income3").val()/(parseFloat($("#capital_sum3").val()))*2*365/date3*1000)/1000.0;
	$("#zongzichanzhouzhuanlv1").html(data1+"次");
	$("#zongzichanzhouzhuanlv2").html(data2+"次");
	$("#zongzichanzhouzhuanlv3").html(data3+"次");
	$("#zongzichanzhouzhuanlv4").html(Math.round(365/data1*1000)/1000.0+"天");
	$("#zongzichanzhouzhuanlv5").html(Math.round(365/data2*1000)/1000.0+"天");
	$("#zongzichanzhouzhuanlv6").html(Math.round(365/data3*1000)/1000.0+"天");
	$("#liudongbilv1").html(Math.round($("#ca_sum1").val()/$("#sd_sum1").val()*100000)/1000.0+"%");
	$("#liudongbilv2").html(Math.round($("#ca_sum2").val()/$("#sd_sum2").val()*100000)/1000.0+"%");
	$("#liudongbilv3").html(Math.round($("#ca_sum3").val()/$("#sd_sum3").val()*100000)/1000.0+"%");
	$("#sudongbilv1").html(Math.round((parseFloat($("#ca_cash_price1").val())+parseFloat($("#ca_short_Invest1").val())+parseFloat($("#ca_bills_should1").val())+parseFloat($("#ca_Funds_should1").val()))/parseFloat($("#sd_sum1").val())*100000)/1000.0+"%");
	$("#sudongbilv2").html(Math.round((parseFloat($("#ca_cash_price2").val())+parseFloat($("#ca_short_Invest2").val())+parseFloat($("#ca_bills_should2").val())+parseFloat($("#ca_Funds_should2").val()))/parseFloat($("#sd_sum2").val())*100000)/1000.0+"%");
	$("#sudongbilv3").html(Math.round((parseFloat($("#ca_cash_price3").val())+parseFloat($("#ca_short_Invest3").val())+parseFloat($("#ca_bills_should3").val())+parseFloat($("#ca_Funds_should3").val()))/parseFloat($("#sd_sum3").val())*100000)/1000.0+"%");
	data1=parseFloat($("#s_interest_expense1").val())+parseFloat($("#s_before_sum1").val());
	data2=parseFloat($("#s_interest_expense2").val())+parseFloat($("#s_before_sum2").val());
	data3=parseFloat($("#s_interest_expense3").val())+parseFloat($("#s_before_sum3").val());
	if(data1<0){
		$("#lixibaozhangbeishu1").html("N/A");
	}else{
		if(parseFloat($("#s_interest_expense1").val())!=0){
			$("#lixibaozhangbeishu1").html(Math.round(data1/parseFloat($("#s_interest_expense1").val())*100000)/1000.0+"%");
		}else{
			$("#lixibaozhangbeishu1").html("NaN%");
		}
	}
	if(data2<0){
		$("#lixibaozhangbeishu2").html("N/A");
	}else{
		if(parseFloat($("#s_interest_expense2").val())!=0){
			$("#lixibaozhangbeishu2").html(Math.round(data2/parseFloat($("#s_interest_expense2").val())*100000)/1000.0+"%");
		}else{
			$("#lixibaozhangbeishu2").html("NaN%");
		}
	}
	if(data3<0){
		$("#lixibaozhangbeishu3").html("N/A");
	}else{
		if(parseFloat($("#s_interest_expense3").val())!=0){
			$("#lixibaozhangbeishu3").html(Math.round(data3/parseFloat($("#s_interest_expense3").val())*100000)/1000.0+"%");
		}else{
			$("#lixibaozhangbeishu3").html("NaN%");
		}
	}
	$("#changhuannengli41").html(Math.round($("#s_interest_expense1").val()/$("#s_sale_net_income1").val()*100000)/1000.0+"%");
	$("#changhuannengli42").html(Math.round($("#s_interest_expense2").val()/$("#s_sale_net_income2").val()*100000)/1000.0+"%");
	$("#changhuannengli43").html(Math.round($("#s_interest_expense3").val()/$("#s_sale_net_income3").val()*100000)/1000.0+"%");
	$("#hl_maolilv1").html(Math.round($("#s_sgp_sum1").val()/$("#s_sale_net_income1").val()*100000)/1000.0+"%");
	$("#hl_maolilv2").html(Math.round($("#s_sgp_sum2").val()/$("#s_sale_net_income2").val()*100000)/1000.0+"%");
	$("#hl_maolilv3").html(Math.round($("#s_sgp_sum3").val()/$("#s_sale_net_income3").val()*100000)/1000.0+"%");
	$("#hl_yingyeliyilv1").html(Math.round($("#s_bp_sum1").val()/$("#s_sale_net_income1").val()*100000)/1000.0+"%");
	$("#hl_yingyeliyilv2").html(Math.round($("#s_bp_sum2").val()/$("#s_sale_net_income2").val()*100000)/1000.0+"%");
	$("#hl_yingyeliyilv3").html(Math.round($("#s_bp_sum3").val()/$("#s_sale_net_income3").val()*100000)/1000.0+"%");
	$("#hl_chunyilv1").html(Math.round($("#s_after_sum1").val()/$("#s_sale_net_income1").val()*100000)/1000.0+"%");
	$("#hl_chunyilv2").html(Math.round($("#s_after_sum2").val()/$("#s_sale_net_income2").val()*100000)/1000.0+"%");
	$("#hl_chunyilv3").html(Math.round($("#s_after_sum3").val()/$("#s_sale_net_income3").val()*100000)/1000.0+"%");
	$("#hl_jingzhihuolilv1").html(Math.round($("#s_after_sum1").val()/((parseFloat($("#real_sum1").val())+parseFloat($("#real_sum2").val()))/2)*365/date1*100000)/1000.0+"%");
	$("#hl_jingzhihuolilv2").html(Math.round($("#s_after_sum2").val()/((parseFloat($("#real_sum2").val())+parseFloat($("#real_sum3").val()))/2)*365/date2*100000)/1000.0+"%");
	$("#hl_jingzhihuolilv3").html(Math.round($("#s_after_sum3").val()/(parseFloat($("#real_sum3").val())/2)*365/date3*100000)/1000.0+"%");
	$("#hl_zongzichanhuolilv1").html(Math.round((parseFloat($("#s_after_sum1").val())+parseFloat($("#s_interest_expense1").val()))/((parseFloat($("#capital_sum1").val())+parseFloat($("#capital_sum2").val()))/2)*365/date1*100000)/1000.0+"%");
	$("#hl_zongzichanhuolilv2").html(Math.round((parseFloat($("#s_after_sum2").val())+parseFloat($("#s_interest_expense2").val()))/((parseFloat($("#capital_sum2").val())+parseFloat($("#capital_sum3").val()))/2)*365/date2*100000)/1000.0+"%");
	$("#hl_zongzichanhuolilv3").html(Math.round((parseFloat($("#s_after_sum3").val())+parseFloat($("#s_interest_expense3").val()))/((parseFloat($("#capital_sum3").val()))/2)*365/date3*100000)/1000.0+"%");
}


function DateDiff(asStartDate,asEndDate){

    var miStart=Date.parse(asStartDate.replace(/\-/g,'/'));

    var miEnd=Date.parse(asEndDate.replace(/\-/g,'/'));

    return (miEnd-miStart)/(1000*24*3600);

}