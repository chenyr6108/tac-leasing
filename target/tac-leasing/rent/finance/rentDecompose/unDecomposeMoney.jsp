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
				系统自动匹配之客户名称
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
				上传来款人员
			</th>
			<th class="ui-state-default ui-th-ltr zc_grid_head">
				身份证
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
						<c:if test="${item.FILE_COUNT >0 }"><a href="javascript:void(0)" onclick="expandUploadFile('${item.INCOME_ID }');"><img src="${ctx }/images/attach.jpg" title="已有水单上传" style="cursor: pointer;"></c:if>${item.FILE_COUNT }份<c:if test="${item.FILE_COUNT >0 }"></a></c:if>&nbsp;
					</td>
					<td style="text-align: center">
						<input type="radio" value="${item.INCOME_ID }" name="key" style="cursor: pointer;">
					</td>
					<td style="text-align: center">
						${item.INCOME_DATE }&nbsp;
						<input type="hidden" id="income_date_${item.INCOME_ID }" value='${item.INCOME_DATE }'>
					</td>
					<td style="text-align: right">
						￥<fmt:formatNumber pattern="#,##0.00" value="${item.INCOME_MONEY }"/>&nbsp;
					</td>
					<td style="text-align: center">
						${item.INCOME_NAME }&nbsp;
						<input type="hidden" id="income_name_${item.INCOME_ID }" value="${item.INCOME_NAME }">
					</td>
					<td style="text-align: center">
						${item.INCOME_NAME_TRUE }&nbsp;
						<input type="hidden" id="income_name_true_${item.INCOME_ID }" value="${item.INCOME_NAME_TRUE }">
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
						${item.UPLOAD_NAME }&nbsp;
					</td>
					<td style="text-align: right">
						${item.ID }&nbsp;
					</td>
					<td>
						${item.REMARK }&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="14" style="background: white">
						<div id="fileAffix${item.INCOME_ID}" align="center" style="margin-left:15px;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:40%">
							<img src="${ctx }/images/029.gif">
						</div>
					</td>											
				</tr>
		</c:forEach>
</table>