<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id='${divName }' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'${divName }');" title="点击删除导航"></span>逾期情况(${descr })
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="font-family: 微软雅黑">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">逾期天数</td>
					<td style="text-align: center;">逾期件数</td>
					<td style="text-align: center;">逾期金额</td>
					<td style="text-align: center;">逾期件数比</td>
					<td style="text-align: center;">逾期金额比</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">8~14</td>
					<td style="text-align: right;">${dunInfo.count8_14 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.price8_14 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.count8_14*100.0/dunInfo.totalCount }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.price8_14*100.0/dunInfo.totalPrice }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">15~30</td>
					<td style="text-align: right;">${dunInfo.count15_30 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.price15_30 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.count15_30*100.0/dunInfo.totalCount }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.price15_30*100.0/dunInfo.totalPrice }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">31~60</td>
					<td style="text-align: right;">${dunInfo.count31_60}&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.price31_60}"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.count31_60*100.0/dunInfo.totalCount}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.price31_60*100.0/dunInfo.totalPrice}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">61~90</td>
					<td style="text-align: right;">${dunInfo.count61_90}&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.price61_90}"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.count61_90*100.0/dunInfo.totalCount }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.price61_90*100.0/dunInfo.totalPrice }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">8~30</td>
					<td style="text-align: right;">${dunInfo.count8_14+dunInfo.count15_30 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.price8_14+dunInfo.price15_30}"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${(dunInfo.count8_14+dunInfo.count15_30)*100.0/dunInfo.totalCount}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${(dunInfo.price8_14+dunInfo.price15_30)*100.0/dunInfo.totalPrice}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">31~180</td>
					<td style="text-align: right;">${dunInfo.count31_60+dunInfo.count61_90+dunInfo.count91_180 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.price31_60+dunInfo.price61_90+dunInfo.price91_180 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${(dunInfo.count31_60+dunInfo.count61_90+dunInfo.count91_180)*100.0/dunInfo.totalCount }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${(dunInfo.price31_60+dunInfo.price61_90+dunInfo.price91_180)*100.0/dunInfo.totalPrice }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">91~180</td>
					<td style="text-align: right;">${dunInfo.count91_180 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.price91_180 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.count91_180*100.0/dunInfo.totalCount }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.price91_180*100.0/dunInfo.totalPrice }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">181天以上</td>
					<td style="text-align: right;">${dunInfo.countMoreThan181 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.priceMoreThan181 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.countMoreThan181*100.0/dunInfo.totalCount }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.priceMoreThan181*100.0/dunInfo.totalPrice }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
			</table>
		</div>
		</div>
		<font color="red">*</font>${date }&nbsp;20:00之数据
		</div>
	</div>
</div>