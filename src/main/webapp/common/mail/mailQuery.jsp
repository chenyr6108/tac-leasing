<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<script>
		
		$(function (){
			$("#EMAIL_SEND_DATE").datepicker($.datepicker.regional['zh-CN']);
			$("#EMAIL_SEND_DATE1").datepicker($.datepicker.regional['zh-CN']);
			$("#SEND_FROM_TIME").datepicker($.datepicker.regional['zh-CN']);
			$("#SEND_TO_TIME").datepicker($.datepicker.regional['zh-CN']);
		});
		
		function doQuery() {
			$("#form").action="../servlet/defaultDispatcher?__action=mailSettingCommand.query";
			$("#form").submit();
		}	
		
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
							email_type_option+="<option value=\"" + dataBack[i].emailType + "\">" + dataBack[i].emailTypeDescr + "</option>";
						});
						
						email_type.html(email_type_option);
					}
					
					$("#addDiv").dialog({modal:true,autoOpen:false,width:1200});
			        $("#addDiv").dialog("open");
				}	
				});
		} 
		
		function saveEmailSetting() {
			$("#addForm").submit();
		}
		
		function toUpdateDiv(param) {
			$.ajax({
				type:"post",
				url:'../servlet/defaultDispatcher',
				data:'__action=mailSettingCommand.getMailSetting&id='+param,
				dataType:'json',
				success: function(dataBack)	{
					
					var emailFrom=dataBack.emailFrom;
					var emailTo=dataBack.emailTo;
					var emailCc=dataBack.emailCc;
					var emailBcc=dataBack.emailBcc;
					var emailSubject=dataBack.emailSubject;
					var emailAttachPath=dataBack.emailAttachPath;
					var emailType=dataBack.emailType;
					var emailSendDate=dataBack.emailSendDate;
					var emailSendTime=dataBack.emailSendTime;
					var emailContent=dataBack.emailContent;
					
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
										if(emailType==dataBack[i].emailType) {
											email_type_option+="<option selected='selected' value=\"" + dataBack[i].emailType + "\">" + dataBack[i].emailTypeDescr + "</option>";
										} else {
											email_type_option+="<option value=\"" + dataBack[i].emailType + "\">" + dataBack[i].emailTypeDescr + "</option>";
										}
									});
									
									email_type.html(email_type_option);
								}
								$("#EMAIL_FROM1").val(emailFrom);
								$("#EMAIL_TO1").val(emailTo);
								$("#EMAIL_CC1").val(emailCc);
								$("#EMAIL_BCC1").val(emailBcc);
								$("#EMAIL_SUBJECT1").val(emailSubject);
								$("#EMAIL_ATTACH_PATH1").val(emailAttachPath);
								$("#EMAIL_SEND_DATE1").val(emailSendDate);
								$("#EMAIL_SEND_TIME1").val(emailSendTime);
								$("#EMAIL_CONTENT1").val(emailContent);
								
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
	            $(this).load("../servlet/defaultDispatcher?__action=mailSettingCommand.getEmailAddress&id="+id);
	        });
		}
