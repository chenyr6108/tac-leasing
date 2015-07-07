<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	function showLawFeeInfo(id){
		document.lawFeeAdd_m.ID.value=id;
		$.ajax({
			type:"POST",
			data: '__action=collectionManage.showLawFeeList&ID='+id,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(databack){
				document.lawFeeAdd_m.fee_name.value=databack.writeBackDetails.FEE_NAME;
				document.lawFeeAdd_m.fee_value.value=databack.writeBackDetails.FEE_VALUE;
				document.lawFeeAdd_m.memo.value=databack.writeBackDetails.MEMO;
				document.lawFeeAdd_m.recp_id.value=databack.writeBackDetails.RECP_ID;
			},
			error:function(databack){
				alert("网络错误，请稍后重试！");
				return ;
			}
		});
		$("#lawFeeAdd_m").dialog({
			modal:true,
			autoOpen: false,
			width: 450
		});
		$("#lawFeeAdd_m").dialog('open');
	}	
	
	function deleteLawyFee(id) { 
		if(confirm('确认作废？')){
			$.ajax({
				type:"POST",
				data: '__action=collectionManage.deleteLawFeeList&ID='+id,
				url:"../servlet/defaultDispatcher",
				dataType:"json",
				success:function(databack){
					alert(databack.writeBackDetails.strReturn);
					location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.queryPaylistForAddLawyFee';
				},
				error:function(databack){
					alert("网络错误，请稍后重试！");
					return ;
				}
			});
		}else{
			return false;
		}
	}
	
	function updateLawyFeeList(){
		var fee_name= document.lawFeeAdd_m.fee_name.value;
		var fee_value= document.lawFeeAdd_m.fee_value.value;
		var memo= document.lawFeeAdd_m.memo.value;
		var recp_id=document.lawFeeAdd_m.recp_id.value;
		var id=document.lawFeeAdd_m.ID.value;
		if (fee_name==""){
			alert("请选择费用类别");
			return false;
		}
		if (fee_value==""){
			alert("请填入法务费用金额");
			return false;
		}
		
		if(checkpositive(fee_value)==false){
			alert("法务费用必须要输入整数！");
			document.lawFeeAdd.fee_value.focus();
			return false;
		}
		$.ajax({
			type:"POST",
			data: '__action=collectionManage.createLawFeeList&ID='+id+'&MEMO='+memo+'&FEE_VALUE='+fee_value+'&FEE_NAME='+fee_name+'&RECP_ID='+recp_id,
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(databack){
				alert(databack.writeBackDetails.strReturn);
				location.href='${ctx }/servlet/defaultDispatcher?__action=collectionManage.queryPaylistForAddLawyFee';
			},
			error:function(databack){
				alert("网络错误，请稍后重试！");
				return ;
			}
		});
		$("#lawFeeAdd_m").dialog('close');
	}
</script>
<div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" align="center">
		<div class="zc_grid_body ">
		<c:set value="0" var="TOTAL_FEE"></c:set>
		<c:set value="0" var="TOTAL_PAY_FEE"></c:set>
					<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;产生费用明细</strong></th>
					<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;已付金额明细</strong></th>
					</tr>
					<tr class="ui-jqgrid-labels">
					<td>
						<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;费用名称</strong></th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;费用金额</strong></th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;备注</strong></th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;录入人员</strong></th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;录入时间</strong></th>
						</tr>
						<c:forEach items="${lawFeeList}" var="item" varStatus="status">
						<c:set value="${TOTAL_FEE + item.FEE_VALUE  }" var="TOTAL_FEE"></c:set>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td  style="background-color: #e8e8e8;text-align: center;"><strong>&nbsp;&nbsp;${item.FLAG}</strong></td>
								<td style="background-color: #e8e8e8;text-align: right;"><strong>&nbsp;&nbsp;￥<fmt:formatNumber pattern='#,##0.00' value="${item.FEE_VALUE}"/></strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>&nbsp;&nbsp;${item.MEMO}</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>&nbsp;&nbsp;${item.NAME}</strong></td>
								<td style="background-color: #e8e8e8;text-align: center;"><strong>&nbsp;&nbsp;<fmt:formatDate value="${item.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></strong></td>
							</tr>
						</c:forEach>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: right;" colspan="5"><strong>&nbsp;&nbsp;总计：￥<fmt:formatNumber pattern='#,##0.00' value="${TOTAL_FEE}"/></strong></td>
					</tr>						
					</table>	
					</td>
					<td>
					<table cellspacing="0" cellpadding="0" border="0" width="100%" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;费用名称</strong></th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"><strong>&nbsp;&nbsp;已付费用金额</strong></th>
						</tr>
						<c:forEach items="${lawFeePayList}" var="item" varStatus="status">
						<c:set value="${TOTAL_PAY_FEE + item.REAL_PRICE  }" var="TOTAL_FEE"></c:set>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td  style="background-color: #e8e8e8;text-align: center;"><strong>&nbsp;&nbsp;${item.FLAG}</strong></td>
								<td style="background-color: #e8e8e8;text-align: right;"><strong>&nbsp;&nbsp;￥<fmt:formatNumber pattern='#,##0.00' value="${item.REAL_PRICE}"/></strong></td>
							</tr>
						</c:forEach>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="background-color: #e8e8e8;text-align: right;" colspan="2"><strong>&nbsp;&nbsp;总计：￥<fmt:formatNumber pattern='#,##0.00' value="${TOTAL_PAY_FEE}"/></strong></td>
					</tr>
					</table>
					</td>
					</tr>
					</table>
			
			</div>
	</div>
</div>
<!------------弹出层:修改法务费用信息------------>
<div style="display: none;" id="lawFeeAdd_m" title="您当前的位置:修改法务费用信息">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
			<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form name="lawFeeAdd_m" id="lawFeeAdd_m" action="../servlet/defaultDispatcher" method="post">
				<input type="hidden" id="__action" name="__action"/>
				<input type="hidden" id="recp_id" name="recp_id"/>
				<input type="hidden" id="ID" name="ID"/>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="showlawFeeAddTableID">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">费用类别:<font color="red">*</font></td>
						<td style="text-align: left;"><select name="fee_name">
						<option value="">-请选择-</option>
						<c:forEach items="${lawyFeeList}" var="item" varStatus="status">
							<option value="${item.CODE }">${item.FLAG }</option>
						</c:forEach>
						</select></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">费用金额:<font color="red">*</font></td>
						<td style="text-align: left;"><input name="fee_value" size="20"/></td>
					</tr>			
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: left;" width="20%">备注说明:</td>
						<td style="text-align: left;"><textarea rows="15" cols="5" name="memo" style="width:100%;"></textarea></td>
					</tr>
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;" colspan="2"><input type="button" id="subUpload" value="确&nbsp;定" onclick="updateLawyFeeList();" class="ui-state-default ui-corner-all"></td>
					</tr>									
				</table>
			</form>
			</div>
		</div>
	</div>
</div>	

