<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>资讯需求单</title>
<%@ include file="/common/taglibs.jsp"%>
<link href="${ctx}/common/css/jquery.autocomplete.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/common/css/jquery.multiSelect.css" rel="stylesheet" type="text/css" />


<style>
	.ui-timepicker-div .ui-widget-header { margin-bottom: 8px;}
	.ui-timepicker-div dl { text-align: left; }
	.ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
	.ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
	.ui-timepicker-div td { font-size: 90%; }
	.ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
	.ui_tpicker_hour_label,.ui_tpicker_minute_label,.ui_tpicker_second_label,.ui_tpicker_millisec_label,.ui_tpicker_time_label{padding-left:20px}
	#addAgentDivForm td { height: 30px;}
	.remarkTip a:hover {cursor: pointer;}
	.triangle-right {
		position:relative;
		padding:10px;
		margin:1em 0 3em;
		color:#fff;
		background:#2E6E9E; 
		/* css3 */
		-webkit-border-radius:10px;
		-moz-border-radius:10px;
		border-radius:10px;
	}
	
	.triangle-right:after {
		content: '';
	    display: block;
	    font-size: 0;
	    position: absolute;
	    bottom: -9px;
	    left: 13px;
	    width: 0;
	    height: 0;
	    border-width: 5px;
	    border-color: #e8e8e8 transparent transparent #e8e8e8;
	    border-style: solid dashed dashed solid;
	}
	
	.triangle-right.top:after {
		top:-20px; /* value = - border-top-width - border-bottom-width */
		right:auto; /* controls horizontal position */
		bottom:30px;
		left:10px;
		border-width:20px 20px 0 0; /* vary these values to change the angle of the vertex */
		border-color:transparent #2E6E9E;
	}
