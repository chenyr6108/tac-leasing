<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 全部 -->
	<c:set value="${oneMap}" var="dunOne" ></c:set>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="33.3%" colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>小于5天  (x &lt; 5)</strong>
			</th>
			<th width="33.3%" colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>5天~15天  (5 &lt;= x &lt;= 15) </strong>
			</th>
			<th width="33.4%" colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>16天~30天   (16 &lt;= x &lt;= 30)</strong>
			</th>
		</tr>
		<tr class="ui-jqgrid-labels">
			<th width="6.6%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期率</strong>
			</th>
			<th width="6.6%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="6.6%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期率</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="6.6%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="6.6%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期率</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="6.7%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
		</tr>
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">${dunOne.NUM_L_5 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.MONTHPRICE_L_5}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunOne.PERCENT_L_5 }%&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.RENPRICE_L_5}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.FINE_L_5}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunOne.NUM_5_15 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.MONTHPRICE_5_15}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunOne.PERCENT_5_15 }%&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.RENPRICE_5_15}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.FINE_5_15}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunOne.NUM_16_30 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.MONTHPRICE_16_30}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunOne.PERCENT_16_30 }%&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.RENPRICE_16_30}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunOne.FINE_16_30}" type="currency"></fmt:formatNumber>&nbsp;</td>
		</tr>
	</table>