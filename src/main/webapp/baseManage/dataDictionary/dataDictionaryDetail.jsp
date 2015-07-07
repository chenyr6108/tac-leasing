
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>数据字典类型修改 </title>
</head>
<script type="text/javascript" src="${ctx}/baseManage/dataDictionary/js/dictionary.js"></script>
<script type="text/javascript">
$(function(){

		addLevel();
	// delTr();
			//修改选择按钮的状态 根据数据
	  $("input[name^=DEFAULT_VALUE]").filter(function(){
		   return $(this).val() == 1
	    })
	
			
})
	function addTypeValue(){
		
		if($.trim($("#flag").val()).length == 0){
				alert("请填写类型名称")
				return false;
		}
		$("input[name='TYPE']").val($("#flag").val());
				return true;
	}	

	

var row_index=0;
//建立一个函数build_row()用于建立新的一行
function build_row(){
	 
	row_index= (data2.rows.length +2);
  	row_index++;
    var new_row= document.getElementById('data2').insertRow(data2.rows.length);
    new_row.setAttribute("id", "row"+row_index);  
	 new_row.setAttribute("class", "ui-widget-content jqgrow ui-row-ltr");  
    var new_col=new_row.insertCell(0);																						  							
	 new_col.innerHTML="     "+"<input id='def"+(row_index+1)+"'   type='radio'   name='defaultValue' value="+(row_index+1)+" onclick='chooseDefault("+(row_index+1)+")' >";
    var new_col=new_row.insertCell(1);
	 new_col.innerHTML="<input type='radio' name=Ve"+(row_index+1)+" id='Ve"+(row_index+1)+"' checked='checked' value='0' onclick='chooseT("+(row_index+1)+")'  >启用<input type='radio' id='Ved"+(row_index+1)+"' name=Ve"+(row_index+1)+" value='1' onclick='chooseF("+(row_index+1)+")' >作废";
	var new_col=new_row.insertCell(2);
    new_col.innerHTML="<input type='text' id='FLAG"+(row_index+1)+"' size='30' name='FLAG' >";
    var new_col=new_row.insertCell(3);
    new_col.innerHTML="<input type='text' id='CODE"+(row_index+1)+"' name='CODE' >";
    var new_col=new_row.insertCell(4);
     new_col.innerHTML="<input type='text' id='SHORTNAME"+(row_index+1)+"' size='20' name='SHORTNAME'  >";
	var new_col=new_row.insertCell(5);
	new_col.innerHTML="<SELECT NAME='LEVEL_NUM' STYLE='width:50px' ><OPTION VALUE='1' SELECTED>1</OPTION><OPTION VALUE='2'>2</OPTION><OPTION VALUE='3'>3</OPTION><OPTION VALUE='4'>4</OPTION><OPTION VALUE='5'>5</OPTION><OPTION VALUE='6'>6</OPTION><OPTION VALUE='7'>7</OPTION><OPTION VALUE='8'>8</OPTION><OPTION VALUE='9'>9</OPTION><OPTION VALUE='10'>10</OPTION></SELECT>";
	var new_col=new_row.insertCell(6);
	new_col.innerHTML="<input type='text' id='REMARK"+(row_index+1)+"' size='60' name='REMARK' >";
	var new_col=new_row.insertCell(7);
	new_col.innerHTML="<input type='hidden' value='0' id='STATUS"+(row_index+1)+"'  name='STATUS'><input type='hidden' value='0' id='DEFAULT_VALUE"+(row_index+1)+"' name='DEFAULT_VALUE'><input type='hidden' id='TYPE"+(row_index+1)+"' value='0' name='TYPE'><input type='button' value='删除此行' name='del' LANGUAGE='javascript'  class='ui-state-default ui-corner-all' >";
	 
	 //删除按钮事件添加
	delTr();
	 
	changSelect2();
	addTypeValue()
	
	
	} 
	
	
