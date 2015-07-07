<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>核准函变更申请</title>
<%@ include file="/common/taglibsNew.jsp"%>
<style>
	.connectedSortable { list-style-type:none; margin:0 0 10px 0; padding:0; border:1px solid #4297D7; min-width:120px; min-height:320px;}
	.connectedSortable li, .connectedSortable li { margin:1px 0 1px 0; padding:6px;  cursor:move; }
	.demandHead { background-color:#2E6EAF;}
	.applyBtns input:hover{background:#FFFFFF;}
</style>
<script type="text/javascript" src="${ctx}/bpm/js/bpmUI.js?v=2"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<script type="text/javascript">	
function showRisk(credit_id,prc_id){
	$("#progressbar").dialog({
		closeOnEscape : false,
		open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
		modal : true,
		resizable : false,
		draggable : false,
		title : "数据加载中... ..."
	});
	$("#sub___action").val("riskAuditSee.selectRiskAuditForSee_zulin");
	$("#sub_credit_id").val(credit_id);
	$("#sub_prc_id").val(prc_id);
	$("#subForm").submit();
}

function doQuery() {
	document.form1.submit();
}
function add() {
	location.href='${ctx}/aprv/insertApproval.jsp';
}
function view(aprvId) {
	location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.viewApproval&aprvId=' + aprvId;
}
function exportAprv() {
	var chk_value =[];   
	$('input[name="check_id"]:checked').each(function(){   
	   chk_value.push($(this).attr('id').substr(9));   
	});
	if(chk_value.length==0){
	  	alert("你还没有选择核准函变更申请");
	  	return false;
	}
	$("#aprvId").val(chk_value[0]);
	$("#__action").val("approvalCommand.export");
	$("#form1").submit();
	$("#__action").val("approvalCommand.selectApproval");
}

$(document).ready(function() {
	
	$(".statusName").each(function() {
		var processId = $(this).attr("process_id");
		if(processId != null && processId != '') {
			$.bpmStatusName(this,processId);
		} else {
			$(this).html('未提交');
		}
	});
	
	$(".currentChargeName").each(function() {
		var processId = $(this).attr("process_id");
		if(processId != null && processId != '') {
			$.bpmCurrentChargeName(this,processId);
		}
	});
	
	
});
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="subForm" id="subForm" method="post">
		<input type="hidden" name="__action" id="sub___action">
		<input type="hidden" name="credit_id" id="sub_credit_id">
		<input type="hidden" name="prc_id" id="sub_prc_id">
		<input type="hidden" name="flag" id="sub_flag">
	</form>
	<div id="progressbar" style="display: none;text-align: center;">
		<img src="${ctx }/images/loading.gif" style="vertical-align: middle;">
	</div>
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"	method="post">
		<input type="hidden" name="__action" id="__action" value="approvalCommand.selectApproval"> 
		<input type="hidden" id="aprvId" name="aprvId">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;核准函变更申请</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main" style="min-width:1100px;">
			<div style="margin: 6 0 6 0px;">
				<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o"></td>
						<td width="60%" class="ss_t" valign="top">
							<table style="margin-left: 10px; min-width: 790px;">
								<tr>
									<td align="right">流程状态:</td>
									<td>
										<select id="QSEARCH_STATUS" name="flowStatus">
											<option value="" <c:if test="${flowStatus eq ''}">selected</c:if>>--全部--</option>
											<option value="0" <c:if test="${flowStatus eq '0'}">selected</c:if>>未提交</option>
											<option value="1" <c:if test="${flowStatus eq '1'}">selected</c:if>>待主管审批</option>
											<option value="2" <c:if test="${flowStatus eq '2'}">selected</c:if>>会签中</option>
											<option value="3" <c:if test="${flowStatus eq '3'}">selected</c:if>>办理中</option>
											<option value="4" <c:if test="${flowStatus eq '4'}">selected</c:if>>已完成</option>
											<option value="5" <c:if test="${flowStatus eq '5'}">selected</c:if>>已驳回</option>
										</select>
									</td>
									<td align="right">查询内容:</td>
									<td>
										<input type="text" id="QSEARCH_VALUE" name="searchContent" value="${searchContent }" style="width: 100%; height: 18px; font-size: 12px;" />
									</td>
									<td align="right">当前处理人:</td>
									<td>
										<select id="QSEARCH_SELFONLY" name="selfOnly">
											<c:if test="${selectApproval_selectAll eq true}">
												<option value="0" <c:if test="${selfOnly eq '0'}">selected</c:if>>--全部--</option>
											</c:if>
											<c:if test="${selectApproval_selectAll eq false}">
												<option value="1" <c:if test="${selfOnly eq '1'}">selected</c:if>>--全部--</option>
											</c:if>
											<option value="2" <c:if test="${selfOnly eq '2'}">selected</c:if>>本人</option>
										</select>
									</td>
									<td align="right">申请人:</td>
									<td>
										<select id="QSEARCH_SELFAPPLY" name="selfApply">
											<option value="0" <c:if test="${selfApply ne '1'}">selected</c:if>>--全部--</option>
											<option value="1" <c:if test="${selfApply eq '1'}">selected</c:if>>本人</option>
										</select>
									</td>
									<td align="right">公司:</td>
									<td colspan="4">
										<select id="QSEARCH_COMPANYCODE" name="companyCode">
											<option value="" <c:if test="${companyCode eq ''}">selected</c:if>>--全部--</option>
											<option value="1" <c:if test="${companyCode eq '1'}">selected</c:if>>裕融</option>
											<option value="2" <c:if test="${companyCode eq '2'}">selected</c:if>>裕国</option>
										</select>
									</td>
								</tr>
							</table>
						</td>
						<td width="55" class="ss_th" valign="top">&nbsp;</td>
						<td width="20%"><a href="#" name="search" id="search" onclick="doQuery();" class="blue_button">搜 索</a></td>
					</tr>
				</table>
			</div>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background: #FFFFFF;"><br/>
				<div class="applyBtns" style="margin-left:10px;">
					<input type="button" name="addbutton" onclick="add()" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="新增核准函变更申请" />
					<input type="button" name="exportbutton" onclick="exportAprv()" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="导出核准函变更申请" />
				</div>
				<page:pagingToolbarTop pagingInfo="${dw }" />
				<table id="demandList" class="grid_table">
					<tbody>
						<tr>
							<th>&nbsp;</th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="flowStatus">当前状态</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="aprvCode">申请编号<br/><span style="font-size:11px;color:red;">(点击查看详细)</span></page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="aprvCode">合同编号</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="summary">原核准事项</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="content">拟变更事项</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="applyUserName">申请人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="companyCode">公司</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="createTime">申请时间</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="flowStatus">当前处理人</page:pagingSort></th>
						</tr>
						<c:forEach items="${dw.resultList}" var="d" varStatus="index">
							<tr>
								<td width="2%" style="text-align: center;">
									<c:if test="${d.flowStatus == 16384 || d.flowStatus == 65536}">
										<input type="checkbox" id="checkbox_${d.aprvId}" name="check_id">
									</c:if>	
								</td>
								<td width="5%" style="text-align: center;">
									<span class="statusName" process_id="${d.processId}"></span>&nbsp;
								</td>
								<td width="6%" style="text-align: center;">
									<a href="javascript:void(0)" onclick="view('${d.aprvId}')">
										${d.aprvCode}
									</a>
								</td>
								<td width="7%" style="text-align: center;">
									<a href="javascript:void(0)" onclick="showRisk('${d.rectId}','${d.prcId}')">
										${d.leaseCode}
									</a>
								</td>
								<%-- <td style="text-align: center;">${d.code }&nbsp;</td> --%>
								<td width="31%" style="text-align: left;"><div style="white-space: normal;">${d.summary }&nbsp;</div></td>
								<td width="31%" style="text-align: left;"><div style="white-space: normal;">${d.content }&nbsp;</div></td>
								<td width="3%" style="text-align: center;">${d.applyUserName }&nbsp;</td>
								<td width="3%" style="text-align: center;">${d.companyCode == "1"?"裕融":"裕国" }&nbsp;</td>
								<td width="7%" style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd" type="both" value="${d.createTime}" />&nbsp;
								</td>
								<td width="5%" style="text-align: center;">
									<span class="currentChargeName" process_id="${d.processId}"></span>&nbsp;
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<page:pagingToolbar pagingInfo="${dw }" />
			</div>
		</div>
	</form>
</body>
</html>