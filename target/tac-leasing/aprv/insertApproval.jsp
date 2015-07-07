<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>新增核准函</title>
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
		$('#btnSub').attr('disabled','disabled');
		$('#_rd5').val($('#otherValue').val());
		if ($("#summary").val() == '') {
			alert('原核准事项不得为空!');
			$('#btnSub').removeAttr('disabled');
			return false;
		}
		if ($("#content").val() == '') {
			alert('拟变更事项不得为空!');
			$('#btnSub').removeAttr('disabled');
			return false;
		}
		var fileValid = $('#fileValid').val();
		if(fileValid=='0'){
			$('#btnSub').removeAttr('disabled');
			alert('上传文件列表中含有无效的文件，请检查已选择文件的大小或文件名（字体为红色的附件）是否符合上传要求！');
			return false;
		}
		$('#action').val('approvalCommand.insertAndSubmitApproval');
		document.form1.submit();
	}
	function add() {
		$('#btnAdd').attr('disabled','disabled');
		$('#_rd5').val($('#otherValue').val());
		if ($("#summary").val() == '') {
			alert('原核准事项不得为空!');
			$('#btnAdd').removeAttr('disabled');
			return false;
		}
		if ($("#content").val() == '') {
			alert('拟变更事项不得为空!');
			$('#btnAdd').removeAttr('disabled');
			return false;
		}
		var fileValid = $('#fileValid').val();
		if(fileValid=='0'){
			$('#btnAdd').removeAttr('disabled');
			alert('上传文件列表中含有无效的文件，请检查已选择文件的大小或文件名（字体为红色的附件）是否符合上传要求！');
			return false;
		}
		$('#action').val('approvalCommand.insertApproval');
		document.form1.submit();
	}
	function back(){
		location.href='${ctx}/servlet/defaultDispatcher?__action=approvalCommand.selectApproval';
	}
	
	$(function(){
		
		$.bpmDeptUI("deptDiv",$("#companyCode").val());
		
		$("#companyCode").change(function(){
			$.bpmDeptUI("deptDiv",$("#companyCode").val());
			$("#BPM_DEPTUI_USERLIST").val("");
			$("#BPM_DEPTUI_USERNAMELIST").html("");
		});
		
		$("#btnUserList").click(function(){
			$("#deptDiv").dialog({
				modal : true,
				autoOpen : true,
				width : 600
			});
		});
		
		var errorMsg = '${errorMsg}';
		if (errorMsg == 'Y') {
			alert('合同号无效!');
		}
		
		$("#leaseCode").change(function(){
			$.ajax({
                url: "../servlet/defaultDispatcher",
                dataType: "json",
                data: {
                	'__action' : 'approvalCommand.previewApproval',
                	leaseCode : $("#leaseCode").val()
                },
                success: function(data) {
                	if (data.result == 'success') {
                		$("#payed").html((data.payed=='1')?'已拨款':'未拨款');
                    	$("#custName").html(data.custName);
                    	$("#payMoney").html('￥' +data.payMoney);
                    	$("#payDate").html(data.payDate);
                	} else {
                		$("#payed").html('');
                    	$("#custName").html('');
                    	$("#payMoney").html('');
                    	$("#payDate").html('');
                	}
                	
                }
            });
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
			url:'${ctx}/servlet/defaultDispatcher?__action=approvalCommand.uploadFiles',
			onUploadComplete : function() {
				alert("ok");
			}
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
		<input type="hidden" id="action" name="__action" value="approvalCommand.insertApproval">
		<input type ="hidden" value="${pageContext.session.id}" id="sessionId" />
		<input type="hidden" value="" name="upFiles" id="files" />
		<input type="hidden" value="1" id="fileValid" />
		<br>
		<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center" >
			<tr>
				<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
						<span id="addDemandTitle2" class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;<select id="companyCode" name="companyCode" style=" color: red;">
													<option value="1" style="color: red;">裕融</option>
													<option value="2" style="color: red;">裕国</option>
												</select>核准函变更申请</span>
					</div>
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
						<div class="zc_grid_body jqgrowleft">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td>
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
											<tr>
												<th style="width:15%">类型：</th>
												<td style="width:85%" colspan="3"><span id="payed"></span></td>
											</tr>
											<tr>
												<th style="width:15%">承租人：</th>
												<td style="width:85%" colspan="3"><span id="custName"></span></td>
											</tr>
											<tr>
												<th style="width:15%">合同编号：</th>
												<td style="width:35%"><input type="text" id="leaseCode" name="leaseCode" class="panel_text" value="${leaseCode }"></td>
												<th style="width:15%">申请部门：</th>
												<td style="width:35%"></td>
											</tr>
											<tr>
												<th style="width:15%">核准日期：</th>
												<td style="width:35%"><span id="payDate"></span></td>
												<th style="width:15%">申请人：</th>
												<td style="width:35%">${s_employeeName}</td>
											</tr>
											<tr>
												<th style="width:15%">核准金额：</th>
												<td style="width:35%"><span id="payMoney"></span></td>
												<th style="width:15%">申请日期：</th>
												<td style="width:35%"></td>
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
													<span id="BPM_DEPTUI_USERNAMELIST"></span>
													<input id="BPM_DEPTUI_USERLIST" name="auditData" type="hidden" value="${auditData }"/>
													<input id="btnUserList" type="button" class="ui-state-default" value="修改会签人员" style="height: 30px;width: 90px"/>
												</td>
											</tr>
										</table>
									
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
											<tr>
												<th style="height: 30px; width:100%" colspan="2">申请内容：</th>
											</tr>
											<tr>
												<th style="height: 30px; width:50%">原核准事项：</th>
												<th style="height: 30px; width:50%">拟变更事项：</th>
											</tr>
											<tr>
												<td style="width:50%">
													<textarea rows="8" id="summary" name="summary" cols="80">${summary }</textarea>
												</td>
												<td style="width:50%">
													<textarea rows="8" id="content" name="content" cols="80">${content }</textarea>
												</td>
											</tr>
										</table>
										
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table">
											<tr>
												<th style="width:50%;height: 30px; text-align:right;">
													添加附件(单个文件大小限2M以下)：
												</th>
												<td style="width:50%;padding:4px 0 0 4px; height:30px;">
													<div id="file_upload"></div>
												</td> 
											</tr>
											<tr>
												<td colspan="6" style="height:40px; text-align:center;">
													<input id="btnSub" type="button" class="ui-state-default" value="提交" style="height: 30px;width: 90px;" onclick="tosubmit();"/>
													<input id="btnAdd" type="button" class="ui-state-default" value="暂存" style="height: 30px;width: 90px;" onclick="add();"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div id="deptDiv"  title="选择部门" style="display: none"></div>
	</center>
</body>