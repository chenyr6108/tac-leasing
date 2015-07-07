<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/multiSelectlib" prefix="mSelect"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>合同资料管理</title>
		<script src="${ctx }/rentcontract/js/selectCard.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(function() {
				//添加选项卡
				$("#tabs").tabs();			
			});	
			
			function subRentFile(){
				$("#rentFileForm").submit();
			}
		</script>
	</head>
	<body>
	<div id="tabs" style="width: 900px">
		<ul>
			<li style="width: 100px;text-align: center;"><a href="#tabs-3">合同资料</a></li>
		</ul>
	<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" style="width: 900px">
		<div class="ui-state-default ui-jqgrid-hdiv">
			<form action="../servlet/defaultDispatcher" name=rentFileForm" id="rentFileForm" method="post" enctype="multipart/form-data">	
			<input type="hidden" id="__action" name="__action" value="rentFile.uploadRentContractFile" />
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">								
				<TR class="ui-widget-content jqgrow ui-row-ltr">
					<TD style="text-align: center;" width="25%">客户名称</TD>
					<TD style="text-align: center;" width="25%">${infor.CUST_NAME}&nbsp;</TD>
					<TD style="text-align: center;" width="25%">联系方式</TD>
					<TD style="text-align: center;" width="25%">&nbsp;<c:if test="${infor.CUST_TYPE eq 0}">${infor.NATU_MOBILE}</c:if><c:if test="${infor.CUST_TYPE eq 1}">${infor.CORP_HS_LINK_MODE}</c:if></TD>
				</TR>
				<TR class="ui-widget-content jqgrow ui-row-ltr">
					<TD style="text-align: center;" width="25%">资料编号</TD>
					<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
					<TD style="text-align: center;" width="25%">合同编号</TD>
					<TD style="text-align: center;" width="25%">${infor.LEASE_CODE}&nbsp;</TD>
				</TR>								
			</table>	
			<br>
			<br>
			<br>		
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			       <tr class="ui-jqgrid-labels">
						<td align="left" colspan="5">
						 	<input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
						    <input type="hidden" name="prcd_id"  value="${prcd_id}"/>
							<input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();"/>
						
						</td>							
					</tr>	
					<tr class="ui-jqgrid-labels">
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">编 号</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">资料类型</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">应征份数</th>
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">实征份数</th> 
						<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">附件</th> 
					</tr>
					<c:forEach items="${insorupd}" var="item" varStatus="status" >
						<input type="hidden" name="refd_idC${status.count }${status.count }${status.count }" id="refd_id3" value="${item.REFD_ID}"/>
						<input type="hidden" name="refi_idC${status.count }${status.count }${status.count }" id="refi_id3" value="${item.REFI_ID}"/>
						<input type="hidden" name="file_nameC${status.count }${status.count }${status.count }" id="file_name3" value="${item.FILE_NAME}"/>
					<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
						<td width="5%" onclick="expand('pactAffix3${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" style="cursor: pointer;">${status.count }</td>
						<td width="15%"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}</td>
						<td width="5%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
						<td width="5%">${item.COPYSIGN_COUNT}&nbsp;</td> 
						<td>
						<input  id="${item.REFD_ID}@${item.REFI_ID}" type="file" size="30"  name="${item.REFD_ID}@${item.REFI_ID}"  multiple  class="ui-state-default ui-corner-all" accept="image/gif,image/png,application/pdf,image/tif"/>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="5" align="center">
							<div id="pactAffix3${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
								<img src="${ctx }/images/loading.gif">
							</div>
						</td>
					</tr>								
					</c:forEach>
					<tr class="ui-jqgrid-labels">
						<td align="left" colspan="5">
							<input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();"/>
						</td>							
					</tr>																				
			</table>
			</div>
			</form>
			</div>									
		</div>	
	</body>
</html>