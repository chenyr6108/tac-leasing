<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>奖金管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ctx }/bonus/js/bonus.js" type="text/javascript"></script> 
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>	

<script type="text/javascript">
function bonusExcel()
{
	window.location.href="../servlet/defaultDispatcher?__action=bonusManage.bonusAllExcel";	
}

</script>

</head>
<body> 
	<form action="${ctx}/servlet/defaultDispatcher" id="form1"  method="post">
		<input type="hidden" name="__action" value="bonusManage.findAllBonus" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;奖金管理</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
			<div>
				<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="75">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" id="content" name="content" value="${content }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<td><input type="button" onclick="addBonusDiv()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加"><input type="button" onclick="bonusExcel()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="下载模板"></td>
				<td><%@ include file="/common/pageControlTop.jsp"%></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
			<tr class="ui-jqgrid-labels">
				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
				<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">奖金名称</th>
				<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">创建日期</th>
				<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.rs}" var="result" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count}</td>
					<td style="text-align: center;">${result.BONUS_NAME}</td>
					<td style="text-align: center;"><fmt:formatDate value="${result.BONUS_CREATE_DATE}" pattern="yyyy-MM-dd"/></td>
					<td style="text-align: center;"><a href="javascript:void(0)" onclick="showBonusDiv('${result.BONUS_ID}')">查看</a> <a href="javascript:void(0)" onclick="updateBonusDiv('${result.BONUS_ID}')">修改</a> <a href="javascript:void(0)" onclick="deleteType('${result.BONUS_ID}')">删除</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
				</div>
			</div>
	</form>
	
	<div id="addBonus" style="display: none;" title="奖金添加">
		<form action="${ctx}/servlet/defaultDispatcher?__action=bonusManage.createBonus" method="post" id="addForm" name="addForm">

	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">奖金名称</td>
			<td><input type="text" name="BONUS_NAME" id="BONUS_NAME"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" value="增加" class="ui-state-default ui-corner-all" onclick="checkType()"/><input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(addBonus);"/>
			</center>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
	</div>
	
	<div id="showBonus" style="display: none;" title="奖金查看">
	<form action="" method="post" >
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="40%">奖金名称</td>
			<td><span id="showBonusName"></span></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
	</div>
	
	<div id="updateBonus" style="display: none;" title="修改奖金">
	<form action="${ctx}/servlet/defaultDispatcher?__action=bonusManage.updateBonus" method="post" id="updateForm" name="updateForm">
	<input type="hidden" name="id" id="id"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">奖金名称</td>
			<td><input type="text" name="BONUS_NAMEU" id="BONUS_NAMEU"></input></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" class="ui-state-default ui-corner-all" value="修改" onclick="update()"></input>
					 <input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(updateBonus);"/>
			</center>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
	</div>
	<p align="right" style="font-weight:bolder;">编号：IT-RPT-46</p>
</body>
</html>