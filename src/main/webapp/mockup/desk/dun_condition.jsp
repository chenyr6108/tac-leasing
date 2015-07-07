<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id='dun_condition' class='portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'>
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'dun_condition');" title="点击删除导航"></span>逾期情况
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<%-- <tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="2" style="text-align: center;">小于5天</td>
					<td colspan="2" style="text-align: center;">5天~15天</td>
					<td colspan="2" style="text-align: center;">15天~30天</td>
					<!-- Add By Michael 2011 12/9 增加30天以上逾期统计 -->
					<td colspan="2" style="text-align: center;">30天以上</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
					<td style="text-align: center;">数量</td>
					<td style="text-align: center;">金额</td>
					<td style="text-align: center;">数量</td>
					<td style="text-align: center;">金额</td>
					<td style="text-align: center;">数量</td>
					<td style="text-align: center;">金额</td>
					<!-- Add By Michael 2011 12/9 增加30天以上逾期统计 -->
					<td style="text-align: center;">数量</td>
					<td style="text-align: center;">金额</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${countFive }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${moneyFive }"></fmt:formatNumber></td>
					<td style="text-align: center;">${countFifteen }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${moneyFifteen }"></fmt:formatNumber></td>
					<td style="text-align: center;">${countThirty }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${moneyThirty }"></fmt:formatNumber></td>
					<!-- Add By Michael 2011 12/9 增加30天以上逾期统计 -->
					<td style="text-align: center;">${countThirtyAbove }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${moneyThirtyAbove }"></fmt:formatNumber></td>
				</tr> --%>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">逾期天数</td>
					<td style="text-align: center;">逾期件数</td>
					<td style="text-align: center;">逾期金额</td>
					<td style="text-align: center;">逾期件数比</td>
					<td style="text-align: center;">逾期金额比</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">8~14</td>
					<td style="text-align: center;">${dunInfo.DUN_COUNT_8 }&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_8 }"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_8 }" maxFractionDigits="2"/>%</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_8 }" maxFractionDigits="2"/>%</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">15~30</td>
					<td style="text-align: center;">${dunInfo.DUN_COUNT_15 }&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_15 }"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_15 }" maxFractionDigits="2"/>%</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_15 }" maxFractionDigits="2"/>%</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">31~60</td>
					<td style="text-align: center;">${dunInfo.DUN_COUNT_31}&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_31}"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_31}" maxFractionDigits="2"/>%</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_31}" maxFractionDigits="2"/>%</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">61~90</td>
					<td style="text-align: center;">${dunInfo.DUN_COUNT_61}&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_61}"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_61 }" maxFractionDigits="2"/>%</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_61 }" maxFractionDigits="2"/>%</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">90以上</td>
					<td style="text-align: center;">${dunInfo.DUN_COUNT_90 }&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${dunInfo.DUN_PRICE_90 }"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_90}" maxFractionDigits="2"/>%</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_90 }" maxFractionDigits="2"/>%</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">合计（8天以上）</td>
					<td style="text-align: center;">${dunInfo.SUB_DUN_COUNT }&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${dunInfo.SUB_DUN_PRICE}"/>&nbsp;</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_COUNT_PER_SUB}" maxFractionDigits="2"/>%</td>
					<td style="text-align: center;"><fmt:formatNumber type="number" value="${dunInfo.DUN_PRICE_PER_SUB}" maxFractionDigits="2"/>%</td>
				</tr>
			</table>
		</div>
		</div>
		</div>
	</div>
</div>