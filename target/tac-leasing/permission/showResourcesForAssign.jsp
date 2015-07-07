<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="${ctx }/permission/js/permission.js" type="text/javascript"></script> 
		<title>权限查询</title>
		
		<script type="text/javascript">
			function doSortorder(ordername){
				$("#sortorder").val(ordername);
				if("DESC" == $("#ordertype").val()){
					$("#ordertype").val("ASC");
				} else if("ASC" == $("#ordertype").val()){
					$("#ordertype").val("DESC");
				} else {
					$("#ordertype").val("ASC");
				}
				doSearch();
			}
		</script>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1"
			id="form1" method="post">
			<input type="hidden" id="__action" name="__action"
				value="permission.getAllResourceForAssign" />
			<input type="hidden" id="sortorder" name="sortorder"
				value="${sortorder }" />
			<input type="hidden" id="ordertype" name="ordertype"
				value="${ordertype }" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;权限查询</span>
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
				          <td>资源名：</td>
				          <td><input type="text" name="resname" value="${resname }" style="height:18px; font-size: 12px;"></td>
				          <td>角色名：</td>
				          <td><input type="text" name="rolename" value="${rolename }" style="height:18px; font-size: 12px;"></td>
				          <td>用户名:</td>
				          <td><input type="text" name="username" value="${username }" style="height:18px; font-size: 12px;"/> </td>
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
					<td><%@ include file="/common/pageControlTop.jsp"%></td>
				</tr>
			</table>
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
									编号
								</th>
								<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('RESNAME');" style="cursor: pointer;">
									资源名称(点击排序)
								</th>
								<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('ROLENAME');" style="cursor: pointer;">
									角色名称(点击排序)
								</th>
								<th width="20%" class="ui-state-default ui-th-ltr zc_grid_head" onclick="doSortorder('USERNAME');" style="cursor: pointer;">
									用户名称(点击排序)
								</th>
							</tr>
							<tbody>
								<c:forEach items="${dw.rs}" var="item" varStatus="status">
									<tr class="ui-widget-content jqgrow ui-row-ltr">
										<td style="text-align: center;">${status.count }</td>
										<td style="text-align: center;">${item.RESNAME }</td>
										<td style="text-align: center;">${item.ROLENAME }</td>
										<td style="text-align: center;"><c:if test="${empty item.USERNAME }">角色无用户</c:if><c:if test="${not empty item.USERNAME }">${item.USERNAME }</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					<%@ include file="/common/pageControl.jsp"%>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>