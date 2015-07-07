<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改签办单</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/modifyOrder/js/html5uploader.css">
	<script type="text/javascript" src="${ctx }/modifyOrder/js/jquery.html5uploader.js"></script>
<style type="text/css">    
	.connectedSortable { list-style-type:none; margin:0 0 10px 0; padding:0; border:1px solid #4297D7; min-width:120px; min-height:320px;}
	.connectedSortable li, .connectedSortable li { margin:1px 0 1px 0; padding:6px;  cursor:move; }
	a:link { text-decoration:none; color:#2E6E9E;} 
	a:hover { color:red; text-decoration: underline;} 
</style>
<script type="text/javascript">
//var $j = jQuery.noConflict(true);
	$(function(){
		var status = "${status}";
		if(status=="ok"){
			alert("签办单修改成功！");
			location.href="../servlet/defaultDispatcher?__action=signOrderCommand.getAllSignOrders";
		} else if(status=="err"){
			alert("签办单修改失败，请重试！");
		}
		$.datepicker.setDefaults($.datepicker.regional["zh-CN"]);
		$("#hopeDate").datepicker({minDate: 0});
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
			url:'${ctx}/servlet/defaultDispatcher?__action=signOrderCommand.uploadFiles',
		});
		$('.uploadfilebtn').addClass('ui-state-default ui-corner-all');
		
		$(".connectedSortable").sortable({
		      connectWith: ".connectedSortable",
		      opacity: 0.6,
	    	  items: "li:not(.ui-state-disabled)"
	    }).disableSelection();
	});
	
	//会签名单修改
	function countersignList(demandId, demandCode, opType){
		$('#opTypeDept').val(opType);
		$("#dept").removeAttr('disabled');
		$("#demandCodeCountersign").html(demandCode); 
		$("#demandIdCountersign").val(demandId);
		$("#countersignDiv").dialog({
			modal : true,
			autoOpen : true,
			width : 600
		});
	}
	
	//提交申请
	function updateOrder(){
		$('#sub').attr('disabled','disabled');
		$('#_rd5').val($('#otherValue').val());
		if($('#content').val().trim()==''){
			$('#sub').removeAttr('disabled');
			alert('"签办单内容"不能为空！');
			$('#content').focus();
			return false;
		}
		if($('#SUMMARY').val().trim()==''){
			$('#sub').removeAttr('disabled');
			alert('"事由"不能为空！');
			$('#SUMMARY').focus();
			return false;
		}
		//上传文件是否有效，1有效，0无效
		var fileValid = $('#fileValid').val();
		if(fileValid=='0'){
			$('#sub').removeAttr('disabled');
			alert('上传文件列表中含有无效的文件，请检查已选择文件的大小或文件名（字体为红色的附件）是否符合上传要求！');
			return false;
		}
		$("#form1").submit();
	}
	
	function devDeptDivBtn(){
		var codesOb = $("#selectDept > li");
		var codes = "";
		var showText = "";
		codesOb.each(function(i){
			codes = codes + "," + $(this).attr('id');
			showText = showText + "→" + $(this).html();
		});
		showText = showText + "→结束";
		codes = codes.substring(1, codes.length);
		showText = showText.substring(1, showText.length);
		$('#chooseCodes').val(codes);
		$("#alter").html(showText);
		if($("#seniorSign").attr("checked")){
			$("#seniorSignSub").val(1);
		} else {
			$("#seniorSignSub").val(0);
		}
		$("#countersignDiv").dialog("close");
	}
	function back(){
		location.href='${ctx}/servlet/defaultDispatcher?__action=signOrderCommand.getAllSignOrders&isMy=1';
	}
	
	function delFile(ob){
		 var delId = $(ob).parent().children('.fileId').val();
		 var delIds = $('#fileDelIds').val();
		 if(delIds == ''){
			 $('#fileDelIds').val(delId);
		 } else {
			 $('#fileDelIds').val(delIds + ',' + delId);
		 }
		 $(ob).parent().remove();
	 }
