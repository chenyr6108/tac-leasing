<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>显示核准函</title>
	<%@ include file="/common/taglibsNew.jsp"%>
	<link rel="stylesheet" type="text/css" href="${ctx}/modifyOrder/js/html5uploader.css">
	<script type="text/javascript" src="${ctx }/modifyOrder/js/jquery.html5uploader.js"></script>
	<script src="../bpm/js/bpmUI.js?v=2" type="text/javascript"></script>
	<script src="${ctx }/rentcontract/js/json2.js" type="text/javascript"></script>
<style type="text/css">    
	.connectedSortable { list-style-type:none; margin:0 0 10px 0; padding:0; border:1px solid #4297D7; min-width:120px; min-height:320px;}
	.connectedSortable li, .connectedSortable li { margin:1px 0 1px 0; padding:6px;  cursor:move; }
	a:link { text-decoration:none; color:#2E6E9E;} 
	a:hover { color:red; text-decoration: underline;} 
</style>
<script type="text/javascript">
	function tosubmit() {
		$("#__action").val("approvalCommand.submitApproval");
		document.form1.submit();
	}
	
	function upload() {
		$('#_rd5').val($('#otherValue').val());
		var fileValid = $('#fileValid').val();
		if(fileValid=='0'){
			$('#btnSub').removeAttr('disabled');
			alert('上传文件列表中含有无效的文件，请检查已选择文件的大小或文件名（字体为红色的附件）是否符合上传要求！');
			return false;
		}
		$("#__action").val("approvalCommand.uploadFiles");
		document.form1.submit();
	}
	
	function resubmit() {
		$("#__action").val("approvalCommand.resubmitApproval");
		document.form1.submit();
	}
	
	function back(){
		location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.selectApproval';
	}
	
	function deleteFile(id, name) {
		if(confirm("你确认要删除附件["+name+"]吗？")) {
			$.ajax({
                url: "../servlet/defaultDispatcher",
                dataType: "json",
                data: {
                	'__action' : 'approvalCommand.deleteFiles',
                    'delFiles': id
                },
                success: function(data) {
                	location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.viewApproval&aprvId='+$("#aprvId").val();
                }
            });
		}
	}
	
	$(document).ready(function() {
		
		$.bpmUI("bpmDiv",$("#processId").val(),null,function(){
			location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.viewApproval&aprvId='+$("#aprvId").val();
		});
		
		if($("#processId").val() != null && $("#processId").val() != '') {
			$.bpmGetFlowStatus({
				processId : $("#processId").val(),
				flowDefId : 'toaduit1',
				callback : function(data) {
					if(data.result=="success" && data.flowStatus == 2) {
						$("#btnUserList").hide();
					}
				}
			});
		}
		
		$("#BPM_DEPTUI_USERLIST").change(function(){
			location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.updateApproval&aprvId='+$("#aprvId").val() + '&auditData=' + $("#BPM_DEPTUI_USERLIST").val();
		});
		
		var selectDeptId='';
		$(".selectDeptId").each(function() {
			selectDeptId += $(this).val() + ',';
		});
		if(selectDeptId.length>0) {
			selectDeptId = selectDeptId.substr(0,selectDeptId.length-1);
		}
		
		var completeDeptId='';
		$(".completeDeptId").each(function() {
			completeDeptId += $(this).val() + ',';
		});
		if(completeDeptId.length>0) {
			completeDeptId = completeDeptId.substr(0,completeDeptId.length-1);
		}
		$.bpmDeptUI("deptDiv",${approval.companyCode},selectDeptId,completeDeptId);
		
		
		//$.bpmTaskComplete($("#hisDiv"),$("#processId").val());
		
		$(".hisProcessDiv").each(function(){
			$.bpmTaskComplete($(this),$(this).attr("processId"));
		});
		
		$.bpmStatusName($("#statusName"),$("#processId").val());
		$.bpmCurrentChargeName($("#currentChargeName"),$("#processId").val());
		$.bpmGetProcessData({
			processId : $("#processId").val(),
			dataDefId : 'USER_LIST',
			callback : function(data) {
				if(data.result=="success") {
					$("#BPM_DEPTUI_USERLIST").val(data.value);
					// $("#BPM_DEPTUI_USERNAMELIST").html(data.value);
				}
			}
		});
		$("#subUserList").click(function(){
			$.bpmUpdateProcessData({
				processId : $("#processId").val(),
				dataDefId : 'USER_LIST',
				value : $("#BPM_DEPTUI_USERLIST").val(),
				callback : function(data) {
					$.bpmGetProcessData({
						processId : $("#processId").val(),
						dataDefId : 'USER_LIST',
						callback : function(data) {
							if(data.result=="success") {
								$("#BPM_DEPTUI_USERLIST").val(data.value);
								$("#BPM_DEPTUI_USERNAMELIST").html(data.value);
							}
						}
					})
				}
			});
		});
		$("#btnUserList").click(function(){
			$("#deptDiv").dialog({
				modal : true,
				autoOpen : true,
				width : 600
			});
		});
		$("#hisToggle").click(function(){
			$("#hisGroup").toggle();
		});
		
		$("#DIV_ALTER_ORI").dialog({ 
			autoOpen:false, 
			modal:true, 
			buttons:{ 
				'保存':function(){
					if ($("#INPUT_ALTER_ORI").val() == '') {
						alert('原核准事项不得为空!');
						return false;
					}
					$("#DIV_ALTER_ORI").dialog("close");
					location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.updateApproval&aprvId='+$("#aprvId").val() + '&summary=' + $("#INPUT_ALTER_ORI").val();
				}
			}
		});
		
		$("#DIV_ALTER_NEW").dialog({ 
			autoOpen:false, 
			modal:true, 
			buttons:{ 
				'保存':function(){
					if ($("#INPUT_ALTER_NEW").val() == '') {
						alert('拟变更事项不得为空!');
						return false;
					}
					$("#DIV_ALTER_NEW").dialog("close");
					location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.updateApproval&aprvId='+$("#aprvId").val() + '&content=' + $("#INPUT_ALTER_NEW").val();
				}
			}
		});
		
		$("#BTN_ALTER_ORI").click(function(){
			$("#DIV_ALTER_ORI").dialog('open');
		});
		
		$("#BTN_ALTER_NEW").click(function(){
			$("#DIV_ALTER_NEW").dialog('open');
		});
		
		$('.s_rd').click(function(){
			$('#_' + $(this).attr('id')).click();
		});
		$('input[name!=otherValue]:radio').click(function(){
			$('#otherValue').attr('disabled', 'disabled');
		});
		$('#_rd5').click(function(){
			$('#otherValue').removeAttr('disabled');
			$('#otherValue').focus();
		});
		$('#file_upload').html5uploader({
			auto:false,
			multi:true,
			buttonText:'选择文件（可多选）',
   			fileSizeLimit:2097152,
			url:'${ctx}/servlet/defaultDispatcher?__action=approvalCommand.uploadFiles&aprvId=${approval.aprvId}',
		});
	});
</script>
</head>
<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
		<span id="addDemandTitle1" class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;核准函变更申请</span>
	</div>
	<br>
	<div><input type="button" class="ui-state-default" value="返回核准函变更申请列表" onclick="back()" style="height: 30px"/></div>
	<center>
		
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" name="__action" id="__action" value="approvalCommand.submitApproval">
		<input type="hidden" name="aprvId" id="aprvId" value="${approval.aprvId}"> 
		<input type="hidden" name="processId" id="processId" value="${approval.processId}"> 
		<input type ="hidden" value="${pageContext.session.id}" id="sessionId" />
		<input type="hidden" value="" name="upFiles" id="files" />
		<input type="hidden" value="1" id="fileValid" />
		<br>
		<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center" >
			<tr>
				<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
						<span id="addDemandTitle2" class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;
							<c:if test="${approval.companyCode eq 1}">裕融 - 核准函变更申请</c:if>
							<c:if test="${approval.companyCode eq 2}">裕国 - 核准函变更申请</c:if>
						</span>
					</div>
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
						<div class="zc_grid_body jqgrowleft">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td>
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
											<tr>
												<th style="width:15%">类型：</th>
												<td style="width:85%" colspan="3">
													<c:if test="${approval.payed gt 0}">已拨款</c:if>
													<c:if test="${approval.payed eq 0}">未拨款</c:if>
												</td>
											</tr>
											<tr>
												<th style="width:15%">承租人：</th>
												<td style="width:85%" colspan="3">${approval.custName }</td>
											</tr>
											<tr>
												<th style="width:15%">合同编号：</th>
												<td style="width:35%">${approval.leaseCode }</td>
												<th style="width:15%">申请部门：</th>
												<td style="width:35%">${approval.deptName }</td>
											</tr>
											<tr>
												<th style="width:15%">核准日期：</th>
												<td style="width:35%"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${approval.payDate }" /></td>
												<th style="width:15%">申请人：</th>
												<td style="width:35%">${approval.applyUserName }</td>
											</tr>
											<tr>
												<th style="width:15%">核准金额：</th>
												<td style="width:35%">￥<fmt:formatNumber value="${approval.payMoney }" type="currency" pattern="#,##0"/></td>
												<th style="width:15%">申请日期：</th>
												<td style="width:35%"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${approval.createTime }" /></td>
											</tr>
											<tr>
												<th style="width:15%">流程：</th>
												<td style="width:85%" colspan="3">
													直属主管 -> 评审人员 -> 可选会签部门 -> 审查/资讯会办
												</td>
											</tr>
											<tr>
												<th style="width:15%">可选会签部门：</th>
												<td style="width:85%" colspan="3">
													<span id="BPM_DEPTUI_USERNAMELIST">
														<c:forEach var="audit" items="${auditData }" varStatus="status">
															<c:forEach var="dept" items="${deptList }">
																<c:if test="${dept.code == audit.deptId}">
																	${dept.flag} -> 
																	<c:if test="${status.last}">结束</c:if>
																</c:if>
															</c:forEach>
														</c:forEach>
													</span>
													<input id="BPM_DEPTUI_USERLIST" type="hidden"/>
													<c:if test="${(approval.processId == null || approval.processId eq '' || approval.flowStatus != 4096 && approval.flowStatus != 8192 && approval.flowStatus != 16384  && approval.flowStatus != 32768  && approval.flowStatus != 65536) && (approval.currentCharge == s_employeeId || approval.currentDelegate == s_employeeId) || bpm_admin == true}">
														<input id="btnUserList" type="button" class="ui-state-default" value="修改会签人员" style="height: 30px;width: 90px"/>
													</c:if>
												</td>
											</tr>
										</table>
									
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table" style="table-layout:fixed !important;">
											<tr>
												<th style="height: 30px; width:100%" colspan="2">申请内容：</th>
											</tr>
											<tr>
												<th style="height: 30px; width:50%">原核准事项：
													<c:if test="${((approval.processId == null || approval.processId eq '') || (approval.flowStatus == 16 || approval.flowStatus == 256 || approval.flowStatus == 2048)) && (approval.applyUserId == s_employeeId) || bpm_admin == true}">
														<input id="BTN_ALTER_ORI" type="button" class="ui-state-default" value="修改" style="height: 30px;width: 90px"/>
													</c:if>
												</th>
												<th style="height: 30px; width:50%">拟变更事项：
													<c:if test="${((approval.processId == null || approval.processId eq '') || (approval.flowStatus == 16 || approval.flowStatus == 256 || approval.flowStatus == 2048)) && (approval.applyUserId == s_employeeId) || bpm_admin == true}">
														<input id="BTN_ALTER_NEW" type="button" class="ui-state-default" value="修改" style="height: 30px;width: 90px"/>
													</c:if>
												</th>
											</tr>
											<tr>
												<td style="width:50%;">
												<div style="white-space: normal;">
													${approval.summary }
												</div>
												</td>
												<td style="width:50%;">
												<div style="white-space: normal;">
													${approval.content }
												</div>
													
												</td>
											</tr>
											<c:if test="${fn:length(fileList)>0 || approval.processId != null && approval.processId ne '' && (approval.flowStatus == 16 || approval.flowStatus == 256 || approval.flowStatus == 2048)  && (approval.applyUserId == s_employeeId) || bpm_admin == true}">
												<tr>
													<th style="width:50%;">附件:<br>
														<c:if test="${approval.processId != null && approval.processId ne '' && (approval.flowStatus == 16 || approval.flowStatus == 256 || approval.flowStatus == 2048)  && (approval.applyUserId == s_employeeId) || bpm_admin == true}">
															添加附件(单个文件大小限2M以下)：
															<div id="file_upload"></div>
															<a style="padding:0 4px; margin:2px 0;" class="ui-state-default" href="javascript:void(0);" onclick="upload();" >确认上传</a>
														</c:if>
													</th>
													<th style="width:50%;">
														<c:forEach items="${fileList}" var="f" varStatus="index">
															<div style="float:left; clear:both; width:500px; padding:1px;">
																<a style="padding:0 4px; margin:2px 0;float:left; " class="ui-state-default" 
																href="${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${f.ORG_FILE_NAME }&path=${f.PATH}&bootPath=aprvFile">${f.ORG_FILE_NAME }</a>
																<c:if test="${approval.processId != null && approval.processId ne '' && (approval.flowStatus == 16 || approval.flowStatus == 256 || approval.flowStatus == 2048)  && (approval.applyUserId == s_employeeId) || bpm_admin == true}">
																	<a style="padding:0 4px; margin:2px 0;float:left;" class="ui-state-default" href="javascript:void(0);" onclick="deleteFile('${f.ID }','${f.ORG_FILE_NAME }');" >删除</a>
																</c:if>
															</div>
														</c:forEach>
													</th>
												</tr>
											</c:if>
										</table>
										
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
											<tr>
												<th style="height: 30px; width:100%" colspan="6">流程：</th>
											</tr>
											<tr>
												<th style="height: 30px; width:10%">部门</th>
												<th style="height: 30px; width:10%">结果</th>
												<th style="height: 30px; width:50%">备注</th>
												<th style="height: 30px; width:10%">负责人</th>
												<th style="height: 30px; width:10%">实际处理人</th>
												<th style="height: 30px; width:10%">处理时间</th>
											</tr>
											<c:if test='${upUser ne ""}'>
												<tr>
													<th style="height: 30px; width:10%">直属主管：</th>
													<td style="text-align:center;height: 30px; width:10%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'tosubmit'}">
																<c:if test="${task.result eq 'C'}">完成</c:if>
																<c:if test="${task.result eq 'A'}">同意</c:if>
																<c:if test="${task.result eq 'R'}">驳回</c:if>
																<c:if test="${task.result eq 'P'}">通过</c:if>
															</c:if>
														</c:forEach>
													</td>
													<td style="height: 30px; width:50%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'tosubmit'}">
																${task.comment}
															</c:if>
														</c:forEach>
													</td>
													<td style="text-align:center;height: 30px; width:10%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'tosubmit'}">
																${task.chargeName}
															</c:if>
														</c:forEach>
													</td>
													<td style="text-align:center;height: 30px; width:10%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'tosubmit'}">
																${task.operatorName}
															</c:if>
														</c:forEach>
													</td>
													<td style="height: 30px; width:10%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'tosubmit'}">
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${task.endDate }" />
															</c:if>
														</c:forEach>
													</td>
												</tr>
											</c:if>
											<c:forEach var="rUser" items="${riskUser }">
												<tr>
													<th style="height: 30px; width:10%">评审人员：</th>
													<td style="text-align:center;height: 30px; width:10%">
														<c:set var="exists" value="0"/>
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'exam' && rUser == task.charge && exists == '0'}">
																<c:set var="exists" value="1"/>
																<c:if test="${task.result eq 'C'}">完成</c:if>
																<c:if test="${task.result eq 'A'}">同意</c:if>
																<c:if test="${task.result eq 'R'}">驳回</c:if>
																<c:if test="${task.result eq 'P'}">通过</c:if>
															</c:if>
														</c:forEach>
													</td>
													<td style="height: 30px; width:50%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'exam' && rUser == task.charge}">
																${task.comment}
															</c:if>
														</c:forEach>
													</td>
													<td style="text-align:center;height: 30px; width:10%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'exam' && rUser == task.charge}">
																${task.chargeName}
															</c:if>
														</c:forEach>
													</td>
													<td style="text-align:center;height: 30px; width:10%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'exam' && rUser == task.charge}">
																${task.operatorName}
															</c:if>
														</c:forEach>
													</td>
													<td style="height: 30px; width:10%">
														<c:forEach var="task" items="${allTasks }">
															<c:if test="${task.flowDefId == 'exam' && rUser == task.charge}">
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${task.endDate }" />
															</c:if>
														</c:forEach>
													</td>
												</tr>
											</c:forEach>
											<c:forEach var="audit" items="${auditData }" varStatus="status">
												<c:forEach var="dept" items="${deptList }">
													<c:if test="${dept.code == audit.deptId}">
														<tr>
															<th style="height: 30px; width:10%"><input type="hidden" class="selectDeptId" value="${dept.code }">${dept.flag}：</th>
															<td style="text-align:center;height: 30px; width:10%">
																<c:forEach var="task" items="${tasks }">
																	<c:if test="${task.flowDefId == 'toaduit1' && task.charge==audit.userId }">
																		<input type="hidden" class="completeDeptId" value="${dept.code }">
																		<c:if test="${task.result eq 'C'}">完成</c:if>
																		<c:if test="${task.result eq 'A'}">同意</c:if>
																		<c:if test="${task.result eq 'R'}">驳回</c:if>
																		<c:if test="${task.result eq 'P'}">通过</c:if>
																	</c:if>
																</c:forEach>
															</td>
															<td style="height: 30px; width:50%">
																<c:forEach var="task" items="${tasks }">
																	<c:if test="${task.flowDefId == 'toaduit1' && task.charge==audit.userId }">
																		${task.comment}
																	</c:if>
																</c:forEach>
															</td>
															<td style="text-align:center;height: 30px; width:10%">
																<c:forEach var="task" items="${tasks }">
																	<c:if test="${task.flowDefId == 'toaduit1' && task.charge==audit.userId }">
																		${task.chargeName}
																	</c:if>
																</c:forEach>
															</td>
															<td style="text-align:center;height: 30px; width:10%">
																<c:forEach var="task" items="${tasks }">
																	<c:if test="${task.flowDefId == 'toaduit1' && task.charge==audit.userId }">
																		${task.operatorName}
																	</c:if>
																</c:forEach>
															</td>
															<td style="height: 30px; width:10%">
																<c:forEach var="task" items="${tasks }">
																	<c:if test="${task.flowDefId == 'toaduit1' && task.charge==audit.userId }">
																		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${task.endDate }" />
																	</c:if>
																</c:forEach>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:forEach>
											<tr>
												<th style="height: 30px; width:10%">审查部会办：</th>
												<td style="text-align:center;height: 30px; width:10%">
													<c:forEach var="task" items="${tasks }">
														<c:if test="${task.flowDefId == 'examproc'}">
															<c:if test="${task.result eq 'C'}">完成</c:if>
															<c:if test="${task.result eq 'I'}">转发</c:if>
														</c:if>
													</c:forEach>
												</td>
												<td style="height: 30px; width:50%">
													<c:forEach var="task" items="${tasks }">
														<c:if test="${task.flowDefId == 'examproc'}">
															${task.comment}
														</c:if>
													</c:forEach>
												</td>
												<td style="text-align:center;height: 30px; width:10%">
													<c:forEach var="task" items="${tasks }">
														<c:if test="${task.flowDefId == 'examproc'}">
															${task.chargeName}
														</c:if>
													</c:forEach>
												</td>
												<td style="text-align:center;height: 30px; width:10%">
													<c:forEach var="task" items="${tasks }">
														<c:if test="${task.flowDefId == 'examproc'}">
															${task.operatorName}
														</c:if>
													</c:forEach>
												</td>
												<td style="height: 30px; width:10%">
													<c:forEach var="task" items="${tasks }">
														<c:if test="${task.flowDefId == 'examproc'}">
															<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${task.endDate }" />
														</c:if>
													</c:forEach>
												</td>
											</tr>
											<c:forEach var="task" items="${tasks }">
												<c:if test="${task.flowDefId == 'itproc'}">
													<tr>
														<th style="height: 30px; width:10%">资讯部会办：</th>
														<td style="text-align:center;height: 30px; width:10%">
															<c:if test="${task.result eq 'C'}">完成</c:if>
														</td>
														<td style="height: 30px; width:50%">
															${task.comment}
														</td>
														<td style="text-align:center;height: 30px; width:10%">
															${task.chargeName}
														</td>
														<td style="text-align:center;height: 30px; width:10%">
															${task.operatorName}
														</td>
														<td style="height: 30px; width:10%">
															<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${task.endDate }" />
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</table>
										
										
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
											<tr>
												<td colspan="6" style="height:40px; text-align:center;">
													<span id="statusName"></span>
													<c:if test="${(approval.processId == null || approval.processId eq '') && (approval.applyUserId == s_employeeId || bpm_admin == true)}">
														<input id="sub" type="button" class="ui-state-default" value="提交流程" style="height: 30px;width: 90px" onclick="tosubmit()"/>
														<c:if test="${bpm_admin eq true}">
															<font color="red">(当前为流程管理员权限)</font>
														</c:if>
													</c:if>
													<c:if test="${approval.processId != null && approval.processId ne ''}">
														<span id="currentChargeName"></span>
														<div id="bpmDiv"></div>
													</c:if>
													<c:if test="${approval.processId != null && approval.processId ne '' && (approval.flowStatus == 16 || approval.flowStatus == 256 || approval.flowStatus == 2048)  && (approval.applyUserId == s_employeeId || bpm_admin == true)}">
														<input id="resub" type="button" class="ui-state-default" value="重新提交流程" style="height: 30px;width: 90px" onclick="resubmit()"/>
														<c:if test="${bpm_admin eq true}">
															<font color="red">(当前为流程管理员权限)</font>
														</c:if>
													</c:if>
												</td>
											</tr>
										</table>
										
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					
					
					<!-- 
					<div id="hisDiv" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"></div>
					 -->
					<c:if test="${hisProcess ne null}">
						<input id="hisToggle" type="button" class="ui-state-default" value="显示/隐藏历史处理记录" style="height: 30px;width: 90px"/>
					</c:if>
					<div id="hisGroup" style="display: none;" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all hisProcessDiv">
						<c:forEach var="p" items="${hisProcess }">
							<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all hisProcessDiv" processId="${p}"></div>
						</c:forEach>
					</div>
					
					
				</td>
			</tr>
		</table>
	</form>
	<div id="deptDiv"  title="选择部门" style="display: none"></div>
	
	<div id="DIV_ALTER_ORI" class="ui-widget" title="修改原核准事项">
		<textarea rows="8" id="INPUT_ALTER_ORI" cols="38">${approval.summary }</textarea>
	</div>
	
	<div id="DIV_ALTER_NEW" class="ui-widget" title="修改拟变更事项">
		<textarea rows="8" id="INPUT_ALTER_NEW" cols="38">${approval.content }</textarea>
	</div>
	
	</center>
</body>