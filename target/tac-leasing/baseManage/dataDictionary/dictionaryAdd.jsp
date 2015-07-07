<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>数据字典的类型增加</title>
</head>
<script type="text/javascript" src="${ctx}/baseManage/dataDictionary/js/dictionary.js"></script>
<script type="text/javascript">		
	$(function(){
		delTr();
		checkData();
		$("#addButton").mousedown(function(){
			if($.trim($("#TYPE0").val()) =="" || $.trim($("#TYPE0").val()) == null){
				alert("请填写类型名称");
			}else{
				$("input[name^='TYPE']").val($.trim($("#TYPE0").val()));
				
			}
			
			
		})
	});
	
	var row_index=0;
//建立一个函数build_row()用于建立新的一行
function build_row(){
    row_index++; 
    var new_row= document.getElementById('data1').insertRow(data1.rows.length);
    new_row.setAttribute("id", "row"+row_index);  
	 new_row.setAttribute("class", "ui-widget-content jqgrow ui-row-ltr");  
    var new_col=new_row.insertCell(0);																						  							
	 new_col.innerHTML="     "+"<input id='def"+(row_index+1)+"'   type='radio'   name='defaultValue' value="+(row_index+1)+" onclick='chooseDefault("+(row_index+1)+")' >";
    var new_col=new_row.insertCell(1);
	 new_col.innerHTML="<input type='radio' name=Ve"+(row_index+1)+" id='Ve"+(row_index+1)+"' checked='checked' value='0' onclick='chooseT("+(row_index+1)+")'  >启用<input type='radio' id='Ved"+(row_index+1)+"' name=Ve"+(row_index+1)+" value='-1' onclick='chooseF("+(row_index+1)+")' >作废";
	var new_col=new_row.insertCell(2);
    new_col.innerHTML="<input type='text' id='FLAG"+(row_index+1)+"' size='30' name='FLAG' >";
    var new_col=new_row.insertCell(3);
    new_col.innerHTML="<input type='text' id='CODE"+(row_index+1)+"' name='CODE' >";
    var new_col=new_row.insertCell(4);
     new_col.innerHTML="<input type='text' id='SHORTNAME"+(row_index+1)+"' size='20' name='SHORTNAME'  >";
	var new_col=new_row.insertCell(5);
	new_col.innerHTML="<SELECT NAME='LEVEL_NUM' STYLE='width:50px' ><OPTION VALUE='1' SELECTED>1</OPTION><OPTION VALUE='2'>2</OPTION><OPTION VALUE='3'>3</OPTION><OPTION VALUE='4'>4</OPTION><OPTION VALUE='5'>5</OPTION><OPTION VALUE='6'>6</OPTION><OPTION VALUE='7'>7</OPTION><OPTION VALUE='8'>8</OPTION><OPTION VALUE='9'>9</OPTION><OPTION VALUE='10'>10</OPTION></SELECT>";
	var new_col=new_row.insertCell(6);
	new_col.innerHTML="<input type='text' id='REMARK"+(row_index+1)+"' size='60' name='REMARK' ><input type='hidden' id='TYPE"+(row_index+1)+"' value='0' name='TYPE'><input type='hidden' value='0' id='DEFAULT_VALUE"+(row_index+1)+"' name='DEFAULT_VALUE'><input type='hidden' value='0' id='STATUS"+(row_index+1)+"'  name='STATUS'>";
	var new_col=new_row.insertCell(7);
	new_col.innerHTML="<input type='button' value='删除此行' name='del'   class='ui-state-default ui-corner-all' >";
	 
	 
	 //删除按钮事件添加
	delTr();
	
	 changSelect();
	
	checkData()
	
	} 
	
	
</script>
<body>			 			
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=dataDictionary.createDictionary" id="addForm" method="post">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;类型数据添加</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
    <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="8%">类型名称<font color="red">*</font></td>
				<td><input type="text" name="TYPE" size="70px"  id="TYPE0"/><span id="check"></span></td>
			<td style="text-align:right"  ><input type="button" class="ui-state-default ui-corner-all" value="新增" onclick="build_row();" />    </td>	
			</tr>
			</table>
			</div>
	<div class="ui-state-default ui-jqgrid-hdiv " id="broad">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="data1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td  width="4%" style="text-align:center">缺省</td>
				<td width="8%">是否启用</td>
				<td width="15%">名称<font color="red">*</font></td>
				<td width="10%">标示<font color="red">*</font></td>
				<td width="10%">简称</td>
				<td width="4%">顺序</td>
				<td >备注</td>
				<td width="8%">&nbsp;</td>
			</tr>
			<tr id="row0" class="ui-widget-content jqgrow ui-row-ltr" >
				<td width="4%" style="text-align:center"> <input type="radio" id='def1' value="0" name="defaultValue"  checked="checked"></td>
				<td><input type="radio" id="Ve1" name="Ve1" checked="checked" onclick="chooseT('1');" value="0">启用<input type="radio" id="Ved1" onclick="chooseF('1');" name="Ve1" value="-1">作废</td>
				<td><input type="text" size="30" id="FLAG1" name="FLAG" onblur=checkData(); /></td>
				<td><input type="text" id="CODE1" name="CODE"/></td>
				<td><input type="text" size="20" name="SHORTNAME" /></td>
				<td><SELECT NAME="LEVEL_NUM"   STYLE="width:50px" >
						<OPTION VALUE="1" SELECTED>1</OPTION>
								<OPTION VALUE="2">2</OPTION>
									<OPTION VALUE="3">3</OPTION>
									<OPTION VALUE="4">4</OPTION>
									<OPTION VALUE='5'>5</OPTION>
									<OPTION VALUE='6'>6</OPTION>
									<OPTION VALUE='7'>7</OPTION>
									<OPTION VALUE='8'>8</OPTION>
									<OPTION VALUE='9'>9</OPTION>
									<OPTION VALUE='10'>10</OPTION>
									</SELECT></td>		
				<td><input type="text" size="60" name="REMARK"/><input type='hidden' value='0' id="TYPE1" name='TYPE'><input type='hidden' value='1' id="DEFAULT_VALUE1" name='DEFAULT_VALUE'><input type='hidden' value='0' id='STATUS1'  name='STATUS'></td>
				<td width="8%">&nbsp;</td> 
			</tr>
	
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" >
			<tr>
				<td colspan="2" align="center">
					<input type="button" class="ui-state-default ui-corner-all" value="保存" id="addButton" onclick="addDictionary()"></input>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="ui-state-default ui-corner-all" value="重置"></input>
				</td>
			</tr>
		</table>
		</div>
	</div>
			
	</form>
</body>
</html>