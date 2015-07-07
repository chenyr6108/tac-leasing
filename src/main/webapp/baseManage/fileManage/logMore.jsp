<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
	<tr class="ui-jqgrid-labels">
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			序号
		</th>
		<th class="ui-state-default ui-th-ltr zc_grid_head">
			资料名称
		</th>						
	</tr>	
	<c:forEach items="${logMoreList}" var="logMoreList" varStatus="status">
		<tr class="ui-widget-content jqgrow ui-row-ltr">							
			<td style="text-align: center;">${status.count }</td>
			<td style="text-align: center;">${logMoreList.FILE_NAME}&nbsp;</td>
		</tr>							
	</c:forEach>	
</table>		
