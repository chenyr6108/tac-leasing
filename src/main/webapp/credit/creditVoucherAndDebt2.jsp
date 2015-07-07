<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <script type="text/javascript">
       function inputDatablur(fild,k){
		   valueChangeTableVg1(fild,k);		   
		}  
		function inputData2blur(fild,k){
		   valueChangeTableVg2(fild,k);	   
		} 
		$(function() {
			$("#toExcelRow41Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(2).find("td").eq(0).find("div").text());
			$("#toExcelRow41Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(2).find("td").eq(1).find("div").text());
			$("#toExcelRow41Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(2).find("td").eq(2).find("div").text());
			
			$("#toExcelRow42Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(3).find("td").eq(3).text());
			$("#toExcelRow42Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(3).find("td").eq(6).text());
			
			$("#toExcelRow43Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(4).find("td").eq(2).text());
			$("#toExcelRow43Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(4).find("td").eq(3).text());
			$("#toExcelRow43Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(4).find("td").eq(5).text());
			$("#toExcelRow43Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(4).find("td").eq(6).text());
			$("#toExcelRow43Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(4).find("td").eq(8).text());
			
			$("#toExcelRow44Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(5).find("td").eq(2).text());
			$("#toExcelRow44Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(5).find("td").eq(3).text());
			$("#toExcelRow44Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(5).find("td").eq(5).text());
			$("#toExcelRow44Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(5).find("td").eq(6).text());
			$("#toExcelRow44Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(5).find("td").eq(8).text());
			
			$("#toExcelRow45Col2"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(1).find("input").val());
			$("#toExcelRow45Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(2).text());
			$("#toExcelRow45Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(3).text());
			$("#toExcelRow45Col5"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(4).find("input").val());
			$("#toExcelRow45Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(5).text());
			$("#toExcelRow45Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(6).text());
			$("#toExcelRow45Col8"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(7).find("input").val());
			$("#toExcelRow45Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(6).find("td").eq(8).text());
			
			$("#toExcelRow46Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(7).find("td").eq(2).text());
			$("#toExcelRow46Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(7).find("td").eq(3).text());
			$("#toExcelRow46Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(7).find("td").eq(5).text());
			$("#toExcelRow46Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(7).find("td").eq(6).text());
			$("#toExcelRow46Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(7).find("td").eq(8).text());
			
			$("#toExcelRow47Col2"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(1).find("input").val());
			$("#toExcelRow47Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(2).text());
			$("#toExcelRow47Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(3).text());
			$("#toExcelRow47Col5"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(4).find("input").val());
			$("#toExcelRow47Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(5).text());
			$("#toExcelRow47Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(6).text());
			$("#toExcelRow47Col8"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(7).find("input").val());
			$("#toExcelRow47Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(8).find("td").eq(8).text());
			
			$("#toExcelRow48Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(9).find("td").eq(2).text());
			$("#toExcelRow48Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(9).find("td").eq(3).text());
			$("#toExcelRow48Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(9).find("td").eq(5).text());
			$("#toExcelRow48Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(9).find("td").eq(6).text());
			$("#toExcelRow48Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(9).find("td").eq(8).text());
			
			$("#toExcelRow49Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(10).find("td").eq(2).text());
			$("#toExcelRow49Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(10).find("td").eq(3).text());
			$("#toExcelRow49Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(10).find("td").eq(5).text());
			$("#toExcelRow49Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(10).find("td").eq(6).text());
			$("#toExcelRow49Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(10).find("td").eq(8).text());
			
			$("#toExcelRow50Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(11).find("td").eq(2).text());
			$("#toExcelRow50Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(11).find("td").eq(3).text());
			$("#toExcelRow50Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(11).find("td").eq(5).text());
			$("#toExcelRow50Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(11).find("td").eq(6).text());
			$("#toExcelRow50Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(11).find("td").eq(8).text());
			for(var i=2;i<10;i++) {
				if(i==2||i==5||i==8) {
					$("#toExcelRow51Col"+i+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(12).find("td").eq(i-1).find("input").val());
				} else {
					$("#toExcelRow51Col"+i+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(12).find("td").eq(i-1).text());
				}
			}
			for(var i=2;i<10;i++) {
				if(i==2||i==5||i==8) {
					$("#toExcelRow52Col"+i+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(13).find("td").eq(i-1).find("input").val());
				} else {
					$("#toExcelRow52Col"+i+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(13).find("td").eq(i-1).text());
				}
			}
			$("#toExcelRow53Col3"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(14).find("td").eq(2).text());
			$("#toExcelRow53Col4"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(14).find("td").eq(3).text());
			$("#toExcelRow53Col6"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(14).find("td").eq(5).text());
			$("#toExcelRow53Col7"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(14).find("td").eq(6).text());
			$("#toExcelRow53Col9"+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(14).find("td").eq(8).text());
			for(var i=2;i<10;i++) {
				if(i==2||i==5||i==8) {
					$("#toExcelRow54Col"+i+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(15).find("td").eq(i-1).find("input").val());
				} else {
					$("#toExcelRow54Col"+i+${status.count }).val($("#capitalAndDebtTabVg2"+${status.count }).find("tr").eq(15).find("td").eq(i-1).text());
				}
			}
		});
</script>

<table id="capitalAndDebtTabVg2${status.count }" width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab"  >
    <tr>
		 <th    class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="height: 28px;font-size: 14px;">
			 项目名称
		 </th>
		 <th colspan="7"  class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
			损益表暨水平分析(年度) 
		 </th> 			  
		 <th   class="ui-state-default ui-th-ltr zc_grid_head" style="font-size:14px;">
			 <font style="font-size: 12">单位（千元）</font>
		 </th> 			  
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 19%;height: 24px;font-size: 14px;" rowspan="2">
			科目\期间
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: center;height: 24px;font-size:14px;">
			<input type="text" readonly="readonly"  name="s_start_dateV" id="s_start_dateV${status.count }1" value="${obj1.S_START_DATE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow41Col2" value="${obj1.S_START_DATE}">
			<input type="hidden" name="toExcelRow41Col3" id="toExcelRow41Col3${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;"  rowspan="2">
			<input type="button" value="剪切到下年" onclick="cutdownVg(2,${status.count },1);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;font-size:14px;"  rowspan="2">
			成长率%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" readonly="readonly" name="s_start_dateV" id="s_start_dateV${status.count }2" value="${obj2.S_START_DATE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow41Col5" value="${obj2.S_START_DATE}">
			<input type="hidden" name="toExcelRow41Col6" id="toExcelRow41Col6${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;"  rowspan="2">
			<input type="button" value="剪切到下年" onclick="cutdownVg(2,${status.count },2);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;font-size:14px;"  rowspan="2">
			成长率%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" readonly="readonly"  name="s_start_dateV" id="s_start_dateV${status.count }3" value="${obj3.S_START_DATE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow41Col8" value="${obj3.S_START_DATE}">
			<input type="hidden" name="toExcelRow41Col9" id="toExcelRow41Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;" rowspan="2">
			&nbsp;
		</td>
	</tr> 
	<tr> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;height: 24px;font-size:14px;">
			<div id="showProject_itemV${status.count }1" style="font-size: 14px;"></div>
		</td> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			<div id="showProject_itemV${status.count }2" style="font-size: 14px;"></div>
		</td> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			<div id="showProject_itemV${status.count }3" style="font-size: 14px;"></div>
		</td> 
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;"> 
			销售收入净额 
			<input type="hidden" name="toExcelRow42Col1" value="销售收入净额 ">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size: 14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_net_incomeV" id="s_sale_net_incomeV${status.count }1" value="${obj1.S_SALE_NET_INCOME}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow42Col2" value="${obj1.S_SALE_NET_INCOME}">		
			<input type="hidden" name="toExcelRow42Col3" value="100%">	
			<input type="hidden" name="toExcelRow42Col4" id="toExcelRow42Col4${status.count }">
			<input type="hidden" name="toExcelRow42Col7" id="toExcelRow42Col7${status.count }">
			<input type="hidden" name="toExcelRow42Col9" value="100%">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size: 14px;">
			100%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size: 14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_net_incomeV" id="s_sale_net_incomeV${status.count }2" value="${obj2.S_SALE_NET_INCOME}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow42Col5" value="${obj2.S_SALE_NET_INCOME}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size: 14px;">
			100%
			<input type="hidden" name="toExcelRow42Col6" value="100%">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size: 14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_net_incomeV" id="s_sale_net_incomeV${status.count }3" value="${obj3.S_SALE_NET_INCOME}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow42Col8" value="${obj3.S_SALE_NET_INCOME}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size: 14px;">
			100%
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size: 14px;">
			减:销售成本
			<input type="hidden" name="toExcelRow43Col1" value="减:销售成本">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size: 14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_costV" id="s_sale_costV${status.count }1" value="${obj1.S_SALE_COST}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow43Col2" value="${obj1.S_SALE_COST}">
			<input type="hidden" name="toExcelRow43Col3" id="toExcelRow43Col3${status.count }">
			<input type="hidden" name="toExcelRow43Col4" id="toExcelRow43Col4${status.count }">
			<input type="hidden" name="toExcelRow43Col6" id="toExcelRow43Col6${status.count }">
			<input type="hidden" name="toExcelRow43Col7" id="toExcelRow43Col7${status.count }">
			<input type="hidden" name="toExcelRow43Col9" id="toExcelRow43Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size: 14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_costV" id="s_sale_costV${status.count }2" value="${obj2.S_SALE_COST}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow43Col5" value="${obj2.S_SALE_COST}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size: 14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_costV" id="s_sale_costV${status.count }3" value="${obj3.S_SALE_COST}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow43Col8" value="${obj3.S_SALE_COST}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他业务毛利
			<input type="hidden" name="toExcelRow44Col1" value="其他业务毛利">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_gross_profitV" id="s_other_gross_profitV${status.count }1" value="${obj1.S_OTHER_GROSS_PROFIT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow44Col2" value="${obj1.S_OTHER_GROSS_PROFIT}">
			<input type="hidden" name="toExcelRow44Col3" id="toExcelRow44Col3${status.count }">
			<input type="hidden" name="toExcelRow44Col4" id="toExcelRow44Col4${status.count }">
			<input type="hidden" name="toExcelRow44Col6" id="toExcelRow44Col6${status.count }">
			<input type="hidden" name="toExcelRow44Col7" id="toExcelRow44Col7${status.count }">
			<input type="hidden" name="toExcelRow44Col9" id="toExcelRow44Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_gross_profitV" id="s_other_gross_profitV${status.count }2" value="${obj2.S_OTHER_GROSS_PROFIT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow44Col5" value="${obj2.S_OTHER_GROSS_PROFIT}">		
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_gross_profitV" id="s_other_gross_profitV${status.count }3" value="${obj3.S_OTHER_GROSS_PROFIT}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow44Col8" value="${obj3.S_OTHER_GROSS_PROFIT}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue">销售毛利</font>
			<input type="hidden" name="toExcelRow45Col1" value="销售毛利">			
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sgp_sumV" id="s_sgp_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow45Col2" id="toExcelRow45Col2${status.count }">
			<input type="hidden" name="toExcelRow45Col3" id="toExcelRow45Col3${status.count }">
			<input type="hidden" name="toExcelRow45Col4" id="toExcelRow45Col4${status.count }">
			<input type="hidden" name="toExcelRow45Col5" id="toExcelRow45Col5${status.count }">
			<input type="hidden" name="toExcelRow45Col6" id="toExcelRow45Col6${status.count }">
			<input type="hidden" name="toExcelRow45Col7" id="toExcelRow45Col7${status.count }">
			<input type="hidden" name="toExcelRow45Col8" id="toExcelRow45Col8${status.count }">
			<input type="hidden" name="toExcelRow45Col9" id="toExcelRow45Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sgp_sumV" id="s_sgp_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sgp_sumV" id="s_sgp_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			减:营业费用
			<input type="hidden" name="toExcelRow46Col1" value="减:营业费用">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_operating_expensesV" id="s_operating_expensesV${status.count }1" value="${obj1.S_OPERATING_EXPENSES}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow46Col2" value="${obj1.S_OPERATING_EXPENSES}">
			<input type="hidden" name="toExcelRow46Col3" id="toExcelRow46Col3${status.count }">
			<input type="hidden" name="toExcelRow46Col4" id="toExcelRow46Col4${status.count }">
			<input type="hidden" name="toExcelRow46Col6" id="toExcelRow46Col6${status.count }">
			<input type="hidden" name="toExcelRow46Col7" id="toExcelRow46Col7${status.count }">
			<input type="hidden" name="toExcelRow46Col9" id="toExcelRow46Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_operating_expensesV" id="s_operating_expensesV${status.count }2" value="${obj2.S_OPERATING_EXPENSES}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow46Col5" value="${obj2.S_OPERATING_EXPENSES}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_operating_expensesV" id="s_operating_expensesV${status.count }3" value="${obj3.S_OPERATING_EXPENSES}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow46Col8" value="${obj3.S_OPERATING_EXPENSES}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue">营业利益</font>
			<input type="hidden" name="toExcelRow47Col1" value="营业利益">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_bp_sum" id="s_bp_sumV${status.count }1" readonly="readonlyV"  style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow47Col2" id="toExcelRow47Col2${status.count }">
			<input type="hidden" name="toExcelRow47Col3" id="toExcelRow47Col3${status.count }">
			<input type="hidden" name="toExcelRow47Col4" id="toExcelRow47Col4${status.count }">
			<input type="hidden" name="toExcelRow47Col5" id="toExcelRow47Col5${status.count }">
			<input type="hidden" name="toExcelRow47Col6" id="toExcelRow47Col6${status.count }">
			<input type="hidden" name="toExcelRow47Col7" id="toExcelRow47Col7${status.count }">
			<input type="hidden" name="toExcelRow47Col8" id="toExcelRow47Col8${status.count }">
			<input type="hidden" name="toExcelRow47Col9" id="toExcelRow47Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_bp_sumV" id="s_bp_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_bp_sumV" id="s_bp_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			营业外收入
			<input type="hidden" name="toExcelRow48Col1" value="营业外收入">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeV${status.count }1" value="${obj1.S_NONBUSINESS_INCOME}" style="width: 100px;text-align: right;">
			
			<input type="hidden" name="toExcelRow48Col2" value="${obj1.S_NONBUSINESS_INCOME}">
			<input type="hidden" name="toExcelRow48Col3" id="toExcelRow48Col3${status.count }">
			<input type="hidden" name="toExcelRow48Col4" id="toExcelRow48Col4${status.count }">
			<input type="hidden" name="toExcelRow48Col6" id="toExcelRow48Col6${status.count }">
			<input type="hidden" name="toExcelRow48Col7" id="toExcelRow48Col7${status.count }">
			<input type="hidden" name="toExcelRow48Col9" id="toExcelRow48Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeV${status.count }2" value="${obj2.S_NONBUSINESS_INCOME}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow48Col5" value="${obj2.S_NONBUSINESS_INCOME}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeV${status.count }3" value="${obj3.S_NONBUSINESS_INCOME}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow48Col8" value="${obj3.S_NONBUSINESS_INCOME}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			利息支出
			<input type="hidden" name="toExcelRow49Col1" value="利息支出">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_interest_expenseV" id="s_interest_expenseV${status.count }1" value="${obj1.S_INTEREST_EXPENSE}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow49Col2" value="${obj1.S_INTEREST_EXPENSE}">
			<input type="hidden" name="toExcelRow49Col3" id="toExcelRow49Col3${status.count }">
			<input type="hidden" name="toExcelRow49Col4" id="toExcelRow49Col4${status.count }">
			<input type="hidden" name="toExcelRow49Col6" id="toExcelRow49Col6${status.count }">
			<input type="hidden" name="toExcelRow49Col7" id="toExcelRow49Col7${status.count }">
			<input type="hidden" name="toExcelRow49Col9" id="toExcelRow49Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_interest_expenseV" id="s_interest_expenseV${status.count }2" value="${obj2.S_INTEREST_EXPENSE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow49Col5" value="${obj2.S_INTEREST_EXPENSE}">		
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_interest_expenseV" id="s_interest_expenseV${status.count }3" value="${obj3.S_INTEREST_EXPENSE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow49Col8" value="${obj3.S_INTEREST_EXPENSE}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他营业外支出
			<input type="hidden" name="toExcelRow50Col1" value="其他营业外支出">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_nonbusiness_expenseV" id="s_other_nonbusiness_expenseV${status.count }1" value="${obj1.S_OTHER_NONBUSINESS_EXPENSE}" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow50Col2" value="${obj1.S_OTHER_NONBUSINESS_EXPENSE}">
			<input type="hidden" name="toExcelRow50Col3" id="toExcelRow50Col3${status.count }">
			<input type="hidden" name="toExcelRow50Col4" id="toExcelRow50Col4${status.count }">
			<input type="hidden" name="toExcelRow50Col6" id="toExcelRow50Col6${status.count }">
			<input type="hidden" name="toExcelRow50Col7" id="toExcelRow50Col7${status.count }">
			<input type="hidden" name="toExcelRow50Col9" id="toExcelRow50Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_nonbusiness_expenseV" id="s_other_nonbusiness_expenseV${status.count }2" value="${obj2.S_OTHER_NONBUSINESS_EXPENSE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow50Col5" value="${obj2.S_OTHER_NONBUSINESS_EXPENSE}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_nonbusiness_expenseV" id="s_other_nonbusiness_expenseV${status.count }3" value="${obj3.S_OTHER_NONBUSINESS_EXPENSE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow50Col8" value="${obj3.S_OTHER_NONBUSINESS_EXPENSE}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue">减:营业外支出</font>
			<input type="hidden" name="toExcelRow51Col1" value="减:营业外支出">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nbe_sumV" id="s_nbe_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow51Col2" id="toExcelRow51Col2${status.count }">
			<input type="hidden" name="toExcelRow51Col3" id="toExcelRow51Col3${status.count }">
			<input type="hidden" name="toExcelRow51Col4" id="toExcelRow51Col4${status.count }">
			<input type="hidden" name="toExcelRow51Col5" id="toExcelRow51Col5${status.count }">
			<input type="hidden" name="toExcelRow51Col6" id="toExcelRow51Col6${status.count }">
			<input type="hidden" name="toExcelRow51Col7" id="toExcelRow51Col7${status.count }">
			<input type="hidden" name="toExcelRow51Col8" id="toExcelRow51Col8${status.count }">
			<input type="hidden" name="toExcelRow51Col9" id="toExcelRow51Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nbe_sumV" id="s_nbe_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nbe_sumV" id="s_nbe_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue">税前损益</font>
			<input type="hidden" name="toExcelRow52Col1" value="税前损益">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_before_sumV" id="s_before_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow52Col2" id="toExcelRow52Col2${status.count }">
			<input type="hidden" name="toExcelRow52Col3" id="toExcelRow52Col3${status.count }">
			<input type="hidden" name="toExcelRow52Col4" id="toExcelRow52Col4${status.count }">
			<input type="hidden" name="toExcelRow52Col5" id="toExcelRow52Col5${status.count }">
			<input type="hidden" name="toExcelRow52Col6" id="toExcelRow52Col6${status.count }">
			<input type="hidden" name="toExcelRow52Col7" id="toExcelRow52Col7${status.count }">
			<input type="hidden" name="toExcelRow52Col8" id="toExcelRow52Col8${status.count }">
			<input type="hidden" name="toExcelRow52Col9" id="toExcelRow52Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_before_sumV" id="s_before_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_before_sumV" id="s_before_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			减:所得税费用(利益)
			<input type="hidden" name="toExcelRow53Col1" value="减:所得税费用(利益)">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_income_tax_expenseV" id="s_income_tax_expenseV${status.count }1" value="${obj1.S_INCOME_TAX_EXPENSE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow53Col2" value="${obj1.S_INCOME_TAX_EXPENSE}">
			<input type="hidden" name="toExcelRow53Col3" id="toExcelRow53Col3${status.count }">
			<input type="hidden" name="toExcelRow53Col4" id="toExcelRow53Col4${status.count }">
			<input type="hidden" name="toExcelRow53Col6" id="toExcelRow53Col6${status.count }">
			<input type="hidden" name="toExcelRow53Col7" id="toExcelRow53Col7${status.count }">
			<input type="hidden" name="toExcelRow53Col9" id="toExcelRow53Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_income_tax_expenseV" id="s_income_tax_expenseV${status.count }2" value="${obj2.S_INCOME_TAX_EXPENSE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow53Col5" value="${obj2.S_INCOME_TAX_EXPENSE}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_income_tax_expenseV" id="s_income_tax_expenseV${status.count }3" value="${obj3.S_INCOME_TAX_EXPENSE}" style="width: 100px;text-align: right;">
			<input type="hidden" name="toExcelRow53Col8" value="${obj3.S_INCOME_TAX_EXPENSE}">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
		<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue"><strong style="font-size: 14px;">税后损益</strong></font>
			<input type="hidden" name="toExcelRow54Col1" value="税后损益">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_after_sumV" id="s_after_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		
			<input type="hidden" name="toExcelRow54Col2" id="toExcelRow54Col2${status.count }">
			<input type="hidden" name="toExcelRow54Col3" id="toExcelRow54Col3${status.count }">
			<input type="hidden" name="toExcelRow54Col4" id="toExcelRow54Col4${status.count }">
			<input type="hidden" name="toExcelRow54Col5" id="toExcelRow54Col5${status.count }">
			<input type="hidden" name="toExcelRow54Col6" id="toExcelRow54Col6${status.count }">
			<input type="hidden" name="toExcelRow54Col7" id="toExcelRow54Col7${status.count }">
			<input type="hidden" name="toExcelRow54Col8" id="toExcelRow54Col8${status.count }">
			<input type="hidden" name="toExcelRow54Col9" id="toExcelRow54Col9${status.count }">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_after_sumV" id="s_after_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_after_sumV" id="s_after_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
</table> <script type="text/javascript">  
			var lengthpc=$("#lengthpc").val();
			for(k=1;k<=lengthpc;k++){
			$("#project_itemV"+k+"1").datepicker($.datepicker.regional['zh-CN']); 
			$("#project_itemV"+k+"2").datepicker($.datepicker.regional['zh-CN']); 
			$("#project_itemV"+k+"3").datepicker($.datepicker.regional['zh-CN']); 
		    $("#s_start_dateV"+k+"1").datepicker($.datepicker.regional['zh-CN']); 
			$("#s_start_dateV"+k+"2").datepicker($.datepicker.regional['zh-CN']); 
			$("#s_start_dateV"+k+"3").datepicker($.datepicker.regional['zh-CN']); 
			changeProjectItemVg(k);
			sumZiChanZongEVg(k);
			sumFuZaiZongEVg(k);
			sumJingZhiZongEVg(k)
			initAllDataVg(k);
			sumYingYeLiYiVg(k);
			sumShuiQianSunYiVg(k);
			sumShuiHouSunYiVg(k);	
			initTable2DataVg(k);
			}		 
</script>