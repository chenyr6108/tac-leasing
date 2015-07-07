<%@ page language="java" pageEncoding="utf-8"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				序号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				区域
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				客户名称
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				客户编号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				合同号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				来款日期
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				分解时间
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				分解项目
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				分解金额
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				本金
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				利息
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				税费方案
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				收款银行
			</th>
		</tr>
		<c:forEach items="${resultList }" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr" <c:if test="${not empty item.REASON }">onclick="showReason('${item.REASON }')" style="cursor: pointer"</c:if>>
					<td style="text-align: center">
						${status.count }
					</td>
					<td style="text-align: center">
						${item.DECP_NAME_CN }&nbsp;
					</td>
					<td style="text-align: center">
						${item.CUST_NAME }&nbsp;
					</td>
					<td style="text-align: center">
						${item.CUST_CODE }&nbsp;
					</td>
					<td style="text-align: center">
						${item.LEASE_CODE }&nbsp;
					</td>
					<td style="text-align: center">
						${item.INCOME_DATE }
					</td>
					<td style="text-align: center">
						<fmt:formatDate value="${item.DECOMPOSE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td style="text-align: center">
						${item.BILL_DESCR }<br>
						<c:if test="${item.BILL_CODE eq 'REFUND' or item.BILL_CODE eq 'CLAIM'}">认退原因：${item.REASON }</c:if>
					</td>
					<td style="text-align: right">
						￥<fmt:formatNumber pattern="#,##0.00" value="${item.DECOMPOSE_PRICE }"/>
					</td>
					<td style="text-align: right">
						<c:if test="${not empty item.OWN_PRICE }">￥<fmt:formatNumber pattern="#,##0.00" value="${item.OWN_PRICE }"/></c:if>&nbsp;
					</td>
					<td style="text-align: right">
						<c:if test="${not empty item.REN_PRICE }">￥<fmt:formatNumber pattern="#,##0.00" value="${item.REN_PRICE }"/></c:if>&nbsp;
					</td>
					<td style="text-align: center">
						${item.TAX_PLAN }&nbsp;
					</td>
					<td style="text-align: center">
						${item.BANK_NAME }
					</td>
				</tr>
		</c:forEach>
</table>
<script>
	function showReason(v) {
		alert("认退原因："+v);
	}
</script>