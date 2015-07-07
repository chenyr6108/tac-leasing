<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div>
	<div
		class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
		id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%"
				class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>类型:&nbsp;&nbsp;</strong></td>
					<td colspan="4" style="background-color: #e8e8e8; text-align: left;">${orderOne.FLAG}&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>承租人名称:&nbsp;&nbsp;</strong></td>
					<td colspan="4" style="background-color: #e8e8e8; text-align: left;">${orderOne.CUST_NAME}&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>合同号:&nbsp;&nbsp;</strong></td>
					<td colspan="4" style="background-color: #e8e8e8; text-align: left;">${orderOne.LEASE_CODE}&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>是否拨款:&nbsp;&nbsp;</strong></td>
					<td colspan="4" style="background-color: #e8e8e8; text-align: left;"><c:if test="${orderOne.IS_PAY eq 1}">已拨款</c:if><c:if test="${orderOne.IS_PAY eq 0}">未拨款</c:if></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>是否保留合同号:&nbsp;&nbsp;</strong></td>
					<td colspan="4" style="background-color: #e8e8e8; text-align: left;"><c:if test="${orderOne.IS_LEASE_CODE eq 1}">保留合同号</c:if><c:if test="${orderOne.IS_LEASE_CODE eq 0}">不保留合同号</c:if></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>需求内容:&nbsp;&nbsp;</strong></td>
					<td colspan="4" style="background-color: #e8e8e8; text-align: left;">${orderOne.INTRODUCTION}</td>
				</tr>
				
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>附件:&nbsp;&nbsp;</strong></td>
					<td colspan="4" style="background-color: #e8e8e8; text-align: left;"><c:if test="${empty fileList}">无</c:if>&nbsp;&nbsp;</td>
				</tr>
					
				<c:if test="${fileList != null }">
					<c:forEach items="${fileList}" var="img" varStatus="index">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;">${index.count}</td>
								<td colspan="4" style="background-color: #e8e8e8; text-align: left;">${img.TITLE} <a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${img.IMAGE_NAME }&path=${img.PATH }&bootPath=modifyOrderImage'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看" name="showRentFile"></a></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;"><strong>详情:&nbsp;&nbsp;</strong></td>
							<td colspan="4" style="background-color: #e8e8e8; text-align: left;"></td>
					</tr>
				<c:if test="${logList != null }">
					<c:forEach items="${logList}" var="log" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td class="ui-state-default ui-th-ltr zc_grid_head" style="width: 10px; text-align: right;">${status.count}</td>
								<td style="width: 10px;background-color: #e8e8e8; text-align: left;"><c:if test="${log.ORDER_TYPE_LOG eq 0}"><c:if test="${log.ORDER_STATUS_LOG eq 0}">提交</c:if><c:if test="${log.ORDER_STATUS_LOG eq 1}">通过</c:if><c:if test="${log.ORDER_STATUS_LOG eq 2}">驳回</c:if></c:if><c:if test="${log.ORDER_TYPE_LOG eq 1}"><c:if test="${log.ORDER_STATUS_LOG eq 0}">处理</c:if><c:if test="${log.ORDER_STATUS_LOG eq 1}">处理审核</c:if><c:if test="${log.ORDER_STATUS_LOG eq 2}">处理驳回</c:if></c:if><c:if test="${log.ORDER_TYPE_LOG eq 2}"><c:if test="${log.ORDER_STATUS_LOG eq 0}">验收</c:if><c:if test="${log.ORDER_STATUS_LOG eq 1}">验收通过</c:if><c:if test="${log.ORDER_STATUS_LOG eq 2}">验收驳回</c:if></c:if><c:if test="${log.ORDER_TYPE_LOG eq 3}">转移</c:if><c:if test="${log.ORDER_TYPE_LOG eq 4}">修改</c:if><c:if test="${log.ORDER_TYPE_LOG eq 5}">撤案</c:if><c:if test="${log.ORDER_TYPE_LOG eq 6}">退回</c:if>&nbsp;&nbsp;</td>
								<td style="background-color: #e8e8e8; text-align: left;">${log.REMARK_LOG}&nbsp;&nbsp;</td>
								<td style="background-color: #e8e8e8; text-align: left;">签字:${log.ALTER_NAME}&nbsp;&nbsp;</td>
								<td style="width: 10px;background-color: #e8e8e8; text-align: left;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" type="both" value="${log.CREATE_TIME}" />&nbsp;</td>
							</tr>	
				   </c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</div>




