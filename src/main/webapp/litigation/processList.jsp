<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ include file="/common/taglibs.jsp"%>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div class="zc_grid_body" style="background:#FFFFFF;">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>合同号</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>诉讼状态</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>诉讼日期</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>备注</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作人</strong>
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						<strong>操作时间</strong>
					</th>
				</tr>
				<c:forEach items="${processList}" var="process" varStatus="index">
					<tr class="ui-widget-content jqgrow ui-row-ltr">   
						<td style="background-color: #e8e8e8; text-align: center;">${process.LEASE_CODE}&nbsp;</td>
						<td style="background-color: #e8e8e8; text-align: center;" ><strong <c:if test="${process.STATUS == '1'}">style="color: red"</c:if> >${process.FLAG}&nbsp;</strong></td>
						<td style="background-color: #e8e8e8; text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${process.LITIGATION_DATE}"/>&nbsp;</td>
						<td style="background-color: #e8e8e8; text-align: center;">${process.REMARK}&nbsp;</td>
						<td style="background-color: #e8e8e8; text-align: center;">${process.NAME}&nbsp;</td>
						<td style="background-color: #e8e8e8; text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" type="both" value="${process.CREATE_DATE}"/>&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
