<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>合同资料检核表</title>
		<script type="text/javascript">
		function subRentFile(){	
			document.getElementById("buttonAdd").disabled=true;
			$("#rentForm").submit();						
		}
			
		function expand(id,REFI_ID,PRCD_ID){	   
	        $("#"+id).toggle(function(){
	            $(this).load("../servlet/defaultDispatcher?__action=rentFile.queryFileUpMore&REFI_ID=" + REFI_ID+"&PRCD_ID="+PRCD_ID+"&id="+id);
	        });
		}	
		function expandVisitImage(id){
			$("#"+id).toggle() ;
		}	
		
		</script>
	</head>
	<body>
	<div id="tabs" style="width: 800px">
			<div id="main" class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
				<div class="ui-state-default ui-jqgrid-hdiv">
					<div class="zc_grid_body ">
		<form action="../servlet/defaultDispatcher" name=rentForm" id="rentForm" method="post" enctype="multipart/form-data">	
			 <input type="hidden" name="CONTRACT_TYPE" id="CONTRACT_TYPE"  value="${CONTRACT_TYPE}"/>
			<input type="hidden" id="__action" name="__action" value="rentFile.uploadAllForSales" /> 	
			<input type="hidden" name="prcd_id" id="prcd_id" value="${prcd_id}"/>
			<input type="hidden" name="name" id="name" value=""/>
			<input type="hidden" name="path" id="path" value=""/>	
			<input type="hidden" name="cardFlag" id="cardFlag" value="${cardFlag}"/>
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
				<TR class="ui-widget-content jqgrow ui-row-ltr">
					<TD style="text-align: center;" width="25%">支付方式</TD>
					<TD style="text-align: center;" width="25%">${infor.FLAG}&nbsp;</TD>
					<TD style="text-align: center;" width="25%">交机方式</TD>
					<TD style="text-align: center;" width="25%"><c:choose><c:when test="${not empty infor.QIANTYPE}">交机前拨款</c:when><c:otherwise>交机后拨款</c:otherwise></c:choose>&nbsp;</TD>
				</TR>												
			</table>	
			<br>
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
       <tr class="ui-jqgrid-labels">
       		<td align="left" colspan="2">&nbsp;
			</td>
				<td align="left" colspan="3">
				    <input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
			<c:if test="${empty infor.RECT_ID and sendFile and (rentFileSenderState.STATE eq 3 or rentFileSenderState.STATE eq 1 or rentFileSenderState.STATE eq 5 or empty rentFileSenderState.STATE)}"><input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();" style="cursor: pointer;"/></c:if>
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
	<th class="ui-state-default ui-th-ltr zc_grid_head" style="width:25%;">业务行政备注</th>
</tr>
<c:forEach items="${insorupd}" var="item" varStatus="status" >
	<input type="hidden" name="refd_idC${status.count }${status.count }${status.count }" id="refd_id3" value="${item.REFD_ID}"/>
	<input type="hidden" name="refi_idC${status.count }${status.count }${status.count }" id="refi_id3" value="${item.REFI_ID}"/>
<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
	<td width="5%" onclick="expand('pactAffix3${item.REFI_ID}','${item.REFI_ID}','${prcd_id}');" style="cursor: pointer;">${status.count }</td>
	<td width="15%"><c:if test="${item.FILESTATE eq 1}"><font color="red">*</font></c:if>${item.FILE_NAME}</td>
	<td width="5%">${item.WANT_COUNT == null || item.WANT_COUNT == '' ? 0 : item.WANT_COUNT}</td>
	<td width="5%"><input type="text" name="COPYSIGN_COUNTC${status.count }${status.count }${status.count }" id="COPYSIGN_COUNT3" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${item.COPYSIGN_COUNT}"/>&nbsp;</td>
	<td width="25%"><input type="text" name="SALES_MEMOC${status.count }${status.count }${status.count }" id="SALES_MEMO3" style="width:100%; border-top-style:none;   border-left-style:none;   border-right-style:none;border-bottom-style:none;" value="${item.SALES_MEMO}"></td>
</tr>
	<tr>
		<td style="text-align: center;" colspan="5" align="center">
			<div id="pactAffix3${item.REFI_ID}" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
				<img src="${ctx }/images/loading.gif">
			</div>
		</td>
	</tr>								
</c:forEach>	
<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
	<td width="5%" onclick="expandVisitImage('visitImage');" style="cursor: pointer;">${fn:length(insorupd) +1}</td>
	<td width="15%">回访信息资料</td>
	<td width="5%">&nbsp;</td>
	<td width="5%">${fn:length(visitImage)}&nbsp;</td>
	<td width="25%"></td>
</tr>
	<tr>
		<td style="text-align: center;" colspan="5" align="center">
			<div id="visitImage" align="center" style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
				<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">	
					<c:forEach items="${visitImage}" var="item" varStatus="status">	
							<tr id="imageUp${status.count }" class="ui-widget-content jqgrow ui-row-ltr">	
								<td style="text-align: center;"><a href="javaScript:void(0)" onclick="javaScript:location.href='${ctx }/servlet/defaultDispatcher?__action=rentFile.download&name=${item.IMAGE_NAME }&path=${item.PATH }&bootPath=backVisitImage'"><input type="button" class="ui-state-default ui-corner-all" id="showRentFile" value="查看${item.TITLE}${item.IMAGE_NAME }" name="showRentFile"></a></td>
							</tr>		
					</c:forEach>		
				</table>	
			</div>
		</td>
	</tr>				
	<tr class="ui-jqgrid-labels">
		<td align="left" colspan="2">&nbsp;
		</td>
		<td align="left" colspan="3">
		    <input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
			<c:if test="${empty infor.RECT_ID and sendFile and (rentFileSenderState.STATE eq 3  or rentFileSenderState.STATE eq 1 or rentFileSenderState.STATE eq 5 or empty rentFileSenderState.STATE)}"><input class="ui-state-default ui-corner-all" type="button" value="保存数据" onclick="subRentFile();" id="buttonAdd" style="cursor: pointer;"/></c:if>
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