<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
<!--
jQuery(function($){

})
function hideOrShow(id) {
	$("#"+id).toggle();
}
//-->


//ajax修改LockCode信息
function modifyLockCode(e,LEASE_CODE,eqmt_addr_old){
	
	var eqmt_addr=e.parentElement.parentElement.cells[0].firstChild.value;
    $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=rentContract.updateRentEqmtAddr&LEASE_CODE=' +
        LEASE_CODE +
        '&EQUPMENT_ADDRESS=' +
        eqmt_addr +
        '&EQUPMENT_ADDRESS_OLD=' +
        eqmt_addr_old,
        dataType: 'json',
        success: function(dataBack){
        	alert("修改成功!");
        }
    }); 
}

</script>
<div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;" width="70"><strong>设备放置地</strong></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td colspan="4"><table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
								<tr id="equipment_${PRCD_ID}" class="ui-widget-content jqgrow ui-row-ltr">
									<td colspan="4">
										<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title">
											<tr class="ui-widget-content jqgrow ui-row-ltr">
												<td width="121" align="center"><input type="text" name="eqmt_addr" value="${rsMap.EQUPMENT_ADDRESS }" size="120" /></td>
												<td width="50" align="center"><input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="modifyLockCode(this,'${LEASE_CODE}','${rsMap.EQUPMENT_ADDRESS }');"  value="修改"/></td>
											</tr>
										</table>
										</td>
								</tr></table></td>
					</tr>
</table>
			
		</div>
	</div>
</div>