</script>
<body>
	<form id="detailForm" action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=dataDictionary.updateDictionaryByid" method="post" >
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;数据字典配置操作</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
          <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="8%">类型名称 <font color="red">*</font></td>
				<td><input type="text"  size="70px" value="${result[0].TYPE}" id="flag"/></td>
			
			<td style="text-align:center"><input type="button" class="ui-state-default ui-corner-all" value="新增一条数据" onclick="build_row();" /></td>	
			</tr>
			</table>
			
		
		<div class="ui-state-default ui-jqgrid-hdiv " id="broad">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="data2">
			<tbody>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<!-- 	<td  width="4%" style="text-align:center">序号</td>   -->
				<td  width="4%" style="text-align:center">缺省</td>
				<td width="8%">是否启用</td>
				<td width="15%">名称<font color="red">*</font></td>
				<td width="10%">标示<font color="red">*</font></td>
				<td width="10%">简称</td>
				<td width="4%">顺序</td>
				<td >备注</td>
				<td width="8%">&nbsp;</td>
			</tr>
			<c:set value="${ fn:length(result)}" var ="len1"></c:set>
			<c:forEach items="${result}" var="result" varStatus="status">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
			<!--  	<td width="4%" style="text-align:center">${status.count} &nbsp;</td>   -->
				<td style="text-align:center"> <c:choose><c:when test="${result.DEFAULT_VALUE eq 1}"><input id="def${status.count}"   type='radio' checked="checked"  name='defaultValue' value="${status.count}" onclick='chooseDefault("${status.count}")' ></c:when><c:otherwise><input id="def${status.count}"   type='radio'   name='defaultValue' value="${status.count}" onclick='chooseDefault("${status.count}")' ></c:otherwise></c:choose></td>
				<td><c:choose><c:when test="${result.STATUS eq 0}"><input type="radio" size="20" name="Ve${status.count}" id="Ve${status.count}" value="0" onclick="chooseT('${status.count}')" checked="checked">启用<input id="Ved${status.count}" type="radio" size="20" name="Ve${status.count}" value="-1" onclick="chooseF('${status.count}')">作废</c:when><c:otherwise><input type="radio" size="20" name="Ve${status.count}" id="Ve${status.count}" value="0" onclick="chooseT('${status.count}')" >启用<input id="Ved${status.count}" type="radio" size="20" name="Ve${status.count}" value="-1" onclick="chooseF('${status.count}')" checked="checked">作废</c:otherwise></c:choose></td>
				<td><input type="text" size="30" name="FLAG" id="FLAG${status.count}" value="${result.FLAG}" /></td>
				<td><input type="text"  name="CODE" id="CODE${status.count}" value="${result.CODE}" /></td>
				<td><input type="text" size="20" name="SHORTNAME" id="SHORTNAME${status.count}" value="${result.SHORTNAME}"/></td>
				<td><SELECT NAME="LEVEL_NUM" STYLE="width:50px" id="level${status.count}">
							 <c:forEach begin="1" end="${len1}" var="item">
							 <OPTION VALUE="${item}" >${item}</OPTION>
							 	</c:forEach>
					</SELECT></td>		
				<td><input type="text" size="60" name="REMARK" value="${result.REMARK}" /></td>
				<td>&nbsp;<input type="hidden" id="DATA_ID${status.count}" name="DATA_ID" value="${result.DATA_ID}"/><input type="hidden" id="STATUS${status.count}" name="STATUS" value="${result.STATUS}"/><input type="hidden" id="DEFAULT_VALUE${status.count}" name="DEFAULT_VALUE" value="${result.DEFAULT_VALUE}"/><input type="hidden" id="smooth${status.count}" name="smooth" value="${result.LEVEL_NUM}"/><input type="hidden" name="TYPE" value="${result.TYPE}" /></td>
			</tr>	
			</c:forEach>
		</tbody>
	</table>
	
		</div>
			</div>
				<center>
					<input type="button" class="ui-state-default ui-corner-all" value="修改" onclick="updateSelect()"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="ui-state-default ui-corner-all" value="返回" onclick="javascript:history.go(-1)"/>
					
					</center>
			</div>
	</form>
</body>
</html>