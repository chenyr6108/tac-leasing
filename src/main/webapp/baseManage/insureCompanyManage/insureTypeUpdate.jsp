<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx }/baseManage/insureCompanyManage/js/insureType.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx }/common/css/navy.css">
		<%@ include file="/common/import.jsp"%>
		<title>修改保险险种页面</title>	
	</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action" value="insureType.update">
			<input type="hidden" name="intp_id" value="${insuretype.INTP_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改保险险种</span>
		  	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			  <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">	
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>保险险种名称：</td>
					<td><input type="text" name="intp_name" size="60"  value="${insuretype.INTP_NAME }" id="intp_name" > <font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>保险险种类型：</td>
					<td><select name="intp_type"><c:choose>
								<c:when test="${insuretype.INTP_TYPE eq 0}">
									<option value="0" selected="selected">必保险种</option>
									<option value="1">选保险种</option>
								</c:when>
								<c:otherwise>
									<option value="0">必保险种</option>
									<option value="1"  selected="selected">选保险种</option>
								</c:otherwise>
							</c:choose></select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>设备类型：</td>
					<td><select name="motor_flag">
							<c:choose>
								<c:when test="${insuretype.MOTOR_FLAG eq 0}">
									<option value="0" selected="selected">机动车</option>
									<option value="1">非机动车</option>
								</c:when>
								<c:otherwise>
									<option value="0">机动车</option>
									<option value="1"  selected="selected">非机动车</option>
								</c:otherwise>
							</c:choose>
						</select></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td align="center">备注：</td>
					<td><textarea style="border:#c0c0c0 solid 1px; width:585px; height:50px; font-size:12px;"  name="remark" id="remark" >${insuretype.REMARK }</textarea></td>
				</tr>
			</table>
			<center>
			<input type="button" name="subbut" class="ui-state-default ui-corner-all" value="提  交" onclick="addInsureType();" />
						<input type="reset" name="reset" class="ui-state-default ui-corner-all" value="重  置" />
						<input type='button' value='返  回' class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1)" /></center>
		</div>
				</div>
			</div>
		</form>
	</body>
</html>