<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<title>供应商联络信息一览表</title>
	</head>
	<script type="text/javascript"> 
	 function exportSupplierContact(){
		 	var supplierName = $("#supplierName").val();
		 	var beginDate = $("#beginDate").val();
		 	var endDate = $("#endDate").val();
			var url = "${ctx }/servlet/defaultDispatcher?__action=supplierCommand.exportExcel&supplierName="+supplierName+"&beginDate="+beginDate+"&endDate="+endDate;
			window.location.href = url;
		 
	 }
	 
	 function restSearch(){
		 $("#beginDate").val("");
		 $("#endDate").val("");
		 $("#supplierName").val("");		 
	 }
	 
	 
	 $(function(){
		 
		 $("#beginDate").datepicker($.datepicker.regional['zh-CN']);
		 $("#endDate").datepicker($.datepicker.regional['zh-CN']);
		 
	 });
	</script>
	<body>
		<form id="form1" method="POST"
			action="${ctx}/servlet/defaultDispatcher?__action=supplierCommand.getSupplierContactInfo">
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;供应商联络信息一览表</span>
		   	</div>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div>
					<table width="1024px" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="80">&nbsp;</td>
				        <td width="50" class="ss_o">&nbsp;</td>
				        <td width="500" class="ss_t">&nbsp;&nbsp;
				                           供应商名称：<input type="text" id="supplierName" name="supplierName" value="${supplierName }" style="width:150px; height:20px;">
						</td>
						<td class="ss_t" width="80">拨款日期：<input type="text" name="beginDate" value="${ beginDate}" id="beginDate" readonly="readonly"></td>
						<td class="ss_t" width="10">至</td>
						<td class="ss_t"><input type="text" name="endDate" value="${ endDate}" id="endDate" readonly="readonly"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table></div>
			<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
					<td><input type="button" onclick="exportSupplierContact()" style="padding: 2px 10px;cursor: pointer;" class="ui-state-default ui-corner-all" value="导出Excel"></td>
					<td><page:pagingToolbarTop pagingInfo="${pagingInfo }"/></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-jqgrid-labels">
					<th>供应商名称</th>
					<th>邮寄地址</th>
					<th>电话</th>
					<th>联系人</th>
				</tr>
			<tbody>
				<c:forEach items="${pagingInfo.resultList}" var="item" varStatus="status">
					<tr class="ui-widget-content jqgrow ui-row-ltr">
						<td>${item.NAME} &nbsp;</td>
						<td>${item.LINK_WORK_ADDRESS}&nbsp;</td>
						<td>${item.LINK_MOBILE}&nbsp;</td>
						<td>${item.LINK_NAME}&nbsp;</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		<page:pagingToolbar pagingInfo="${pagingInfo }"/>
		</div>
				</div>
			</div>
		</form>
	</body>
</html>