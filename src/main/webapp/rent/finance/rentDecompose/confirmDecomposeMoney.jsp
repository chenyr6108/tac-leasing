<%@ page language="java" pageEncoding="utf-8"%>
<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr class="ui-jqgrid-labels">
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				序号
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				查看水单
			</th>
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
				<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:right;">
						<c:if test="${item.FILE_COUNT >0 }"><a href="javascript:void(0)" onclick="expandUploadFile2('${item.INCOME_ID }');"><img src="${ctx }/images/attach.jpg" title="已有水单上传" style="cursor: pointer;"></c:if>${item.FILE_COUNT }份<c:if test="${item.FILE_COUNT >0 }"></a></c:if>&nbsp;
				</td>
				<td style="text-align: center">
					<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==0 or empty item.IS_SETTLEMENT_DECOMPOSE}">
						<c:if test="${item.RECP_ID eq -1 }">暂收款认退</c:if><c:if test="${item.RECP_ID ne -1 }">租金分解</c:if>
					</c:if>
					<c:if test="${item.IS_SETTLEMENT_DECOMPOSE==1 }">结清分解</c:if>
				</td>
				<td style="text-align: center">
					<c:if test="${item.DECOMPOSE_TYPE==0 }"><c:if test="${item.NAME eq '系统'}">自动</c:if><c:if test="${item.NAME ne '系统'}">手动</c:if>分解</c:if>
					<c:if test="${item.DECOMPOSE_TYPE==1 }"><p style="color: red">红冲</p></c:if>
				</td>
				<td style="text-align: center">
					<a href="#" onclick="showDecomposeDetailList('${item.INCOME_ID }','${item.PERIOD_NUM }','${item.RECP_ID }','2','${menu }')">查看</a>
				</td>
				<td style="text-align: center">
					${item.INCOME_DATE }&nbsp;
				</td>
				<td style="text-align: right">
					<a href="#" onclick="showCashFlow('${item.INCOME_ID }','${item.BILL_ID }')">￥<c:if test="${item.DECOMPOSE_TYPE==1 }">-</c:if><fmt:formatNumber pattern="#,##0.00" value="${item.INCOME_MONEY }"/>&nbsp;</a>
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
			<tr>
				<td colspan="14" style="background: white">
					<div id="fileAffix_${item.INCOME_ID}" align="center" style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:40%">
						<img src="${ctx }/images/029.gif">
					</div>
				</td>											
			</tr>
		</c:forEach>
</table>
<div style="display: none;" id="cashFlowDiv" title="金流信息">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="cashIncomeTable">
				</table>
				<br><br>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="cashFlowTable">
				</table>
			</div>
		</div>
	</div>
</div>