</script>
</head>
<body style="text-align:center;">
	<form id="form" method="post" action="../servlet/defaultDispatcher?__action=mailSettingCommand.query">
	<input type="hidden" name="__action" id="__action"
			value="mailSettingCommand.query">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
				style="text-align:left;height: 30px">
			<span class="ui-jqgrid-title"
					style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;邮件发送查询</span>
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
								<td>邮件发送结果：</td>
								<td><select id="SEND_RESULT" name="SEND_RESULT" style="width: 70px;">
								<c:forEach  items="${sendResultList}" var="item"><option value="${item.code }" <c:if test="${SEND_RESULT eq item.code }">selected="selected"</c:if>>${item.descr }</option></c:forEach>
								</select></td>
								<td>&nbsp;&nbsp;&nbsp;邮件所属功能：</td>
								<td><select id="MAIL_TYPE" name="MAIL_TYPE"><option value="">全部</option>
								<c:forEach items="${mailTypeList}" var="item"><option value="${item.code }" <c:if test="${MAIL_TYPE eq item.code }">selected="selected"</c:if>>${item.descr }</option></c:forEach>
								</select></td>
								<td>邮件地址：<input name="MAIL_ADDRESS" value="${MAIL_ADDRESS }"></td>
							</tr>
							<tr>
								<td>&gt;&nbsp;发送时间：</td>
								<td><input name="SEND_FROM_TIME" id="SEND_FROM_TIME" value="${SEND_FROM_TIME }" readonly="readonly" style="width: 70px;"></td>
								<td>&nbsp;&nbsp;&nbsp;&lt;&nbsp;发送时间：</td>
								<td><input name="SEND_TO_TIME" id="SEND_TO_TIME" value="${SEND_TO_TIME }" readonly="readonly" style="width: 70px;"></td>
								<td>邮件主题：<input name="MAIL_SUBJECT" value="${MAIL_SUBJECT }"></td>
								<%-- <td>是否有附件：<select name="MAIL_PATH"><option value="">全部</option><option value="1" <c:if test="${MAIL_PATH eq '1' }">selected="selected"</c:if>>有</option><option value="2" <c:if test="${MAIL_PATH eq '2' }">selected="selected"</c:if>>无</option></select></td> --%>
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
		<!-- <input type="button" value="新增" class="ui-state-default ui-corner-all" style="cursor:pointer;" onclick="toAddDiv()"> -->
		</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<%@ include file="/common/pageTagTop.jsp"%>
			<div class="ui-state-default ui-jqgrid-hdiv" style="background:#FFFFFF;">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:20px;"><strong>序号</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>邮件所属功能</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>邮件主题</strong></td>
					<!-- <td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:100px;"><strong>邮件内容</strong></td> -->
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>邮件附件路径</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>邮件发送时间</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>邮件发送结果</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>邮件发送次数</strong></td>
					<td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>创建人</strong></td>
					<!-- <td class="ui-state-default ui-th-ltr zc_grid_head" align="center" style="width:50px;"><strong>操作</strong></td> -->
					</tr>
					<c:forEach items="${resultList}" var="item" varStatus="count">
						<tr>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${count.count }</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><a href="#" onClick="expand('pactAffix${item.id}',${item.id});"><c:choose><c:when test="${item.emailTypeDescr eq '' or item.emailTypeDescr == null}">无所属功能</c:when><c:otherwise>${item.emailTypeDescr }</c:otherwise></c:choose></a>&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.emailSubject }&nbsp;</td>
							<%-- <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.emailContent }&nbsp;</td> --%>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.emailAttachPath }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.sendTime }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.sendResult }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.sendCount }&nbsp;</td>
							<td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;">${item.name }&nbsp;</td>
							<%-- <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align:center;"><c:if test="${item.status eq '0' }"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=mailSettingCommand.disableEmail&id=${item.id }'">废除</a></c:if><c:if test="${item.status eq '-1' }"><a href="#" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=mailSettingCommand.enableEmail&id=${item.id }'">启用</a></c:if>|<a href="#" onclick="toUpdateDiv(${item.id})">更新</a>&nbsp;</td> --%>
						</tr>
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
			<%@ include file="/common/pageTagBottom.jsp"%>
			</div>
	</form>
		<div id="addDiv" style="display:none;" title="添加邮件">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<form action="../servlet/defaultDispatcher?__action=mailSettingCommand.saveEmailSetting" id="addForm" method="post">
							<table cellspacing="1" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>FROM</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_FROM" name="EMAIL_FROM"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>TO</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_TO" name="EMAIL_TO"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>CC</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_CC" name="EMAIL_CC"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>邮件主题</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_SUBJECT" name="EMAIL_SUBJECT"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>附件路径</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_ATTACH_PATH" name="EMAIL_ATTACH_PATH"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>发送时间</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" style="width:70px;" id="EMAIL_SEND_DATE" name="EMAIL_SEND_DATE" readonly="readonly">
										<input type="text" style="width:60px;" id="EMAIL_SEND_TIME" name="EMAIL_SEND_TIME" maxlength="8">(HH:MM:SS)
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件所属功能</b>
									<select id="EMAIL_TYPE_LIST" name="EMAIL_TYPE"></select>
									</td>
								</tr>
								<tr>
									<td class="ui-widget-content jqgrow ui-row-ltr" colspan="2">
										<textarea rows="20" cols="223" name="EMAIL_CONTENT" id="EMAIL_CONTENT"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" id="button_flag" style="text-align:center;">
									<br>
										<input type="button" value="保&nbsp;存" onclick="saveEmailSetting()" class="ui-state-default ui-corner-all" style="cursor:pointer;">
										<input type="button" value="关&nbsp;闭" onclick="$('#addDiv').dialog('close');" class="ui-state-default ui-corner-all" style="cursor:pointer;">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<font style="color:#FF0000;">*</font>邮件地址之间请用;隔开<br>
				<font style="color:#FF0000;">*</font>邮件附件路径请使用服务器绝对路径<br>
				<font style="color:#FF0000;">*</font>发送时间格式如2012-6-20 17:20:00
			</div>
		</div>
		<div id="updateDiv" style="display:none;" title="更新邮件">
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		          <div class="zc_grid_body jqgrowleft">
					<div class="ui-widget-content jqgrow ui-row-ltr ">
						<form action="../servlet/defaultDispatcher?__action=mailSettingCommand.updateEmailSetting" id="updateForm" method="post">
							<table cellspacing="1" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>FROM</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_FROM1" name="EMAIL_FROM1"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>TO</b>
									</td>
								 	<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_TO1" name="EMAIL_TO1"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>CC</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_CC1" name="EMAIL_CC1"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>邮件主题</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_SUBJECT1" name="EMAIL_SUBJECT1"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>附件路径</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr"><input type="text" style="width:1112px;" id="EMAIL_ATTACH_PATH1" name="EMAIL_ATTACH_PATH1"></td>
								</tr>
								<tr>
									<td align="right" class="ui-widget-content jqgrow ui-row-ltr"><b>发送时间</b>
									</td>
									<td class="ui-widget-content jqgrow ui-row-ltr">
										<input type="text" style="width:70px;" id="EMAIL_SEND_DATE1" name="EMAIL_SEND_DATE1" readonly="readonly">
										<input type="text" style="width:60px;" id="EMAIL_SEND_TIME1" name="EMAIL_SEND_TIME1" maxlength="8">(HH:MM:SS)
									</td>
								</tr>
								<tr>
									<td align="left" class="ui-widget-content jqgrow ui-row-ltr" colspan="2"><b>邮件所属功能</b>
									<select id="EMAIL_TYPE_LIST1" name="EMAIL_TYPE1"></select>
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
				<font style="color:#FF0000;">*</font>邮件附件路径请使用服务器绝对路径<br>
				<font style="color:#FF0000;">*</font>发送时间格式如2012-6-20 17:20:00
			</div>
		</div>
	</body>
</html>