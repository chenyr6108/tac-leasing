<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now4" class="java.util.Date" />
<html>
	<head>
		<title>添加担保人 财务信息</title>


		<script type="text/javascript">  
					 
		$("#project_itemVc1").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_itemVc2").datepicker($.datepicker.regional['zh-CN']); 
		$("#project_itemVc3").datepicker($.datepicker.regional['zh-CN']); 
	    $("#s_start_dateVc1").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_dateVc2").datepicker($.datepicker.regional['zh-CN']); 
		$("#s_start_dateVc3").datepicker($.datepicker.regional['zh-CN']); 
		changeProjectItemVc();
	
		sumZiChanZongEVc();
		sumFuZaiZongEVc();
		sumJingZhiZongEVc()
		initAllDataVc();
		sumYingYeLiYiVc();
		sumShuiQianSunYiVc();
		sumShuiHouSunYiVc();	
		initTable2DataVc();
		$(".inputDataVc").blur(function(){
			valueChangeTableVc1(this);
		});
		$(".inputDataVc2").blur(function(){
			valueChangeTableVc2(this);
		});
		$(".inputDataVc").keypress(function(event){
			pressKeyFuncVc(this,event);
		});
		$(".inputDataVc2").keypress(function(event){
			pressKeyFuncVc2(this,event);
		}); 
		
