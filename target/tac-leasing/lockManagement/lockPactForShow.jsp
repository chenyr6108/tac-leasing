<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
<!--
jQuery(function($){

	// $("[id*='pucsContract_']").hide();
	// $("[id*='paylists_']").hide();
	// $("[id*='windList_']").hide();
	// $("[id*='deliveryNotices_']").hide();
	// $("[id*='payments_']").hide();
	// $("[id*='pactMore']").hide();

})
function hideOrShow(id) {
	$("#"+id).toggle();
}
//-->
</script>
<div>
	<input type="hidden" name="PRCD_ID" id="PRCD_ID" value="${PRCD_ID}" />
	<input type="hidden" name="RECT_ID" id="RECT_ID" value="${RECT_ID}" />
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong>序号</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
									<td style="background-color: #e8e8e8;" width="608"><strong>合同设备</strong></td>
									<td style="background-color: #e8e8e8;" width="120"><strong>日期</strong></td>
									<td style="background-color: #e8e8e8;" width="50"><strong>状态</strong></td>
								</tr>
							</table></td>
					</tr>
					
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>01</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<!-- <tr class="ui-widget-content jqgrow ui-row-ltr">
									<td width="550"><img src="${ctx }/images/jia.gif" width="16" height="16" style="cursor: pointer" <c:if test="${not empty rentEquipmentList}">onClick="hideOrShow('equipment_${PRCD_ID}');"</c:if> >&nbsp;合同设备</td>
									<td width="59" align="center">&nbsp;</td>
									<td width="121" align="center">&nbsp;</td>
									<td width="50" align="center">&nbsp;</td>
								</tr> -->
								<tr id="equipment_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${rentEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}</td>
													<td width="59" align="center"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id=${RECT_ID }&eqmt_id=${item.EQMT_ID }&recp_id=${item.RECP_ID }'" >明细</a></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center" ><img src="${ctx }/images/ytq.gif" width="16" height="16"></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
</table>
			
		</div>
	</div>
</div>

<!-- 

<tr style="background-color: #ffffff;"
	onMouseOver="this.style.backgroundColor='#f6fbff'"
	onMouseOut="this.style.backgroundColor='#ffffff'">
	<td width="70" align="center">
		11
	</td>
	<td height="22" align="left">
		<table width="780" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20" class="pa" width="608">
					呈批件
				</td>
				<td width="120" height="20" style="border-left: #B5D6E6 solid 1px;"
					align="center">
					&nbsp;&nbsp;
				</td>
				<td width="120" height="20" style="border-left: #B5D6E6 solid 1px;"
					align="center">
					&nbsp;&nbsp;
				</td>
				<td width="50" height="20" style="border-left: #B5D6E6 solid 1px;"
					align="center">
					&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</td>
</tr>
 -->
