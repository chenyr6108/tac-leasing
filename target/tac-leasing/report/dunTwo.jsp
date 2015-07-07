<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 全部 -->
	<c:set value="${twoMap}" var="dunTwo" ></c:set>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="25%" colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>小于30天 (x &lt;= 30)</strong>
			</th>
			<th width="25%" colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>31天~60天 (31 &lt;= x &lt;= 60)</strong>
			</th>
			<th width="25%" colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>61天~90天 (61 &lt;= x &lt;= 90)</strong>
			</th>
			<th width="25%" colspan="5" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>大于90天  (x &gt; 90)</strong>
			</th>
		</tr>
		<tr class="ui-jqgrid-labels">
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期率</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期率</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期率</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>数量</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期金额</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期率</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>逾期利息</strong>
			</th>
			<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>罚金</strong>
			</th>
		</tr>
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">${dunTwo.NUM_L_30 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.MONTHPRICE_L_30}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunTwo.PERCENT_L_30 }%&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.RENPRICE_L_30}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.FINE_L_30}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunTwo.NUM_31_60 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.MONTHPRICE_31_60}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunTwo.PERCENT_31_60 }%&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.RENPRICE_31_60}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.FINE_31_60}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunTwo.NUM_61_90 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.MONTHPRICE_61_90}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunTwo.PERCENT_61_90 }%&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.RENPRICE_61_90}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.FINE_61_90}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunTwo.NUM_M_91 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.MONTHPRICE_M_91}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${dunTwo.PERCENT_M_91 }%&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.RENPRICE_M_91}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${dunTwo.FINE_M_91}" type="currency"></fmt:formatNumber>&nbsp;</td>
		</tr>
	</table>