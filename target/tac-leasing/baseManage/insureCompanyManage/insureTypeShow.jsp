<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/insureCompanyManage/js/insureType.js"></script>
		<title>保险险种查看页面</title>
		<%@ include file="/common/import.jsp"%>
	</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;险保查看页面</span>
	  	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">	
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>保险险种名称</td><td>${insuretype.INTP_NAME } &nbsp;</td>
				<td>保险险种类型</td><td><c:choose><c:when test="${insuretype.INTP_TYPE eq 0}">必保险种</c:when><c:otherwise>选保险种</c:otherwise></c:choose> &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>设备类型</td><td><c:choose><c:when test="${insuretype.MOTOR_FLAG eq 0}">机动车</c:when><c:otherwise>非机动车</c:otherwise></c:choose> &nbsp;</td>
				<td>备注</td><td>${insuretype.REMARK }&nbsp;</td></tr>
		</table>
		<center>
			<input  type="button" value='返  回' class="ui-state-default ui-corner-all" onclick='javascript:history.back(-1)' />
		</center></div>
</div>
</div>
</body>
</html>