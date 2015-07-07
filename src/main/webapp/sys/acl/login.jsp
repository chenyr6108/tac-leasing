<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.net.InetAddress"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>乘用车融资租赁信息系统</title>
		<script src="${ctx}/script/js/customer.js" type="text/javascript"></script>
		<script src="${ctx}/common/js/md5.js" type="text/javascript"></script>
		<script src="${ctx}/common/js/jsMD5.js" type="text/javascript"></script>

		<script type="text/javascript">
			$(function () {
				if(!+[1,]){
					alert("这是IE浏览器,请用火狐浏览器,谢谢。");
					$("input").each(function (){
						$(this).attr("disabled", true);
					});
					$("body").append("<div style=\"font-size: 22px; text-align: center; color: red; font-weight: bold;\">这是IE浏览器,请用火狐浏览器,谢谢。</div>");
				}
				$("#ssn").val("");
				$("#pwd").val("");
				$("#loginForm").submit(function (){
					setPassword();
					return validateLoign();
				});
				
				$("#ssn").keypress(function (event){
					if (event.keyCode == 13) {
						$("#pwd").focus();
					}
				});
				$("#pwd").keypress(function (event){
					if (event.keyCode == 13) {
						$("#loginForm").submit();
					}
				});
			});
			
			function setPassword(){
				$("#myPassword").val($("#pwd").val());
				$("#pwd").val(CalcuMD5("pwd","form1",false));
			}
			
			function openDiv() {
				$("#userId").val($("input[name=code]").val());
				$("#resetPassword").dialog({
					modal:true,
					autoOpen: false,
					width: 400,
					position:['center',150],
					hide:'slide',
					show:'slide'
				});
				$("#resetPassword").dialog('open');
			}
			
			function closeDialog() {
				$("#resetPassword").dialog('close');
			}
			
			function resetPswd() {
				//加入重置密码 add by ShenQi
				$.ajax({
					type:"post",
					url:'${ctx}/servlet/defaultDispatcher',
					data:'__action=employeeCommand.checkUserId&userId='+$("#userId").val(),
					dataType:'json',
					success: function(user)	{
						if(user==null) {
							alert("此用户名不存在!");
							$("#userId").focus();
						} else {
							//重置密码
							var id=user.ID;
							$.ajax({
								type:"post",
								url:'${ctx}/servlet/defaultDispatcher',
								data:'__action=employeeCommand.getPassword',
								dataType:'json',
								success:function(data) {
									$("#password").val(data.pwd);
									if(confirm('确认密码重置么?')) {
										$.ajax({
											type:"post",
											url:'${ctx}/servlet/defaultDispatcher',
											data:'__action=employeeCommand.resetPassword&id='+id+'&MD5password='+CalcuMD5("password","form1",false)+'&password='+$("#password").val()+'&userReset=userReset',
											dataType:'json',
											success:function(flag) { 
												if(flag) {
													alert("密码更新中,系统将会发送mail提示你更新完毕!");
												}
											}
										});
									}
								}
							});
						}
					}
				});
			}
		</script>
		
		<style type="text/css">
				.table_all {
					
					background-repeat: no-repeat;
					height: 500px;
					width: 1000px;
					margin: 42px auto auto auto;
				}			 
				.kuang_dl {
					background-image: url(${ctx}/sys/acl/images/bai_bg.png);
					background-repeat: no-repeat;
					height: 240px;
					width: 393px;
					margin:auto;
				}
				.blue_size {
					font-family: "黑体";
					font-size: 19px;
					color: #00467e;
					text-decoration: none;
				}
				.bai_size {
					font-family: "黑体";
					font-size: 15px;
					color: #FFFFFF;
					font-weight: normal;
					text-decoration: none;
				}
				.red_size {
					font-family: "黑体";
					font-size: 15px;
					color: #FF0000;
					text-decoration: none;
					font-weight: normal;
				}
				.blue_bt {
					background-image: url(${ctx}/sys/acl/images/button_19.png);
					background-repeat: no-repeat;
					height: 31px;
					width: 82px;
					font-size: 15px;
					color: #FFFFFF;
					text-decoration: none;
					font-family: "黑体";
					border-width: 0px;
					border-style: none;
				}
				.blue_bt2 {
					background-image: url(${ctx}/sys/acl/images/button_cz_22.png);
					background-repeat: no-repeat;
					height: 31px;
					width: 82px;
					font-size: 15px;
					color: #FFFFFF;
					text-decoration: none;
					font-family: "黑体";
					border-width: 0px;
					border-style: none;
				}
				.left_magin {
					margin-left: 75px;
				}
		</style>
	</head>

	<body bgcolor="#ffffff" style="text-align:center">
		<% 
			pageContext.setAttribute("ip", InetAddress.getLocalHost().getHostAddress()); 
			//pageContext.setAttribute("ip", "10.2.1.193"); 
		%>
		<form name="loginForm" action="${ctx}/servlet/defaultDispatcher" method="POST" id="loginForm">

			<input type="hidden" value="acl.login" name="__action" />
			<input type="hidden" name="myPassword" id="myPassword" value=""/>
			<table class="table_all" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td style="height:47px"></td>
				</tr>
				<tr>
					<td style="height:115px;">
						<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td style="width:95px"></td>
								<td style="width:817px">
									<c:choose>
										<c:when test="${ip eq '10.2.1.236' }">
											<img src="${ctx}/sys/acl/images/tac_logo1.jpg">
										</c:when>
										<c:when test="${ip eq '10.2.1.193' }">
											<img src="${ctx}/sys/acl/images/car_logo_l.jpg" width="700" height="284">
										</c:when>
										<c:otherwise>
											<font color="red" style="font-size: 80px;">测试环境</font>
										</c:otherwise>
									</c:choose>
								</td>
								<td style="width:88px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="height:18px"></td>
				</tr>
				<tr>
					<td style="text-align:center; vertical-align:top; padding:0">
						<div class="kuang_dl">
						<br>
							<table border="0" cellspacing="2" cellpadding="0">
								<tr>
									<td colspan="2" width="135" height="12" align="center">
										<c:forEach items="${errList}" var="err">
										     <li>
												<FONT color="red"><c:out value="${err}" />
												</FONT>
										     </li>
										</c:forEach> 
									</td>
								</tr>
								<tr>
									<td width="135" height="57" align="right" class="blue_size">
										用户名：
									</td>
									<td width="258">
										<input type="text" name="code" id="ssn" <%-- value="${cookie.c_code.value}" --%>
											style="height: 20px; width: 155px;" />
									</td>
								</tr>
								<tr>
									<td height="46" align="right" class="blue_size">
										密 &nbsp;码：
									</td>
									<td>
										<input  id="pwd" type="text" 
											value="" 
											name="password"
											autocomplete="off"
											onfocus="this.type='password';"
											style="height: 20px; width: 155px;"/>
									</td>
								</tr>
								<!-- <tr>
									<td height="34" align="right">
										<input name="rememberMe" id="rememberMe" type="checkbox"  value=""/>
										&nbsp;&nbsp;
									</td>
									<td>
										记住用户名<b class="red_size">（公共场所请勿勾选）</b>
									</td>
								</tr> -->
								<tr>
									<td height="48" align="right">
										<input name="" type="button" class="blue_bt" value="登&nbsp;录"
											id="login_submit" style="cursor: pointer;" onclick="$('#loginForm').submit();"/>
									</td>
									<td class="left_magin">
										<input name="input" type="button" class="blue_bt left_magin"
											value="忘记密码" onClick="openDiv()" style="cursor: pointer;"/>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</form>
		<div id="resetPassword" title="重置密码" style="display: none;">
			<form id="passwordForm" action="../servlet/defaultDispatcher" method="POST">
			<input type="hidden" id="password">
				<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
			  		<div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv" style="background: white">	
							<table cellspacing="0" cellpadding="0" border="0" style="width: 100%" id="passwordTable">
								<tr>
									<td style="text-align: right;background: white;font-family: 微软雅黑;font-size: 13px;">用户名：</td>
									<td style="text-align: center;background: white;font-family: 微软雅黑"><input id="userId" name="userId"></td>
								</tr>
							</table>
						</div>
						<br>
						<center>
							<input value="重置" type="button" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="resetPswd()">&nbsp;<input value="关闭" type="button" class="ui-state-default ui-corner-all" style="cursor: pointer;" onclick="closeDialog();">
						</center>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>
