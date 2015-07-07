<%@ page language="java" pageEncoding="utf-8"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				序号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				来款单位
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				来款时间
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				期初余额
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				本期新增
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				本期减少
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				期末余额
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				收款银行
			</th>
		</tr>
		<c:forEach items="${resultList }" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center">
						${status.count }
					</td>
					<td style="text-align: center">
						${item.INCOME_NAME }&nbsp;
					</td>
					<td style="text-align: center">
						${item.INCOME_DATE }
					</td>
					<td style="text-align: right">
						￥<fmt:formatNumber pattern="#,##0.00" value="${item.FINAL_BALANCE }"/>
					</td>
					<td style="text-align: right">
						￥<fmt:formatNumber pattern="#,##0.00" value="${item.CURRENT_INCREASE }"/>
					</td>
					<td style="text-align: right">
						￥<fmt:formatNumber pattern="#,##0.00" value="${item.CURRENT_REDUCE }"/>
					</td>
					<td style="text-align: right">
						￥<fmt:formatNumber pattern="#,##0.00" value="${item.FINAL_BALANCE+item.CURRENT_INCREASE-item.CURRENT_REDUCE }"/>
					</td>
					<td style="text-align: center">
						${item.BANK_NAME }
					</td>
				</tr>
		</c:forEach>
</table>