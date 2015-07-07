<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
		<title>资料管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="${ctx }/common/js/check1.0.1.js" type="text/javascript"></script>	
		<script type="text/javascript" src="tab_data/tab.js"></script>
        <script type="text/javascript" src="${ctx }/baseManage/fileManage/js/fileManage.js"></script>
		<script type="text/javascript">
			$(function (){
				var STATEA=$("#stateee").val();	
				$("input[name=state][value="+STATEA+"]").attr("checked",true);	
			});
		</script>        
</head>
	<body>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"	method="post">	
			<input type="hidden" name="__action" value="fileService.update">
			<input type="hidden" name="refi_id" id="refi_id" value="${fileInfor.REFI_ID}" >
			<input type="hidden" name="stateee" id="stateee" value="${fileInfor.STATE}" >	
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
			    <td rowspan="7" align="center" class="ui-state-default ui-th-ltr zc_grid_head">修<br>改<br>资<br>料</td>
			    <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr" >资料名称：</td>
			    <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="FILE_NAME"  id="FILE_NAME" style="width:150px;" value="${fileInfor.FILE_NAME}"></td>
			  </tr>
			  <tr>
			    <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">资料类型：</td>
			    <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">
					<select name="FILE_TYPE"  id="FILE_TYPE" style="width: 150px" onchange="changeContractType();">
						<c:forEach items="${Infor}" var="infor" varStatus="status">
							<c:choose><c:when test="${infor.CODE eq fileInfor.FILE_TYPE}"><option value="${infor.CODE}"selected>${infor.FLAG}</option></c:when><c:otherwise><option value="${infor.CODE}">${infor.FLAG}</option></c:otherwise></c:choose>			                                          
                        </c:forEach>
                      </select>									    
			    </td>					    
			  </tr>
			  <tr>							  
			    <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">必填项：</td>
			    <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"> 
					<input checked="checked" type="radio" name="state" id="state1" value="0">&nbsp;否&nbsp;&nbsp;<input type="radio" name="state" id="state2"  value="1">&nbsp;是&nbsp;                                                  								    
			    </td>
			  </tr>									  
			  <tr>							  
			    <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">级别：</td>
			    <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"> 
					<select name="LEVEL_NUM"  id="LEVEL_NUM" style="width: 150px">
						<c:forEach var="x" begin="1" end="30" step="1">
							<c:choose><c:when test="${fileInfor.LEVEL_NUM eq x}"><option value="${x}"selected>${x}</option></c:when><c:otherwise><option value="${x}">${x}</option></c:otherwise></c:choose>								
						</c:forEach> 		                                                                                	                                          
                                   </select>                                                    								    
			    </td>
			  </tr>
			  <tr>
			      <td style="text-align: center ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr">应征份数：</td>
			      <td style="text-align: left ;height: 24px;" class="ui-widget-content jqgrow ui-row-ltr"><input type="text" name="WANT_COUNT"  id="WANT_COUNT" style="width:150px;" value="${fileInfor.WANT_COUNT}"></td>
			  </tr>										  
			<c:forEach items="${Infor}" var="infor" varStatus="status">
				<c:if test="${infor.CODE eq fileInfor.FILE_TYPE and infor.FLAG eq '合同资料'}">
				 <tr class="ui-widget-content jqgrow ui-row-ltr" id="addContractType">
				    <td style="text-align: center ;height: 24px;">合同类型：</td>
				    <td style="text-align: left ;height: 24px;">
				    <select name="FILE_CONTRACT_TYPE"  id="FILE_CONTRACT_TYPE" style="width: 150px">
				    <option value="1" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 1}">selected="selected"</c:if>>一般合同</option>
				    <option value="2" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 2}">selected="selected"</c:if>>委托合同</option>
				    <option value="3" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 3}">selected="selected"</c:if>>回租合同</option>
				    <option value="4" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 4}">selected="selected"</c:if>>重车合同</option>
				    <option value="5" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 5}">selected="selected"</c:if>>重车回租合同</option>
				    <option value="6" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 6}">selected="selected"</c:if>>新品回租合同</option>
				    <option value="7" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 7}">selected="selected"</c:if>>乘用车回租合同</option>
				    <option value="8" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 8}">selected="selected"</c:if>>直接租赁合同</option>
				    <option value="9" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 9}">selected="selected"</c:if>>乘用车租赁合同</option>
				    <option value="10" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 10}">selected="selected"</c:if>>设备售后回租合同</option>
				    <option value="11" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 11}">selected="selected"</c:if>>新车回租合同</option>
				    <option value="13" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 13}">selected="selected"</c:if>>二手车回租合同</option>
				    <option value="14" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 14}">selected="selected"</c:if>>原车回租合同</option>
				   	<option value="15" <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 15}">selected="selected"</c:if>>二手车委贷合同</option>
				    </select></td>
				 </tr>			    
				</c:if>
			</c:forEach>									  
			 <tr class="ui-widget-content jqgrow ui-row-ltr" id="CONTRACT_FILE_TYPE" name="CONTRACT_FILE_TYPE">
			    <td style="text-align: center ;height: 24px;">合同资料类型：</td>
			    <td style="text-align: left ;height: 24px;">
			    <select name="CONTRACT_FILE_TYPE"  id="CONTRACT_FILE_TYPE" style="width: 150px">
			    <option value="">--无--</option>
			    <c:forEach items="${InforFileType}" var="inforFileType" varStatus="status">
			    	<option value="${inforFileType.CODE }" <c:if test="${fileInfor.CONTRACT_FILE_TYPE eq inforFileType.CODE}">selected="selected"</c:if>>${inforFileType.FLAG }</option>
			    </c:forEach>
			    </select>
			    </td>
			 </tr>					  
	</table>
				<div class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: center ;">
					<input type="button" class="ui-state-default ui-corner-all" name="subbut" value="提  交" onClick="updateFileInfor();">
					<input type="reset" class="ui-state-default ui-corner-all" name="reset" value="重  置">
				</div> 
				</div>
				</div>
				</td>
				</tr>
				</table>			
	</form>			
	</body></html>