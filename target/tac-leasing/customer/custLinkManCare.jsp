<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<form id='' name="custLinkManCareForm" method="POST"
	action="#">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title" id="LinkCaretable1">
<thead>
	<tr class="ui-jqgrid-labels"> 
				<th colspan="8" align="right" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align:right">
					操作：<a href="javascript:void(0)" onclick="showDivAddCustLinkManCare();">添加</a>
				</th>
			</tr>
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
					<td >${status.count }<input type="hidden" name="forcountNum" ></td>
					<td >${item.LINK_THEME }&nbsp;</td>
					<td >${item.LINK_DATE }&nbsp;</td>
					<td   >${item.LINK_PRINCIPAL }&nbsp;</td>
					<td >${item.LINK_DETAILS }&nbsp;</td>
					<td   > <c:if test="${item.STATUS eq 0}"><a href="javascript:void(0)" onclick="deleteLinkcare('${item.CULC_ID }')">删除</a></c:if> &nbsp;</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	</div>
	</div>
	</div>
</form>
<div id="AddCustLinkManCare" style="display: none" title="添加客户关怀">
	<form action="#" method="post" id="DivAddCustLinkManCareForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>负责人</td>
						<td><input type="text" name="CARELINK_PRINCIPAL" id="CARELINK_PRINCIPAL"></td>
						<td>日期</td>
						<td><input type="text" name="CARELINK_DATE" id="CARELINK_DATE"></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>主题</td>
						<td colspan="4"><input type="text" id="CARELINK_THEME" name="CARELINK_THEME" size="65" /></td>
						
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户</td>
						<td><input type="text" name="CARELINK_CUSTOMER" id="CARELINK_CUSTOMER"  value="${cust.CUST_NAME }" readonly="readonly"></td>
						<td>联系人</td>
						<td><select  id="CARELINK_MAN" >
						 </select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>内容</td>
						<td colspan="3"><textarea name="CARELINK_DETAILS" id="CARELINK_DETAILS" cols="80" rows="3"></textarea></td>
						
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>备注</td>
						<td colspan="3"><textarea name="CARELINK_MEMO" id="CARELINK_MEMO" cols="80" rows="3"></textarea></td>
						
				</tr>
							</table>
							<center>
							<input type="button" value="保存" class="ui-state-default ui-corner-all"  onclick="submitAddCustLinkcare()">
							<input type="button" value="取消" class="ui-state-default ui-corner-all"  onclick="closeAddCustLinkcare()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="Linkcare_reset" >
							</center>
							</div>
							</div>
							</div>
	</form>
</div>
