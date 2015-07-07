<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看主档明细</title>
</head>
<script type="text/javascript" src="${ctx }/common/js/money.js"></script>
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
$(function(){
		$("#Founded_date").datepicker($.datepicker.regional['zh-CN']);
} );


    
    function updateLog()
    {
    var form = document.addForm;
    var tname = $.trim($(":input[name='expectedDate']").val());
    if (tname.length <1) {
        alert("请填写预计日期！")
        return false;
    }
    var tdate = $.trim($(":input[name='expectedDate']").val());
    if (tdate.length <1) {
        alert("请填写实际实现日！")
        return false;
    }
  
  	var tdate = $.trim($(":input[name='casesun']").val());
    if (tdate.length <1 || tdate=='-1') {
        alert("请选择案件状况！")
        return false;
    }
    
    var tdate = $.trim($(":input[name='visitName']").val());
    if (tdate.length <1) {
        alert("请填写访谈人名称！")
        return false;
    }
    
    	var tdate = $.trim($(":input[name='contactKey']").val());
    if (tdate.length <1 || tdate=='-1') {
        alert("请填写联系人电话！")
        return false;
    }
    
    var tdate = $.trim($(":input[name='ecpectedRemark']").val());
    if (tdate.length <1) {
        alert("预计完成目标！")
        return false;
    }
    
     var tdate = $.trim($(":input[name='visitRemark']").val());
    if (tdate.length <1) {
        alert("拜访内容！")
        return false;
    }
    
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=activitiesLog.updateLog");
    $("#addForm").submit();
    
    
    function chang()
    {
    	var logvalue=$("#caseSelect").value;
    	var spit=logvalue.split(",");
    	var dataid=spit[0];
    	var code=spit[1];
    	document.getElementById("caseFather").value=dataid;
    	
    	
    	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=activitiesLog.getLogType&code=' + code,
		dataType:'json',
		async: false,
		success: function(dataBack){		
		var logSunList= dataBack.logSunList;
		$("#casesun").remove();
		for(var i=0;i<logSunList.size();i++)
		{
			$("<option value='"+logSunList[i].ACTLOG_ID+"'>"+logSunList[i].ACTLOG_NAME+"</option>").appendTo($("#casesun"));
		}
		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
    }
    
}


</script>
<body>
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=activitiesLog.createFiles" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" value="${ID }">
	<input type="hidden" name="cust_id" id="cust_id" value="${LogByDet.CUST_ID }">
	<input type="hidden" name="actilog" id="actilog" value="${LogByDet.actilog }">
	<input type="hidden" name="detlog_id" id="detlog_id" value="${LogByDet.detlog_id }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看主档明细</span>
	   		</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>客户编号：</td>
			<td><input type="text" name="cust_code" id="cust_code" value="${LogByDet.CUST_CODE }" readonly="readonly"/>&nbsp;</td>
			<td> 客户姓名：</td>
			<td><input type="text" size="35" style="height:25px" id="cust_nmae" name="cust_name" value="${LogByDet.CUST_NAME }" readonly="readonly"> &nbsp;   </td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td> 客户类别：</td>
			<td><input type="text" style="height:25px"  size="10" id="cust_type" name="cust_type" <c:if test="${LogByDet.CUST_TYPE==0 }">value="自然人"</c:if><c:if test="${LogByDet.CUST_TYPE==1 }">value="法人"</c:if> readonly="readonly">&nbsp; </td>
			<td>业务输入人员：</td>
			<td><input type="text" size="10" style="height:25px" id="create_id" name="create_id" value="${USERNAME }" readonly="readonly">&nbsp;</td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>预计日期： </td>
			<td>${LogByDet.EXPECTEDDATE }&nbsp;</td>
			<td>实际实现日：  </td>
			<td>${LogByDet.ACTUALDATE }&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>客户拜访：</td>
			<td>${LogByDet.FLAG1 } <!--   -   ${LogByDet.ACTLOG_NAME1 }  -->&nbsp;</td>
			<td rowspan='2'>访谈人名称：</td>
			<td rowspan='2'>${LogByDet.VISITNAME }&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>案件状况：</td>
			<td>${LogByDet.FLAG }   -   ${LogByDet.ACTLOG_NAME }&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>访谈人职称： </td>
			<td>${LogByDet.VISITTITLES }&nbsp;</td>
			<td>联系人电话：  </td>
			<td>${LogByDet.CONTACTKEY }&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>预计完成目标： </td>
			<td colspan="3">  <textarea name="textarea" cols="50" rows="3">${LogByDet.ECPECTEDREMARK }</textarea>&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>拜访内容： </td>
			<td colspan="3"> <textarea name="textarea" cols="50" rows="3">${LogByDet.VISITREMARK }</textarea>&nbsp;</td>
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