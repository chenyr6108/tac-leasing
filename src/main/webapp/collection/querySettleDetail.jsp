	<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function pdfFun(id,recpId){
					 location.href='${ctx }/servlet/defaultDispatcher?__action=settleManage.expPDF&RECP_ID='+ recpId +'&trse_id='+id;
	  }
</script>
	
			<div
				class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="main">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">

						<table cellspacing="0" cellpadding="0" border="0"
							class="ui-jqgrid-htable zc_grid_title" width="80%">
							<tr class="ui-jqgrid-labels">
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									序号
								</td>
								<td style="width:10%" class="ui-state-default ui-th-ltr zc_grid_head">
									本   金
								</td>
								<td style="width:13%" class="ui-state-default ui-th-ltr zc_grid_head">
									利   息
								</td>
								<td style="width:8%" class="ui-state-default ui-th-ltr zc_grid_head">
									违约金
								</td>
								<td style="width:18%" class="ui-state-default ui-th-ltr zc_grid_head">
									损害金
								</td>
								<td style="width:9%" class="ui-state-default ui-th-ltr zc_grid_head">
									期满购买金
								</td>
								<td style="width:11%" class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</td>
							</tr>
								<c:set value="0" var="recpId"></c:set>
								<c:forEach items="${dw}" var="list" varStatus="status">
									<c:set value="${list.RECP_ID }" var="recpId"></c:set>
									<tr  class="ui-widget-content ui-row-ltr">
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											${status.index+1}&nbsp;
										</td>
										<td style="text-align: right;"    class="ui-widget-content ui-row-ltr" >
											<fmt:formatNumber value="${list.OWN_PRICE }" type="currency" />&nbsp;
										</td>
										<td style="text-align: right;"    class="ui-widget-content ui-row-ltr" >
											<fmt:formatNumber value="${list.REN_PRICE }" type="currency" />&nbsp;
										</td>
										<td style="text-align: right;"    class="ui-widget-content ui-row-ltr" >
											<fmt:formatNumber value="${list.BREACH_PRICE }" type="currency" />&nbsp;
										</td>
										<td style="text-align: right;"    class="ui-widget-content ui-row-ltr" >
											<fmt:formatNumber value="${list.DAMAGE_PRICE }" type="currency" />&nbsp;
										</td>
										<td style="text-align: right;"    class="ui-widget-content ui-row-ltr" >
											<fmt:formatNumber value="${list.STAYBUY_PRICE }" type="currency" />&nbsp;
										</td>
										<td style="text-align: center;"   class="ui-widget-content ui-row-ltr" >
											<a href="javaScript:void(0);" onclick="pdfFun('${list.TRSE_ID}','${list.RECP_ID }');">导出结清数据明细表</a>
										</td>
									</tr>
								</c:forEach>
						</table>
					</div>

				</div>
			</div>
	