</script>
	</head>
	<body>
		<table id="capitalAndDebtTabVc" width="100%" cellspacing="0"
			cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"
			id="priorProjectTab">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" align="left"
					style="height: 28px;">
					项目名称
				</th>
				<th colspan="7" class="ui-state-default ui-th-ltr zc_grid_head">
					财务报表资产负债表暨水平分析(年度)
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					<font style="font-size: 12">单位（千元）</font>
				</th>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 19%; height: 24px;">
					科目\日期
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: center;">
					<input type="text" readonly="readonly"
						onchange="changeProjectItemVc();" name="project_itemV"
						id="project_itemVc1"
						value="<fmt:formatDate value="${now4}" pattern="yyyy-MM-dd" />"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					<input type="button" value="剪切到下年" onclick="cutdownVc(1,1);"
						class="ui-state-default ui-corner-all">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					两期差异
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<jsp:setProperty name="now4" property="month"
						value="${now4.month-12}" />
					<input type="text" readonly="readonly"
						onchange="changeProjectItemVc();" name="project_itemV"
						id="project_itemVc2"
						value="<fmt:formatDate value="${now4}" pattern="yyyy-12-31" />"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					<input type="button" value="剪切到下年" onclick="cutdownVc(1,2);"
						class="ui-state-default ui-corner-all">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					两期差异
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<jsp:setProperty name="now4" property="month"
						value="${now4.month-12}" />
					<input type="text" readonly="readonly"
						onchange="changeProjectItemVc();" name="project_itemV"
						id="project_itemVc3"
						value="<fmt:formatDate value="${now4}" pattern="yyyy-12-31" />"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					现金及约当现金
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ca_cash_priceV"
						id="ca_cash_priceVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_cash_priceV"
						id="ca_cash_priceVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_cash_priceV"
						id="ca_cash_priceVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					短期投资
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ca_short_InvestV"
						id="ca_short_InvestVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_short_InvestV"
						id="ca_short_InvestVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_short_InvestV"
						id="ca_short_InvestVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					应收票据
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ca_bills_shouldV"
						id="ca_bills_shouldVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_bills_shouldV"
						id="ca_bills_shouldVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_bills_shouldV"
						id="ca_bills_shouldVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					应收账款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ca_Funds_shouldV"
						id="ca_Funds_shouldVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_Funds_shouldV"
						id="ca_Funds_shouldVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_Funds_shouldV"
						id="ca_Funds_shouldVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他应收款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc"
						name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldVc1"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc"
						name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldVc2"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc"
						name="ca_other_Funds_shouldV" id="ca_other_Funds_shouldVc3"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					存货
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ca_Goods_stockV"
						id="ca_Goods_stockVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_Goods_stockV"
						id="ca_Goods_stockVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_Goods_stockV"
						id="ca_Goods_stockVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他流动资产
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ca_otherV"
						id="ca_otherVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_otherV"
						id="ca_otherVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_otherV"
						id="ca_otherVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">流动资产</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ca_sumV" id="ca_sumVc1"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_sumV" id="ca_sumVc2"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ca_sumV" id="ca_sumVc3"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					土地
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_landV"
						id="fa_landVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_landV"
						id="fa_landVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_landV"
						id="fa_landVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					建筑物
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_buildingsV"
						id="fa_buildingsVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_buildingsV"
						id="fa_buildingsVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_buildingsV"
						id="fa_buildingsVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					机器设备
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_equipmentsV"
						id="fa_equipmentsVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_equipmentsV"
						id="fa_equipmentsVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_equipmentsV"
						id="fa_equipmentsVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					租赁资产
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_rent_AssetsV"
						id="fa_rent_AssetsVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_rent_AssetsV"
						id="fa_rent_AssetsVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_rent_AssetsV"
						id="fa_rent_AssetsVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					运输工具及生财器具
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_transportsV"
						id="fa_transportsVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_transportsV"
						id="fa_transportsVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_transportsV"
						id="fa_transportsVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他固定资产
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_otherV"
						id="fa_otherVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_otherV"
						id="fa_otherVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_otherV"
						id="fa_otherVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					减:累计折旧
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_DepreciationsV"
						id="fa_DepreciationsVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_DepreciationsV"
						id="fa_DepreciationsVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_DepreciationsV"
						id="fa_DepreciationsVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					未完工程及预付设备款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc"
						name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsVc1"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc"
						name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsVc2"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc"
						name="fa_Incompleted_projectsV" id="fa_Incompleted_projectsVc3"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">固定资产</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="fa_sumV" id="fa_sumVc1"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_sumV" id="fa_sumVc2"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="fa_sumV" id="fa_sumVc3"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					长期投资
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="lang_InvestV"
						id="lang_InvestVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="lang_InvestV"
						id="lang_InvestVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="lang_InvestV"
						id="lang_InvestVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他资产
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="other_AssetsV"
						id="other_AssetsVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="other_AssetsV"
						id="other_AssetsVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="other_AssetsV"
						id="other_AssetsVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue"><strong>资产总额</strong>
					</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="capital_sumV"
						id="capital_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="capital_sumV"
						id="capital_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="capital_sumV"
						id="capital_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					短期借款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_short_debtV"
						id="sd_short_debtVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_short_debtV"
						id="sd_short_debtVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_short_debtV"
						id="sd_short_debtVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					应付票据
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_bills_shouldV"
						id="sd_bills_shouldVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_bills_shouldV"
						id="sd_bills_shouldVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_bills_shouldV"
						id="sd_bills_shouldVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					应付账款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_funds_shouldV"
						id="sd_funds_shouldVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_funds_shouldV"
						id="sd_funds_shouldVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_funds_shouldV"
						id="sd_funds_shouldVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他应付款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_other_payV"
						id="sd_other_payVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_other_payV"
						id="sd_other_payVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_other_payV"
						id="sd_other_payVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					股东往来
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_shareholdersV"
						id="sd_shareholdersVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_shareholdersV"
						id="sd_shareholdersVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_shareholdersV"
						id="sd_shareholdersVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					一年内到期之长期负债
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_one_yearV"
						id="sd_one_yearVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_one_yearV"
						id="sd_one_yearVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_one_yearV"
						id="sd_one_yearVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他流动负债
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_otherV"
						id="sd_otherVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_otherV"
						id="sd_otherVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_otherV"
						id="sd_otherVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">流动负债</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="sd_sumV" id="sd_sumVc1"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_sumV" id="sd_sumVc2"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="sd_sumV" id="sd_sumVc3"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					长期借款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="lang_debtV"
						id="lang_debtVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="lang_debtV"
						id="lang_debtVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="lang_debtV"
						id="lang_debtVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他长期负债
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="other_long_debtV"
						id="other_long_debtVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="other_long_debtV"
						id="other_long_debtVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="other_long_debtV"
						id="other_long_debtVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">长期负债</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="ld_sumV" id="ld_sumVc1"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ld_sumV" id="ld_sumVc2"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="ld_sumV" id="ld_sumVc3"
						readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他负债
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="other_debtV"
						id="other_debtVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="other_debtV"
						id="other_debtVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="other_debtV"
						id="other_debtVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue"><strong>负债总额</strong>
					</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="debt_sumV"
						id="debt_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="debt_sumV"
						id="debt_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="debt_sumV"
						id="debt_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					实收股本
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="share_capitalV"
						id="share_capitalVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="share_capitalV"
						id="share_capitalVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="share_capitalV"
						id="share_capitalVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					资本公积
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="surplus_CapitalV"
						id="surplus_CapitalVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="surplus_CapitalV"
						id="surplus_CapitalVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="surplus_CapitalV"
						id="surplus_CapitalVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					累积盈余
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="surplus_incomeV"
						id="surplus_incomeVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="surplus_incomeV"
						id="surplus_incomeVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="surplus_incomeV"
						id="surplus_incomeVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					本期损益
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="this_lostsV"
						id="this_lostsVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="this_lostsV"
						id="this_lostsVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="this_lostsV"
						id="this_lostsVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					调整项目
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="project_changedV"
						id="project_changedVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="project_changedV"
						id="project_changedVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="project_changedV"
						id="project_changedVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue"><strong>净值总额</strong>
					</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc" name="real_sumV"
						id="real_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="real_sumV"
						id="real_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc" name="real_sumV"
						id="real_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
		</table>
		<br />
		<table id="capitalAndDebtTabVc2" width="100%" cellspacing="0"
			cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"
			id="priorProjectTab">
			<tr>
				<th class="ui-state-default ui-th-ltr zc_grid_head" align="left"
					style="height: 28px;">
					项目名称
				</th>
				<th colspan="7" class="ui-state-default ui-th-ltr zc_grid_head">
					损益表暨水平分析(年度)
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					<font style="font-size: 12">单位（千元）</font>
				</th>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 19%; height: 24px;" rowspan="2">
					科目\期间
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: center; height: 24px;">
					<jsp:setProperty name="now4" property="month"
						value="${now4.month+24}" />
					<input type="text" readonly="readonly" name="s_start_dateV"
						id="s_start_dateVc1"
						value="<fmt:formatDate value="${now4}" pattern="yyyy-01-01" />"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;" rowspan="2">
					<input type="button" value="剪切到下年" onclick="cutdownVc(2,1);"
						class="ui-state-default ui-corner-all">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;" rowspan="2">
					成长率%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<jsp:setProperty name="now4" property="month"
						value="${now4.month-12}" />
					<input type="text" readonly="readonly" name="s_start_dateV"
						id="s_start_dateVc2"
						value="<fmt:formatDate value="${now4}" pattern="yyyy-01-01" />"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;" rowspan="2">
					<input type="button" value="剪切到下年" onclick="cutdownVc(2,2);"
						class="ui-state-default ui-corner-all">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;" rowspan="2">
					成长率%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<jsp:setProperty name="now4" property="month"
						value="${now4.month-12}" />
					<input type="text" readonly="readonly" name="s_start_dateV"
						id="s_start_dateVc3"
						value="<fmt:formatDate value="${now4}" pattern="yyyy-01-01" />"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;" rowspan="2">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right; height: 24px;">
					<div id="showProject_itemVc1"></div>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					<div id="showProject_itemVc2"></div>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					<div id="showProject_itemVc3"></div>
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					销售收入净额
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_sale_net_incomeV"
						id="s_sale_net_incomeVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					100%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_sale_net_incomeV"
						id="s_sale_net_incomeVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					100%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_sale_net_incomeV"
						id="s_sale_net_incomeVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					100%
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					减:销售成本
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_sale_costV"
						id="s_sale_costVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_sale_costV"
						id="s_sale_costVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_sale_costV"
						id="s_sale_costVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他业务毛利
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2"
						name="s_other_gross_profitV" id="s_other_gross_profitVc1"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_other_gross_profitV" id="s_other_gross_profitVc2"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_other_gross_profitV" id="s_other_gross_profitVc3"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">销售毛利</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_sgp_sumV"
						id="s_sgp_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_sgp_sumV"
						id="s_sgp_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_sgp_sumV"
						id="s_sgp_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					减:营业费用
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2"
						name="s_operating_expensesV" id="s_operating_expensesVc1"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_operating_expensesV" id="s_operating_expensesVc2"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_operating_expensesV" id="s_operating_expensesVc3"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">营业利益</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_bp_sumV"
						id="s_bp_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_bp_sumV"
						id="s_bp_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_bp_sumV"
						id="s_bp_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					营业外收入
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2"
						name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeVc1"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeVc2"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_nonbusiness_incomeV" id="s_nonbusiness_incomeVc3"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					利息支出
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_interest_expenseV"
						id="s_interest_expenseVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_interest_expenseV"
						id="s_interest_expenseVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_interest_expenseV"
						id="s_interest_expenseVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					其他营业外支出
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2"
						name="s_other_nonbusiness_expenseV"
						id="s_other_nonbusiness_expenseVc1" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_other_nonbusiness_expenseV"
						id="s_other_nonbusiness_expenseVc2" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_other_nonbusiness_expenseV"
						id="s_other_nonbusiness_expenseVc3" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">减:营业外支出</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_nbe_sumV"
						id="s_nbe_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_nbe_sumV"
						id="s_nbe_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_nbe_sumV"
						id="s_nbe_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue">税前损益</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_before_sumV"
						id="s_before_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_before_sumV"
						id="s_before_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_before_sumV"
						id="s_before_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					减:所得税费用(利益)
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2"
						name="s_income_tax_expenseV" id="s_income_tax_expenseVc1"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_income_tax_expenseV" id="s_income_tax_expenseVc2"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2"
						name="s_income_tax_expenseV" id="s_income_tax_expenseVc3"
						value="0.0" style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<font color="blue"><strong>税后损益</strong>
					</font>
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center; height: 24px;">
					<input type="text" class="inputDataVc2" name="s_after_sumV"
						id="s_after_sumVc1" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_after_sumV"
						id="s_after_sumVc2" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%;; text-align: center;">
					<input type="text" class="inputDataVc2" name="s_after_sumV"
						id="s_after_sumVc3" readonly="readonly" value="0.0"
						style="width: 100px; text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr"
					style="width: 9%; text-align: right;">
					&nbsp;
				</td>
			</tr>
		</table>
		<!-- 	
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="thisProjectsTab">
			<tr>
				<th width="19%"  class="ui-state-default ui-th-ltr zc_grid_head" align="left">
					项目名称
				</th>
				<th colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head">
					财务情况说明 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位（千元）
				</th>
			</tr> 
			<tr>
				<td width="20%" class="ui-widget-content jqgrow ui-row-ltr">
					项目
					<jsp:useBean id="now" class="java.util.Date" /> 
					<jsp:setProperty name="now" property="month" value="${now.month-1}"/>
				</td>
				<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PROJECT_NAMEss" id="PROJECT_NAME11s" value="<fmt:formatDate value="${now}" pattern="yyyy年MM月" />" style="width: 130px">
				</td>
				<td width="15%" class="ui-widget-content jqgrow ui-row-ltr"> 
					<jsp:setProperty name="now" property="month" value="${now.month-12}"/>
					<input type="text" name="PROJECT_NAMEss" id="PROJECT_NAME22s" value="<fmt:formatDate value="${now}" pattern="yyyy年" />" style="width: 130px">
				</td>
				<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
					<jsp:setProperty name="now" property="month" value="${now.month-12}"/>
					<input type="text" name="PROJECT_NAMEss" id="PROJECT_NAME33s" value="<fmt:formatDate value="${now}" pattern="yyyy年" />" style="width: 130px">
				</td>
				<td width="15%" class="ui-widget-content jqgrow ui-row-ltr">
					<jsp:setProperty name="now" property="month" value="${now.month-12}"/>
					<input type="text" name="PROJECT_NAMEss" id="PROJECT_NAME44s" value="<fmt:formatDate value="${now}" pattern="yyyy年" />" style="width: 130px">
				</td>
				<td width="20%" align="center" class="ui-widget-content jqgrow ui-row-ltr">
					备注<input type="hidden" name="PROJECT_NAMEss" id="PROJECT_NAME55" value="备注">
				</td>
			</tr>
			<tr>
				<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
					货币资金
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="MONEY_FUNDSs" id="MONEY_FUNDS11s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="MONEY_FUNDSs" id="MONEY_FUNDS12s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="MONEY_FUNDSs" id="MONEY_FUNDS13s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="MONEY_FUNDSs" id="MONEY_FUNDS14s" style="width: 130px;text-align: right;">
				</td>
				<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="MONEY_FUNDSs" id="MONEY_FUNDS15" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
					应收账款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_RECEIVABLEs" id="ACCOUNTS_RECEIVABLE1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_RECEIVABLEs" id="ACCOUNTS_RECEIVABLE2s"  style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_RECEIVABLEs" id="ACCOUNTS_RECEIVABLE3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_RECEIVABLEs" id="ACCOUNTS_RECEIVABLE4s" style="width: 130px;text-align: right;">
				</td>
				<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_RECEIVABLEs" id="ACCOUNTS_RECEIVABLE5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
					存货
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="STOCKs" id="STOCK1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="STOCKs" id="STOCK2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="STOCKs" id="STOCK3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="STOCKs" id="STOCK4s" style="width: 130px;text-align: right;">
				</td>
				<td  align="center" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="STOCKs" id="STOCK5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
					固定资产（净值）
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_ASSERTSs" id="CAPITAL_ASSERTS1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_ASSERTSs" id="CAPITAL_ASSERTS2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_ASSERTSs" id="CAPITAL_ASSERTS3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_ASSERTSs" id="CAPITAL_ASSERTS4s" style="width: 130px;text-align: right;">
				</td>
				<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_ASSERTSs" id="CAPITAL_ASSERTS5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
					总资产
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_ASSERTSs" id="TOTAL_ASSERTS1s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_ASSERTSs" id="TOTAL_ASSERTS2s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_ASSERTSs" id="TOTAL_ASSERTS3s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_ASSERTSs" id="TOTAL_ASSERTS4s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_ASSERTSs" id="TOTAL_ASSERTS5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
					短期借款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SHORTTIME_LOANs" id="SHORTTIME_LOAN1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SHORTTIME_LOANs" id="SHORTTIME_LOAN2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SHORTTIME_LOANs" id="SHORTTIME_LOAN3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SHORTTIME_LOANs" id="SHORTTIME_LOAN4s" style="width: 130px;text-align: right;">
				</td>
				<td align="center" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SHORTTIME_LOANs" id="SHORTTIME_LOAN5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td width="19%" class="ui-widget-content jqgrow ui-row-ltr">
					应付账款
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_PAYABLEs" id="ACCOUNTS_PAYABLE1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_PAYABLEs" id="ACCOUNTS_PAYABLE2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_PAYABLEs" id="ACCOUNTS_PAYABLE3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="ACCOUNTS_PAYABLEs" id="ACCOUNTS_PAYABLE4s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="ACCOUNTS_PAYABLEs" id="ACCOUNTS_PAYABLE5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					总负债
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_OWESs" id="TOTAL_OWES1s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_OWESs" id="TOTAL_OWES2s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_OWESs" id="TOTAL_OWES3s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_OWESs" id="TOTAL_OWES4s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="TOTAL_OWESs" id="TOTAL_OWES5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					实收资本
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CONTRIBUTED_CAPITALs" id="CONTRIBUTED_CAPITAL1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CONTRIBUTED_CAPITALs" id="CONTRIBUTED_CAPITAL2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CONTRIBUTED_CAPITALs" id="CONTRIBUTED_CAPITAL3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CONTRIBUTED_CAPITALs" id="CONTRIBUTED_CAPITAL4s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="CONTRIBUTED_CAPITALs" id="CONTRIBUTED_CAPITAL5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					资本公积
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_RESERVEs" id="CAPITAL_RESERVE1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_RESERVEs" id="CAPITAL_RESERVE2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_RESERVEs" id="CAPITAL_RESERVE3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="CAPITAL_RESERVEs" id="CAPITAL_RESERVE4s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="CAPITAL_RESERVEs" id="CAPITAL_RESERVE5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					未分配利润
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="UNDISTRIBUTED_PROFITs" id="UNDISTRIBUTED_PROFIT1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="UNDISTRIBUTED_PROFITs" id="UNDISTRIBUTED_PROFIT2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="UNDISTRIBUTED_PROFITs" id="UNDISTRIBUTED_PROFIT3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="UNDISTRIBUTED_PROFITs" id="UNDISTRIBUTED_PROFIT4s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="UNDISTRIBUTED_PROFITs" id="UNDISTRIBUTED_PROFIT5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					销售收入
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_REVENUEs" id="SALES_REVENUE1s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_REVENUEs" id="SALES_REVENUE2s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_REVENUEs" id="SALES_REVENUE3s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_REVENUEs" id="SALES_REVENUE4s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="SALES_REVENUEs" id="SALES_REVENUE5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					销售成本
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="COST_OF_MARKETINGs" id="COST_OF_MARKETING1s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="COST_OF_MARKETINGs" id="COST_OF_MARKETING2s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="COST_OF_MARKETINGs" id="COST_OF_MARKETING3s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="COST_OF_MARKETINGs" id="COST_OF_MARKETING4s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="COST_OF_MARKETINGs" id="COST_OF_MARKETING5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					期间费用
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PERIOD_EXPENSEs" id="PERIOD_EXPENSE1s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PERIOD_EXPENSEs" id="PERIOD_EXPENSE2s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PERIOD_EXPENSEs" id="PERIOD_EXPENSE3s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PERIOD_EXPENSEs" id="PERIOD_EXPENSE4s" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="PERIOD_EXPENSEs" id="PERIOD_EXPENSE5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="19%">
					利润总额
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_PROFITs" id="TOTAL_PROFIT1s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_PROFITs" id="TOTAL_PROFIT2s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_PROFITs" id="TOTAL_PROFIT3s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TOTAL_PROFITs" id="TOTAL_PROFIT4s" onchange="changEBTRs();" style="width: 130px;text-align: right;">
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="TOTAL_PROFITs" id="TOTAL_PROFIT5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					资产负债率
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="DEBTRs" id="DEBTR1s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="DEBTRs" id="DEBTR2s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="DEBTRs" id="DEBTR3s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="DEBTRs" id="DEBTR4s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="DEBTRs" id="DEBTR5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					销售净利率
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PROFIT_MARGINs" id="PROFIT_MARGIN1s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PROFIT_MARGINs" id="PROFIT_MARGIN2s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PROFIT_MARGINs" id="PROFIT_MARGIN3s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="PROFIT_MARGINs" id="PROFIT_MARGIN4s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="PROFIT_MARGINs" id="PROFIT_MARGIN5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					毛利率
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TTMs" id="TTM1s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TTMs" id="TTM2s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TTMs" id="TTM3s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="TTMs" id="TTM4s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="TTMs" id="TTM5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					销售增长率
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_GROWTHs" id="SALES_GROWTH1s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_GROWTHs" id="SALES_GROWTH2s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_GROWTHs" id="SALES_GROWTH3s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="SALES_GROWTHs" id="SALES_GROWTH4s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="SALES_GROWTHs" id="SALES_GROWTH5s" style="width: 150px">
				</td>
			</tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					净资产增长率
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="NAGRs" id="NAGR1s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="NAGRs" id="NAGR2s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="NAGRs" id="NAGR3s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
					<input type="text" name="NAGRs" id="NAGR4s" style="width: 110px;text-align: right;">%
				</td>
				<td class="ui-widget-content jqgrow ui-row-ltr" align="center">
					<input type="text" name="NAGRs" id="NAGR5s" style="width: 150px"> 
				</td>
			</tr>
		</table>-->

		<table cellspacing="0" cellpadding="0" border="0"
			class="ui-jqgrid-htable zc_grid_title">
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head" width="70%">
					<strong>其他调查说明</strong>
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" align="right">
					相关操作：
					<img src="../images/u100.gif">
					&nbsp;
					<a href="javaScript:void(0);" onclick="addOtherProjectss('sssss');">添加</a>
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" align="right">
					<img src="../images/u103.gif">
					&nbsp;
					<a href="javaScript:void(0);" onclick="deleteOtherProjectss();">删除</a>
				</td>
			</tr>
		</table>
		<div id="sssss" class="ui-state-default ui-jqgrid-hdiv "></div>
		<table cellspacing="0" cellpadding="0" border="0"
			class="ui-jqgrid-htable zc_grid_title">
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head" width="70%">
					<b>名下资产</b>
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" align="right">
					相关操作：
					<img src="../images/u100.gif">
					&nbsp;
					<a href="javaScript:void(0);" onclick="addOtherProrerty('fffff');">添加</a>
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head" align="right">
					<img src="../images/u103.gif">
					&nbsp;
					<a href="javaScript:void(0);" onclick="deleteOtherProrerty();">删除</a>
				</td>
			</tr>
		</table>
		<div id="fffff" class="ui-state-default ui-jqgrid-hdiv "></div>
		<table width="100%" cellspacing="0" cellpadding="0" border="0"
			class="ui-jqgrid-htable zc_grid_title">
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					<b>说明</b>
				</td>
				<td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				</td>
			</tr>
			<tr>
				<td width="19%" height="50"
					class="ui-widget-content jqgrow ui-row-ltr">
					意见：
				</td>
				<td colspan="5" class="ui-widget-content jqgrow ui-row-ltr">
					<input type="hidden" name="PROJECT_NAME3" style="width: 200px;">
					<textarea name="PROJECT_CONTENT3"
						style="width: 500px; height: 50px; font-size: 12px" class="txtk"></textarea>
				</td>
			</tr>
		</table>

	</body>
</html>