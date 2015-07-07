<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
<script type="text/javascript">
function passInvoiceSuspen() {
	$("#check_flag").val("Y");
	$("#__action").val("settleManage.dueInvoiceSuspen");
	if(window.confirm("你确定要通过该笔暂停申请吗？")){
		$("#invoiceForm").submit();
	}else{
		return false;
	}
}
//财务驳回
function backInvoiceSuspen() {
	$("#check_flag").val("N");
	$("#__action").val("settleManage.dueInvoiceSuspen");
	if(window.confirm("你确定要驳回该笔续开申请吗？")){
		$("#invoiceForm").submit();
	}else{
		return false;
	}
}
</script>
</head>
<body>
	<center>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
				<form action="../servlet/defaultDispatcher" id="invoiceForm" method="post" name="invoiceForm">
				<input type="hidden" id="__action" name="__action" value="settleManage.dueInvoiceSuspen" />
				<table cellspacing="1" cellpadding="3" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td style="text-align: center;"><strong>续开发票原因：</strong><font color="red">*</font></td>
						<td>
						<input type="hidden" id="RECP_ID" name="RECP_ID" value="${invoiceSuspen.RECP_ID}"/>
						<input type="hidden" id="ID" name="ID" value="${ID}"/>
						<input type="hidden" id="INVOICE_TYPE" name="INVOICE_TYPE" value="${invoiceSuspen.INVOICE_TYPE}"/>
						<textarea id="MEMO" name="MEMO" rows="8" cols="55" style="border: 1px solid #A6C9E2;">${invoiceSuspen.MEMO}</textarea>
						</td>
					</tr>
					<tr class="ui-state-default ui-jqgrid-hdiv">
						<td colspan="2" id="button_flag" style="text-align: center;">
								<c:choose>
									<c:when test="${invoiceSuspen.INVOICE_STATUS eq 0}">
										<input type="hidden" name="check_flag" id="check_flag" value="">
										<input type="button" name="passDecom" value="通过"
											onclick="passInvoiceSuspen()">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" name="backDecom" value="驳回"
											onclick="backInvoiceSuspen()">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:when>
								</c:choose>
								<input type="button" name="back" value="返回" onclick="javascript:history.back(-1);">
							
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
		</center>
	</body>
</html>	
