<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<link href="${ctx }/script/image/ss_bigk.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		function showExportLog(ctx)
		{
			window.location.href=ctx+"/servlet/defaultDispatcher?__action=customer.getExportCustVirtualCodeLog";
		}
		
		function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
		
		function getCustVirtualCodeExcel(e){
			$(e).attr("disabled", "disabled");
			var cust_id = "";
			
			$("input[name='CUST_ID']:checked").each(function(){
				cust_id += ($(this).val() + ",");
			});
			if(cust_id == ""){
				alert("必须选择要导出客户");
				return;
			}
			var s_employeeId= document.getElementById("s_employeeId").value;
			var s_employeeName= document.getElementById("s_employeeName").value;
					
			window.parent.callBirt("birtReport/testExportCustcode.rptdesign", "xls", {"cust_id" : cust_id.substring(0, cust_id.length - 1),"s_employeeId" : s_employeeId,"s_employeeName":s_employeeName,});

			$(e).attr("disabled", false);
		}
		</script>

	</head>
	<body>
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=customer.getCustVirtualCode">
			<input type="hidden" name="__action" value="customer.getCustVirtualCode" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;导出虚拟账号</span>
		   	</div>
		   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
            <div class="zc_grid_body jqgrowleft">
				<div style="margin: 6 0 6 0px;">
 	<table width="97%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			      <tr>
				      <td width="8">&nbsp;</td>
				        <td width="60" class="ss_o"></td>
				        <td width="60%" class="ss_t" valign="center">
				          <table style="margin-left: 10px;">
				          <tr>
				          <td>客户类型：</td>
				          <td>
				          
				          	<select name="cust_type" id="cust_type">
				          		<option value="">全部</option>
				          		<option value="1" <c:if test="${cust_type eq 1 }">selected="selected"</c:if>>设备</option>
				          		<option value="2" <c:if test="${cust_type eq 2 }">selected="selected"</c:if>>商用车</option>
				          		<option value="3" <c:if test="${cust_type eq 3 }">selected="selected"</c:if>>乘用车</option>
				          	</select>
				          </td>
				          <td>公司：</td>
				          <td>
				          
				          	<select name="com_type" id="com_type">
				          		<option value="1" <c:if test="${com_type eq 1 || com_type eq '' }">selected="selected"</c:if>>裕融</option>
				          		<option value="2" <c:if test="${com_type eq 2 }">selected="selected"</c:if>>裕国</option>
				          	</select>
				          </td>
				          <td>查询内容：</td>
				          <td><input type="text" name="searchValue" value="${searchValue }" style=" width:395px;height:18px; font-size: 12px;"></td>
				          </tr>
				          </table>
				          
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
	          		</div>
	          		
			<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<td>&nbsp;&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="showExportLog('${ctx}');"  value="查看导出日志"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="sub" class="ui-state-default ui-corner-all" onclick="getCustVirtualCodeExcel(this);"  value="导出客户虚拟账号"/></td>
				<td><page:pagingToolbarTop pagingInfo="${dw }"/></td>
			</tr>
		</table>

		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th width="2%" class="ui-state-default ui-th-ltr zc_grid_head">
						<input type="checkbox" NAME="all" id="all" onclick="checkAll(this,'CUST_ID');">
					</th>			
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人编号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						承租人名称
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						虚拟帐号
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						公司
					</th>
					
				</tr>
			</thead>
			<tbody>
			<input type="hidden" name="s_employeeId" value="${s_employeeId }" id="s_employeeId"/>
			<input type="hidden" name="s_employeeName" value="${s_employeeName }" id="s_employeeName"/>

			<c:forEach items="${dw.resultList}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td style="text-align: center;"><input type="checkbox" value="${item.CUST_ID }"  name ="CUST_ID"></td>
					<td style="text-align: center;">${status.count }</td>
					<td style="text-align: center;">${item.CUST_CODE }</td>
					<td style="text-align: center;">${item.CUST_NAME }</td>
					<td style="text-align: center;">${item.VIRTUAL_CODE }&nbsp;</td>
					<td style="text-align: center;">
						<c:if test="${item.COMPANY_CODE==1}">裕融</c:if>
						<c:if test="${item.COMPANY_CODE==2}">裕国</c:if>
					&nbsp;</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<page:pagingToolbar pagingInfo="${dw }"/>
		</div>
			</div>
			</div>
</form>
	</body>
</html>