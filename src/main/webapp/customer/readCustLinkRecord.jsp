<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<form id="" name="" method="POST"
	action="#">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
	<table border="0" align="center" class="ui-jqgrid-htable zc_grid_title">
		<thead>
			<tr>
				<td style="width:4%;text-align: center" class="ui-state-default ui-th-ltr zc_grid_head">
					序号
				</td>
				<td  style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					日期
				</td>
				<td  style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					开始时间
				</td >
				<td style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					结束时间
				</td>
				<td style="width:7%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					负责人
				</td>
				<td style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					目的
				</td>
				<td style="width:8%; text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					重点记录
				</td>
				<td style="  text-align:center" class="ui-state-default ui-th-ltr zc_grid_head">
					内容
				</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${custLinkRecord}" var="item" varStatus="status">
				<tr id="LinkRecord_${item.CULR_ID }" class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center">${status.count }<input type="hidden" name="count" value="${status.count }"></td>
					<td style="text-align: center">${item.LINK_DATE }&nbsp;</td>
					<td style="text-align: center">${item.FROM_TIME }&nbsp;</td>
					<td style="text-align: center">${item.TO_TIME }&nbsp;</td>
					<td style="text-align: center">${item.LINK_PRINCIPAL }&nbsp;</td>
					<td style="text-align: center">${item.INTENTDESCR }&nbsp;</td>
					<td style="text-align: center">${item.IMPORTANTDESCR }&nbsp;</td>
					<td style="text-align: center">${item.LINK_DETAILS }&nbsp;</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
</form>
<div id="AddCustLinkRecord" style="display: none" title="添加联系记录">
	<form action="#" method="post" id="divAddCustLinkRecordForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title"  >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>负责人</td>
						<td id="Record_LINK_PRINCIPAL">&nbsp;</td>
						<td>日期</td>
						<td id="Record_LINK_DATE" >&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>主题</td>
						<td colspan="4"  id="Record_LINK_THEME">&nbsp;</td>
						
				</tr >
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>客户</td>
						<td  id="Record_LINK_CUSTOMER"> ${cust.CUST_NAME }	</td>
						<td>联系人</td>
						<td id="Record_LINK_MAN">&nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>类型</td>
						<td id="Record_LINK_TYPE" >&nbsp;</td>
						<td> &nbsp;  </td>
						<td >   &nbsp;  </td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>内容</td>
						<td colspan="3" id="Record_LINK_DETAILS"  >&nbsp;</td>
			    </tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>备注</td>
						<td colspan="3"  id="Record_LINK_MEMO" >&nbsp;</td>
				</tr>
							</table>
							<center>
							<input type="button" value="关闭" class="ui-state-default ui-corner-all"  onclick="closeAddCustLinkRecord()">
							<input type="reset" value="重置" class="ui-state-default ui-corner-all" id="LinkRecord_reset" style="display:none" >
							</center>
							</div>
							</div>
							</div>
	</form>
</div>
