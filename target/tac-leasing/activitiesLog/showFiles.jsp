<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看主档</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
} );


    
    function updateFiles()
    {
    var form = document.addForm;
    var tname = $.trim($(":input[name='productsabout']").val());
    if (tname.length <1) {
        alert("请填写租赁物概要！")
        return false;
    }
    var tdate = $.trim($(":input[name='referee']").val());
    if (tdate.length <1) {
        alert("请填写引荐人！")
        return false;
    }
  
  	var tdate = $.trim($(":input[name='supplier']").val());
    if (tdate.length <1) {
        alert("请填写供应商！")
        return false;
    }
    
    var tdate = $.trim($(":input[name='limit']").val());
    if (tdate.length <1) {
        alert("请填写申请额度！")
        return false;
    }
    
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=activitiesLog.updateFiles");
    $("#addForm").submit();
    
}


</script>
<body>
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=activitiesLog.createFiles" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${employee.ID }">
	<input type="hidden" name="actilog_id" id="actilog_id" value="${activitiesLog.ACTILOG_ID }">
	<input type="hidden" name="cust_id" id="cust_id" value="${activitiesLog.CUST_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看主档</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>客户编号：</td>
			<td><input type="text" name="cust_code" id="cust_code" value="${activitiesLog.CUST_CODE }" readonly="readonly"/>&nbsp;</td>
			<td> 客户姓名：</td>
			<td><input type="text" size="35" style="height:25px" id="cust_nmae" name="cust_name" value="${activitiesLog.CUST_NAME }" readonly="readonly">&nbsp;    </td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 客户类别：</td>
			<td><input type="text" style="height:25px"  size="10" id="cust_type" name="cust_type" <c:if test="${activitiesLog.CUST_TYPE==0 }">value="自然人"</c:if><c:if test="${activitiesLog.CUST_TYPE==1 }">value="法人"</c:if> readonly="readonly">&nbsp; </td>
			<td>业务输入人员：</td>
			<td><input type="text" size="10" style="height:25px" id="create_id" name="create_id" value="${activitiesLog.NAME }" readonly="readonly">&nbsp;</td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>租赁物概要： </td>
			<td>${activitiesLog.PRODUCTSABOUT }&nbsp;</td>
			<td>引荐人： </td>
			<td>${activitiesLog.REFEREE }&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>供应商： </td>
			<td>${activitiesLog.SUPPLIER }&nbsp;</td>
			<td>申请额度： </td>
			<td>${activitiesLog.LIMIT }&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4"><div align="center"><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
</body>
</html>