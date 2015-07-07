<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改主档明细</title>
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
   
    /* 2012/1/6 Yang Yun 增加 实际实现日期非空验证. */
    var tname = $.trim($(":input[name='actualDate']").val());
    if (tname.length <1) {
        alert("请填写实际实现日期！");
        return false;
    }
    /* ****************************************** */
  
  	var tdate = $.trim($(":input[name='casesun']").val());
    if (tdate<=0) {
        alert("请选择案件状况！")
        return false;
    }
    
    var tdate = $.trim($(":input[name='CASESUN1']").val());
    if (tdate<=0) {
        alert("请选择客户拜访！")
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
    
    
    
    $("#addForm").val("${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=activitiesLog.updateLog");
    $("#addForm").submit();
    }
    
    
   function chang()
    {
    	var logvalue=$("#caseSelect").val();
    	if(logvalue==-1)
    	{
    		$("#casesun option").remove();
    		return false;
    	}
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
		
		$("#casesun option").remove();
		for(var i=0;i<logSunList.length;i++)
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
  
  function initchang(code,repid)
    {
    	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=activitiesLog.getLogType&code=' + code,
		dataType:'json',
		async: false,
		success: function(dataBack){		
		var logSunList= dataBack.logSunList;
		
		$("#casesun option").remove();
		for(var i=0;i<logSunList.length;i++)
		{
			if(logSunList[i].ACTLOG_ID==repid)
			{
				$("<option selected='selected' value='"+logSunList[i].ACTLOG_ID+"'>"+logSunList[i].ACTLOG_NAME+"</option>").appendTo($("#casesun"));
			}
			else
			{
				$("<option value='"+logSunList[i].ACTLOG_ID+"'>"+logSunList[i].ACTLOG_NAME+"</option>").appendTo($("#casesun"));
			}	
			
		}
		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
	
	
	/**
	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=activitiesLog.getLogType1&code=' + code1,
		dataType:'json',
		async: false,
		success: function(dataBack){		
		var logSunList= dataBack.logSunList1;
		
		$("#CASESUN1 option").remove();
		for(var i=0;i<logSunList.length;i++)
		{
			if(logSunList[i].DATA_ID==repid1)
			{
				$("<option selected='selected' value='"+logSunList[i].DATA_ID+"'>"+logSunList[i].FLAG+"</option>").appendTo($("#CASESUN1"));
			}
			else
			{
				$("<option value='"+logSunList[i].DATA_ID+"'>"+logSunList[i].FLAG+"</option>").appendTo($("#CASESUN1"));
			}	
			
		}
		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
	
	*/
  }
  
  
  function change2()
    {
    	var logvalue=$("#caseSelect1").val();
    	if(logvalue==-1)
    	{
    		$("#CASESUN1 option").remove();
    		return false;
    	}
    	var spit=logvalue.split(",");
    	var dataid=spit[0];
    	var code=spit[1];
    	document.getElementById("CASEFATHER1").value=dataid;
    	
    	
    	$.ajax({
		type:"post",
		url:'../servlet/defaultDispatcher',
		data:'__action=activitiesLog.getLogType1&code=' + code,
		dataType:'json',
		async: false,
		success: function(dataBack){		
		var logSunList= dataBack.logSunList1;
		
		$("#CASESUN1 option").remove();
		for(var i=0;i<logSunList.length;i++)
		{
			$("<option value='"+logSunList[i].DATA_ID+"'>"+logSunList[i].FLAG+"</option>").appendTo($("#CASESUN1"));
		}
		},
		error:function(callback){
			alert("error!");
			return;
		}
	});
  } 
  


</script>
<body onLoad="initchang('${LogByDet.DICTCODE }','${LogByDet.REPID }')">
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=activitiesLog.updateLog" method="post" id="addForm" name="addForm" >
	<input type="hidden" name="id" id="id" value="${ID }">
	<input type="hidden" name="cust_id" id="cust_id" value="${LogByDet.CUST_ID }">
	<input type="hidden" name="actilog" id="actilog" value="${LogByDet.ACTILOG_ID }">
	<input type="hidden" name="detlog_id" id="detlog_id" value="${LogByDet.DETLOG_ID }">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;修改明细档(含<font color='red'>*</font>为必添项，请务必填写。)</span>
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
			<td><input type="text" style="height:25px"  size="10" id="cust_type" name="cust_type" <c:if test="${LogByDet.CUST_TYPE==0 }">value="自然人"</c:if><c:if test="${LogByDet.CUST_TYPE==1 }">value="法人"</c:if> readonly="readonly"> &nbsp;</td>
			<td>业务输入人员：</td>
			<td><input type="text" size="10" style="height:25px" id="create_id" name="create_id" value="${LogByDet.NAME }" readonly="readonly">&nbsp;</td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>预计日期： <font color='red'>*</font></td>
			<td><input type="text" style="height:25px" name="expectedDate" id="datebegin" value="${LogByDet.EXPECTEDDATE }"/>&nbsp;</td>
			<td>实际实现日： <font color='red'>*</font></td>
			<td><input type="text" style="height:25px" name="actualDate" id="dateend" value="${LogByDet.ACTUALDATE }"/>&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>客户拜访：<font color='red'>*</font></td>
			<td><select name="CASEFATHER1" id="CASEFATHER1" style="width:150px" ><c:forEach items="${logTypeList }" var="item" varStatus="status"><option value="${item.DATA_ID }" <c:if test="${LogByDet.FLAG1 eq item.FLAG }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select> <input type="hidden" value="137" name="CASESUN1" id="CASESUN1"> <!--  <select name="CASESUN1" id="CASESUN1" style="width:100px"></select>  -->&nbsp;</td>
			<td rowspan="2">访谈人名称： <font color='red'>*</font> </td>
			<td rowspan="2"><input type="text" style="height:25px" name="visitName" id="visitName" value="${LogByDet.VISITNAME }"/>&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>案件状况：  <font color='red'>*</font></td>
			<td><input type="hidden" name="caseFather" id="caseFather" value="${LogByDet.CASEFATHER }"><select name="caseSelect" style="width:150px" id="caseSelect" onchange="chang()"><c:forEach items="${logTypeList1 }" var="item" varStatus="status"><option value="${item.DATA_ID },${item.CODE }" <c:if test="${LogByDet.FLAG eq item.FLAG }">selected="selected"</c:if>>${item.FLAG }</option></c:forEach></select><select name="casesun" style="width:100px" id="casesun"></select>&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>访谈人职称： 
			<td><input type="text" style="height:25px" name="visitTitles" id="visitTitles"  value="${LogByDet.VISITTITLES }"/>&nbsp;</td>
			<td>联系人电话： <font color='red'>*</font> </td>
			<td><input type="text" style="height:25px" name="contactKey" id="contactKey"  value="${LogByDet.CONTACTKEY }"/>&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>预计完成目标：  </td>
			<td colspan="3"><textarea  cols="50" rows="3" name="ecpectedRemark" id="ecpectedRemark">${LogByDet.ECPECTEDREMARK }</textarea>&nbsp;</td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>拜访内容：  </td>
			<td colspan="3"><textarea  cols="50" rows="3" name="visitRemark" id="visitRemark" >${LogByDet.VISITREMARK }</textarea>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4"><div align="center"><input class="ui-state-default ui-corner-all" type="button" id="buttonAdd" value="提交" onclick="updateLog()"></input><input class="ui-state-default ui-corner-all" type="button" value="返回" onclick="javascript:history.go(-1);"></input></div></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
</body>
</html>