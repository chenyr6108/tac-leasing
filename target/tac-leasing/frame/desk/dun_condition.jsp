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
					<td style="text-align: right;">${dunInfo.DUN_COUNT_8 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_8 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_8 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_8 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">15~30</td>
					<td style="text-align: right;">${dunInfo.DUN_COUNT_15 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_15 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_15 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_15 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">31~60</td>
					<td style="text-align: right;">${dunInfo.DUN_COUNT_31}&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_31}"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_31}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_31}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">61~90</td>
					<td style="text-align: right;">${dunInfo.DUN_COUNT_61}&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_61}"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_61 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_61 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">8天以上</td>
					<td style="text-align: right;">${dunInfo.SUB_DUN_COUNT }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.SUB_DUN_PRICE}"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_SUB}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_SUB}" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">31天以上</td>
					<td style="text-align: right;">${dunInfo.DUN_COUNT_31_TOTAL }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_31_TOTAL }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_31_TOTAL }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_31_TOTAL }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">91天以上</td>
					<td style="text-align: right;">${dunInfo.DUN_COUNT_91_TOTAL }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_91_TOTAL }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_91_TOTAL }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_91_TOTAL }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">181天以上</td>
					<td style="text-align: right;">${dunInfo.DUN_COUNT_180 }&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_180 }"/>&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_180 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
					<td style="text-align: right;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_180 }" maxFractionDigits="2" pattern="0.00"/>%&nbsp;</td>
				</tr>
			</table>
		</div>
		</div>
		<font color="red">*</font>${date }&nbsp;20:00之数据
		</div>
	</div>
</div>