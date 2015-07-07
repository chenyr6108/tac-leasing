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
//-->


//ajax修改LockCode信息
function modifyCreditLockCode(e,PRCD_ID,EQMT_ID,LOCK_CODE){
	var RECT_ID="";
	var lock_code=e.parentElement.parentElement.cells[1].firstChild.value;
	var lock_code_id="#LOCK_CODE"+EQMT_ID;
	var lock_code_text=$.trim($(lock_code_id).find("option:selected").text());
     $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=rentContract.modifyLockCodeByEqmtID&PRCD_ID='+PRCD_ID+'&RECT_ID=' +
        RECT_ID +
        '&LOCK_CODE_TEXT='+
        lock_code_text+
        '&EQMT_ID=' +
        EQMT_ID +
        '&ORI_CODE=' +
        LOCK_CODE +
        '&LOCK_CODE=' +
        lock_code,
        dataType: 'json',
        success: function(dataBack){
        	alert("修改成功!");
        }
    }); 
}

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
									<td style="background-color: #e8e8e8;" width="50"><strong>操作</strong></td>
								</tr>
							</table></td>
					</tr>
					
					
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="width: 50px;"><strong>01</strong></td>
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr id="equipment_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<c:forEach items="${rentEquipmentList}" var="item" varStatus="status">
												<tr class="ui-widget-content jqgrow ui-row-ltr">
													<td width="550">&nbsp;${item.THING_NAME}</td>
													<td width="59" align="center"><select name="LOCK_CODE" id="LOCK_CODE${item.EQMT_ID}">
													<c:forEach items="${lockList}" var="lockList" varStatus="status">
														<option value="${lockList.CODE }" <c:if test="${lockList.CODE eq item.LOCK_CODE }"> selected</c:if>>${lockList.FLAG }</option>
													</c:forEach>
													</select></td>
													<td width="121" align="center"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></td>
													<td width="50" align="center"><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="modifyCreditLockCode(this,${PRCD_ID},${item.EQMT_ID},${item.LOCK_CODE});"  value="修改"/></td>
												</tr>
											</c:forEach>
										</table></td>
								</tr></table></td>
					</tr>
</table>
			
		</div>
	</div>
</div>