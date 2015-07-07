<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合同寄件管理</title>
<script type="text/javascript" src="${ctx }/rentcontract/js/manage.js"></script>
<script type="text/javascript">
$(function(){
    $("#POST_DATE").datepicker($.datepicker.regional['zh-CN']);
});

		function checkItem(e, allName,issureName)
		{
			 var all = document.getElementsByName(allName)[0];
			  if(!e.checked) all.checked = false;
			  else
			  {
			    var aa = document.getElementsByName(e.name);
			    for (var i=0; i<aa.length; i++)
			     if(!aa[i].checked) return;
			    all.checked = true;
			  }
		}
			
		function subRentFile(){
			var aa = document.getElementsByName("rent_ids");
			var i=0;
			var rent_ids="";
			var temArray;
			var file_names="";
			$('input[name="rent_ids"]:checked').each(function(){  
				temArray=$(this).val().split(","); 
				if (rent_ids!=""){
					rent_ids=rent_ids+","+temArray[0];
					file_names=file_names+","+temArray[1];
				}else{
					rent_ids=rent_ids+temArray[0];
					file_names=file_names+temArray[1];
				}
			});
				rentForm.checked_rent_ids.value=rent_ids;
				rentForm.file_names.value=file_names;
				
			document.getElementById("buttonAdd").disabled=true;
			$("#rentForm").submit();						
		}
		
		</script>
</head>
<body>
	<div id="main"
		class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
		style="width: 850px">
		<div class="ui-state-default ui-jqgrid-hdiv">
			<div class="zc_grid_body ">
				<form action="../servlet/defaultDispatcher" name=rentForm
					" id="rentForm" method="post">
					<input type="hidden" id="__action" name="__action" value="rentContract.saveRentPostFileDetail" /> 
					<input type="hidden" id="prcd_id" name="prcd_id" value="${prcd_id }" />
					<input type="hidden" id="checked_rent_ids" name="checked_rent_ids" />
					<input type="hidden" id="file_names" name="file_names" />
					<input type="hidden" id="POST_ID" name="POST_ID" value="${POST_ID }" />
					<input type="hidden" name="QSEARCH_VALUE" value="${QSEARCH_VALUE }">
					<input type="hidden" name="page_from" value="${page_from }">
					
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title" width="850px">
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%">客户名称</TD>
							<TD style="text-align: center;" width="25%">${infor.CUST_NAME }&nbsp;</TD>
							<TD style="text-align: center;" width="25%">联系方式</TD>
							<TD style="text-align: center;" width="25%">${infor.CORP_HS_LINK_MODE }&nbsp;</TD>
						</TR>
						<TR class="ui-widget-content jqgrow ui-row-ltr">
							<TD style="text-align: center;" width="25%">资料编号</TD>
							<TD style="text-align: center;" width="25%">${infor.LEASE_CODE }&nbsp;</TD>
							<TD style="text-align: center;" width="25%">合同编号</TD>
							<TD style="text-align: center;" width="25%">${infor.LEASE_CODE }&nbsp;</TD>
						</TR>
					</table>
					<br> 
					<table cellspacing="0" cellpadding="0" border="0"
						class="ui-jqgrid-htable zc_grid_title">
						<tr class="ui-jqgrid-labels">
							<th class="ui-state-default ui-th-ltr zc_grid_head"
								style="width: 7%;">&nbsp;</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"
								style="width: 7%;">编 号</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"
								style="width: 15%;">资料类型</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"
								style="width: 10%;">邮寄份数</th>
							<th class="ui-state-default ui-th-ltr zc_grid_head"
								style="width: 20%;">备注</th>
						</tr>
						<c:forEach items="${insorupd}" var="item" varStatus="status">
							<input type="hidden"
								name="refd_id${status.count }" 
								value="${item.REFD_ID}" />
							<input type="hidden"
								name="REFI_ID${status.count }" 
								value="${item.REFI_ID}" />
							<tr id="cz001" class="ui-widget-content jqgrow ui-row-ltr">
								<td width="8%"><INPUT TYPE="checkbox" NAME="rent_ids" 
									value="${item.REFI_ID},${item.FILE_NAME}" style="width: 100%;" <c:if test="${item.POST_FLAG eq 1}">checked</c:if>></td>
								<td width="7%">${status.count }</td>
								<td width="15%"><c:if test="${item.FILESTATE eq 1 }">
										<font color="red">*</font>
									</c:if>${item.FILE_NAME}<input type="hidden"
									name="FILE_NAME${status.count }"
									value="${item.FILE_NAME}" ></td>
								<td width="9%"><input type="text"
									name="FILE_COUNT${status.count }"
									value="${item.FILE_POST_COUNT}" 
									style="width: 100%; border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none"></td>
								<td width="20%"><input type="text"
									name="MEMO${status.count }"
									value="${item.FILE_MEMO}" 
									style="width: 100%; border-top-style: none; border-left-style: none; border-right-style: none; border-bottom-style: none;"></td>
							</tr>
						</c:forEach>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="text-align: center;width:7%;">寄件日期</td>
		<td style="text-align: left;" colspan="5"><input name="POST_DATE" id="POST_DATE" size="30" readonly="readonly" value="<c:if test="${postMap.POST_DATE !='1900-01-01'}">${postMap.POST_DATE }</c:if>">&nbsp;</textarea></td>							
	</tr>
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="text-align: center;width:7%;">快递公司</td>
		<td style="text-align: left;" colspan="5">
		<select name="POST_NAME" id="POST_NAME">
			<option value=""></option>
			<c:forEach items="${postNameList}" var="item" varStatus="status">
				<option value="${item.FLAG }" <c:if test="${item.FLAG eq postMap.POST_NAME }">selected</c:if>>${item.FLAG }</option>
			</c:forEach>
			
		</select>
		</td>							
	</tr>	
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="text-align: center;width:7%;">寄件单号</td>
		<td style="text-align: left;" colspan="5"><input name="POST_CODE" id="POST_CODE" size="30" value="${postMap.POST_CODE }">&nbsp;</td>							
	</tr>						
	<tr class="ui-widget-content jqgrow ui-row-ltr">
		<td style="text-align: center;width:7%;">备注说明：</td>
		<td style="text-align: left;" colspan="5"><textarea name="REMARK" id="REMARK" rows="5" cols="5" style="width:80%;">${postMap.MEMO }</textarea></td>							
	</tr>						
						<tr class="ui-jqgrid-labels">
							<td align="center" colspan="6">  <input type="hidden" name="statusLengthC"  value="${fn:length(insorupd)}"/>
								<input class="ui-state-default ui-corner-all" style="cursor: pointer;" id="buttonAdd" type="button"
								value="保存数据" onclick="subRentFile();" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>