<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
function inputDatablur(fild,k){
		   valueChangeTableVg1(fild,k);		   
		}  
		function inputData2blur(fild,k){
		   valueChangeTableVg2(fild,k);	   
		} 
</script>
		<script type="text/javascript">  
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

<table id="capitalAndDebtTabVg${status.count }" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab"  >
	<tr>
		 <th class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="height: 28px;">
			 项目名称
		 </th>
		 <th colspan="7"  class="ui-state-default ui-th-ltr zc_grid_head">
			财务报表资产负债表暨水平分析(年度) 
		 </th> 			  
		 <th class="ui-state-default ui-th-ltr zc_grid_head">
			 <font style="font-size: 12">单位（千元）</font>
		 </th> 			  
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 19%;height: 24px;">
			科目\日期
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: center;">
			<input type="text" readonly="readonly" onchange="changeProjectItemVg(${status.count } );"  name="project_itemV" id="project_itemV${status.count }1" value="${obj1.PROJECT_ITEM}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<input type="button" value="剪切到下年" onclick="cutdownVg(1,${status.count },1);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" readonly="readonly"  onchange="changeProjectItemVg(${status.count });" name="project_itemV" id="project_itemV${status.count }2" value="${obj2.PROJECT_ITEM}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<input type="button" value="剪切到下年" onclick="cutdownVg(1,${status.count },2);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" readonly="readonly"  onchange="changeProjectItemVg(${status.count });"  name="project_itemV" id="project_itemV${status.count }3" value="${obj3.PROJECT_ITEM}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			现金及约当现金
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });"  name="ca_cash_priceV" id="ca_cash_priceV${status.count }1" value="${obj1.CA_CASH_PRICE }"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_cash_priceV" id="ca_cash_priceV${status.count }2" value="${obj2.CA_CASH_PRICE }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }"  onblur="inputDatablur(this.value,${status.count });" name="ca_cash_priceV" id="ca_cash_priceV${status.count }3" value="${obj3.CA_CASH_PRICE }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			短期投资
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_short_InvestV" id="ca_short_InvestV${status.count }1" value="${obj1.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_short_InvestV" id="ca_short_InvestV${status.count }2" value="${obj2.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_short_InvestV" id="ca_short_InvestV${status.count }3" value="${obj3.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			应收票据
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_bills_shouldV" id="ca_bills_shouldV${status.count }1" value="${obj1.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_bills_shouldV" id="ca_bills_shouldV${status.count }2" value="${obj2.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_bills_shouldV" id="ca_bills_shouldV${status.count }3" value="${obj3.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			应收账款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Funds_shouldV" id="ca_Funds_shouldV${status.count }1" value="${obj1.CA_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Funds_shouldV" id="ca_Funds_shouldV${status.count }2" value="${obj2.CA_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Funds_shouldV" id="ca_Funds_shouldV${status.count }3" value="${obj3.CA_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他应收款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldV${status.count }1" value="${obj1.CA_OTHER_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldV${status.count }2" value="${obj2.CA_OTHER_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldV${status.count }3" value="${obj3.CA_OTHER_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			存货
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Goods_stockV" id="ca_Goods_stockV${status.count }1" value="${obj1.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Goods_stockV" id="ca_Goods_stockV${status.count }2" value="${obj2.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_Goods_stockV" id="ca_Goods_stockV${status.count }3" value="${obj3.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他流动资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_otherV" id="ca_otherV${status.count }1" value="${obj1.CA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_otherV" id="ca_otherV${status.count }2" value="${obj2.CA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_otherV" id="ca_otherV${status.count }3" value="${obj3.CA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">流动资产</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_sumV" id="ca_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_sumV" id="ca_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ca_sumV" id="ca_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			土地
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_landV" id="fa_landV${status.count }1" value="${obj1.FA_LAND}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_landV" id="fa_landV${status.count }2" value="${obj2.FA_LAND}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_landV" id="fa_landV${status.count }3" value="${obj3.FA_LAND}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			建筑物
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_buildingsV" id="fa_buildingsV${status.count }1" value="${obj1.FA_BUILDINGS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_buildingsV" id="fa_buildingsV${status.count }2" value="${obj2.FA_BUILDINGS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_buildingsV" id="fa_buildingsV${status.count }3" value="${obj3.FA_BUILDINGS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			机器设备
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_equipmentsV" id="fa_equipmentsV${status.count }1" value="${obj1.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_equipmentsV" id="fa_equipmentsV${status.count }2" value="${obj2.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_equipmentsV" id="fa_equipmentsV${status.count }3" value="${obj3.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			租赁资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_rent_AssetsV" id="fa_rent_AssetsV${status.count }1" value="${obj1.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_rent_AssetsV" id="fa_rent_AssetsV${status.count }2" value="${obj2.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_rent_AssetsV" id="fa_rent_AssetsV${status.count }3" value="${obj3.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			运输工具及生财器具
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_transportsV" id="fa_transportsV${status.count }1" value="${obj1.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_transportsV" id="fa_transportsV${status.count }2" value="${obj2.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_transportsV" id="fa_transportsV${status.count }3" value="${obj3.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他固定资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_otherV" id="fa_otherV${status.count }1" value="${obj1.FA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_otherV" id="fa_otherV${status.count }2" value="${obj2.FA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_otherV" id="fa_otherV${status.count }3" value="${obj3.FA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			减:累计折旧
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_DepreciationsV" id="fa_DepreciationsV${status.count }1" value="${obj1.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_DepreciationsV" id="fa_DepreciationsV${status.count }2" value="${obj2.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_DepreciationsV" id="fa_DepreciationsV${status.count }3" value="${obj3.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			未完工程及预付设备款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsV${status.count }1" value="${obj1.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsV${status.count }2" value="${obj2.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsV${status.count }3" value="${obj3.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">固定资产</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_sumV" id="fa_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_sumV" id="fa_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="fa_sumV" id="fa_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			长期投资
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_InvestV" id="lang_InvestV${status.count }1" value="${obj1.LANG_INVEST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_InvestV" id="lang_InvestV${status.count }2" value="${obj2.LANG_INVEST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_InvestV" id="lang_InvestV${status.count }3" value="${obj3.LANG_INVEST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_AssetsV" id="other_AssetsV${status.count }1" value="${obj1.OTHER_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_AssetsV" id="other_AssetsV${status.count }2" value="${obj2.OTHER_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_AssetsV" id="other_AssetsV${status.count }3" value="${obj3.OTHER_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue"><strong>资产总额</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="capital_sumV" id="capital_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="capital_sumV" id="capital_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="capital_sumV" id="capital_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			短期借款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_short_debtV" id="sd_short_debtV${status.count }1" value="${obj1.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_short_debtV" id="sd_short_debtV${status.count }2" value="${obj2.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_short_debtV" id="sd_short_debtV${status.count }3" value="${obj3.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			应付票据
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_bills_shouldV" id="sd_bills_shouldV${status.count }1" value="${obj1.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_bills_shouldV" id="sd_bills_shouldV${status.count }2" value="${obj2.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_bills_shouldV" id="sd_bills_shouldV${status.count }3" value="${obj3.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			应付账款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_funds_shouldV" id="sd_funds_shouldV${status.count }1" value="${obj1.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_funds_shouldV" id="sd_funds_shouldV${status.count }2" value="${obj2.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_funds_shouldV" id="sd_funds_shouldV${status.count }3" value="${obj3.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他应付款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_other_payV" id="sd_other_payV${status.count }1" value="${obj1.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_other_payV" id="sd_other_payV${status.count }2" value="${obj2.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_other_payV" id="sd_other_payV${status.count }3" value="${obj3.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			股东往来
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_shareholdersV" id="sd_shareholdersV${status.count }1" value="${obj1.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_shareholdersV" id="sd_shareholdersV${status.count }2" value="${obj2.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_shareholdersV" id="sd_shareholdersV${status.count }3" value="${obj3.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			一年内到期之长期负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_one_yearV" id="sd_one_yearV${status.count }1" value="${obj1.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_one_yearV" id="sd_one_yearV${status.count }2" value="${obj2.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_one_yearV" id="sd_one_yearV${status.count }3" value="${obj3.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他流动负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_otherV" id="sd_otherV${status.count }1" value="${obj1.SD_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_otherV" id="sd_otherV${status.count }2" value="${obj2.SD_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_otherV" id="sd_otherV${status.count }3" value="${obj3.SD_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">流动负债</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_sumV" id="sd_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_sumV" id="sd_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="sd_sumV" id="sd_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			长期借款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_debtV" id="lang_debtV${status.count }1" value="${obj1.LANG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_debtV" id="lang_debtV${status.count }2" value="${obj2.LANG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="lang_debtV" id="lang_debtV${status.count }3" value="${obj3.LANG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他长期负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_long_debtV" id="other_long_debtV${status.count }1" value="${obj1.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_long_debtV" id="other_long_debtV${status.count }2" value="${obj2.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_long_debtV" id="other_long_debtV${status.count }3" value="${obj3.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue">长期负债</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ld_sumV" id="ld_sumV${status.count }1" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ld_sumV" id="ld_sumV${status.count }2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="ld_sumV" id="ld_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			其他负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_debtV" id="other_debtV${status.count }1" value="${obj1.OTHER_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_debtV" id="other_debtV${status.count }2" value="${obj2.OTHER_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="other_debtV" id="other_debtV${status.count }3" value="${obj3.OTHER_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue"><strong>负债总额</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="debt_sumV" id="debt_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="debt_sumV" id="debt_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="debt_sumV" id="debt_sumV${status.count }3" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			实收股本
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="share_capitalV" id="share_capitalV${status.count }1" value="${obj1.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="share_capitalV" id="share_capitalV${status.count }2" value="${obj2.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="share_capitalV" id="share_capitalV${status.count }3" value="${obj3.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			资本公积
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_CapitalV" id="surplus_CapitalV${status.count }1" value="${obj1.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_CapitalV" id="surplus_CapitalV${status.count }2" value="${obj2.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_CapitalV" id="surplus_CapitalV${status.count }3" value="${obj3.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			累积盈余
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_incomeV" id="surplus_incomeV${status.count }1" value="${obj1.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_incomeV" id="surplus_incomeV${status.count }2" value="${obj2.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="surplus_incomeV" id="surplus_incomeV${status.count }3" value="${obj3.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			本期损益
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="this_lostsV" id="this_lostsV${status.count }1" value="${obj1.THIS_LOSTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="this_lostsV" id="this_lostsV${status.count }2" value="${obj2.THIS_LOSTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="this_lostsV" id="this_lostsV${status.count }3" value="${obj3.THIS_LOSTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			调整项目
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="project_changedV" id="project_changedV${status.count }1" value="${obj1.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="project_changedV" id="project_changedV${status.count }2" value="${obj2.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="project_changedV" id="project_changedV${status.count }3" value="${obj3.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr">
			<font color="blue"><strong>净值总额</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="real_sumV" id="real_sumV${status.count }1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="real_sumV" id="real_sumV${status.count }2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData${status.count }" onblur="inputDatablur(this.value,${status.count });" name="real_sumV" id="real_sumV${status.count }3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
</table>  

  