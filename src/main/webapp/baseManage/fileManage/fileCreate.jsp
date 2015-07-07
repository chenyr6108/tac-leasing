<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
		<title>资料管理</title>
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>
        <script type="text/javascript" src="${ctx }/baseManage/fileManage/js/fileManage.js"></script>
</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">	
			<input type="hidden" name="__action" value="fileService.create">
			<br/>
			<table width="1040" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td>
						<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
							<span class="ui-jqgrid-title"
								style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;资料管理</span>
						</div>
						<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
						<div class="zc_grid_body jqgrowleft">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="ContractTypeId">
				<tr>
				  <td colspan="5" class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"><strong>资料基本信息</strong></td>
			    </tr>
			  <tr>
				  <td rowspan="7" align="center" class="ui-state-default ui-th-ltr zc_grid_head">添<br>加<br>资<br>料</td>
			      <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">资料名称：</td>
			      <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="FILE_NAME"  id="FILE_NAME" style="width:150px;"></td>
			  </tr>
			  <tr>
				  <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">资料类型：</td>
				  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
					 <select name="FILE_TYPE"  id="FILE_TYPE" style="width: 150px" onchange="changeContractType();">
						 <option value="0">---请选择资料类型---</option>
							 <c:forEach items="${fileInfor}" var="Infor" varStatus="status">
			                      <option value="${Infor.CODE}">${Infor.FLAG}</option>
			               </c:forEach>
	                  </select>									    
							  </td>					    
			 </tr>			 
						 <tr>
							  <td  style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">级别：</td>
							  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
							 <select name="LEVEL_NUM"  id="LEVEL_NUM" style="width: 150px">							 
								<c:forEach var="x" begin="1" end="30" step="1">
								<option value="${x}">${x}</option>
								</c:forEach>                                          	                                          
	                         </select>									    
							  </td>
							  </tr>
							  
			  <tr>
			      <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">应征份数：</td>
			      <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="WANT_COUNT"  id="WANT_COUNT" style="width:150px;"></td>
			  </tr>							  
							  <tr>
				  <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">必填项：</td>
				  <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
					<input checked="checked" type="radio" name="state" id="state1" value="0">&nbsp;否&nbsp;&nbsp;<input type="radio" name="state" id="state2"  value="1">&nbsp;是&nbsp;</td>					    							  							  
							  </tr>
							  
				<tr class="ui-widget-content jqgrow ui-row-ltr" id="CONTRACT_FILE_TYPE" name="CONTRACT_FILE_TYPE">
				    <td style="text-align: center ;height: 24px;">合同资料类型：</td>
				    <td style="text-align: left ;height: 24px;">
				    <select name="CONTRACT_FILE_TYPE"  id="CONTRACT_FILE_TYPE" style="width: 150px">
				    <option value="">--无--</option>
				    <c:forEach items="${InforFileType}" var="inforFileType" varStatus="status">
				    	<option value="${inforFileType.CODE }">${inforFileType.FLAG }</option>
				    </c:forEach>
				    </select>
				    </td>
				 </tr>
						 </table>

				<div class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center ;">
					<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onClick="addFileInfor();">
					<input type="reset" class="ui-state-default ui-corner-all" name="reset" value="重  置">
				</div> 
				</div>
				</div> 
				</td>
				</tr>
				</table>			
	</form>			
	</body></html>