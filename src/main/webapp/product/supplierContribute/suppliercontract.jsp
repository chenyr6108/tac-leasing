<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="10"><strong>序号</strong></td>
						<td style="background-color: #e8e8e8;" width="100"><strong>承租人名称</strong></td>
						<td style="background-color: #e8e8e8;" width="100"><strong>合同号</strong></td>
						<td style="background-color: #e8e8e8;" width="300"><strong>合同总额</strong></td></td>
					</tr>
				<c:forEach items="${conlist}" var="conlistitem" varStatus="conliststatus">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td>${conliststatus.count } &nbsp;</td>
									<td>${conlistitem.CUST_NAME } &nbsp;</td>
									<td>${conlistitem.LEASE_CODE } &nbsp;</td>
									<td><fmt:formatNumber value="${conlistitem.LEASE_TOPRIC }" type="currency" /> &nbsp;</td>
					</tr>
				 </c:forEach>
			</table>
		</div>
	</div>
</div>
