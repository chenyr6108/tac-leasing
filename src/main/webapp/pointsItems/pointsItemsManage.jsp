<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="${ctx }/pointsItems/js/pointsItems.js" type="text/javascript"></script>
		<script src="${ctx }/common/js/check.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<title>评分配置</title>
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" id="__action" name="__action"
				value="pointsItems.pointsItemsManage" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;评分配置</span>
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
							<td>
							<input type="button" name="but" onclick="javascript:openAddPointsItems();" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="新建项目"></td>
							<td><%@ include file="/common/pageControlTop.jsp"%></td>
						</tr>
					</table>
			
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
							<tr class="ui-jqgrid-labels">
								<th class="ui-state-default ui-th-ltr zc_grid_head" width="5%">
									<strong>序号 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">
									<strong>项目类型 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">
									<strong>项目名称 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head">
									<strong>说明 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" width="6%">
									<strong>标准分 </strong>
								</th>
								<th class="ui-state-default ui-th-ltr zc_grid_head" width="15%">
									<strong>操作 </strong>
								</th>
							</tr>
							<c:forEach items="${dw.rs}" var="item" varStatus="status">
								<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td style="text-align: center;">${status.count }</td>
								<td style="text-align: center;">${item.FLAG }</td>
								<td style="text-align: center;">${item.POINTS_NAME }</td>
								<td style="text-align: center;">${item.MEMO }&nbsp;</td>
								<td style="text-align: center;">${item.STANDARD_SCORE }</td>
								<td style="text-align: center;"><a href="javascript:void(0)" onclick="javascript:preUpdatePointsItems(${item.POINTS_ID });">更新 </a><c:if test="${item.STATE eq 1}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pointsItems.updatePointsItems&POINTS_ID=${item.POINTS_ID }&STATE=2'">关闭 </a></c:if><c:if test="${item.STATE eq 2}"><a href="javascript:void(0)" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=pointsItems.updatePointsItems&POINTS_ID=${item.POINTS_ID }&STATE=1'">启用 </a></c:if><a href="javascript:void(0)" onclick="javascript:configurationPointItems(${item.POINTS_ID },'${item.POINTS_NAME }');">配置</a></td>
							</tr>
							</c:forEach>
						</table>
						<%@ include file="/common/pageControl.jsp"%>
			</div>
			</div>
			</div>
		</form>

		<div id="addPointsItemsDiv" style="display: none;"  title="新建项目"> 
				<form action="../servlet/defaultDispatcher" name="addPointsItemsForm"
					id="addPointsItemsForm" method="post">
					<input type="hidden" name="__action" value="pointsItems.addPointsItems">
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="25%">项目名称：</td>
								<td><input type="text" name="POINTS_NAME" id="POINTS_NAME" style="width: 220px"/></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>项目类型：</td>
								<td><select name="TYPE_CODE" style="width: 150px;">
										<c:forEach items="${pointsItemsTypes}" var="item">
											<option value="${item.CODE }">${item.FLAG }</option> 
										</c:forEach></select></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>标准分：</td>
								<td><input type="text" name="STANDARD_SCORE" id="STANDARD_SCORE" style="width: 40px"/></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>说明：</td>
								<td><textarea name="MEMO" rows="3" cols="45" style="font-size: 12"></textarea></td>
							</tr> 
							<tr>
								<td colspan="2" align="center">  
									<input type="button" name="saveBut" id="saveBut"
										value="保  存" onclick="addPointsItems();"
										class="ui-state-default ui-corner-all">
								   <input type="reset" name="resetBut" id="resetBut"
										value="重  置" class="ui-state-default ui-corner-all">
								   <input type="button" value="关 闭" name="but"
										onclick="closeDialog(addPointsItemsDiv);" class="ui-state-default ui-corner-all">	
								</td>
							</tr>
						</table>
							</div>
				</div>
				</div>
				</form>
		</div>



		<div id="updatePointsItemsDiv" style="display: none;" title="更新项目"> 
				<form action="../servlet/defaultDispatcher" name="updatePointsItemsForm"
					id="updatePointsItemsForm" method="post">
					<input type="hidden" name="__action" value="pointsItems.updatePointsItems">
					<input type="hidden" name="POINTS_ID">
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td width="25%">项目名称：</td>
								<td><input type="text" name="POINTS_NAME" id="POINTS_NAME" style="width: 220px"/></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>项目类型：</td>
								<td><select name="TYPE_CODE" style="width: 150px;">
										<c:forEach items="${pointsItemsTypes}" var="item">
											<option value="${item.CODE }">${item.FLAG }</option> 
										</c:forEach></select></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>标准分：</td>
								<td><input type="text" name="STANDARD_SCORE" id="STANDARD_SCORE" style="width: 40px"/></td>
							</tr>
							<tr class="ui-widget-content jqgrow ui-row-ltr">
								<td>说明：</td>
								<td><textarea name="MEMO" rows="3" cols="45" style="font-size: 12"></textarea></td>
							</tr> 
							<tr>
								<td colspan="2" align="center">  
									<input type="button" name="saveBut" id="saveBut"
										value="保  存" onclick="updatePointsItems();"
										class="ui-state-default ui-corner-all">
								   <input type="reset" name="resetBut" id="resetBut"
										value="重  置" class="ui-state-default ui-corner-all">
								   <input type="button" value="关 闭" name="but"
										onclick="closeDialog(updatePointsItemsDiv);" class="ui-state-default ui-corner-all">	
								</td>
							</tr>
						</table>
				</div>
				</div>
				</div>
				</form>
		</div>
		
		
		
		<div id="configurationpointsItemsDiv" style="display: none;"  title="项目配置"> 
				<form action="../servlet/defaultDispatcher" name="configurationPointsItemsForm"
					id="configurationPointsItemsForm" method="post">
					<input type="hidden" name="__action" value="pointsItems.configuration">
					<input type="hidden" name="POINTS_ID"/>
					<input type="hidden" id="data"/>
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			           <div class="zc_grid_body jqgrowleft">
						<div class="ui-state-default ui-jqgrid-hdiv ">
					<table id="configurationTab" cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
						
					</table> 
					</div>
					</div>					
					</div>					
				</form>
			</div>					
	</body>
</html>