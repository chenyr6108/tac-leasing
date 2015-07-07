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
$(function (){
	$("#QUERY_START_DATE").datepicker($.datepicker.regional["zh-CN"]);
	$("#QUERY_END_DATE").datepicker($.datepicker.regional["zh-CN"]);
});

function exportToExcel(e){
	$(e).attr("disabled", "disabled");
	var query_date = "";
	query_start_date= document.getElementById("QUERY_START_DATE").value;
	query_end_date= document.getElementById("QUERY_END_DATE").value;

	window.parent.callBirt("birtReport/custCase/custLinkerManInfo.rptdesign", "xls", {"query_start_date" : query_start_date,"query_end_date" : query_end_date,"companyCode" : $("#companyCode").val()});

	$(e).attr("disabled", false);
}

</script>

	</head>
	<body>
		<form id="form1" name="form1" method="POST" action="${ctx}/servlet/defaultDispatcher?__action=customer.queryCustLinkerManByFinance">
			<input type="hidden" name="__action" value="customer.queryCustLinkerManByFinance" />
			<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;导出开票资料客户联系人</span>
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
				          <td>&nbsp;</td>
				          <td>开始日期 ：<input type="text" value="<fmt:formatDate value="${QUERY_START_DATE}" pattern="yyyy-MM-dd"/>" name="QUERY_START_DATE" id="QUERY_START_DATE" readonly="readonly" style="width:150px; height:18px;">结束日期:<input type="text" value="<fmt:formatDate value="${QUERY_END_DATE}" pattern="yyyy-MM-dd"/>"  name="QUERY_END_DATE" id="QUERY_END_DATE" readonly="readonly" style="width:150px; height:18px;"></td>
				          <td>
							公司别：
							<select name="companyCode" id="companyCode">
								<option value="">全部</option>
								<c:forEach items="${companys}" var="item">
									<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected</c:if>>${item.name}</option>
								</c:forEach>
							</select>			          
							</td> 
				          </tr>
				          </table>
				          </td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td width="20%"><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				        <td width="20%"><a href="#" name="exportToExcel" id="exportToExcel" onclick="exportToExcel(this);"  class="blue_button">导出Excel</a></td>
				      </tr>
				    </table>
	          		</div>
	     <%@ include file="/common/pageControl.jsp"%>     		
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
				<tr class="ui-jqgrid-labels">
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						序号
					</th>
<!-- 					<th class="ui-state-default ui-th-ltr zc_grid_head">
						客户编号
					</th> -->
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						客户名称
					</th>
<!-- 					<th class="ui-state-default ui-th-ltr zc_grid_head">
						合同号
					</th> -->
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						联系人
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						手机
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						Email
					</th>
					<th class="ui-state-default ui-th-ltr zc_grid_head">
						邮寄地址
					</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${dw.rs}" var="item" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }</td>
			<%-- 		<td style="text-align: center;">${item.CUST_CODE }</td> --%>
					<td style="text-align: center;">${item.CUST_NAME }</td>
			<%-- 		<td style="text-align: center;">${item.LEASE_CODE }&nbsp;</td> --%>
					<td style="text-align: center;">${item.LINK_NAME }&nbsp;</td>
					<td style="text-align: center;">${item.LINK_MOBILE}&nbsp;</td>
					<td style="text-align: center;">${item.LINK_EMAIL}&nbsp;</td>
					<td style="text-align: center;">${item.LINK_WORK_ADDRESS }&nbsp;</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
			</div>
			</div>
</form>
	</body>
</html>