</script>
</head>
<body>
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
		<span id="addDemandTitle1" class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;修改签办单</span>
	</div>
	<br>
	<div><input type="button" class="ui-state-default" value="返回签办单列表" onclick="back();" style="height: 30px"/></div>
	<center>
		
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" id="__action" name="__action" value="signOrderCommand.alterSignOrder">
		<input type ="hidden" value="${pageContext.session.id}" id="sessionId" />
		<input type="hidden" value="" name="upFiles" id="files" />
		<input type="hidden" value="1" id="fileValid" />
		<input type="hidden" value="2" name="opState" />
		<input type="hidden" value="${signOrderTo.id }" name="signOrderId" />
		<input type="hidden" value="${signOrderTo.countersignCodeOrder }" id="chooseCodes" name="chooseCodes" />
		<br/>
		<table width="1028" cellpadding="0" cellspacing="0" border="0" align="center" >
			<tr>
				<td>
					<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
						<span id="addDemandTitle2" class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;签办单</span>
					</div>
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
						<div class="zc_grid_body jqgrowleft">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td>
										<table cellspacing="0" cellpadding="0" border="0" class="panel_table" id="modifyOrderTable">
											<tr id="orderTr">
												<th style="height: 30px; width:15%">申请人：</th>
												<td style="height: 30px; width:22%;text-align:center;">${signOrderTo.applyUserName}</td>
												<th style="height: 30px;width:15%">公司名：</th>
												<td style="height: 30px;width:15%;text-align:center;">
														<c:if test="${signOrderTo.companyCode eq '1' }">裕融</c:if>
														<c:if test="${signOrderTo.companyCode eq '2' }">裕国</c:if>
												</td>
												<th style="height: 30px;width:15%">签办单编号</th>
												<td style="height: 30px;text-align:center;">${signOrderTo.signCode}</td>
											</tr>
											<tr>
												<th style="height: 30px; width:15%">事由：</th>
												<td colspan="5" align="left" style="height: 30px;">
													<input style="width:60%;height:28px;" maxlength="40" type="text" id="SUMMARY" name="SUMMARY" value="${signOrderTo.summary}" />
													<span class="red">40个字以内</span>
												</td>
											</tr>
											<tr>
												<th style="height: 100px;">签办单内容：</th>
												<td colspan="5" style="height: 100px;">
													<textarea rows="14" cols="100" style="width:100%" id="content" name="content">${signOrderTo.content }</textarea>
												</td>
											</tr>
											<tr>
												<th style="height: 30px; text-align:center;">
													会签名单(点击修改)：
												</th>
												<td colspan="5" style="padding:4px 0 0 4px; height:30px;">
													<a id="alter" href="javascript:void(0);" title="点击修改" onclick="countersignList('','',5);">
														<c:if test="${codeName eq '' }">无会签</c:if><c:if test="${codeName ne '' }">${codeName }→结束</c:if>
													</a>
												</td> 
											</tr>
											<tr>
												<th colspan="2" style="height: 30px; text-align:right;">
													签办单附件：<input type="hidden" name="fileDelIds" id="fileDelIds" value="" />
												</th>
												<td colspan="4" style="padding:4px 0 0 4px; height:30px;">
													<c:forEach items="${fileList}" var="f" varStatus="index">
														<div style="float:left; clear:both; width:500px; padding:4px;">
															<input type="hidden" class="fileId" value="${f.ID }" />
															<a style="padding:0 4px; margin:2px 0; " class="ui-state-default" 
															href="${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${f.ORG_FILE_NAME }&path=${f.PATH}&bootPath=${bootPath}">${f.ORG_FILE_NAME }</a>&nbsp;&nbsp;
															<input class="ui-state-default" style="margin-left:10px;" type="button" onclick="delFile(this);" value="删除" />
														</div>
													</c:forEach>
												</td> 
											</tr>
											<tr>
												<th colspan="2" style="height: 30px; text-align:right;">
													添加附件(单个文件大小限2M以下)：
												</th>
												<td colspan="4" style="padding:4px 0 0 4px; height:30px;">
													<div id="file_upload"></div>
												</td> 
											</tr>
											<tr>
												<td colspan="6" style="height:40px; text-align:center;">
													<input id="sub" type="button" class="ui-state-default" value="保存修改" style="height: 30px;width: 90px" onclick="updateOrder();"/>
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
	
	<div title="签办单" style="display: none" id="countersignDiv">
		<form id="countersignDivForm" name="countersignDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=modifyOrderCommand.addDemandLog">
			<input type="hidden" name="demandId" id="demandIdCountersign"/> 
			<input type="hidden" name="COUNTERSIGN_CODE_ORDER" id="chooseCodes" value=""/> 
			<input type="hidden" id="opTypeDept" name="opType" value="4"/>
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center" width="10%">会签部门:</td>
								<td style="text-align: center;" width="90%">
									<div style="float:left; margin:10px 0 0 50px;">
										<span class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix">所有部门：</span>
										<ul id="all" class="connectedSortable">
											<c:forEach items="${depts}" var="d">
										  		<li id="${d.CODE }" class="ui-state-default">${d.FLAG}</li>
										  	</c:forEach>
										</ul>
									</div>
									<div style="float:left; color:red; margin:100px 0 0 20px; width:50px;">
										向右拖动添加&gt;&gt;<br/><br/><br/><br/><br/><br/><br/><br/>&lt;&lt;向左拖动删除
									</div>
									<div style="float:left; margin:10px 0 0 50px;">
										<span class="ui-dialog-titlebar ui-widget-header ui-helper-clearfix">已选择会签部门：</span>
										<ul id="selectDept" class="connectedSortable">
											<c:forEach items="${comCounList}" var="d">
										  		<li id="${d.CODE }" class="ui-state-default">${d.FLAG}</li>
										  	</c:forEach>
										</ul>
									</div>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="2" style="text-align: center; height: 30px;" width="100%">
									<input id="dept" type="button" class="ui-state-default ui-corner-all" value="提交" onclick="devDeptDivBtn();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	</center>
</body>