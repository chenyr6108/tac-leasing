<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="${ctx }/product/supplier/js/supplierPropertyAndDebt.js"></script>
<table id="capitalAndDebtTab" width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab"  >
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
			<input type="text" readonly="readonly" onchange="changeProjectItem();"  name="project_item" id="project_item1" value="${obj1.PROJECT_ITEM}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<input type="button" value="剪切到下年" onclick="cutdown(1,1);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" readonly="readonly"  onchange="changeProjectItem();" name="project_item" id="project_item2" value="${obj2.PROJECT_ITEM}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			<input type="button" value="剪切到下年" onclick="cutdown(1,2);" class="ui-state-default ui-corner-all">&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" readonly="readonly"  onchange="changeProjectItem();"  name="project_item" id="project_item3" value="${obj3.PROJECT_ITEM}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_cash_price" id="ca_cash_price1" value="${obj1.CA_CASH_PRICE }"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_cash_price" id="ca_cash_price2" value="${obj2.CA_CASH_PRICE }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_cash_price" id="ca_cash_price3" value="${obj3.CA_CASH_PRICE }" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_short_Invest" id="ca_short_Invest1" value="${obj1.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_short_Invest" id="ca_short_Invest2" value="${obj2.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_short_Invest" id="ca_short_Invest3" value="${obj3.CA_SHORT_INVEST }" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_bills_should" id="ca_bills_should1" value="${obj1.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_bills_should" id="ca_bills_should2" value="${obj2.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_bills_should" id="ca_bills_should3" value="${obj3.CA_BILLS_SHOULD }" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_Funds_should" id="ca_Funds_should1" value="${obj1.CA_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_Funds_should" id="ca_Funds_should2" value="${obj2.CA_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_Funds_should" id="ca_Funds_should3" value="${obj3.CA_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_other_Funds_should" id="ca_other_Funds_should1" value="${obj1.CA_OTHER_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_other_Funds_should" id="ca_other_Funds_should2" value="${obj2.CA_OTHER_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_other_Funds_should" id="ca_other_Funds_should3" value="${obj3.CA_OTHER_FUNDS_SHOULD }" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_Goods_stock" id="ca_Goods_stock1" value="${obj1.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_Goods_stock" id="ca_Goods_stock2" value="${obj2.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_Goods_stock" id="ca_Goods_stock3" value="${obj3.CA_GOODS_STOCK}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_other" id="ca_other1" value="${obj1.CA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_other" id="ca_other2" value="${obj2.CA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_other" id="ca_other3" value="${obj3.CA_OTHER}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ca_sum" id="ca_sum1" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_sum" id="ca_sum2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ca_sum" id="ca_sum3" readonly="readonly" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_land" id="fa_land1" value="${obj1.FA_LAND}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_land" id="fa_land2" value="${obj2.FA_LAND}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_land" id="fa_land3" value="${obj3.FA_LAND}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_buildings" id="fa_buildings1" value="${obj1.FA_BUILDINGS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_buildings" id="fa_buildings2" value="${obj2.FA_BUILDINGS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_buildings" id="fa_buildings3" value="${obj3.FA_BUILDINGS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_equipments" id="fa_equipments1" value="${obj1.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_equipments" id="fa_equipments2" value="${obj2.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_equipments" id="fa_equipments3" value="${obj3.FA_EQUIPMENTS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_rent_Assets" id="fa_rent_Assets1" value="${obj1.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_rent_Assets" id="fa_rent_Assets2" value="${obj2.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_rent_Assets" id="fa_rent_Assets3" value="${obj3.FA_RENT_ASSETS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_transports" id="fa_transports1" value="${obj1.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_transports" id="fa_transports2" value="${obj2.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_transports" id="fa_transports3" value="${obj3.FA_TRANSPORTS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_other" id="fa_other1" value="${obj1.FA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_other" id="fa_other2" value="${obj2.FA_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_other" id="fa_other3" value="${obj3.FA_OTHER}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_Depreciations" id="fa_Depreciations1" value="${obj1.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_Depreciations" id="fa_Depreciations2" value="${obj2.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_Depreciations" id="fa_Depreciations3" value="${obj3.FA_DEPRECIATIONS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_Incompleted_projects" id="fa_Incompleted_projects1" value="${obj1.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_Incompleted_projects" id="fa_Incompleted_projects2" value="${obj2.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_Incompleted_projects" id="fa_Incompleted_projects3" value="${obj3.FA_INCOMPLETED_PROJECTS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="fa_sum" id="fa_sum1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_sum" id="fa_sum2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="fa_sum" id="fa_sum3" readonly="readonly" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="lang_Invest" id="lang_Invest1" value="${obj1.LANG_INVEST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="lang_Invest" id="lang_Invest2" value="${obj2.LANG_INVEST}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="lang_Invest" id="lang_Invest3" value="${obj3.LANG_INVEST}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="other_Assets" id="other_Assets1" value="${obj1.OTHER_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="other_Assets" id="other_Assets2" value="${obj2.OTHER_ASSETS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="other_Assets" id="other_Assets3" value="${obj3.OTHER_ASSETS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="capital_sum" id="capital_sum1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="capital_sum" id="capital_sum2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="capital_sum" id="capital_sum3" readonly="readonly" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_short_debt" id="sd_short_debt1" value="${obj1.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_short_debt" id="sd_short_debt2" value="${obj2.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_short_debt" id="sd_short_debt3" value="${obj3.SD_SHORT_DEBT}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_bills_should" id="sd_bills_should1" value="${obj1.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_bills_should" id="sd_bills_should2" value="${obj2.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_bills_should" id="sd_bills_should3" value="${obj3.SD_BILLS_SHOULD}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_funds_should" id="sd_funds_should1" value="${obj1.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_funds_should" id="sd_funds_should2" value="${obj2.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_funds_should" id="sd_funds_should3" value="${obj3.SD_FUNDS_SHOULD}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_other_pay" id="sd_other_pay1" value="${obj1.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_other_pay" id="sd_other_pay2" value="${obj2.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_other_pay" id="sd_other_pay3" value="${obj3.SD_OTHER_PAY}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_shareholders" id="sd_shareholders1" value="${obj1.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_shareholders" id="sd_shareholders2" value="${obj2.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_shareholders" id="sd_shareholders3" value="${obj3.SD_SHAREHOLDERS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_one_year" id="sd_one_year1" value="${obj1.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_one_year" id="sd_one_year2" value="${obj2.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_one_year" id="sd_one_year3" value="${obj3.SD_ONE_YEAR}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_other" id="sd_other1" value="${obj1.SD_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_other" id="sd_other2" value="${obj2.SD_OTHER}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_other" id="sd_other3" value="${obj3.SD_OTHER}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="sd_sum" id="sd_sum1" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_sum" id="sd_sum2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="sd_sum" id="sd_sum3" readonly="readonly" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="lang_debt" id="lang_debt1" value="${obj1.LANG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="lang_debt" id="lang_debt2" value="${obj2.LANG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="lang_debt" id="lang_debt3" value="${obj3.LANG_DEBT}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="other_long_debt" id="other_long_debt1" value="${obj1.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="other_long_debt" id="other_long_debt2" value="${obj2.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="other_long_debt" id="other_long_debt3" value="${obj3.OTHER_LONG_DEBT}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="ld_sum" id="ld_sum1" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ld_sum" id="ld_sum2" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="ld_sum" id="ld_sum3" readonly="readonly"  style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="other_debt" id="other_debt1" value="${obj1.OTHER_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="other_debt" id="other_debt2" value="${obj2.OTHER_DEBT}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="other_debt" id="other_debt3" value="${obj3.OTHER_DEBT}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="debt_sum" id="debt_sum1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="debt_sum" id="debt_sum2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="debt_sum" id="debt_sum3" readonly="readonly" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="share_capital" id="share_capital1" value="${obj1.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="share_capital" id="share_capital2" value="${obj2.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="share_capital" id="share_capital3" value="${obj3.SHARE_CAPITAL}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="surplus_Capital" id="surplus_Capital1" value="${obj1.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="surplus_Capital" id="surplus_Capital2" value="${obj2.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="surplus_Capital" id="surplus_Capital3" value="${obj3.SURPLUS_CAPITAL}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="surplus_income" id="surplus_income1" value="${obj1.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="surplus_income" id="surplus_income2" value="${obj2.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="surplus_income" id="surplus_income3" value="${obj3.SURPLUS_INCOME}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="this_losts" id="this_losts1" value="${obj1.THIS_LOSTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="this_losts" id="this_losts2" value="${obj2.THIS_LOSTS}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="this_losts" id="this_losts3" value="${obj3.THIS_LOSTS}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="project_changed" id="project_changed1" value="${obj1.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="project_changed" id="project_changed2" value="${obj2.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="project_changed" id="project_changed3" value="${obj3.PROJECT_CHANGED}" style="width: 100px;text-align: right;">
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
			<input type="text" class="inputData" name="real_sum" id="real_sum1" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="real_sum" id="real_sum2" readonly="readonly" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;">
			<input type="text" class="inputData" name="real_sum" id="real_sum3" readonly="readonly"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td colspan="9" class="ui-state-default ui-th-ltr zc_grid_head" height="26px">上次说明记录</td>
	</tr> 
	<tr>
	<td colspan="9">${remark1Map.REMARK}</td>
	</tr> 
</table>  
		<font color="blue">说明</font><br/>
		<textarea cols="120" rows="5" name="fuzhai"></textarea>
	<center>
		<input type="button" value="下一页" class="ui-state-default ui-corner-all" onclick="gosoming();">
	</center>

	   
<script type="text/javascript">  
		$("#project_item1").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_item2").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_item3").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_date1").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_date2").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_date3").datepicker($.datepicker.regional['zh-CN']); 
		changeProjectItem();
		sumZiChanZongE();
		sumFuZaiZongE();
		sumJingZhiZongE();
		initAllData();
		sumYingYeLiYi();
		sumShuiQianSunYi();
		sumShuiHouSunYi();	
		initTable2Data();
		$(".inputData").blur(function(){
			valueChangeTable1(this);
		});
		$(".inputData2").blur(function(){
			valueChangeTable2(this);
		});
		$(".inputData").keypress(function(event){
			pressKeyFunc(this,event);
		});
		$(".inputData2").keypress(function(event){
			pressKeyFunc2(this,event);
		}); 
	function gosoming(){
		$("#bs_2").click();
	}
</script> 