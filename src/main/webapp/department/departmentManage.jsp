<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %> 
<html>
	<head>
		 <script src="${ctx }/department/js/departmentManage.js" type="text/javascript" ></script> 
		 <link rel="stylesheet" type="text/css" href="${ctx }/common/css/openDiv.css" />
		<title>部门管理</title>
	</head>
	<body onload="loadCompany();">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;部门管理</span>
	   	</div>
	   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			<div>
 				<input type="button" name="addBut" value="添 加" onclick="preAddDept();" class="ui-state-default ui-corner-all">
 				<input type="button" name="updateBut" value="更 新" onclick="preUpdateDept();" class="ui-state-default ui-corner-all">
 				<input type="button" name="delete" value="删 除" onclick="deleteDept();" class="ui-state-default ui-corner-all">
 				<input type="button" name="delete" value="结构图" onclick="getAllDeptmentChart();" class="ui-state-default ui-corner-all">
 				<input type="hidden" name="id" id="id" value="">
 				<input type="hidden" name="name" id="name" value="">				
 				<input type="hidden" name="openFlag" id="openFlag" value="">
			</div>
 			<div class="ui-state-default ui-jqgrid-hdiv">
		 	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		 		<tr>
		 			<td align="center" width="10%"><strong>公司</strong>
		 			</td>
		 			<td align="center" width="90%" class="ui-widget-content jqgrow ui-row-ltr">
		 				<table border="0" width="100%" id="companyTable" >
		 					  <tr >
			 						<td>&nbsp;
			 						</td>
			 						<td> &nbsp;
			 						</td>
			 						<td>&nbsp;
			 						</td>
			 						<td>&nbsp;
			 						</td>
			 						<td>&nbsp;
			 						</td>
			 					</tr>  
		 				</table>
		 			</td>
		 		</tr>
		 		<tr id="xuanze" style="display: none;"><td align="center"  width="10%"><strong>所在位置</strong></td><td><strong><span id="wei"></span></strong></td></tr> 
		 		<tr id="companydept" style="display: none;">
		 			<td align="center"  width="10%"><strong>部门</strong>
		 			</td>		
		 			<td align="left" width="90%" class="ui-widget-content jqgrow ui-row-ltr">
		 				<table border=0 width="100%" id="companyDept">
		 					<tr>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 					</tr> 
		 				</table>
		 			</td>
		 		</tr>		 				 		
		 		<tr id="fen" style="display: none;">
		 			<td align="center"  width="10%"><strong>分公司</strong>
		 			</td>
		 			<td align="left" width="90%" class="ui-widget-content jqgrow ui-row-ltr">
		 				<table border=0 width="100%" id="fenCompany">
		 					<tr>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 					</tr> 
		 				</table>
		 			</td>
		 		</tr>
		 		<tr id="xuanze2" style="display: none;"><td align="center"  width="10%"><strong>所在位置</strong></td><td><strong><span id="wei4"></span></strong></td></tr>
		 		<tr id="secondTr"  style="display: none;">
		 			<td align="center" width="10%"><strong>分部门</strong>
		 			</td>
		 			<td align="left" width="90%" class="ui-widget-content jqgrow ui-row-ltr">
		 				<table border=0 width="100%" id="secondDept">
		 					<tr>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 					</tr> 
		 				</table>
		 			</td>
		 		</tr>	
		 		<tr id="xuanze3" style="display: none;"><td align="center"  width="10%"><strong>所在位置</strong></td><td><strong><span id="wei6"></span></strong></td></tr>	 				 		  		 				 		
		 		<tr id="therdTr"  style="display: none;">
		 			<td align="center" width="10%"><strong>部门</strong>
		 			</td>
		 			<td align="left" width="90%" class="ui-widget-content jqgrow ui-row-ltr">
		 				<table border=0 width="100%" id="therdDept">
		 					<tr>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 					</tr> 
		 				</table>
		 			</td>
		 		</tr> 
		 		<tr id="xuanze4" style="display: none;"><td align="center"  width="10%"><strong>所在位置</strong></td><td><strong><span id="wei9"></span></strong></td></tr>
		 		<tr id="fourthTr"  style="display: none;">
		 			<td align="center" width="10%"><strong>分部门</strong>
		 			</td>
		 			<td align="left" width="90%" class="ui-widget-content jqgrow ui-row-ltr">
		 				<table border=0 width="100%" id="fourthDept">
		 					<tr>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 						<td>&nbsp;
		 						</td>
		 					</tr> 
		 				</table>
		 			</td>
		 		</tr>
		 	</table>
		 	</div>
		 	</div>
		 	
		 	<div id="departmentDiv" class="hidden" title="部门添加">
				<form action="servlet/defaultDispatcher" name="addDepartmentForm" id="addDepartmentForm"
					method="post">
					<input type="hidden" name="__action" name="__action" value="">
					<input type="hidden" name="id"  id="id" value="">
					<input type="hidden" name="companyId"  id="companyId" value="">
					<input type="hidden" name="parentId"  id="parentId" value="">
					<input type="hidden" name="node"  id="node" value="">
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">部门名称：</td>
							<td><input type="text" name="deptName" size="49" id="deptName"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">部门编号：</td>
							<td><input type="text" name="deptCode" size="15" id="deptCode"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">上级部门：</td>
							<td><span id="upperDept"></span></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">描述：</td>
							<td><textarea cols="40" rows="2" name="memo" id="memo"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" id="addOrUpdate" value="添 加" name="sub" >
								<input type="reset" class="ui-state-default ui-corner-all" value="重 置" name="res">
								<input type="button" class="ui-state-default ui-corner-all" value="关 闭" name="but"
									onclick="closeDialog(departmentDiv);">
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