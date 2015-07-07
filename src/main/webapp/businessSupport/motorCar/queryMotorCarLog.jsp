<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	<div class="zc_grid_body">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="background: #A7A7A7;color: #000000;">序号</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="background: #A7A7A7;color: #000000;">原始首期支付日</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="background: #A7A7A7;color: #000000;">原始拨款日</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="background: #A7A7A7;color: #000000;">日志内容</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="background: #A7A7A7;color: #000000;">修改人</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head" style="background: #A7A7A7;color: #000000;">修改时间</th>
				</tr>
			<c:forEach items="${resultList }" var="item" varStatus="index">
				<tr>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${index.count }</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.ORIGINAL_FIRST_PAY_DATE } &nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.ORIGINAL_PAY_DATE } &nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:left;">${item.MEMO } &nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.NAME } &nbsp;</td>
					<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp;</td>
				</tr>
			 </c:forEach>
		</table>
	</div>
</div>