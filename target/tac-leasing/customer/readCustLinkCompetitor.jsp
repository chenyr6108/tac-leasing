<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<form id="" name="" method="POST"
	action="#">
	<table border="1" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					&nbsp;
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					名称
				</td >
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					竞争能力
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head"> 
					销售机会
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					备注
				</td>
				
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${custLinkmanList}" var="item" varStatus="status">
				<tr id="CustLinkman_${item.CULM_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td ><span id="custLinkmanIndex">${status.count }</span></td>
					<td >${item.LINK_NAME }&nbsp;</td>
					<td >${item.LINK_GENDER }&nbsp;</td>
					<td >${item.LINK_RELATION2CUST }&nbsp;</td>
					<td >${item.LINK_MOBILE }&nbsp;</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</form>


