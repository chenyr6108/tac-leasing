<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>结清文件申请</title>
		<script type="text/javascript">
		function subRentFile(){	
			document.getElementById("buttonAdd").disabled=true;
			$("#rentForm").submit();						
		}
		
		</script>
	</head>
	<body>
	<div id="tabs" style="width: 800px">
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
		<form action="../servlet/defaultDispatcher" name=rentForm" id="rentForm" method="post">	
			<input type="hidden" id="__action" name="__action" value="rentFile.uploadRentSettleFileApply" /> 
			<input type="hidden" name="RENT_SETTLEFILE_ID" id="RENT_SETTLEFILE_ID" value="${rentSettleFileApply.ID}"/>
			<input type="hidden" name="RECT_ID" id="RECT_ID" value="${RECT_ID}"/>
			<input type="hidden" id="type" name="type" value="all" />	
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
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
       <tr class="ui-jqgrid-labels">
       		<td align="left" colspan="2">&nbsp;
			</td>
				<td align="left" colspan="3">
				<input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
		<c:if test="${empty rentSettleFileApply.STATE  or rentSettleFileApply.STATE ne 1 }"><input class="ui-state-default ui-corner-all" id="buttonAdd" type="button" value="保存数据" onclick="subRentFile();" style="cursor: pointer;"/></c:if>
		</td>							
	</tr>	
       <tr class="ui-jqgrid-labels">
  		<td align="left" colspan="2">&nbsp;</td>
		<td align="left" colspan="3">&nbsp;</td>							
	</tr>
<tr class="ui-jqgrid-labels">
	<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">编 号</th>
	<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:15%;">资料类型</th>
	<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">应征份数</th>
	<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:5%;">实征份数</th>
	<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:25%;">备注</th>
</tr>
<c:forEach items="${insorupd}" var="item" varStatus="status" >
	<input type="hidden" name="refd_idC${status.count }${status.count }${status.count }" value="${item.ID}"/>
	<input type="hidden" name="refi_idC${status.count }${status.count }${status.count }" value="${item.REFI_ID}"/>
<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
	<td width="5%">${status.count }</td>
	<td width="15%"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}</td>
	<td width="5%">${item.FILE_COUNT == null || item.FILE_COUNT == '' ? 0 : item.FILE_COUNT}</td>
	<td width="5%"><input type="text" name="COPYSIGN_COUNTC${status.count }${status.count }${status.count }" id="COPYSIGN_COUNT3" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${item.COPYSIGN_COUNT}"/>&nbsp;</td>
	<td width="25%"><input type="text" name="MEMOC${status.count }${status.count }${status.count }" id="MEMO3" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;" value="${item.MEMO}"></td>
</tr>								
</c:forEach>	
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="text-align: center;width:7%;">备注说明：</td>
		<td style="text-align: left;" colspan="7"><textarea name="REMARK" id="REMARK" rows="5" cols="5" style="width:80%;">${rentSettleFileApply.REMARK}</textarea></td>							
	</tr>				
	<tr class="ui-jqgrid-labels">
		<td align="left" colspan="2">&nbsp;
		</td>
		<td align="left" colspan="3">
			&nbsp;
		</td>							
			</tr>															
		</table>				
		</div>
		</div>									
	</form>	
	</div>
</div>	
	</body>
</html>