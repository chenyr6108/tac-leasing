<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ctx }/customer/js/custLinkCompetitor.js" type="text/javascript"></script>
</head>
<body>	
<form id="" name="" method="POST"
	action="#">
	<table border="1" align="center" class="ui-jqgrid-htable zc_grid_title">
				<thead>
				<tr class="ui-jqgrid-labels"> 
				<th colspan="8" align="right" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right">
					操作：<a href="javascript:void(0)" onclick="showDivAddCustLinkCompetitor();">添加</a>
				</th>
			</tr>
			<tr>
				<td style="width:4%" class="ui-state-default ui-th-ltr zc_grid_head">
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
				<td style="width:4%" class="ui-state-default ui-th-ltr zc_grid_head">
					操作
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
					<td >删除&nbsp;</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</form>
<div id="AddCustLinkCompetitor" style="display: none" title="添加联系人">
	
</div>
</body>
</html>
