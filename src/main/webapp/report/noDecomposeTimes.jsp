<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 全部 -->
	<c:set value="${timesAnalysisMap}" var="times" ></c:set>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="20%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				1天以内（包括今天）
			</th>
			<th width="20%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>2~3天</strong>
			</th>
			<th width="20%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>4~15天</strong>
			</th>
			<th width="20%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>16~30天</strong>
			</th>
			<th width="20%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>31天以上（包括31天）</strong>
			</th>
		</tr>
		<tr class="ui-jqgrid-labels">
			<th width="8%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="12%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
			<th width="8%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="12%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
			<th width="8%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="12%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
			<th width="8%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="12%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
			<th width="8%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="12%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
		</tr>
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">${times.COUNT_0_1 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${times.MONEY_0_1}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${times.COUNT_2_3 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${times.MONEY_2_3}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${times.COUNT_4_15 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${times.MONEY_4_15}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${times.COUNT_16_30 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${times.MONEY_16_30}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${times.COUNT_M_31 }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${times.MONEY_M_31}" type="currency"></fmt:formatNumber>&nbsp;</td>
		</tr>
	</table>