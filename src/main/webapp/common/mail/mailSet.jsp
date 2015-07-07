<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<script>
	var user_map = null;
	$(function (){
		$.each($(".mailDiv"), function (){
			var div = $(this);
			var hiden = div.find("input:hidden").eq(0);
			div.find("span").bind("click", function (){
				if(confirm("确定要删除\"" + div.find("input:hidden").eq(1).val() + "\"吗？")){
					$.getJSON("../servlet/defaultDispatcher",
						{
							"__action" : "mailSettingCommand.delMailFromSetting",
							"id" : hiden.val(),
							"mail" : div.attr("title"),
							"type" : div.find("input:hidden").eq(2).val()
						},
						function (data){
							if(data){
								div.remove();
							} else {
								alert("操作失败！");
							}
						}
					);
				}
			});
		});
		
		$("#progressbar").dialog({
			closeOnEscape : false,
			modal : true,
			resizable : false,
			draggable : false,
			title : "数据加载中... ..."
		});
		if(user_map == null){
			$.ajax({
				url : "../servlet/defaultDispatcher",
				data : {"__action" : "employeeCommand.getAllEmp"},
				dataType : "json",
				success : function (data){
					user_map = $.map(data, function (item){
						return{
							label : item.display_name,
							value : item.option_value
						};
					});
					$("#addMail").dropDownList(user_map);
					$("#progressbar").dialog("close");
				}
			});
		}
	});
	
	function doQuery() {
		$("#form1").action='../servlet/defaultDispatcher?__action=mailSettingCommand.queryOfConfig';
		$("#form1").submit();
	}	
	
	var flagMailType = false;
	var flagMailTypeGroup = false;
	var flagDeptId = false;
	
	function toAddDiv() {
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=mailSettingCommand.getMialTypeList',
			dataType:'json',
			success: function(dataBack)	{
				var email_type=$("#EMAIL_TYPE_LIST");
				if(dataBack.length>0) {
					var email_type_option="";
					$.each(dataBack,function(i) {
						email_type_option+="<option value=\"" + dataBack[i].code + "\">" + dataBack[i].descr + "</option>";
					});
					
					email_type.html(email_type_option);
				}
				
				flagMailType = true;
				if (flagMailType==false || flagMailTypeGroup==false || flagDeptId==false) {
					return;
				}
				flagMailType = false;
				flagMailTypeGroup = false;
				flagDeptId=false;
				
				$("#addDiv").dialog({modal:true,autoOpen:false,width:1200});
		        $("#addDiv").dialog("open");
			}	
		});
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=mailSettingCommand.getMailTypeGroupList',
			dataType:'json',
			success: function(dataBack)	{
				var email_type=$("#EMAIL_TYPE_GROUP_LIST");
				if(dataBack.length>0) {
					var email_type_option="<option value=\"\">--空--</option>";
					$.each(dataBack,function(i) {
						email_type_option+="<option value=\"" + dataBack[i].code + "\">" + dataBack[i].descr + "</option>";
					});
					
					email_type.html(email_type_option);
				}
				
				flagMailTypeGroup = true;
				if (flagMailType==false || flagMailTypeGroup==false || flagDeptId==false) {
					return;
				}
				flagMailType = false;
				flagMailTypeGroup = false;
				flagDeptId=false;
				
				$("#addDiv").dialog({modal:true,autoOpen:false,width:1200});
		        $("#addDiv").dialog("open");
			}	
		});
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=mailSettingCommand.getDeptList',
			dataType:'json',
			success: function(dataBack)	{
				var email_type=$("#DEPT_ID_LIST");
				if(dataBack.length>0) {
					var email_type_option="";
					$.each(dataBack,function(i) {
						email_type_option+="<option value=\"" + dataBack[i].DEPT_ID + "\">" + dataBack[i].DEPT_NAME + "</option>";
					});
					
					email_type.html(email_type_option);
				}
				
				flagDeptId = true;
				if (flagMailType==false || flagMailTypeGroup==false || flagDeptId==false) {
					return;
				}
				flagMailType = false;
				flagMailTypeGroup = false;
				flagDeptId=false;
				
				$("#addDiv").dialog({modal:true,autoOpen:false,width:1200});
		        $("#addDiv").dialog("open");
			}	
		});
	} 
	
	function addEmailSetting() {
		$("#DEPT_ID").val($("#DEPT_ID_LIST").val());
		$("#ADD_STATUS").val($("#STATUS").val());
		$("#ADD_QUERY_EMAIL_TYPE").val($("#QUERY_EMAIL_TYPE").val());
		$("#ADD_QUERY_EMAIL_TYPE_GROUP").val($("#QUERY_EMAIL_TYPE_GROUP").val());
		$("#addForm").action='../servlet/defaultDispatcher?__action=mailSettingCommand.addEmailSetting';
		$("#addForm").submit();
	}
	
	function toUpdateDiv(param) {
		$.ajax({
			type:"post",
			url:'../servlet/defaultDispatcher',
			data:'__action=mailSettingCommand.getSetMail&id='+param,
			dataType:'json',
			success: function(dataBack)	{
				
				var id=dataBack.id;
				var emailFrom=dataBack.emailFrom;
				var emailTo=dataBack.emailTo;
				var emailCc=dataBack.emailCc;
				var emailBcc=dataBack.emailBcc;
				var emailType=dataBack.emailType;
				var emailTypeGroup=dataBack.emailTypeGroup;
				var deptList=dataBack.deptList;
				var emailContent=dataBack.emailContent;
				var emailSubject=dataBack.emailSubject;
				var emailAttachPath=dataBack.emailAttachPath;
				
				$("#ID").val(id);
				$("#EMAIL_FROM1").val(emailFrom);
				$("#EMAIL_TO1").val(emailTo);
				$("#EMAIL_CC1").val(emailCc);
				$("#EMAIL_BCC1").val(emailBcc);
				$("#EMAIL_CONTENT1").val(emailContent);
				$("#EMAIL_SUBJECT1").val(emailSubject);
				$("#EMAIL_ATTACH_PATH1").val(emailAttachPath);
				
				if(dataBack!=null) {
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=mailSettingCommand.getMialTypeList',
						dataType:'json',
						success: function(dataBack)	{
							var email_type=$("#EMAIL_TYPE_LIST1");
							if(dataBack.length>0) {
								var email_type_option="";
								$.each(dataBack,function(i) {
									if(emailType==dataBack[i].code) {
										email_type_option+="<option selected='selected' value=\"" + dataBack[i].code + "\">" + dataBack[i].descr + "</option>";
									} else {
										email_type_option+="<option value=\"" + dataBack[i].code + "\">" + dataBack[i].descr + "</option>";
									}
								});
								
								email_type.html(email_type_option);
							}
							$("#updateDiv").dialog({modal:true,autoOpen:false,width:1200});
					        $("#updateDiv").dialog("open");
						}	
					});
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=mailSettingCommand.getMailTypeGroupList',
						dataType:'json',
						success: function(dataBack)	{
							var email_type=$("#EMAIL_TYPE_GROUP_LIST1");
							if(dataBack.length>0) {
								var email_type_option="<option value=\"\">--空--</option>";
								$.each(dataBack,function(i) {
									if(emailTypeGroup==dataBack[i].code) {
										email_type_option+="<option selected='selected' value=\"" + dataBack[i].code + "\">" + dataBack[i].descr + "</option>";
									} else {
										email_type_option+="<option value=\"" + dataBack[i].code + "\">" + dataBack[i].descr + "</option>";
									}
								});
								
								email_type.html(email_type_option);
							}
							$("#updateDiv").dialog({modal:true,autoOpen:false,width:1200});
					        $("#updateDiv").dialog("open");
						}	
					});
					$.ajax({
						type:"post",
						url:'../servlet/defaultDispatcher',
						data:'__action=mailSettingCommand.getDeptList',
						dataType:'json',
						success: function(dataBack)	{
							var email_type=$("#DEPT_ID_LIST1");
							if(dataBack.length>0) {
								var email_type_option="";
								$.each(dataBack,function(i) {
									var deptExist = false;
									for(var j = 0; j < deptList.length; j++) {
										if(deptList[j] == dataBack[i].DEPT_ID) {
											deptExist = true;
											break;
										}
									}
									if(deptExist == true) {
										email_type_option+="<option selected='selected' value=\"" + dataBack[i].DEPT_ID + "\">" + dataBack[i].DEPT_NAME + "</option>";
									} else {
										email_type_option+="<option value=\"" + dataBack[i].DEPT_ID + "\">" + dataBack[i].DEPT_NAME + "</option>";
									}
								});
								
								email_type.html(email_type_option);
							}
							$("#updateDiv").dialog({modal:true,autoOpen:false,width:1200});
					        $("#updateDiv").dialog("open");
						}	
					});
				}
			}
		});
	}
	
	function expand(iddiv,id){
        $("#"+iddiv).toggle(function(){
            $(this).load("../servlet/defaultDispatcher?__action=mailSettingCommand.getEmailContent&id="+id);
        });
	}
	
	function updateEmailSetting() {
		$("#DEPT_ID1").val($("#DEPT_ID_LIST1").val());
		$("#UPDATE_STATUS").val($("#STATUS").val());
		$("#UPDATE_QUERY_EMAIL_TYPE").val($("#QUERY_EMAIL_TYPE").val());
		$("#UPDATE_QUERY_EMAIL_TYPE_GROUP").val($("#QUERY_EMAIL_TYPE_GROUP").val());
		$("#updateForm").action='../servlet/defaultDispatcher?__action=mailSettingCommand.updateEmailSetting';
		$("#updateForm").submit();
	}
	
	function showAddEmp(setting_id, setting_type){
		$("#setting_id").val(setting_id);
		$("#setting_type").val(setting_type);
		$("#dialog").dialog({
			closeOnEscape : false,
			modal : true,
			resizable : false,
			draggable : false,
			title : "添加收件人"
		});
	}
	
	function addMail(){
		var addMail = $("#addMail").getValue();
		var setting_id = $("#setting_id").val();
		var setting_type = $("#setting_type").val();
		$.getJSON("../servlet/defaultDispatcher",
			{
				"__action" : "mailSettingCommand.addMailFromSetting",
				"id" : setting_id,
				"mail" : addMail,
				"type" : setting_type
			},
			function (data){
				if(data){
					$("#form1").submit();
				} else {
					alert("操作失败！");
				}
			}
		);
	}
