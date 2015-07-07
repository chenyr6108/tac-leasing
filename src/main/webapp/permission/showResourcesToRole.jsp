<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="${ctx }/permission/js/permission.js" type="text/javascript"></script> 
		<title>资源-角色</title>
		
		<script type="text/javascript">
			$(function (){
				$("div[id^='div_rol_']").each(function (){
					$(this).html(getBlankStr(10 - $.trim($(this).text()).length) + $.trim($(this).html()));
				});
				checkSelectRow();
				checkSelectCell();
			});
		
			function selectCb(resource_id, roleid){
				$("#cb_" + resource_id + "_" + roleid).attr("checked",true);
				$("#cb_" + resource_id + "_" + roleid).parent().css("border","1px red solid");
				//checkSelectAll($("#cb_" + resource_id + "_" + roleid));
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
			
			function changeCb(e){
				if (!$(e).find("input").attr("checked")) {
					$(e).find("input").attr("checked",true);
					$(e).css("border","1px red solid");
				} else {
					$(e).find("input").attr("checked",false);
					$(e).css("border","1px #A6C9E2 solid");
				}
			}
			
			function selectCell(e){
				$("td[id$='_" + $(e).parent().parent().attr("cellIndex") + "']").each(function (){
					if ($(e).attr("checked")) {
						$(this).find("input").attr("checked",true);
						$(this).css("border","1px red solid");
					} else {
						$(this).find("input").attr("checked",false);
						$(this).css("border","1px #A6C9E2 solid");
					}
				});
				checkSelectRow();
			}
			
			function selectRow(e){
				$("td[id^='td_" + $(e).parent().parent().attr("rowIndex") + "_']").each(function (){
					if ($(e).attr("checked")) {
						$(this).find("input").attr("checked",true);
						$(this).css("border","1px red solid");
					} else {
						$(this).find("input").attr("checked",false);
						$(this).css("border","1px #A6C9E2 solid");
					}
				});
				checkSelectCell();
			}
			
			function checkSelectAll(e){
				checkSelectCellForObj(e);
				checkSelectRowForObj(e);
			}
			
			function checkSelectRowForObj(e){
				var flag = true;
				$("td[id$='_" + $(e).parent().attr("cellIndex") + "']").each(function (){
					if (!$(this).find("input").attr("checked")) {
						flag = false;
					}
				});
				if(flag){
					$("#c_cb_" + $(e).parent().attr("cellIndex")).attr("checked",true);
				}else{
					$("#c_cb_" + $(e).parent().attr("cellIndex")).attr("checked",false);
				}
			}
			
			function checkSelectCellForObj(e){
				var flag_r = true;
				$("td[id^='td_" + $(e).parent().parent().attr("rowIndex") + "_']").each(function (){
					if (!$(this).find("input").attr("checked")) {
						flag_r = false;
					}
				});
				if (flag_r) {
					$("#r_cb_" + $(e).parent().parent().attr("rowIndex")).attr("checked",true);
				}else{
					$("#r_cb_" + $(e).parent().parent().attr("rowIndex")).attr("checked",false);
				}
			}
			
			function checkSelectRow(){
				$("td[id$='_2']").each(function (){
					checkSelectCellForObj($(this).find("input"));
				});
			}
			
			function checkSelectCell(){
				$("td[id^='td_2_']").each(function (){
					checkSelectRowForObj($(this).find("input"));
				});
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
				$("#th_res1_" + $(e).parent().attr("rowIndex")).css("background-color","#A8A8A8");
				$("#th_res2_" + $(e).parent().attr("rowIndex")).css("background-color","#A8A8A8");
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
				$("#th_res1_" + $(e).parent().attr("rowIndex")).css("background-color","#EAF4FD");
				$("#th_res2_" + $(e).parent().attr("rowIndex")).css("background-color","#EAF4FD");
			}
			
			function getBlankStr(n){
				var str = "";
				for ( var int = 0; int < n; int++) {
					str += "<br/>";
				}
				return str;
			}
			
			function disSubBut(){
				$("#subBut").attr('disabled',true);
			}
			function exportRes2Rol(){
				window.open('../servlet/defaultDispatcher?__action=permission.exportRes2Rol');
			}
		</script>
		<style type="text/css">
			.tital_th{
				background-color: #EAF4FD; 
				color: #2E6E9E; 
				border: solid 0.25px #A6C9E2;
				cursor: default;
			}
			.tital_th_data{
				background-color: #EAF4FD; 
				color: #2E6E9E; 
				border: solid 0.25px #A6C9E2; 
				white-space: nowrap; 
				overflow: hidden !important; 
				width: 100px;
				cursor: default;
			}
			.tital_th_res{
				background-color: #EAF4FD; 
				color: #2E6E9E; 
				border: solid 0.25px #A6C9E2;
				cursor: default;
			}
			.tital_div_data{
				width: 88%;
				white-space: nowrap; 
				overflow: hidden !important;
				float: left;
			} 
			.dataTD{background-color: #FFFFFF; border: solid 0.25px #A6C9E2;}
		</style>
	</head>
	<body >
		<form action="${ctx }/servlet/defaultDispatcher" method="post" onsubmit="disSubBut();">
		<input type="hidden" name="__action" value="permission.updateResPermission"/>
		<input type="hidden" name="MODIFY_DATE" value="${MODIFY_DATE }">
		<input style="margin-bottom: 6px; height:26px;" class="ui-state-default ui-corner-all" type="button" onclick="exportRes2Rol();"  value="导出资源角色对照表" />
		<table cellspacing="0" cellpadding="0" border="0" align="center" style="border: solid 1px #A6C9E2; table-layout:fixed; width: 100%">
			<tr class="ui-jqgrid-labels">
				<th class="tital_th" style="width: 6%;">
					一级菜单
				</th>
				<th class="tital_th" style="width: 15%;">
					二级菜单
				</th>
				<c:forEach items="${rols}" var="rol" varStatus="thIndex">
					<th width="20px" height="200px" class="tital_th" id="th_rol_${thIndex.count + 1 }">
						<div id="div_rol_${thIndex.count + 1 }" style="width:20px;height:195px;
							background-color: #EAF4FD; writing-mode:tb-rl;padding-top:3px;
							border-bottom:solid 1px #A6C9E2;
							vertical-align:bottom; position:fixed;top: 42px;padding-left: 2px;">${rol.NAME }
							<input type="checkbox" id="c_cb_${thIndex.count + 1 }" onclick="selectCell(this)"/>
						</div>&nbsp;
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
				<c:set var="parent_name" value=""/>
				<c:forEach items="${resourceList}" var="res" varStatus="r">
					<tr>
						<c:if test="${res.PARENT_NAME != parent_name}">
							<th class="tital_th_data" id="th_res1_${r.count}" title="${res.PARENT_NAME }">
								${res.PARENT_NAME }
							</th>
						</c:if>
						<c:if test="${res.PARENT_NAME == parent_name}">
							<th class="tital_th_data" align="right" id="th_res1_${r.count}">&nbsp;</th>
						</c:if>
						<c:set var="parent_name" value="${res.PARENT_NAME }"/>
						<th align="right" class="tital_th_res" id="th_res2_${r.count}" style="vertical-align: middle;">
							<div title="${res.NAME }" class="tital_div_data">(${res.ID })${res.NAME }</div>
							<input type="checkbox" id="r_cb_${r.count}" onclick="selectRow(this)"/>
						</th>
						<c:forEach items="${rols}" var="rol" varStatus="c">
							<td class="dataTD" id="td_${r.count }_${c.count + 1}" 
								onmouseover="changeBg(this);" onmouseout="returnBg(this);"
								onclick="changeCb(this)" align="center">
								<input type="checkbox" name="cb_permission" id="cb_${res.ID }_${rol.ID}" 
									value="${res.ID }_${rol.ID}" onclick="changeBd(this);" onchange="checkSelectAll(this);">
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="${fn:length(rols) + 2}" style="background-color: #EAF4FD;">
						<input type="submit" id="subBut" value="保存" style="width: 80px; height: 30px; color: #2E6E9E; font-weight: bolder;"/>
					</th>
				</tr>
			</tbody>
		</table>
		<c:forEach items="${res2Rol }" var="r2r">
			<script type="text/javascript">
				selectCb('${r2r.RESOURCE_ID}', '${r2r.ROLE_ID}');
			</script>
		</c:forEach>
		</form>
	</body>
</html>