<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<script>
	function exportProjectTransferCheckPDF(credit_id){
		window.parent.callBirt("birtReport/creditManage/projectTransferCheck.rptdesign", "pdf", {"ID" : credit_id});
	}
	
</script>
<div >

		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:700px;">

				<tr class="ui-jqgrid-labels">
					<th style="text-align: center;width:50px" class="ui-state-default ui-th-ltr zc_grid_head"><font color="black">序号</font></th>
					<th style="text-align: center;" class="ui-state-default ui-th-ltr zc_grid_head"><font color="black">资料名称</font></th>
				</tr>

			
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center">
						1
					</td>
					<td style="text-align: left">
						&nbsp;&nbsp;<a href="${ctx}/servlet/defaultDispatcher?__action=creditReport.exportCustomerVerifiedBook&&credit_id=${credit_id}">客户确认函</a>
					</td>
				</tr>	
				<c:if test="${vip eq '1' }">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center">
						2
					</td>
					<td style="text-align: left">
						&nbsp;&nbsp;<a href="javascript:void(0) ;" onclick="exportProjectTransferCheckPDF('${credit_id}')">案件移交检核表</a>
					</td>
				</tr>	
				</c:if>						
		</table>

</div>
	
