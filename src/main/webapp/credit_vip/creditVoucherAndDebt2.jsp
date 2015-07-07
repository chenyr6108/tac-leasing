<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <script type="text/javascript">
       function inputDatablur(fild,k){
		   valueChangeTableVg1(fild,k);		   
		}  
		function inputData2blur(fild,k){
		   valueChangeTableVg2(fild,k);	   
		} 
</script>

<table id="capitalAndDebtTabVg2${status.count }" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab"  >
    <tr>
		 <th    class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="height: 28px;">
			 项目名称
		 </th>
		 <th colspan="7"  class="ui-state-default ui-th-ltr zc_grid_head">
			损益表暨水平分析(年度) 
		 </th> 			  
		 <th   class="ui-state-default ui-th-ltr zc_grid_head">
			 <font style="font-size: 12">单位（千元）</font>
		 </th> 			  
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 19%;height: 24px;" rowspan="2">
			科目\期间
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: center;height: 24px;">
			<input type="text" readonly="readonly"  name="s_start_dateV" id="s_start_dateV${status.count }1" value="${obj1.S_START_DATE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;"  rowspan="2">
			<input type="button" value="剪切到下年" onclick="cutdownVg(2,${status.count },1);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;"  rowspan="2">
			成长率%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" readonly="readonly" name="s_start_dateV" id="s_start_dateV${status.count }2" value="${obj2.S_START_DATE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;"  rowspan="2">
			<input type="button" value="剪切到下年" onclick="cutdownVg(2,${status.count },2);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;"  rowspan="2">
			成长率%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" readonly="readonly"  name="s_start_dateV" id="s_start_dateV${status.count }3" value="${obj3.S_START_DATE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;" rowspan="2">
			&nbsp;
		</td>
	</tr> 
	<tr> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;height: 24px;">
			<div id="showProject_itemV${status.count }1"></div>
		</td> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<div id="showProject_itemV${status.count }2"></div>
		</td> 
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<div id="showProject_itemV${status.count }3"></div>
		</td> 
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr"> 
			销售收入净额 
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_net_incomeV" id="s_sale_net_incomeV${status.count }1" value="${obj1.S_SALE_NET_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			100%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_net_incomeV" id="s_sale_net_incomeV${status.count }2" value="${obj2.S_SALE_NET_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			100%
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_net_incomeV" id="s_sale_net_incomeV${status.count }3" value="${obj3.S_SALE_NET_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			100%
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			减:销售成本
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_costV" id="s_sale_costV${status.count }1" value="${obj1.S_SALE_COST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_costV" id="s_sale_costV${status.count }2" value="${obj2.S_SALE_COST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sale_costV" id="s_sale_costV${status.count }3" value="${obj3.S_SALE_COST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他业务毛利
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_gross_profitV" id="s_other_gross_profitV${status.count }1" value="${obj1.S_OTHER_GROSS_PROFIT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_gross_profitV" id="s_other_gross_profitV${status.count }2" value="${obj2.S_OTHER_GROSS_PROFIT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_gross_profitV" id="s_other_gross_profitV${status.count }3" value="${obj3.S_OTHER_GROSS_PROFIT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">销售毛利</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sgp_sumV" id="s_sgp_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sgp_sumV" id="s_sgp_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_sgp_sumV" id="s_sgp_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			减:营业费用
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_operating_expensesV" id="s_operating_expensesV${status.count }1" value="${obj1.S_OPERATING_EXPENSES}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_operating_expensesV" id="s_operating_expensesV${status.count }2" value="${obj2.S_OPERATING_EXPENSES}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_operating_expensesV" id="s_operating_expensesV${status.count }3" value="${obj3.S_OPERATING_EXPENSES}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">营业利益</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_bp_sum" id="s_bp_sumV${status.count }1" readonly="readonlyV"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_bp_sumV" id="s_bp_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_bp_sumV" id="s_bp_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			营业外收入
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeV${status.count }1" value="${obj1.S_NONBUSINESS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeV${status.count }2" value="${obj2.S_NONBUSINESS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeV${status.count }3" value="${obj3.S_NONBUSINESS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			利息支出
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_interest_expenseV" id="s_interest_expenseV${status.count }1" value="${obj1.S_INTEREST_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_interest_expenseV" id="s_interest_expenseV${status.count }2" value="${obj2.S_INTEREST_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_interest_expenseV" id="s_interest_expenseV${status.count }3" value="${obj3.S_INTEREST_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他营业外支出
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_nonbusiness_expenseV" id="s_other_nonbusiness_expenseV${status.count }1" value="${obj1.S_OTHER_NONBUSINESS_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_nonbusiness_expenseV" id="s_other_nonbusiness_expenseV${status.count }2" value="${obj2.S_OTHER_NONBUSINESS_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_other_nonbusiness_expenseV" id="s_other_nonbusiness_expenseV${status.count }3" value="${obj3.S_OTHER_NONBUSINESS_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">减:营业外支出</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nbe_sumV" id="s_nbe_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nbe_sumV" id="s_nbe_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_nbe_sumV" id="s_nbe_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">税前损益</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_before_sumV" id="s_before_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_before_sumV" id="s_before_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_before_sumV" id="s_before_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			减:所得税费用(利益)
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_income_tax_expenseV" id="s_income_tax_expenseV${status.count }1" value="${obj1.S_INCOME_TAX_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_income_tax_expenseV" id="s_income_tax_expenseV${status.count }2" value="${obj2.S_INCOME_TAX_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_income_tax_expenseV" id="s_income_tax_expenseV${status.count }3" value="${obj3.S_INCOME_TAX_EXPENSE}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
		<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue"><strong>税后损益</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_after_sumV" id="s_after_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputData2blur(this.value,${status.count });" name="s_after_sumV" id="s_after_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
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