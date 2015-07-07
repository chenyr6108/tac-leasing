<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">

<!--
jQuery(function($){


})
function hideOrShow(id) {
	$("#"+id).toggle();
}

</script>
<div>
	<input type="hidden" name="credit_id" id="PRCD_ID" value="${credit_id}" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%"  class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="background-color: #e8e8e8;" width="608"><strong>资料名称</strong></td>
									<td style="background-color: #e8e8e8;" width="120"><strong>日期</strong></td>
									<td style="background-color: #e8e8e8;" width="50"><strong>状态</strong></td>
								</tr>
							</table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>01</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="558"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty creditcorpreport}">onClick="hideOrShow('corpReport${credit_id}');"</c:if> >&nbsp;财务报表</td>
									<td width="120">&nbsp;</td>
									<td width="50">&nbsp;</td>
									
								</tr>
								<tr id="corpReport${credit_id}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="558">&nbsp;<a href="../servlet/defaultDispatcher?__action=creditPriorRecords.expCreditReport&credit_id=${credit_id}">导出财务报表</a>&nbsp;</td>
													<td width="120" >&nbsp;</td>
													<td width="50" >&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
								
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>02</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="558"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('begincustReport${credit_id}');">&nbsp;起租文件核检表</td>
									<td width="120">&nbsp;</td>
									<td width="50">&nbsp;</td>
									
								</tr>
								<tr id="begincustReport${credit_id}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="558">&nbsp;<a href="../servlet/defaultDispatcher?__action=exportCreditPdfs.prePdf&credit_idxx=${credit_id}">导出起租文件核检表</a>&nbsp;</td>
													<td width="120" >&nbsp;</td>
													<td width="50" >&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>03</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="558"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" onClick="hideOrShow('leaseholdReport${credit_id}');">验收证明暨起租通知书</td>
									<td width="120">&nbsp;</td>
									<td width="50">&nbsp;</td>
									
								</tr>
								<tr id="leaseholdReport${credit_id}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="558">&nbsp;<a href="../servlet/defaultDispatcher?__action=exporLleaseHoldPdf.prePdf&credit_idxx=${credit_id}">导出验收证明暨起租通知书</a>&nbsp;</td>
													<td width="120" >&nbsp;</td>
													<td width="50" >&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>04</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="558"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty payMoneyMap}">onClick="hideOrShow('payMoney${payMoneyMap.PUCT_ID}');"</c:if> >&nbsp;付款指示</td>
									<td width="120">&nbsp;</td>
									<td width="50">&nbsp;</td>
									
								</tr>
								<tr id="payMoney${payMoneyMap.PUCT_ID}" class="ui-widget-content jqgrow ui-row-ltr" style="display: none;">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="558">&nbsp;<a href="../servlet/defaultDispatcher?__action=exportPayMoneyPdf.exportPayMoney&PUCT_ID=${payMoneyMap.PUCT_ID}">导出付款指示</a>&nbsp;</td>
													<td width="120" >&nbsp;</td>
													<td width="50" >&nbsp;</td>
												</tr>
										</table></td>
								</tr></table></td>
					</tr>
									
			</table>
		</div>
	</div>
</div>

