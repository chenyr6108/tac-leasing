<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="cust_collet" class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
	<div class="portlet-header ui-widget-header ui-corner-all">
		<span class="ui-icon ui-icon-closethick" onclick="deleteDIV(this,'cust_collet');" title="点击删除导航"></span>應收統計
	</div>
	<div class="portlet-content">
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
       			<div class="zc_grid_body jqgrowleft">
       			<div class="ui-state-default ui-jqgrid-hdiv ">
			<%-- <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td rowspan="2" style="text-align: center;">客户数量</td>
					<td colspan="2" style="text-align: center;">合同</td>
					<td colspan="2" style="text-align: center;">支付表明细</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
					<td style="text-align: center;">数量</td>
					<td style="text-align: center;">金额</td>
					<td style="text-align: center;">数量</td>
					<td style="text-align: center;">金额</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${customerCount }</td>
					<td style="text-align: center;">${contractMap.CONTRACT_COUNT }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${contractMap.CONTRACT_SUM }"></fmt:formatNumber></td>
					<td style="text-align: center;">${collectionPlanMap.COLLECTIONPLAN_COUNT }</td>
					<td style="text-align: right;"><fmt:formatNumber type="currency" value="${collectionPlanMap.COLLECTIONPLAN_SUM }"></fmt:formatNumber></td>
				</tr>
			</table> --%>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">客戶數量</td>
					<td style="text-align: center;">${result.CUST_COUNT }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">合同數量</td>
					<td style="text-align: center;">${result.PRJT_COUNT }&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">總本金</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${result.LOSS_OWN_PRICE }"/>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">總利息</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${result.LOSS_REN_PRICE }"/>&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">總應收租金</td>
					<td style="text-align: center;"><fmt:formatNumber type="currency" value="${result.LOSS_PRICE }"/>&nbsp;</td>
				</tr>
			</table>
		</div>
		</div>
		</div>
	</div>
</div>
