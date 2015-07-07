<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业管收件转移</title>
</head>
<body>
	<form id="form1" name="form1" method="post"  action="${ctx}/servlet/defaultDispatcher">
			<input type="hidden" name="__action" id="__action" value="businessSupport.getDispatchCaseList"/>
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业管收件转移</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	          <div class="zc_grid_body jqgrowleft"><br>
				<div class="ui-state-default ui-jqgrid-hdiv" style="background: white">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						<tr>
							<td>&nbsp;</td>
							<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
						</tr>
					</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										序号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										送件状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="CREDIT_RUNCODE" pagingInfo="${pagingInfo}">案件号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="LEASE_CODE" pagingInfo="${pagingInfo}">合同编号</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										业务经办
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										<page:pagingSort orderBy="DISPATCH_NAME" pagingInfo="${pagingInfo}">分派文审</page:pagingSort>
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${status.count }</td>
										<td style="text-align: center;">业管收件</td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.NAME }&nbsp;</td>
										<td style="text-align: center;">${item.DISPATCH_NAME }&nbsp;</td>
										<td style="text-align: center;"><a href="javascript:void(0)" onclick="showDispatchNameList('${item.ID }','${item.DISPATCH_ID }','${item.DISPATCH_NAME }','${item.EMAIL }','${item.CREDIT_RUNCODE }')">转移</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				</div>
			  </div>
		    </div>
		    <br><br>
		    <input type="button" value="显示日志" class="ui-state-default ui-corner-all" onclick="controlDiv()" id="historyButton">
		    <div id="history" style="display: none">
		    <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;业管收件转移历史记录</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	          <div class="zc_grid_body jqgrowleft"><br>
				<div class="ui-state-default ui-jqgrid-hdiv" style="background: white">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
							<thead>
								<tr class="ui-jqgrid-labels">
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										序号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										送件状态
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										案件号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										合同编号
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										客户名称
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										日志
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作人
									</th>
									<th class="ui-state-default ui-th-ltr zc_grid_head">
										操作时间
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultList }" var="item" varStatus="status">													
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${status.count }</td>
										<td style="text-align: center;">业管收件</td>
										<td style="text-align: center;">${item.CREDIT_RUNCODE }&nbsp;</td>
										<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.CUST_NAME }</td>
										<td style="text-align: center;">${item.MEMO }&nbsp;</td>
										<td style="text-align: center;">${item.NAME }&nbsp;</td>
										<td style="text-align: center;"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
			  </div>
			</div>
	 		</div>
	 </form>
	 <div id="dispatchDiv" title="转移" style="display: none;">
		<form action="../servlet/defaultDispatcher" id="form2" name="form2" method="post">
			<input type="hidden" name="__action" value="businessSupport.updateDispatchId">
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="dispatchId" name="dispatchId">
			<input type="hidden" id="dispatchName" name="dispatchName">
			<input type="hidden" id="email" name="email">
			<input type="hidden" id="creditRuncode" name="creditRuncode">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
           		<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;font-family: 微软雅黑">转移至：</td>
								<td><select id="TRANSFER_ID" name="TRANSFER_ID" style="width: 90px;"></select></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;background: white">
									<input type="button" class="ui-state-default ui-corner-all" value="保存" style="cursor: pointer;" onclick="updateDispatch()">&nbsp;&nbsp;
									<input type="button" class="ui-state-default ui-corner-all" value="关 闭" style="cursor: pointer;" onclick="closeDialog('dispatchDiv');">
								</td>
							</tr>
						 </table>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	function showDispatchNameList(id,dispatchId,dispatchName,email,creditRuncode) {
	
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=businessSupport.getDispatchIdList&dispatchId='+dispatchId,
			dataType:'json',
			success: function(data){	
				$("#TRANSFER_ID option").each(function() {
					$(this).remove();
				});
				
				for(var i=0;i<data.length;i++){
					
					$("#TRANSFER_ID").get(0).options.add(new Option(data[i].NAME,data[i].ID));
				}
			}
		});
		
		$("#id").val(id);
		$("#dispatchId").val(dispatchId);
		$("#dispatchName").val(dispatchName);
		$("#email").val(email);
		$("#creditRuncode").val(creditRuncode);
		
		$('#dispatchDiv').dialog({
			modal:true,
			autoOpen: false,
			width: 400,
			position:['center',250],
			hide:'slide',
			show:'slide'
		});
		$('#dispatchDiv').dialog('open');
	}
	
	
	function closeDialog(div) {
		$("#"+div).dialog('close');
	}
	
	function updateDispatch() {
		$("#form2").submit();
	}
	
	function controlDiv() {
		if($("#history").css("height")=='auto') {
			$("#historyButton").val("隐藏日志");
			$("#history").show(1000);
		} else {
			$("#historyButton").val("显示日志");
			$("#history").hide(1000);
		}
	}
</script>
</html>