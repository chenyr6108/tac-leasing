<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
</script>
<div>

	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td  style="background-color: #e8e8e8;text-align: center" width="100"><strong>&nbsp;&nbsp;合同号</strong></td>
						<td  style="background-color: #e8e8e8;text-align: center" width="80"><strong>&nbsp;&nbsp;承租人</strong></td>
						<td align="center" style="background-color: #e8e8e8;text-align: center" width="70"><strong>&nbsp;&nbsp;报告编号</strong></td>
					</tr>
					<c:forEach items="${creditlist}" var="items" >
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: center" width="100">&nbsp;${items.LEASE_CODE }</td>
						<td style="background-color: #e8e8e8;text-align: center" width="80">&nbsp;${items.CUST_NAME }</td>
						<td style="background-color: #e8e8e8;text-align: center" width="70">&nbsp;${items.CREDIT_CODE }</td>										
					</tr>
					</c:forEach>
				</table>		
		</div>
	</div>
</div>

