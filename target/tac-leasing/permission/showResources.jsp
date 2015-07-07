<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="${ctx }/permission/js/permission.js" type="text/javascript"></script> 
		<title>资源管理</title>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1"
			id="form1" method="post">
			<input type="hidden" id="__action" name="__action"
				value="permission.getAllResource" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;资源管理</span>
	   	</div>
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>资源类型:</td>
				          <td><select name="searchType" style="border: #03515d solid 1px;">
								<option value="0" <c:if test="${searchType eq 0 }">selected='selected'</c:if>>全部</option>
								<option value="1" <c:if test="${searchType eq 1 }">selected='selected'</c:if>>一级菜单</option>
								<option value="2" <c:if test="${searchType eq 2 }">selected='selected'</c:if>>二级菜单</option>
							</select>
				          <td>查询内容：</td>
				          <td><input type="text" name="content" value="${content }" style=" width:395px;height:18px; font-size: 12px;"></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
		
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><input type="button" onclick="openAddResource();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加资源"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
									编号
								</th>
								<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
									资源类型
								</th>
								<th width="5%" class="ui-state-default ui-th-ltr zc_grid_head">
									层次
								</th>
								<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
									资源名称
								</th>
								<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
									资源编号
								</th>
								<th width="50%" class="ui-state-default ui-th-ltr zc_grid_head">
									资源地址
								</th>
								<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
									操作
								</th>
							</tr>
							<tbody>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${status.count }</td>
										<td style="text-align: center;"><c:choose><c:when test="${item.PARENT_ID eq 0}">一级菜单</c:when><c:otherwise>二级菜单</c:otherwise></c:choose></td>
										<td style="text-align: center;">${item.LEVEL_NUM }&nbsp;</td>
										<td style="text-align: center;">${item.NAME }&nbsp;</td>
										<td style="text-align: center;">${item.PERMISSION_CODE }&nbsp;</td>
										<td style="text-align: center;">${item.LAYOUT}&nbsp;</td>
										<td style="text-align: center;">
											<a href="javaScript:void(0);" onclick="updateResource(${item.ID });">更新</a>&nbsp;
											<a href="javaScript:void(0);" onclick="deleteResource(${item.ID }, '${item.NAME }');">作废</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					<%@ include file="/common/pageControl.jsp"%>
					</div>
				</div>
			</div>
		</form>

		<div id="addResourceDiv" style="display: none;" title="资源添加">
				<form action="../servlet/defaultDispatcher" name="addResourceForm" id="addResourceForm"	method="post">
					<input type="hidden" name="__action" value="permission.add">
					
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">资源名称：</td>
							<td><input type="text" name="name" id="name" style="width: 397px;"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">资源编号：</td>
							<td><input type="text" name="code" id="code" style="width: 397px;"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">资源地址：</td>
							<td>
								/servlet/defaultDispatcher?__action=<input type="text" name="layout" id="layout" style="width: 180px;">
							</td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">资源层次：</td>
							<td><input type="text" name="levelNum" id="levelNum" style="width: 397px;"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">资源类型：</td>
							<td><select name="type" id="type" onchange="showFirstResource();"><option value="1">
										--一级菜单--
									</option><option value="2">
										--二级菜单--
									</option></select></td>
						</tr>
						<tr style="display: none" id="showTr" class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">一级菜单：</td>
							<td><select name="parent_id"><c:forEach items="${secondResources}" var="item">
										<option value="${item.ID }">
											${item.NAME }
										</option></c:forEach></select></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">备注：</td>
							<td><textarea cols="40" rows="2" name="memo"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" value="添 加" name="sub" onclick="addResource();">
								<input type="reset" class="ui-state-default ui-corner-all" value="重 置" name="res">
								<input type="button" class="ui-state-default ui-corner-all" value="关 闭" name="but"
									onclick="closeDialog(addResourceDiv);">
							</td>
						</tr>
					</table>
				</div>
				</div>
				</div>
				</form>
		</div>
		
		
		
		
		<div id="updateResourceDiv" style="display: none;" title="资源更新">
				<form action="../servlet/defaultDispatcher" name="updateResourceForm" id="updateResourceForm"
					method="post">
					<input type="hidden" name="id" id="update_id" value="">
					<input type="hidden" name="__action" value="permission.update">
					
				   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center" width="50%">	资源名称：</td>
							<td><input type="text" name="name" id="update_name" size="30"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center" width="50%">	资源编号：</td>
							<td><input type="text" name="code" id="update_code" size="30"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">	资源地址：</td>
							<td><input type="text" name="layout" id="update_layout" size="30"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">	资源层次：</td>
							<td><input type="text" name="levelNum" id="update_levelNum" size="30"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">	资源类型：</td>
							<td><select name="type" id="update_type" onchange="showFirstResource2();">
									<option value="1" id="op1">
										--一级菜单--
									</option>
									<option value="2" id="op2">
										--二级菜单--
									</option></select></td>
						</tr>
						<tr style="display: none" id="showTr2" class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">	一级菜单：</td>
							<td><select name="parent_id" id="update_parent_id">
									<c:forEach items="${secondResources}" var="item">
										<option value="${item.ID }">
											${item.NAME }
										</option>
									</c:forEach></select></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">	备注：</td>
							<td><textarea cols="25" rows="2" name="memo" id="update_memo"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" value="更 新" name="sub" onclick="update();">
								<input type="reset" class="ui-state-default ui-corner-all" value="重 置" name="res">
								<input type="button" class="ui-state-default ui-corner-all" value="关 闭" name="but"
									onclick="closeDialog(updateResourceDiv);">
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