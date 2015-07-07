<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table width="900" cellpadding="0" cellspacing="0" border="0"
	align="center">
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" border="0"
				class="ui-jqgrid-htable zc_grid_title" id="checkPayTab">
				<tr class="ui-jqgrid-labels">
					<td style="text-align: center;"
						class="ui-state-default ui-th-ltr zc_grid_head">客户名称</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">合同号</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">起始期数</td>		
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">结束期数</td>	
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">支票备注</td>
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">操作人</td>	
					<td style="text-align: center; height: 20px;"
						class="ui-state-default ui-th-ltr zc_grid_head">操作时间</td>																																		
				</tr>
				<c:forEach items="${checkPaySchema }" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${item.CUST_NAME }</td>
					<td style="text-align: center; height: 20px;">${item.LEASE_CODE }&nbsp;</td>
					<td style="text-align: center; height: 20px;">${item.CHECK_START }&nbsp;</td>		
					<td style="text-align: center; height: 20px;">${item.CHECK_END }&nbsp;</td>	
					<td style="text-align: center; height: 20px;">${item.MEMO }&nbsp;</td>
					<td style="text-align: center; height: 20px;">${item.NAME }&nbsp;</td>	
					<td style="text-align: center; height: 20px;">${item.CREATE_DATE }&nbsp;</td>		
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
</table>
