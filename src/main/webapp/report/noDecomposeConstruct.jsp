<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 全部 -->
	<c:set value="${constructAnalysisMap}" var="construct" ></c:set>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th width="34%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				未分解来款<br>
				（含三无来款、待分解来款）
			</th>
			<th width="33%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>三无来款</strong>
			</th>
			<th width="33%" colspan="2" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>待分解来款</strong>
			</th>
		</tr>
		<tr class="ui-jqgrid-labels">
			<th width="13%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
			<th width="13%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
			<th width="13%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>笔数</strong>
			</th>
			<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
				<strong>金额</strong>
			</th>
		</tr>
		<tr	class="ui-widget-content jqgrow ui-row-ltr">
			<td style="text-align: center;">${construct.COUNT_ALL }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${construct.MONEY_ALL}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${construct.COUNT_NOTHING }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${construct.MONEY_NOTHING}" type="currency"></fmt:formatNumber>&nbsp;</td>
			<td style="text-align: center;">${construct.COUNT_LEFT }&nbsp;</td>
			<td style="text-align: right;"><fmt:formatNumber value="${construct.MONEY_LEFT}" type="currency"></fmt:formatNumber>&nbsp;</td>
		</tr>
	</table>