</style>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${ctx}/agent/js/jquery-ui-slide.min.js"></script>
<script type="text/javascript" src="${ctx}/agent/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.multiSelect.js" ></script>
<script type="text/javascript">	
	var index = 0;
	var projects = eval("(" + '${users}' + ")");
	var options = {
		minChars : 1,
		max : 20,
		mustMatch: true,
		matchContains: true,
		formatItem : function(row, i, max) {
			var rs = row.name;
			if (row.email != null && row.email.length > 0) {
				rs += "【" + row.email + "】";
			}
			return rs;
		},
		formatMatch : function(row, i, max) {
			return row.email + " " + row.name;
		},
		formatResult : function(row) {
			return row.name;
		}
	};
	$(function (){
		//$("#PREDICT_DATE").datepicker({minDate: 0});
        $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
		$("#dateBegin").datetimepicker({
			hourGrid: 4,
			minuteGrid: 10,
			onSelect: function(selectedDate) {
		        $("#dateEnd").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#dateEnd").datetimepicker({
		    hour: 23,
		   	minute: 59,
			hourGrid: 4,
			minuteGrid: 10,
			onSelect: function( selectedDate ) {
		        $("#dateBegin").datepicker("option", "maxDate", selectedDate);
			}
		});
		$("#agentStartTime").datetimepicker({
			hourGrid: 4,
			minuteGrid: 10,
			onSelect: function(selectedDate) {
		        $("#agentEndTime").datepicker("option", "minDate", selectedDate);
			}
		});
		$("#agentEndTime").datetimepicker({
		    hour: 23,
		   	minute: 59,
			hourGrid: 4,
			minuteGrid: 10,
			onSelect: function( selectedDate ) {
		        $("#agentStartTime").datepicker("option", "maxDate", selectedDate);
			}
		});
		
		$("#ui-datepicker-div").css("display","none");
		$("#userName,#agentUserName").keydown(function(e){ 
	        if(e.which == 13){
		    	$("#form1").submit();
	        } 
	    });
		$("#agentModule").multiSelect({ selectAllText: '选择全部' });
		//下拉多选选中
		var agentModuleList = '${agentModuleList}';
		if(agentModuleList.length > 0){
			agentModuleList = agentModuleList.trim().substring(1,agentModuleList.length-1);
		}
		var as = agentModuleList.split(",");
		for(var i = 0; i < as.length; i++){
			$("input:checkbox[name='agentModule[]'][value=" + as[i] + "]").each(function(){
				this.click();
			});
		}
		//代理人
		$("#agentName").autocomplete(projects, options).result(function(event, data, formatted) {
			$('#agentId').val(data.id);
		});
		$("#agentName").blur(function (e) {
			$('.ac_over').click();
		} );
		//员工
		$("#userNameAdd").autocomplete(projects, options).result(function(event, data, formatted) {
			$('#userId').val(data.id);
		});
		$("#userNameAdd").blur(function (e) {
			$('.ac_over').click();
		} );
		//tip
		myTip();
	}); 
	
	function doQuery() {
		if($("#dateBegin").val() != "" && $("#dateEnd").val() != "" && $("#dateBegin").datetimepicker('getDate') >= $("#dateEnd").datetimepicker('getDate')){
			myAlter("结束日期必须大于开始日期");
			return false;
		}
		$("#form1").submit();
	}
	
	function myAlter(msg){
		$("#dialogContent").html(msg);
		$("#dialog").dialog({
			modal: true,
			width:400,
			buttons: {
		        '关闭': function() {
		          	$(this).dialog("close");
		        }
			}	
		});
	}
	
	function myAlertSuccess(msg){
		$("#dialogContent").html(msg);
		$("#dialog").dialog({
			modal: true,
			buttons: {
		        '关闭': function() {
		          	$(this).dialog("close");
		          	doQuery();
		        }
			}	
		});
	}
	
	function addAgentForm(){
		$("#addAgent").dialog({
			modal : true,
			width : 500,
			resizable: false,
			position:  ["center",60],
			open:function(){
				if(index == 0){
					$("#agentModuleAdd").multiSelect({ selectAllText: '选择全部' });
					index++;
				}
				$("#addAgent").css("overflow","visible");
				$("div[aria-labelledby='ui-dialog-title-addAgent']").css("overflow","visible");
			}
		});
	}
	
	function addAgentBtn(){
		var agentModules = [];
		$("input:checked[name='agentModuleAdd[]']").each(function(){
			agentModules.push(this.value);
		});
		if($("#agentId").val() == ""){
			myAlter("\"代理人\"不能为空！");
			return false;
		}
		if($("#agentStartTime").val() == ""){
			myAlter("\"开始日期\"不能为空");
			return false;
		}
		if($("#agentEndTime").val() == ""){
			myAlter("\"结束日期\"不能为空");
			return false;
		}
		if($("#agentEndTime").datetimepicker('getDate') <= new Date()){
			myAlter("\"结束日期\"不能小于今天当前时间");
			return false;
		}
		if($("#agentStartTime").val() != "" && $("#agentEndTime").val() != "" && $("#agentStartTime").datetimepicker('getDate') >= $("#agentEndTime").datetimepicker('getDate')){
			myAlter("\"结束日期\"必须大于\"开始日期\"");
			return false;
		}
		if(agentModules.toString() == ""){
			myAlter("请选择\"代理模组\"！");
			return false;
		}
		if($("#agentRemark").val()==""){
			myAlter("\"代理信息备注\"不能为空！");
			return false;
		}
		var userId = $("#userId").val() 
		var agentModules = agentModules.toString();
		var agentStartTime = $("#agentStartTime").val();
		var agentEndTime = $("#agentEndTime").val();
		//验证是否有重复
		$.post("../servlet/defaultDispatcher?__action=agentCommand.checkAgentRepeat&userId=" + userId
				+ "&agentModules=" + agentModules
				+ "&agentStartTime=" + agentStartTime
				+ "&agentEndTime=" + agentEndTime
			, function(data){
				var agents = eval("(" + data + ")");
				if(agents.length > 0){
					var msgs = "代理信息添加失败！添加代理的时间段内与以下" + agents.length + "条代理信息重复：<br/>";
					for(var i = 0; i < agents.length; i++){
						msgs = msgs 
								+ (i + 1) + "："
							 	+"编号(" + agents[i].id + ")"
								+ "，"
							 	+"代理人(" + agents[i].agentUserName + ")"
								+ "，"
							 	+"代理模组(" + agents[i].agentModuleName + ")"
								+ "<br/>";
					}
					myAlter(msgs);
				} else {
					//插入代理信息
					insertAgent(userId, agentModules, agentStartTime, agentEndTime);
				}
			});
	}
	
	function insertAgent(userId, agentModules, agentStartTime, agentEndTime){
		$.post("../servlet/defaultDispatcher?__action=agentCommand.addAgent&userId=" + userId
				+ "&agentId=" + $("#agentId").val()
				+ "&agentModules=" + agentModules
				+ "&agentStartTime=" + agentStartTime
				+ "&agentEndTime=" + agentEndTime
				+ "&agentRemark=" + $("#agentRemark").val()
			, function(data){
				if(data == "0"){
					myAlertSuccess("代理信息添加成功！");
				} else if(data == "2") {
					myAlter("代理信息添加失败,当前添加代理信息和已有代理信息有重复！");
				} else {
					myAlter("代理信息添加失败！");
				}
			});
	}

	//提示窗
	function myTip(){
		$("#agentTb").css("overflow","visible");
		var timer;
		$(".remarkTip a").hover(function() {
			clearTimeout(timer);   
			$(".remarkTip div").hide();
			$(this).parent().find("div").stop(true,true).show("drop");
		},function(){
			var t = $(this);
			timer = setTimeout(function(){
				t.parent().find("div").stop(true,true).hide();
			},200);
		});
		$(".remarkTip div").hover(function() {
			clearTimeout(timer);   
		},function(){
			var t = $(this);
			timer = setTimeout(function(){
				t.parent().find("div").stop(true,true).hide();
			},200);
		});
	}
	
	//删除代理信息
	function deleteAgent(agentId){
		$("#dialogContent").html("你确定要删除该代理信息？");
		$("#dialog").dialog({
			modal: true,
			buttons: {
		        '确定': function() {
		          	$(this).dialog("close");
		          	$.post("../servlet/defaultDispatcher?__action=agentCommand.deleteAgentById&agentId=" + agentId
	    				, function(data){
	    					if(data == "0"){
	    						myAlertSuccess("代理信息删除成功！");
	    					} else {
	    						myAlter("代理信息删除失败！");
	    					}
	    				});
		        },
		        '取消': function() {
		          	$(this).dialog("close");
		        }
			}	
		});
	}
	
</script>
</head>
<body>
	<form action="${ctx}/servlet/defaultDispatcher" name="form1" id="form1"	method="post">
		<input type="hidden" name="__action" id="__action" value="agentCommand.getAllAgents"> 
		<input type="hidden" name="EMPLOYEEID" id="EMPLOYEEID" value="${EMPLOYEEID}">
		<input type="hidden" name="urlParam" id="urlParam" value="${urlParam}">

		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px;">
			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;代理人管理</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div style="margin: 6 0 6 0px;">
				<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
					<tr>
						<td width="8">&nbsp;</td>
						<td width="60" class="ss_o" style="background-position:top right;background-size:100% 100%;"></td>
						<td width="60%" class="ss_t" valign="top" style ="background-size:100% 100%;">
							<table style="margin-left: 10px; min-width: 490px;">
								<tr>
									<td align="right">起始日期:</td>
									<td>
										<input type="text" name="dateBegin" style="width: 120px; height: 18px;" readonly="readonly" id="dateBegin" value="${dateBegin }">
									</td>
									<td align="right">结束日期:</td>
									<td>
										<input type="text" name="dateEnd" id="dateEnd" style="width: 120px; height: 18px;" readonly="readonly" value="${dateEnd }">
									</td>
									<td align="right">状态:</td>
									<td>
										<select name="status" id="status" style="min-width:80px;">
											<option value="" <c:if test="${status eq ''}">selected='selected'</c:if>>查询全部</option>
											<option value="0" <c:if test="${status eq '0'}">selected='selected'</c:if>>正常</option>
											<option value="1" <c:if test="${status eq '1'}">selected='selected'</c:if>>删除</option>
											<option value="2" <c:if test="${status eq '2'}">selected='selected'</c:if>>过期</option>
										</select>
									</td>
								</tr>
								<tr>
									<td align="right">员工姓名:</td>
									<td><input type="text" id="userName" name="userName" value="${userName }" style="width:120px; height: 18px; font-size: 12px;" /></td>
									<td align="right">代理人:</td>
									<td><input type="text" id="agentUserName" name="agentUserName" value="${agentUserName }" style="width:120px; height: 18px; font-size: 12px;" /></td>
									<td align="right">代理模组:</td>
									<td>
										<select name="agentModule" id="agentModule" multiple="multiple" style="min-width:80px;">
											<c:forEach items="${dictionary }" var="d">
												<option value="${d.CODE }" >${d.FLAG }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
						</td>
						<td width="55" class="ss_th" valign="top" style="background-size:100% 100%;">&nbsp;</td>
						<td width="20%"><a href="#" name="search" id="search" onclick="doQuery();" class="blue_button">搜 索</a></td>
					</tr>
				</table>
			</div>
			<div id="agentTb" class="ui-state-default ui-jqgrid-hdiv" style="background: #FFFFFF;"><br/>
				<div class="applyBtns" style="margin-left:10px;">
					<input type="button" name="addbutton" onclick="addAgentForm();" style="padding: 1px 10px;" class="ui-state-default ui-corner-all" value="添加代理信息" />
				</div>
				<page:pagingToolbarTop pagingInfo="${dw }" />
				<table id="agentList" class="grid_table">
					<tbody>
						<tr>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="id">编号</page:pagingSort></th>
							<th>状态</th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="userName">员工姓名</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="agentUserName">代理人</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="createTime">创建日期</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="startTime">代理开始时间</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="endTime">代理结束时间</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="agentModuleName">代理模组</page:pagingSort></th>
							<th><page:pagingSort pagingInfo="${dw }" orderBy="remark">代理信息备注</page:pagingSort></th>
							<th>操作</th>
						</tr>
						<c:forEach items="${dw.resultList}" var="d" varStatus="index">
							<tr>
								<td style="text-align: center;">${d.id}&nbsp;</td>
								<td style="text-align: center;">
									<c:if test="${d.status == 0 && d.overdueMinute <= 0}">正常</c:if>
									<c:if test="${d.status == 1}">删除</c:if>
									<c:if test="${d.status == 0 && d.overdueMinute > 0}">过期</c:if>&nbsp;
								</td>
								<td style="text-align: center;">${d.userName}&nbsp;</td>
								<td style="text-align: center;">${d.agentUserName }&nbsp;</td>
								<td style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${d.createTime}" />&nbsp;
								</td>
								<td style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${d.startTime}" />&nbsp;
								</td>
								<td style="text-align: center;">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" type="both" value="${d.endTime}" />&nbsp;
								</td>
								<td style="text-align: center;">${d.agentModuleName}&nbsp;</td>
								<td class="remarkTd" style="text-align: left; overflow: visible;">
									<span class="remarkTip">
										<c:if test="${fn:length(d.remark) >= 20}">
											<a>${fn:substring(d.remark, 0, 20)}…</a>
										</c:if>
										<c:if test="${fn:length(d.remark) < 20}">
											${d.remark}
										</c:if>
										<div class="triangle-right top" style="display: none; position: absolute; max-width: 200px;white-space:pre-wrap; word-wrap:break-word;">${d.remark}</div>
									</span>
								&nbsp;</td>
								<td style="text-align: center;">
									<c:if test="${d.status == 0 && d.overdueMinute <= 0}">
										<a href="javascript:void(0)" id="destroy" onclick="deleteAgent(${d.id});">删除</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<page:pagingToolbar pagingInfo="${dw }" />
			</div>
		</div>
	</form>
	
	<div id="dialog" title="提示"><p id="dialogContent"></p></div>
	
	<div title="添加代理" style="display: none" id="addAgent">
		<form id="addAgentDivForm" name="addAgentDivForm" method="POST" action="${ctx }/servlet/defaultDispatcher?__action=agentCommand.addAgent">
			<input type="hidden" name="demandId" id="demandIdTrans"/> 
			<input type="hidden" name="opType" value="13"/> 
			<input type="hidden" name="urlParam" value="${urlParam}">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv" style="overflow: visible;">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right">员工姓名：</td>
								<td style="text-align: center">
									<c:if test="${manageRole }">
										<input type="text" id="userNameAdd" style="width:320px;" />
										<input type="hidden" id="userId" name="userId" />
										<input type="text" id="existForStopSubmit" style="width:0; border:0; visibility: hidden;" disabled="disabled" />
									</c:if>
									<c:if test="${!manageRole }">
										${s_employeeName }<input type="hidden" value="${s_employeeId }" name="userId" id="userId"/>
									</c:if>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right">代理人：</td>
								<td style="text-align: center">
									<input type="text" id="agentName" style="width:320px;" />
									<input type="hidden" id="agentId" name="agentId" />
									<input type="text" id="existForStopSubmit2" style="width:0; border:0; visibility: hidden;" disabled="disabled" />
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right">代理日期：</td>
								<td style="text-align: center">
									开始：<input type="text" name="agentStartTime" style="width: 120px; height: 18px;" readonly="readonly" id="agentStartTime" value="" />&nbsp;&nbsp;
									结束：<input type="text" name="agentEndTime" style="width: 120px; height: 18px;" readonly="readonly" id="agentEndTime" value="" />
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;" width="20%">代理模组：</td>
								<td style="padding-left:30px;">
									<select name="agentModuleAdd" id="agentModuleAdd" multiple="multiple" style="width:298px;; ">
										<c:forEach items="${dictionary }" var="d">
											<option value="${d.CODE }" >${d.FLAG }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: right;" width="20%">代理信息备注：</td>
								<td style="padding-left:30px;">
									<textarea rows="5" cols="55" style="width:100%;" id="agentRemark" name="agentRemark"></textarea>
								</td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td colspan="3" style="text-align: center; height: 30px;" width="100%">
									<input type="button" class="ui-state-default ui-corner-all" value="提交" onclick="addAgentBtn();" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>