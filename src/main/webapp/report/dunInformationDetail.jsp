<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-jqgrid-labels">
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						业务员
					</th>
					<th rowspan="2" class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						总件数/总金额
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						8 ~ 14天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						15 ~ 30天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						31 ~ 60天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						61 ~ 90天
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						31天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						91天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						181天以上
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						小计（8天以上）
					</th>
				</tr>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="background: #A7A7A7;color: #000000;">
						件数/金额<br/>件数比/金额比
					</th>
				</tr>
				<c:forEach items="${resultList}" var="item" varStatus="index">
					<tr>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.name }</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.totalCount }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.totalMoney }"/><br></td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.count8_14 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money8_14 }"/><br><fmt:formatNumber type="number" value="${item.count8_14 / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money8_14 / item.totalMoney *100}" maxFractionDigits="2"/>%</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.count15_30 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money15_30 }"/><br><fmt:formatNumber type="number" value="${item.count15_30 / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money15_30 / item.totalMoney *100}" maxFractionDigits="2"/>%</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.count31_60 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money31_60 }"/><br><fmt:formatNumber type="number" value="${item.count31_60 / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money31_60 / item.totalMoney *100}" maxFractionDigits="2"/>%</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.count61_90 }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money61_90 }"/><br><fmt:formatNumber type="number" value="${item.count61_90 / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money61_90 / item.totalMoney *100}" maxFractionDigits="2"/>%</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${item.count31_ }&nbsp;/&nbsp;
							<fmt:formatNumber type="currency" value="${item.money31_ }"/>
							<br>
							<fmt:formatNumber type="number" value="${item.count31_ / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;
							<fmt:formatNumber type="number" value="${item.money31_ / item.totalMoney *100}" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${item.count91_ }&nbsp;/&nbsp;
							<fmt:formatNumber type="currency" value="${item.money91_ }"/>
							<br>
							<fmt:formatNumber type="number" value="${item.count91_ / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;
							<fmt:formatNumber type="number" value="${item.money91_ / item.totalMoney *100}" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">
							${item.count181_ }&nbsp;/&nbsp;
							<fmt:formatNumber type="currency" value="${item.money181_ }"/>
							<br>
							<fmt:formatNumber type="number" value="${item.count181_ / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;
							<fmt:formatNumber type="number" value="${item.money181_ / item.totalMoney *100}" maxFractionDigits="2"/>%
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.count8_ }&nbsp;/&nbsp;<fmt:formatNumber type="currency" value="${item.money8_ }"/><br><fmt:formatNumber type="number" value="${item.count8_ / item.totalCount *100}" maxFractionDigits="2"/>%&nbsp;/&nbsp;<fmt:formatNumber type="number" value="${item.money8_ / item.totalMoney *100}" maxFractionDigits="2"/>%</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>