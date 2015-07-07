<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<form id="" name="" method="POST" action="#">
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
<thead>
			<tr>
			<tr>
				<td style="width:4%" class="ui-state-default ui-th-ltr zc_grid_head">
					&nbsp;
				</td>
				<td style="width:21%" class="ui-state-default ui-th-ltr zc_grid_head">
					主题
				</td >
				<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
					时间
				</td>
				<td  style="width:12%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head"> 
					责任人
				</td>
				<td class="ui-state-default ui-th-ltr zc_grid_head">
					内容
				</td>
				<td style="width:4%" class="ui-state-default ui-th-ltr zc_grid_head">
					操作
				</td>
				
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${custLinkcare}" var="item" varStatus="status">
				<tr id="CustLinkmancare_${item.CULC_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td ><span id="custLinkmanIndex">${status.count }</span></td>
					<td >${item.LINK_THEME }&nbsp;</td>
					<td >${item.LINK_DATE }&nbsp;</td>
					<td style="width:12%; text-align:center" >${item.LINK_PRINCIPAL }&nbsp;</td>
					<td >${item.LINK_DETAILS }&nbsp;</td>
					<td  style="width:4%; text-align:center"> <c:if test="${item.STATUS eq 0}"><a href="javascript:void(0)" onclick="readLinkManCare('${item.CULC_ID }')">查看详细</a></c:if> &nbsp;</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	</div>
	</div>
	</div>
</form>
<div id="AddCustLinkManCare" style="display: none" title="客户关怀">
	<form action="#" method="post" id="DivAddCustLinkManCareForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>负责人</td>
						<td id="LINK_PRINCIPAL_CARE" >&nbsp;</td>
						<td>日期</td>
						<td id="LINK_DATE_CARE">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>主题</td>
						<td colspan="3" id="LINK_THEME_CARE">&nbsp;</td>
						
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户</td>
						<td>${cust.CUST_NAME }&nbsp;</td>
						<td>联系人</td>
						<td  id="LINK_NAME_CARE">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>内容</td>
						<td colspan="3" id="CARELINK_DETAILS">&nbsp;</td>
						
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>备注</td>
						<td colspan="3"  id="CARELINK_MEMO" >&nbsp;</td>
						
				</tr>
							</table>
							<center>
							<input type="button" value="关闭" class="ui-state-default ui-corner-all"  onclick="closeAddCustLinkcare()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="Linkcare_reset" style="display:none" >
							</center>
							</div>
							</div>
							</div>
	</form>
</div>
