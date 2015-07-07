<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/baseManage/insureCompanyManage/js/insureType.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx }/permission/css/openDiv.css" />
		<title>险种管理</title>
		<%@ include file="/common/import.jsp"%>
		<script type="text/javascript">
			//弹出添加角色的层
			function openAddInsureType(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 400
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}
			//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
        function showEntey(event){    

        if(event.keyCode==13)
        {
                document.getElementById("search").click();   
                                             
        }
 } 
			
		</script>
	</head>
	<body >
		<form action="../servlet/defaultDispatcher" name="form1"
			id="form1" method="post">
			<input type="hidden" id="__action" name="__action" value="insureType.queryInsureTypeAllInfo" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	  		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;险种管理</span>
	  	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
			<div style="margin: 6 0 6 0px;">
	          	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="top">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>险种类型：</td>
				          <td><select id="intp_type" name="intp_type" style="border: #03515d solid 1px;">
							<option value="">--请选择--</option>
							<option value="0" <c:if test="${intp_type eq 0}">selected="selected"</c:if>>--必保险种--</option> 
							<option value="1" <c:if test="${intp_type eq 1}">selected="selected"</c:if>>--选保险种--</option>  
						</select> 
				          <td>
				         设备类型：</td>
				          <td><select id="motor_flag" name="motor_flag" style="border: #03515d solid 1px;">
							<option value="">--请选择--</option> 
							<option value="0" <c:if test="${motor_flag eq 0}">selected="selected"</c:if>>--机动车保险--</option> 
							<option value="1"<c:if test="${motor_flag eq 1}">selected="selected"</c:if>>--非机动车保险--</option> 
						</select>
					</td>
					<td></td>
					<td></td>
				          </tr>
				          <tr>
				          <td>查询内容：</td>
				          <td colspan="5"><input type="text" name="content" value="${content }" style=" width:395px;height:18px; font-size: 12px;">
				          </td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
			
		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr ><td><input type="button" onclick="openAddInsureType('addInsureTypeDiv');" class="ui-state-default ui-corner-all" value="添加险种"></td>
					<td><%@ include file="/common/pageControlTop.jsp"%></td></tr></table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
						序列号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						险种名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						险种类型
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						设备类别
					</th>
					<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
						操作
					</th>
				</tr>
				<tbody>
					<c:forEach items="${dw.rs}" var="insuretype" varStatus="status">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td style="text-align: center;">${status.count } &nbsp;</td>  
							<td style="text-align: center;">${insuretype.INTP_NAME } &nbsp;</td>
							<td style="text-align: center;"><c:choose><c:when test="${insuretype.INTP_TYPE eq 0}">必保险种</c:when><c:otherwise>选保险种</c:otherwise></c:choose></td>
							<td style="text-align: center;"><c:choose><c:when test="${insuretype.MOTOR_FLAG eq 0}">机动车</c:when>	<c:otherwise>非机动车</c:otherwise></c:choose></td>
							<td style="text-align: center;"><a href="javaScript:void(0);" onclick="showInsureType(${insuretype.INTP_ID});">查看</a> <a href="javaScript:void(0);" onclick="preUpdateInsureType(${insuretype.INTP_ID });">修改</a> <a href="javaScript:void(0);" onclick="deleteInsureType(${insuretype.INTP_ID });">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
				</div>
			</div>
		</form>
		
		<div id="addInsureTypeDiv" class="hidden" title="险种添加">
				<form action="../servlet/defaultDispatcher" name="addInsureTypeForm" id="addInsureTypeForm"
					method="post">
					<input type="hidden" name="__action" value="insureType.create">
					<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
					  <div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
					
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">险种名称：</td>
							<td><input type="text" name="intp_name" size="49" id="intp_name"></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">险种类型：</td>
							<td><select name="intp_type" id="intp_type">
									<option value="0">必保险种</option>
									<option value="1">选保险种</option>
								</select></td>
						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">设备类型：</td>
							<td><select name="motor_flag" id="motor_flag">
									<option value="0">机动车</option>
									<option value="1">非机动车</option>
								</select></td>

						</tr>
						<tr class="ui-widget-content jqgrow ui-row-ltr">
							<td align="center">备注：	</td>
							<td><textarea cols="40" rows="4" name="remark" id="remark"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" class="ui-state-default ui-corner-all" value="添 加" name="sub" onclick="checkAddInsureType('form1');">
								<input type="reset" class="ui-state-default ui-corner-all" value="重 置" name="res">
								<input type="button" value="关 闭" name="but" class="ui-state-default ui-corner-all"	onclick="closeDialog(addInsureTypeDiv);">
							</td>
						</tr>
					</table>
				</div>
				</div>
				</div>
				</form>
				</div>
				
				
		<div  id="insureTypeShow" class="hidden" title="险种查看"> 	
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
		  <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">	
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td width="27%">保险险种名称</td><td id="inname" > &nbsp;</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr"> <!-- 必保险种选保险种 -->
				<td>保险险种类型</td><td id="intype"> &nbsp;</td>
			</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">   <!-- 机动车非机动车  -->
				<td>设备类型</td><td id="motor"> &nbsp;</td>
				</tr>
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>备注</td><td id ="mark"> &nbsp;</td></tr>
		</table>
		<center>
			<input type="button" value="关 闭" name="but" class="ui-state-default ui-corner-all"	onclick="closeDialog(insureTypeShow);">
		</center></div>				
		</div>		
				
	
	
	<div id ="insureTypeUpdate" class="hidden" title="险种修改" >
		<form action="../servlet/defaultDispatcher" name="form3" id="form3"
			method="post">
			<input type="hidden" name="__action" value="insureType.update">
			<input type="hidden" name="intpid" id="intpid"  > 
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			  <div class="zc_grid_body jqgrowleft">
			<div class="ui-state-default ui-jqgrid-hdiv ">	
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>保险险种名称：</td>
					<td><input type="text" name="intpname" id="intpname" size="60"  id="intpname"  > <font color="#ff0080">*</font></td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>保险险种类型：</td>
					<td><select name="intptype" id="intptype" > 
									<option value="0" >必保险种</option>
									<option value="1" >选保险种</option>
								</select></td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td>设备类型：</td>
					<td><select name="motorflag" id="motorflag">
									<option value="0"  >机动车</option>
									<option value="1" >非机动车</option>
						</select></td></tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td align="center">备注：</td>
					<td><textarea style="border:#c0c0c0 solid 1px; width:585px; height:50px; font-size:12px;"  name="remark1" id="remark1" ></textarea></td>
				</tr>
			</table>
			<center>
			<input type="button" name="subbut" class="ui-state-default ui-corner-all" value="提  交" onclick="addInsureType('form3');" />
						<input type="button" name="reset" class="ui-state-default ui-corner-all" value="重  置" onclick="newDialog()" />
						<input type="button" value="关 闭" name="but" class="ui-state-default ui-corner-all"	onclick="closeDialog(insureTypeUpdate);"></center>
		</div>
				</div>
			</div>
		</form>	
	</div>			
				
				
				
				
				
	</body>
</html>