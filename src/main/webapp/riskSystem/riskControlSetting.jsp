<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="${ctx }/permission/js/permission.js" type="text/javascript"></script> 
		<title>审查权限别配置</title>
		
		<script type="text/javascript">
			function selectCb(userid, roleid){
				$("#cb_" + userid + "_" + roleid).attr("checked",true);
				$("#cb_" + userid + "_" + roleid).parent().css("border","1px red solid");
			}
			
			function changeCb(e){
				if (!$(e).find("input").attr("checked")) {
					$(e).find("input").attr("checked",true);
					$(e).css("border","1px red solid");
				} else {
					$(e).find("input").attr("checked",false);
					$(e).css("border","1px #A6C9E2 solid");
				}
			}
			
			function changeBd(e){
				if($(e).attr("checked")){
					$(e).attr("checked",false);
					$(e).parent().css("border","1px #A6C9E2 solid");
				} else {
					$(e).attr("checked",true);
					$(e).parent().css("border","1px red solid");
				}
			}
			
			function changeBg(e){
				$("td[id^='td_" + $(e).parent().attr("rowIndex") + "_']").each(function (){
					$(this).css("background-color","#A8A8A8");
				});
				$("td[id$='_" + $(e).attr("cellIndex") + "']").each(function (){
					$(this).css("background-color","#A8A8A8");
				});
				$("#div_rol_" + $(e).attr("cellIndex")).css("background-color","#A8A8A8");
				$("#th_rol_" + $(e).attr("cellIndex")).css("background-color","#A8A8A8");
				$("#th_user_" + $(e).parent().attr("rowIndex")).css("background-color","#A8A8A8");
			}
			function returnBg(e){
				$("td[id^='td_" + $(e).parent().attr("rowIndex") + "_']").each(function (){
					$(this).css("background-color","#FFFFFF");
				});
				$("td[id$='_" + $(e).attr("cellIndex") + "']").each(function (){
					$(this).css("background-color","#FFFFFF");
				});
				$("#div_rol_" + $(e).attr("cellIndex")).css("background-color","#EAF4FD");
				$("#th_rol_" + $(e).attr("cellIndex")).css("background-color","#EAF4FD");
				$("#th_user_" + $(e).parent().attr("rowIndex")).css("background-color","#EAF4FD");
			}
			function getBlankStr(n){
				var str = "";
				for ( var int = 0; int < n; int++) {
					str += "<br/>";
				}
				return str;
			}
		</script>
		<style type="text/css">
			.tital_th{background-color: #EAF4FD; color: #2E6E9E; border: solid 0.25px #A6C9E2;}
			.dataTD{background-color: #FFFFFF; border: solid 0.25px #A6C9E2;}
			#riskControl_user{
				float: left;
				margin: 10px;
			}
		</style>
	</head>
	<body>
		<form action="${ctx }/servlet/defaultDispatcher" method="post">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
 			<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;
 				审查权限别配置
 			</span>
		</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
        <div class="zc_grid_body jqgrowleft">
		<div class="ui-jqgrid-hdiv" style="background-color: white;">
		<div id="riskControl_user">
		<table cellspacing="0" cellpadding="0" border="0" align="center" style="border: solid 1px #A6C9E2;">
			<tr>
				<th class="tital_th">
					用户名
				</th>
				<c:forEach items="${rols}" var="rol" varStatus="thIndex">
					<th width="20px" height="180px" class="tital_th" id="th_rol_${thIndex.count }" style="vertical-align: top;">
						<div id="div_rol_${thIndex.count }" style="
							width:20px;height:175px;background-color: #EAF4FD; 
							writing-mode:tb-rl;padding-top:3px;
							border-bottom:solid 1px #A6C9E2;
							vertical-align:bottom; position:fixed;">${rol.NAME }</div>
						&nbsp;
					</th>
				</c:forEach>
			</tr>
			<tbody>
				<c:if test="${not empty errorMsg }">
					<tr>
						<td align="center" colspan="${fn:length(rols) + 1}" style="border: solid 1px red; padding: 3px;">
							<font size="+2" color="red" style="font-weight: bold;">${errorMsg }</font>
						</td>
					</tr>
				</c:if>
				<c:forEach items="${users}" var="user" varStatus="r">
					<tr>
						<th class="tital_th" id="th_user_${r.count }">${user.NAME }</th>
						<c:forEach items="${rols}" var="rol" varStatus="c">
							<td class="dataTD" id="td_${r.count }_${c.count}" 
								onmouseover="changeBg(this);" onmouseout="returnBg(this);"
								onclick="changeCb(this)" align="center">
								<input type="checkbox" name="cb_permission" id="cb_${user.ID }_${rol.ID}" 
									value="${user.ID }_${rol.ID}" onclick="changeBd(this);">
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="${fn:length(rols) + 1}" class="tital_th">
						<input type="submit" value="保存" onclick="$(this).attr('disabled',true);" style="width: 80px; height: 30px; color: #2E6E9E; font-weight: bolder;"/>
					</th>
				</tr>
			</tbody>
		</table>
		</div>
		<c:forEach items="${user2Rol }" var="u2r">
			<script type="text/javascript">
				selectCb('${u2r.EMPLOYEE_ID}', '${u2r.ROLE_ID}');	
			</script>
		</c:forEach>
	</div>
	</div>
	</div>
	</form>
		<script type="text/javascript">
		$("div[id^='div_rol_']").each(function (){
			$(this).html(getBlankStr(10 - $.trim($(this).text()).length) + $.trim($(this).html()));
		});
		</script>
	</body>
</html>