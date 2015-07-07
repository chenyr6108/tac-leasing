<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="now2" class="java.util.Date" />  
<script type="text/javascript" src="${ctx }/credit/car/js/creditPropertyAndDebt.js"></script>
<table id="capitalAndDebtTab" width="100%" cellspacing="0" cellpadding="5" border="0" class="ui-jqgrid-htable zc_grid_title" id="priorProjectTab"  >
	<tr>
		 <th    class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="height: 28px;">
			 项目名称
		 </th>
		 <th colspan="7"  class="ui-state-default ui-th-ltr zc_grid_head">
			财务报表资产负债表暨水平分析(年度) 
		 </th> 			  
		 <th   class="ui-state-default ui-th-ltr zc_grid_head">
			 <font style="font-size: 12">单位（千元）</font>
		 </th> 			  
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 19%;height: 24px;font-size:14px;">
			科目\日期
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: center;font-size:14px;">
			<input type="text" readonly="readonly" onchange="changeProjectItem();"  name="project_item" id="project_item1" value="<fmt:formatDate value="${now2}" pattern="yyyy-MM-dd" />" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			<input type="button" value="剪切到下年" onclick="cutdown(1,1);" class="ui-state-default ui-corner-all">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;font-size:14px;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<jsp:setProperty name="now2" property="month" value="${now2.month-12}"/>
			<input type="text" readonly="readonly"  onchange="changeProjectItem();" name="project_item" id="project_item2" value="<fmt:formatDate value="${now2}" pattern="yyyy-12-31" />" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			<input type="button" value="剪切到下年" onclick="cutdown(1,2);" class="ui-state-default ui-corner-all">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align: right;font-size:14px;">
			两期差异
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<jsp:setProperty name="now2" property="month" value="${now2.month-12}"/>
			<input type="text" readonly="readonly"  onchange="changeProjectItem();"  name="project_item" id="project_item3" value="<fmt:formatDate value="${now2}" pattern="yyyy-12-31" />" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			现金及约当现金
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_cash_price" id="ca_cash_price1" value="0.0"  style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_cash_price" id="ca_cash_price2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_cash_price" id="ca_cash_price3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			短期投资
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_short_Invest" id="ca_short_Invest1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_short_Invest" id="ca_short_Invest2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_short_Invest" id="ca_short_Invest3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			应收票据
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_bills_should" id="ca_bills_should1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_bills_should" id="ca_bills_should2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_bills_should" id="ca_bills_should3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			应收账款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_Funds_should" id="ca_Funds_should1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_Funds_should" id="ca_Funds_should2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_Funds_should" id="ca_Funds_should3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他应收款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_other_Funds_should" id="ca_other_Funds_should1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_other_Funds_should" id="ca_other_Funds_should2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_other_Funds_should" id="ca_other_Funds_should3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			存货
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_Goods_stock" id="ca_Goods_stock1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_Goods_stock" id="ca_Goods_stock2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_Goods_stock" id="ca_Goods_stock3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他流动资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_other" id="ca_other1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_other" id="ca_other2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_other" id="ca_other3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size:14px;">流动资产</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ca_sum" id="ca_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_sum" id="ca_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ca_sum" id="ca_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			土地
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_land" id="fa_land1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_land" id="fa_land2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_land" id="fa_land3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			建筑物
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_buildings" id="fa_buildings1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_buildings" id="fa_buildings2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_buildings" id="fa_buildings3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			机器设备
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_equipments" id="fa_equipments1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_equipments" id="fa_equipments2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_equipments" id="fa_equipments3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			租赁资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_rent_Assets" id="fa_rent_Assets1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_rent_Assets" id="fa_rent_Assets2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_rent_Assets" id="fa_rent_Assets3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			运输工具及生财器具
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_transports" id="fa_transports1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_transports" id="fa_transports2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_transports" id="fa_transports3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他固定资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_other" id="fa_other1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_other" id="fa_other2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_other" id="fa_other3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			减:累计折旧
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_Depreciations" id="fa_Depreciations1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_Depreciations" id="fa_Depreciations2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_Depreciations" id="fa_Depreciations3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			未完工程及预付设备款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_Incompleted_projects" id="fa_Incompleted_projects1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_Incompleted_projects" id="fa_Incompleted_projects2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_Incompleted_projects" id="fa_Incompleted_projects3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size:14px;">固定资产</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="fa_sum" id="fa_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_sum" id="fa_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="fa_sum" id="fa_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			长期投资
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="lang_Invest" id="lang_Invest1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="lang_Invest" id="lang_Invest2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="lang_Invest" id="lang_Invest3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他资产
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="other_Assets" id="other_Assets1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="other_Assets" id="other_Assets2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="other_Assets" id="other_Assets3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size:14px;"><strong style="font-size:14px;">资产总额</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="capital_sum" id="capital_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="capital_sum" id="capital_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="capital_sum" id="capital_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			短期借款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_short_debt" id="sd_short_debt1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_short_debt" id="sd_short_debt2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_short_debt" id="sd_short_debt3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			应付票据
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_bills_should" id="sd_bills_should1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_bills_should" id="sd_bills_should2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_bills_should" id="sd_bills_should3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			应付账款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_funds_should" id="sd_funds_should1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_funds_should" id="sd_funds_should2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_funds_should" id="sd_funds_should3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他应付款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_other_pay" id="sd_other_pay1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_other_pay" id="sd_other_pay2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_other_pay" id="sd_other_pay3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			股东往来
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_shareholders" id="sd_shareholders1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_shareholders" id="sd_shareholders2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_shareholders" id="sd_shareholders3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			一年内到期之长期负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_one_year" id="sd_one_year1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_one_year" id="sd_one_year2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_one_year" id="sd_one_year3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他流动负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_other" id="sd_other1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_other" id="sd_other2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_other" id="sd_other3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size:14px;">流动负债</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="sd_sum" id="sd_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_sum" id="sd_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="sd_sum" id="sd_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			长期借款
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="lang_debt" id="lang_debt1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="lang_debt" id="lang_debt2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="lang_debt" id="lang_debt3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他长期负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="other_long_debt" id="other_long_debt1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="other_long_debt" id="other_long_debt2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="other_long_debt" id="other_long_debt3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size:14px;">长期负债</font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="ld_sum" id="ld_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ld_sum" id="ld_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="ld_sum" id="ld_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			其他负债
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="other_debt" id="other_debt1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="other_debt" id="other_debt2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="other_debt" id="other_debt3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size:14px;"><strong style="font-size:14px;">负债总额</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="debt_sum" id="debt_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="debt_sum" id="debt_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="debt_sum" id="debt_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr> 
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			实收股本
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="share_capital" id="share_capital1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="share_capital" id="share_capital2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="share_capital" id="share_capital3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			资本公积
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="surplus_Capital" id="surplus_Capital1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="surplus_Capital" id="surplus_Capital2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="surplus_Capital" id="surplus_Capital3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			累积盈余
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="surplus_income" id="surplus_income1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="surplus_income" id="surplus_income2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="surplus_income" id="surplus_income3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			本期损益
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="this_losts" id="this_losts1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="this_losts" id="this_losts2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="this_losts" id="this_losts3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			调整项目
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="project_changed" id="project_changed1" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="project_changed" id="project_changed2" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="project_changed" id="project_changed3" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="font-size:14px;">
			<font color="blue" style="font-size:14px;"><strong style="font-size: 14px;">净值总额</strong></font>
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;height: 24px;font-size:14px;">
			<input type="text" class="inputData" name="real_sum" id="real_sum1" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="real_sum" id="real_sum2" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;;text-align: center;font-size:14px;">
			<input type="text" class="inputData" name="real_sum" id="real_sum3" readonly="readonly" value="0.0" style="width: 100px;text-align: right;">
		</td>
		<td class="ui-widget-content jqgrow ui-row-ltr" style="width: 9%;text-align:right;font-size:14px;">
			&nbsp;
		</td>
	</tr>  
</table> 	
	<c:if test="${showStatus eq 2}">
		<font color="blue" style="font-size: 14px;">说明</font><br/>
		<textarea cols="120" rows="5" name="fuzhai" style="font-size: 14px;"></textarea>
	</c:if>
	<center>
		<c:if test="${showStatus eq 2}">
			<input type="button" value="下一页"   class="ui-state-default ui-corner-all" onclick="gosoming2();">
		</c:if>
	</center>  
<br />  
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
		sumJingZhiZongE()
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
		
			function gosoming2(){
		$("#bs_2").click();
	} 
</script> 