<%@ page language="java" pageEncoding="utf-8"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				序号
			</th>
			<c:if test="${menu eq 'confirmDecompose' }">
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					<input type="checkbox" style="cursor: pointer;" onclick="selectAll()" id="selAll">
				</th>
			</c:if>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				来源
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				类型
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				操作
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				<page:pagingSort pagingInfo="${dw }" orderBy="INCOME_DATE">来款日期</page:pagingSort>
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				<page:pagingSort pagingInfo="${dw }" orderBy="INCOME_MONEY">来款金额</page:pagingSort>
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				来款户名
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				分解此来款之客户
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				来款帐号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				虚拟帐号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				收款帐号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				分解人员
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				备注
			</th>
		</tr>
		<c:forEach items="${dw.resultList }" var="item" varStatus="status">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center">
					${status.count }
				</td>
				<c:if test="${menu eq 'confirmDecompose' }">
					<td style="text-align: center;">
						<input type="checkbox" name="checkBox" style="cursor: pointer;" value="${item.INCOME_ID }-${item.PERIOD_NUM }-${item.RECP_ID }-1-${item.IS_SETTLEMENT_DECOMPOSE }">
					</td>
				</c:if>
				<td style="text-align: center">
					<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==0 or empty item.IS_SETTLEMENT_DECOMPOSE}">租金分解</c:if>
					<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==1 }">结清分解</c:if>
				</td>
				<td style="text-align: center">
					<c:if test="${item.DECOMPOSE_TYPE==0 }"><c:if test="${item.NAME eq '系统'}">自动</c:if><c:if test="${item.NAME ne '系统'}">手动</c:if>分解</c:if>
					<c:if test="${item.DECOMPOSE_TYPE==1 }"><p style="color: red">红冲</p></c:if>
				</td>
				<td style="text-align: center">
					<a href="#" onclick="showDecomposeDetailList('${item.INCOME_ID }','${item.PERIOD_NUM }','${item.RECP_ID }','1','${menu }')">查看</a>
				</td>
				<td style="text-align: center">
					${item.INCOME_DATE }&nbsp;
				</td>
				<td style="text-align: right">
					￥<c:if test="${item.DECOMPOSE_TYPE==1 }">-</c:if><fmt:formatNumber pattern="#,##0.00" value="${item.INCOME_MONEY }"/>&nbsp;
				</td>
				<td style="text-align: center">
					${item.INCOME_NAME }&nbsp;
				</td>
				<td style="text-align: center">
					${item.CUST_NAME }&nbsp;
				</td>
				<td style="text-align: center">
					${item.INCOME_ACCOUNT }&nbsp;
				</td>
				<td style="text-align: center">
					${item.VIRTUAL_ACCOUNT }&nbsp;
				</td>
				<td style="text-align: center">
					${item.RECEIPT_ACCOUNT }&nbsp;
				</td>
				<td style="text-align: center">
					${item.NAME }&nbsp;
				</td>
				<td>
					${item.REMARK }&nbsp;
				</td>
			</tr>
		</c:forEach>
</table>
<script>
	function selectAll() {
		if($("#selAll").attr("checked")) {
			$("input[name=checkBox]").each(function() {
				$(this).attr("checked","checked");
		   	});
		} else {
			$("input[name=checkBox]").each(function() {
				$(this).attr("checked",false);
		   	});
		}
	}
</script>