</script>
<style type="text/css">
	.mailDiv{
		float: left;
		background-image: url("../images/keda-kuang_05.gif");
		border: 1px white solid;
		margin: 1px;
		padding: 2px;
		cursor: default;
		line-height: 16px;
		height: 18px;
		vertical-align: middle;
	}
	
	.ui-red{
		background-image: url("");
		background-color: white !important;
		border: 1px red solid;
	}
	
	.mailDiv span{
		font-size: 14px;
		font-weight: bold;
		color: black;
		cursor: pointer;
	}
	
	.mailDiv span:hover{
		font-size: 14px;
		font-weight: bold;
		color: red;
	}
	
	
	.add_mail:hover{
		background-image: url("../images/keda-kuang_05.gif");
		color: #FBE189;
		cursor: pointer;
	}
</style>
</head>
<body style="text-align:center;">
	<div id="progressbar" style="display: none;">
			<img src="${ctx }/images/loading.gif">
		</div>
	<div id="dialog" style="display: none; text-align: center;">
		<input type="hidden" id="setting_id"/>
		<input type="hidden" id="setting_type"/>
		<table align="center">
			<tr>
				<td><b>收件人:</b></td>
				<td><input type="text" name="addMail" id="addMail" style="width: 100px; height: 25px;"/></td>
			</tr>
			<tr style="height: 40px;">
				<td colspan="2" align="center">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="确定" style="width: 50px; height: 25px;" onclick="addMail();">
				</td>
			</tr>
		</table>
	</div>
	<form id="form1" method="post" action="../servlet/defaultDispatcher?__action=mailSettingCommand.queryOfConfig">
	<input type="hidden" name="__action" id="__action"
			value="mailSettingCommand.queryOfConfig">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="text-align:left;height: 30px">
			<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;邮件设置</span>
			</div>
		<div>
			<table width="97%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="60%" class="ss_t">
						<table style="margin-left:10px;">
							<tr>
								<td>邮件状态：</td>
								<td colspan="5"><select id="STATUS" name="STATUS"><option value="0" <c:if test="${STATUS eq '0' }">selected="selected"</c:if>>启用</option>
								<option value="-1" <c:if test="${STATUS eq '-1' }">selected="selected"</c:if>>废除</option></select></td>
								<td>&nbsp;&nbsp;&nbsp;邮件所属功能：</td>
								<td colspan="5"><select id="QUERY_EMAIL_TYPE" name="QUERY_EMAIL_TYPE" style="width:120px;"><option value="">全部</option>
								<c:forEach  items="${mailTypeList}" var="item"><option value="${item.code }" <c:if test="${QUERY_EMAIL_TYPE eq item.code }">selected="selected"</c:if>>${item.descr }</option></c:forEach>
								</select></td>
								<td>&nbsp;&nbsp;&nbsp;邮件所属功能分类：</td>
								<td colspan="5"><select id="QUERY_EMAIL_TYPE_GROUP" name="QUERY_EMAIL_TYPE_GROUP" style="width:120px;"><option value="">全部</option>
								<c:forEach  items="${mailTypeGroupList}" var="item"><option value="${item.code }" <c:if test="${QUERY_EMAIL_TYPE_GROUP eq item.code }">selected="selected"</c:if>>${item.descr }</option></c:forEach>
								</select></td>
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
		</div>
		<br><br><br>
		<div class="ui-state-default ui-jqgrid-hdiv" style="text-align:left;background:#FFFFFF;">
			<input type="button" value="新增" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="toAddDiv()">
		</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="1" cellpadding="1" border="0" style="width:1200px;">
					<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:30px;"><strong>序号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>邮件所属功能</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>创建人</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:80px;"><strong>操作</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="left" style="width:80px;" colspan="2"><strong>&nbsp;&nbsp;&nbsp;&nbsp;邮件信息</strong></td>
					</tr>
					<c:forEach items="${resultList}" var="item" varStatus="count">
						<c:if test='${item.deptName != null && item.deptName != "" }'>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="7">${count.count }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="7"><a href="#" onClick="expand('pactAffix${item.id}',${item.id});">${item.emailTypeDescr }</a>&nbsp;</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="7">[${item.name }]&nbsp;</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="7"><c:if test="${item.status eq '0' }"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=mailSettingCommand.disableEmail&id=${item.id }'">废除</a></c:if><c:if test="${item.status eq '-1' }"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=mailSettingCommand.enableEmail&id=${item.id }'">启用</a></c:if>|<a href="#" onclick="toUpdateDiv(${item.id})">更新</a>&nbsp;</td>
							</tr>
						</c:if>
						<c:if test='${item.deptName == null || item.deptName == "" }'>
							<tr>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="6">${count.count }</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="6"><a href="#" onClick="expand('pactAffix${item.id}',${item.id});">${item.emailTypeDescr }</a>&nbsp;</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="6">[${item.name }]&nbsp;</td>
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;" rowspan="6"><c:if test="${item.status eq '0' }"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=mailSettingCommand.disableEmail&id=${item.id }'">废除</a></c:if><c:if test="${item.status eq '-1' }"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=mailSettingCommand.enableEmail&id=${item.id }'">启用</a></c:if>|<a href="#" onclick="toUpdateDiv(${item.id})">更新</a>&nbsp;</td>
							</tr>
						</c:if>
						<tr><td class="ui-state-default ui-th-ltr zc_grid_head" align="right" style="width:80px;"><strong>邮件FROM:&nbsp;&nbsp;</strong></td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:left;"><strong>&nbsp;</strong>${item.emailFrom }&nbsp;</td>
					    </tr>
					    <tr>
					    	<td class="ui-state-default ui-th-ltr zc_grid_head add_mail" align="right" style="width:80px;"
					    		onclick="showAddEmp('${item.id}', 'to');"
					    	>
					    		<b>邮件TO:&nbsp;&nbsp;</b>
					    	</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:left;">
								<c:forEach items="${item.mailToList }" var="e">
									<div class="mailDiv <c:if test="${e.status == -2 }">ui-red</c:if>" title="${e.email }">
										${e.name }&nbsp;
										<span>×</span>
										<input type="hidden" value="${item.id}"/>
										<input type="hidden" value="${e.name}"/>
										<input type="hidden" value="to"/>
									</div>
								</c:forEach>
								&nbsp;
								<!-- <div style="float: left; line-height: 16px; vertical-align: middle; height: 16px; margin-left: 5px;">
									<img alt="添加" src="../images/u100.gif">
								</div> -->
							</td>
						</tr>
						<tr><td class="ui-state-default ui-th-ltr zc_grid_head add_mail" align="right" style="width:80px;"
							onclick="showAddEmp('${item.id}', 'cc');"
						>
							<strong>邮件CC:&nbsp;&nbsp;</strong>
						</td>	
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:left;">
								<c:forEach items="${item.mailCcList }" var="e">
									<div class="mailDiv <c:if test="${e.status == -2 }">ui-red</c:if>" title="${e.email }">
										${e.name }&nbsp;
										<span>×</span>
										<input type="hidden" value="${item.id}"/>
										<input type="hidden" value="${e.name}"/>
										<input type="hidden" value="cc"/>
									</div>
								</c:forEach>
								&nbsp;
								<!-- <div style="float: left; line-height: 18px; vertical-align: middle; height: 18px; margin-left: 5px;">
									<img alt="添加" src="../images/u100.gif">
								</div> -->
							</td>
						</tr>
						<tr><td class="ui-state-default ui-th-ltr zc_grid_head" align="right" style="width:80px;"><strong>邮件BCC:&nbsp;&nbsp;</strong></td>	
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:left;"><strong>&nbsp;</strong>${item.emailBcc }&nbsp;</td>
						</tr>
						<tr><td class="ui-state-default ui-th-ltr zc_grid_head" align="right" style="width:80px;"><strong>邮件主题:&nbsp;&nbsp;</strong></td>	
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:left;"><strong>&nbsp;</strong>${item.emailSubject }&nbsp;</td>
						</tr>
						<c:if test='${item.deptName != null && item.deptName != "" }'>
							<tr>
								<td class="ui-state-default ui-th-ltr zc_grid_head" align="right" style="width:80px;"><strong>对应部门:&nbsp;&nbsp;</strong></td>	
								<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:left;"><strong>&nbsp;</strong>${item.deptName }&nbsp;</td>
							</tr>
						</c:if>
						<tr>
							<td style="text-align:center;" colspan="10" align="center">
								<div id="pactAffix${item.id }" align="center"
									style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;display:none;width:97%">
									<img src="${ctx }/images/loading.gif">
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<page:pagingToolbar pagingInfo="${pagingInfo }"/>
			</div>
	</form>
	<div id="addDiv" style="display:none;" title="添加邮件">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<form action="../servlet/defaultDispatcher?__action=mailSettingCommand.addEmailSetting" id="addForm" method="post">
							<input type="hidden" id="ADD_STATUS" name="STATUS" value=""/>
							<input type="hidden" id="ADD_QUERY_EMAIL_TYPE" name="QUERY_EMAIL_TYPE" value=""/>
							<input type="hidden" id="ADD_QUERY_EMAIL_TYPE_GROUP" name="QUERY_EMAIL_TYPE_GROUP" value=""/>
							<table cellspacing="1" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>FROM</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_FROM" name="EMAIL_FROM" value="tacfinance_service@tacleasing.cn" readonly="readonly"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>TO</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_TO" name="EMAIL_TO"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>CC</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_CC" name="EMAIL_CC"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>BCC</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_BCC" name="EMAIL_BCC"></td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件主题</b>
									<input type="text" style="width:600px;" id="EMAIL_SUBJECT" name="EMAIL_SUBJECT">
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>附件路径</b>
									<input type="text" style="width:600px;" id="EMAIL_ATTACH_PATH" name="EMAIL_ATTACH_PATH">
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件所属功能</b>
									<select id="EMAIL_TYPE_LIST" name="EMAIL_TYPE" style="width:120px;"></select>
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件所属功能分类</b>
									<select id="EMAIL_TYPE_GROUP_LIST" name="EMAIL_TYPE_GROUP" style="width:120px;"></select>
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>部门</b>
									<input type="hidden" id="DEPT_ID" name="DEPT_ID" value=""/>
									<select id="DEPT_ID_LIST" name="DEPT_ID_LIST" style="width:120px;height: 200px;" multiple="multiple"></select>
									</td>
								</tr>
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
										<textarea rows="15" cols="223" name="EMAIL_CONTENT" id="EMAIL_CONTENT"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" id="button_flag" style="text-align:center;">
									<br>
										<input type="button" value="保&nbsp;存" onclick="addEmailSetting()" class="ui-state-default ui-corner-all" style="cursor:pointer;">
										<input type="button" value="关&nbsp;闭" onclick="$('#addDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<font style="color:#FF0000;">*</font>邮件地址之间请用;隔开<br>
			</div>
		</div>
		<div id="updateDiv" style="display:none;" title="更新邮件">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<form action="../servlet/defaultDispatcher?__action=mailSettingCommand.updateEmailSetting" id="updateForm" method="post">
						<input type="hidden" id="ID" name="ID">
						<input type="hidden" id="UPDATE_STATUS" name="STATUS" value=""/>
						<input type="hidden" id="UPDATE_QUERY_EMAIL_TYPE" name="QUERY_EMAIL_TYPE" value=""/>
						<input type="hidden" id="UPDATE_QUERY_EMAIL_TYPE_GROUP" name="QUERY_EMAIL_TYPE_GROUP" value=""/>
							<table cellspacing="1" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>FROM</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_FROM1" name="EMAIL_FROM1" readonly="readonly"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>TO</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_TO1" name="EMAIL_TO1"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>CC</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_CC1" name="EMAIL_CC1"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>BCC</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1130px;" id="EMAIL_BCC1" name="EMAIL_BCC1"></td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件主题</b>
									<input type="text" style="width:600px;" id="EMAIL_SUBJECT1" name="EMAIL_SUBJECT1">
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>附件路径</b>
									<input type="text" style="width:600px;" id="EMAIL_ATTACH_PATH1" name="EMAIL_ATTACH_PATH1">
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件所属功能</b>
									<select id="EMAIL_TYPE_LIST1" name="EMAIL_TYPE1" style="width:120px;"></select>
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件所属功能分类</b>
									<select id="EMAIL_TYPE_GROUP_LIST1" name="EMAIL_TYPE_GROUP1" style="width:120px;"></select>
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>部门</b>
									<input type="hidden" id="DEPT_ID1" name="DEPT_ID1"/>
									<select id="DEPT_ID_LIST1" name="DEPT_ID_LIST1" style="width:120px;height: 200px;" multiple="multiple"></select>
									</td>
								</tr>
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
										<textarea rows="20" cols="223" name="EMAIL_CONTENT1" id="EMAIL_CONTENT1"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" id="button_flag" style="text-align:center;">
									<br>
										<input type="button" value="保&nbsp;存" onclick="updateEmailSetting()" class="ui-state-default ui-corner-all" style="cursor:pointer;">
										<input type="button" value="关&nbsp;闭" onclick="$('#updateDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<font style="color:#FF0000;">*</font>邮件地址之间请用;隔开<br>
			</div>
		</div>
	</body>
</html>