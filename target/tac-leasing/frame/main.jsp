<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<%@ include file="/common/taglibs.jsp"%>
<%@ page language="java" import="java.net.InetAddress"%>
<% 
	pageContext.setAttribute("ip", InetAddress.getLocalHost().getHostAddress()); 
	//pageContext.setAttribute("ip", "10.2.1.193"); 
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>乘用车融资租赁信息系统</title>
		<link type="text/css" rel="stylesheet" href="../resources/jquery/plugins/css-dock-menu/style.css"></link>
		<!--[if IE 7]><link type="text/css" rel="stylesheet" href="../resources/jquery/plugins/css-dock-menu/ie7.css"></link><![endif]-->
		
		<script type="text/javascript" src="../resources/jquery/plugins/jquery.contextmenu.r2.js"></script>
		
		<script type="text/javascript" src="../resources/jquery/plugins/bean.jquery.auto-windows.js"></script>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/md5.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/jsMD5.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
		<link type="text/css" rel="stylesheet" href="style/style.css"></link>
		<link type="text/css" rel="stylesheet" href="style/tab-button.css"></link>
		<link type="text/css" rel="stylesheet" href="style/menu.css"></link>
		<script type="text/javascript" src="script/script.js"></script>
		<script type="text/javascript" src="script/tab-manager.js"></script>
		<script type="text/javascript">
			var employeeId=<%=request.getSession().getAttribute("s_employeeId")%>;
			$(function(){
				$.autoWindows();
				setInterval(function(){$.get("session.html",function(e){});}, 300000);
				/* $("#scode").click(function(){
					$("<div>").html("Hello World!").dialog({modal:true});
				}); */
				$("#loginOut").click(function(){
					if(confirm("确认退出？")){
						location.href="${ctx}/servlet/defaultDispatcher?__action=acl.loginOut";
					}else{
						return false;
					}
				});
				var firstLogin='<c:out value="${FIRST_LOGIN}"/>';
				if(firstLogin=='Y') {
					$("input[name=but]").hide();
					$("#oldPassword").val("");
					$("#anotherPassword").attr("title","<font color='red' style='font-family:微软雅黑'>系统安全警告:初次登录</font>或者<font color='red' style='font-family:微软雅黑'>3个月未修改密码</font>需强制修改,谢谢配合!");
					$("#anotherPassword").dialog({closeOnEscape:false, modal:true, autoOpen:false, width:540, position:['center',250], hide:'slide', show:'slide', open:function(event,ui){$(".ui-dialog-titlebar-close").hide();$(".ui-resizable-se").hide();}});
					$("#anotherPassword").dialog("open");
				}
			});
			
			//弹出添加角色的层
			function openChangePassDiv(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 540,
					position:['center',250],
					hide:'slide',
					show:'slide'
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$("#"+msg).dialog('close');
			}
			function openCredit(url,path){
				openTab({tabName:'资信调查报告',location:url+'/servlet/defaultDispatcher?__action='+path});			
			}
			function openNewTab(url,path,title){
				openTab({tabName:title,location:url+'/servlet/defaultDispatcher?__action='+path});			
			}
			
			var callBirt = function (__report, __format, data){
				if (arguments.length == 2) {
					data = {};
				}
				$("#__report").val(__report);
				$("#__format").val(__format);
				$("#birtFormData").html("");
				$.each(data, function(key, value){
					$("#birtFormData").append("<input type=\"hidden\" name=\"" + key + "\" value=\"" + value + "\"/>");
				});
				$("#birtForm").submit();
			};
			
		</script>
		<style type="text/css">
			.cc {
				font-size: 23px;
			}
			.title_font{font-size: 13px; color: blue; font-weight: bold;}
		</style>
	</head>
	<body>
	<input type="hidden" value="<%=request.getSession().getAttribute("JOB")%>" id="userJob"><!-- 隐藏登录用户的角色,如果是销售不跳转统计桌面,跳转综合工作画面 -->
		<div id="page_head" style="font-family: 微软雅黑">
			<c:choose>
				<c:when test="${ip eq '10.2.1.236' }">
					<img src="${ctx}/sys/acl/images/tac_logo_s.jpg" width="154" height="35">
				</c:when>
				<c:when test="${ip eq '10.2.1.193' }">
					<img src="${ctx}/sys/acl/images/car_logo_s.jpg" width="154" height="35">
				</c:when>
				<c:otherwise>
					<font color="red" style="font-size: 30px; font-weight: bold;">测试环境</font>
				</c:otherwise>
			</c:choose>
			<div style="width: 60px; right : 440px; top : 1px; position: absolute;">
				
			</div>
			<div id="system_menu" style="line-height: 25px;">
			<c:choose>
				<c:when test="${JdbcUrl eq '10.2.1.193'}">
					<font size="3" color="blue">正式环境</font>
				</c:when>
				<c:otherwise>
					<font color="red" style="font-size: 32px; font-weight: bold; position: absolute; left: 300px;" >测试环境</font>				
				</c:otherwise>
			</c:choose>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				当前用户：  
				<font class="title_font">${s_employeeName }</font>(${s_code })
				<a href="#" onclick="changePassword('${s_employeeId }','${s_employeeName }')" class="title_font" style="text-decoration: none;">[修改密码]</a>
				<a id="loginOut" href="javascript:void(0)" class="title_font" style="text-decoration: none;">[退出]&nbsp;&nbsp;&nbsp;&nbsp;</a>
			</div>
			<div id="tab_container" class="z-bg2 bg">
				<div class="tabs"></div><div class="tab-content-menu"><ul></ul></div>
			</div>
		</div>
		<div id="page_content">
			<div id="page_menu">
				<div id="menu_container">
					<c:forEach items="${firstMenuList}" var="item">
						<div>
							<div class="item type">
								<span class="collapsed"></span><b style="font-family: 微软雅黑;font-size: 12px;<c:if test='${item.first_name eq "业务支撑"}'>color:red</c:if>">${item.first_name }</b>
							</div>
							<div class="childs">
								<c:forEach items="${item.secondList}" var="item2">
									<c:if test="${item2.second_level_num != '-1'}">
										<div class="item" onclick="openTab({tabName:$(this).html(),location:'${ctx }${item2.layout }',second_id:${item2.second_id }})" style="font-family: 微软雅黑;font-size: 12px;">${item2.second_name }</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="page_body">
				<div id="iframe_substitute"></div>
				<div id="iframe_container"></div>
			</div>
		</div>
		<div id="page_foot" style="font-family: 微软雅黑">Copyright © TAC Co.,Ltd. All Rights Reserved 
			DataBase:Sql Server
		</div>
		<div id="tab_context_menu">
			<ul>
				<li id="tab_context_menu_refresh" style="font-family: 微软雅黑">刷新</li>
				<li id="tab_context_menu_close" style="font-family: 微软雅黑">关闭</li>
	        	<li id="tab_context_menu_close_all" style="font-family: 微软雅黑">关闭所有</li>
				<li id="tab_context_menu_close_other" style="font-family: 微软雅黑">关闭其他</li>
				<%if("1".equals(request.getSession().getAttribute("JOB"))) {%>
				<li id="tab_context_menu_back_desk" style="font-family: 微软雅黑">返回我的桌面</li>
				<%}%>
			</ul>
		</div>
		
		
		
		
		<!--  修改密码div -->
		<div id="anotherPassword"   title="修改密码">
			<form id="passwordForm" action="../servlet/defaultDispatcher?__action=acl.changePassword" method="POST"> 
			<input type="hidden" id="oldPassword2"  value="">
			<input type="hidden" id="needPassword" name ="needPassword" />
			<input type="hidden" id="iforNot" value="0"/><input id="thisID" type="hidden"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" >
			  <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">	
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="passwordTable">
			<tr>
			
				<td class="ui-widget-content jqgrow ui-row-ltr" width="25%" style="text-align: right;"> &nbsp;&nbsp; 旧密码：</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type=password size = "30" id="oldPassword" onchange="changeThenClean('oldPassword')" onblur="fillIn()" /> 
				  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="check1" class="ui-state-default ui-corner-all" value="检验旧密码" onclick ="checkThisPassword()"  /> </td>
			</tr>
			<tr><td></td><td><span id="behindoldPassword"></span></td></tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="25%" style="text-align: right;">&nbsp;&nbsp; 新密码：</td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="password" size = "30" name="password" id="password1" onchange="changeThenClean('password1')" onblur="newPasswordValue();" maxlength="20"></td>
			</tr>
			<tr><td></td><td><span id="behindpassword1"></span></td></tr>
			<tr>
				<td class="ui-widget-content jqgrow ui-row-ltr" width="25%" style="text-align: right;"> &nbsp;&nbsp;新密码确认： </td>
				<td class="ui-widget-content jqgrow ui-row-ltr">
				<input type="password" size = "30" name="password2" id="password2" onchange="changeThenClean('password2')"   onblur="checkPassword();" maxlength="20"></td>
			</tr>
			<tr><td></td><td><span id="behindpassword2"></span></td>
			<tr><td></td><td><span id="lastResult"></span></td></tr>
			</table>
			<center>
				<input type="button" name="subbut" class="ui-state-default ui-corner-all" value="提  交" onclick="changeThePass('anotherPassword');" disabled="disabled" style="color: gray"/>
				 <!-- &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="reset" class="ui-state-default ui-corner-all" value="重  置" onclick="newDialog()" /> -->
				 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="关 闭" name="but" class="ui-state-default ui-corner-all"	onclick="closeDialog('anotherPassword');">
			</center>
			</div>
			</div>
			</div>
		</form>
		</div>
		<form action="../frameset" id="birtForm" method="post" target="_blank">
			<input type="hidden" id="__report" name="__report"/>
			<input type="hidden" id="__format" name="__format"/>
			<input type="hidden" id="__asattachment" name="__asattachment" value="true"/>
			<div id="birtFormData"></div>
		</form>
	</body>
</html>