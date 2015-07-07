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
</head>
	<body>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;查看资料信息</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	            <table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">				
									    <tr>
									        <td colspan="5"  class="ui-state-default ui-th-ltr zc_grid_head" style="text-align: left ;height: 24px;"><strong>资料基本信息</strong></td>
									    </tr>
									  <tr >
									    <td rowspan="6" align="center" class="ui-state-default ui-th-ltr zc_grid_head">查<br>看<br>资<br>料</td>
									    <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">资料名称：</td>
									    <td class="ui-widget-content jqgrow ui-row-ltr">${fileInfor.FILE_NAME}&nbsp;</td>								    
									  </tr>
									  <tr class="ui-widget-content jqgrow ui-row-ltr" >
									    <td  style="text-align: center;">资料类型：</td>
									    <td><c:forEach items="${Infor}" var="infor" varStatus="status"><c:if test="${infor.CODE eq fileInfor.FILE_TYPE}">${infor.FLAG}</c:if></c:forEach>&nbsp;</td>	  				    
									  </tr>
									  <tr class="ui-widget-content jqgrow ui-row-ltr" >
									    <td  style="text-align: center;">级别：</td>
									    <td>${fileInfor.LEVEL_NUM}&nbsp;</td>
									  </tr>
									  <tr class="ui-widget-content jqgrow ui-row-ltr" >
									    <td  style="text-align: center;">应征份数：</td>
									    <td>${fileInfor.WANT_COUNT}&nbsp;</td>
									  </tr>									  
									  <tr class="ui-widget-content jqgrow ui-row-ltr" >
									    <td  style="text-align: center;">必填项：</td>
									    <td><c:if test="${fileInfor.STATE eq 0}">否</c:if><c:if test="${fileInfor.STATE eq 1}">是</c:if></td>
									  </tr>	
									<c:forEach items="${Infor}" var="infor" varStatus="status">
										<c:if test="${infor.CODE eq fileInfor.FILE_TYPE and infor.FLAG eq '合同资料'}">
										 <tr class="ui-widget-content jqgrow ui-row-ltr" >
										    <td  style="text-align: center;">合同类型：</td>
										    <td>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 1}">一般合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 2}">委托合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 3}">回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 4}">重车合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 5}">重车回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 6}">新品回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 7}">乘用车回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 8}">直接租赁合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 9}">乘用车租赁合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 10}">设备售后回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 11}">新车回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 13}">二手车回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 14}">原车回租合同</c:if>
										    <c:if test="${fileInfor.FILE_CONTRACT_TYPE eq 15}">二手车委贷合同</c:if>
										   </td>
										 </tr>			    
										</c:if>
									</c:forEach>   
									</table>
			<div align="center">
				<input type="button" class="ui-state-default ui-corner-all" name="back" value="返  回" onclick="javascript:history.go(-1)">
			</div>
			</div>
			</div>
			</div>
			
		
	</body></html>