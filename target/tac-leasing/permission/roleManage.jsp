<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="${ctx }/permission/js/permission.js" type="text/javascript"></script> 
		<title>角色管理</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1"
			id="form1" method="post">
			<input type="hidden" id="__action" name="__action"
				value="role.getAllRoles" />

			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;角色管理</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="65">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
					<tr >
						<td><input type="button" onclick="openAddRole();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加角色"></td>
						<td><%@ include file="/common/pageControlTop.jsp"%></td>
					</tr>
				</table>
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr class="ui-jqgrid-labels">
						<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
							编 号
						</th>
						<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head">
							角色名称
						</th>
						<th width="40%" class="ui-state-default ui-th-ltr zc_grid_head">
							角色描述
						</th>
						<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
							用户人数
						</th>
						<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
							操 作
						</th>
					</tr>
					<tbody>
					<c:forEach items="${dw.rs}" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td style="text-align: center;">${status.count }&nbsp;</td>
						<td style="text-align: center;">${item.NAME }&nbsp;</td>
						<td style="text-align: center;">${item.MEMO }&nbsp;</td>
						<td style="text-align: center;">${item.USERCOUNT }&nbsp;</td>
						<td style="text-align: center;"><a href="javaScript:void(0)" onclick="preUpdateRole(${item.ID});">更新</a>&nbsp;<a href="javaScript:void(0)" onclick="invalidRole(${item.ID}, '${item.NAME }');">作废</a>&nbsp;<a href="defaultDispatcher?__action=role.loadRoleForDeploy&id=${item.ID }&cardFlag=0">配置角色</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table> 
				<%@ include file="/common/pageControl.jsp"%>
			</div>
			</div>
			</div>		
				

		</form>

		<div id="addRoleDiv" style="display: none;" title="角色添加">
				<form action="../servlet/defaultDispatcher" name="addRoleForm" id="addRoleForm"
					method="post">
					<input type="hidden" name="__action" value="role.add">
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">角色名称：</td>
							<td><input type="text" name="name" size="49" id="add_name"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">描述：</td>
							<td><textarea cols="40" rows="2" name="memo" id="add_memo"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" value="添 加" name="sub" onclick="checkAddRole();">
								<input type="reset" class="ui-state-default ui-corner-all" value="重 置" name="res">
								<input type="button" class="ui-state-default ui-corner-all" value="关 闭" name="but" onclick="closeDialog(addRoleDiv);"></td>
						</tr>
					</table>
					</div>
				</div>
				</div>
				</form>
		</div>
		
		
		
		<div id="updateRoleDiv" style="display: none;" title="角色更新">
				<form action="../servlet/defaultDispatcher" name="updateRoleForm" id="updateRoleForm"
					method="post">
					<input type="hidden" name="__action" value="role.update">
					<input type="hidden" name="id" id="update_id" value="">
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">角色名称：</td>
							<td><input type="text" name="name" size="49" id="update_name"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">描述：</td>
							<td><textarea cols="40" rows="2" name="memo" id="update_memo"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" value="添 加" name="sub" onclick="checkUpdateRole();">
								<input type="reset" class="ui-state-default ui-corner-all" value="重 置" name="res">
								<input type="button" class="ui-state-default ui-corner-all" value="关 闭" name="but"onclick="closeDialog(updateRoleDiv);">
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