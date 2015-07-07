<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建回访记录</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
} );


    
    function addVisit()
    {
    var form = document.addForm;
    var tname = $.trim($(":input[name='visit_conperson']").val());
    if (tname.length <1) {
        alert("请填写接触对象！")
        return false;
    }
    var tdate = $.trim($(":input[name='visitNewDate']").val());
    if (tdate.length <1) {
        alert("请填写回访时间！")
        return false;
    }
  
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backVisit.createVisitManager");
    $("#addForm").submit();
    
}

function changeDiv()
{
	 var form = document.addForm;
    var tname = $.trim($(":input[name='visit_results']").val());
    if(tname==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}

function changeTr(resul)
{
	if(resul==1)
    {
    	document.getElementById("trDis").style.display='';
    	
    }
    else
    {
    	document.getElementById("trDis").style.display='none';
    }
}
</script>
<body   onload="changeTr('${backVisit.VISIT_RESULTS }')">
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=backVisit.createVisitManager" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${employee.ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;新建回访记录(含<font color='red'>*</font>为必添项，请务必填写。)</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>合同编号：</td>
			<td  colspan="2"><input type="hidden" name="RECT_ID" id="RECT_ID" value="${backVisit.RECT_ID }" readonly="readonly"/><input type="text" style="height:25px" name="rect_code" id="rect_code" value="${backVisit.LEASE_CODE }" readonly="readonly"/></td>
			<td> 承租人：</td>
			<td  colspan="2"><input type="text" size="35" style="height:25px" id="cust_name" name="cust_name" value="${backVisit.CUST_NAME }" readonly="readonly">    </td>
			<td> 租金到期日：</td>
			<td><input type="text" style="height:25px" value="<fmt:formatDate value="${backVisit.END_DATE }" pattern="yyyy-MM-dd"/>&nbsp;" size="10" id="end_date" name="end_date" readonly="readonly"> </td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>区域：</td>
			<td><input type="text" value="${backVisit.PROVINCE }" size="10" style="height:25px" id="province" name="province" readonly="readonly"></td>	
			<td> 城市：</td>
			<td><input type="text" value="${backVisit.CITY }" size="10" id="city" style="height:25px" name="city" readonly="readonly"></td>
			<td> 预访日期：</td>
			<td><input type="text" value="" size="10" id="visitOldDate" name="visitOldDate" style="height:25px" readonly="readonly"></td>
			<td> 回访人员：</td>
			<td><input type="hidden" name="create_id" id="create_id" value="${s_employeeId }"><input type="text" value="${s_employeeName }" style="height:25px" size="10" id="visit_user_name" name="visit_user_name" readonly="readonly"></td>
		
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>回访日期： <font color='red'>*</font></td>
			<td><input type="text" style="height:25px" name="visitNewDate" id="datebegin" value=""/></td>
			<td>是否营业： </td>
			<td><select name="is_business" id="is_business"><option value="0">是</option><option value="1">否</option></select></td>
			<td>接触对象： <font color='red'>*</font></td>
			<td><input type="text" style="height:25px" name="visit_conperson" id="visit_conperson"  /></td>
			<td>是否见标的物： </td>
			<td><select name="is_products" id="is_products"><option value="0">是</option><option value="1">否</option></select></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>标的物外观： </td>
			<td><select name="prod_degree" id="prod_degree"><option value="0">正常</option><option value="1">破损</option></select></td>
			<td>是否正常运行： </td>
			<td><select name="is_run" id="is_run"><option value="0">是</option><option value="1">否</option></select></td>
			<td>机器运行率： </td>
			<td><select name="prod_degree_detailed" id="prod_degree_detailed"><option value="0">正常</option><option value="1">良好</option><option value="2">差</option></select></td>
			<td>回访结果： </td>
			<td><select name="visit_results" id="visit_results" onchange="changeDiv()"><option value="0">正常</option><option value="1">异常</option></select></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr" style="display:block" id="trDis">
			<td colspan="1">是否在回访： </td>
			<td colspan="1"><select name="is_backVisit" id="is_backVisit"><option value="0">是</option><option value="1">否</option></select></td>
			<td colspan="1">备注/建议： </td>
			<td colspan="5"><input type="text" style="height:25px" name="visit_note" id="visit_note" size="50px"></td>
		</tr>
		
		<tr>
			<td colspan="4"><div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="提交" onclick="addVisit()"></input></div></td>
			<td colspan="4"><div align="center"><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
</body>
</html>