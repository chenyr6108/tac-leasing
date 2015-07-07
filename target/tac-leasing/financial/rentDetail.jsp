<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function doQuery() {
		$("#form1").submit();
	}
	
	function exportExcel(){
		var v=$("#selectDate").val();
		var t=$("#companyCode").val();
		location.href="../servlet/defaultDispatcher?__action=InvoiceData.exportRentDetail&selectDate="+v+"&companyCode="+t;
	}
	
	function showDetail(recpId){
		$("#pactAffix_" + recpId).toggle(function(){
	        $(this).load("../servlet/defaultDispatcher?__action=InvoiceData.showRentDetail&recp_id=" + recpId );
	    });
	}
	

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当月拨款案件利息明细表</title>
</head>
<body>
<form action="../servlet/defaultDispatcher" method="post" name="form1"
		id="form1">
		<input type="hidden" name="__action" id="__action"
		value="InvoiceData.getRentDetail">

		<div
			class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
			style="height: 30px;width:98%;">
			<span class="ui-jqgrid-title"
				style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;当月拨款案件利息明细表</span>
		</div>

		<div
			class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all"
			style="background: white;width:98%;">

			<table width="70%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#ffffff">
				<tr>
					<td width="8">&nbsp;</td>
					<td width="60" class="ss_o"></td>
					<td width="40%" class="ss_t">
						<table style="margin-left: 10px;">
							<tr>
								<td colspan="5">&nbsp;					          		
								<td>查询周期：</td>
					          		<td>
					          			<select name="selectDate" id="selectDate">
					          				<c:forEach var="item" items="${dateList }">
					          					<option value="${item.CODE }" <c:if test="${item.CODE eq selectDate }">selected="selected"</c:if>>
					          						${item.DESCR }
					          					</option>
					          				</c:forEach>
					          			</select>
					          										          &nbsp;公司别：
									<select name="companyCode" id="companyCode">
										<option value="">全部</option>
										<c:forEach items="${companys1}" var="item">
											<option value="${item.code}"<c:if test="${item.code eq companyCode }">selected='selected'</c:if>>${item.name}</option>
										</c:forEach>
									</select>
					          		</td>	 
							</tr>
						</table>
					</td>
					<td width="55" class="ss_th" valign="top">&nbsp;</td>
					<td width="20%"><a href="#" name="search" id="search"
						onclick="doQuery();" class="blue_button">搜 索</a></td>
				</tr>
			</table>
			
			<br> <br> <br>
						 <div class="ui-state-default ui-jqgrid-hdiv"
				style="background: white">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
				<tr >
				    <td>
				    <input type="button" value="导出利息明细" onclick="exportExcel()">&nbsp;&nbsp;
				    </td>
					<td><%@ include file="/common/pageControl.jsp"%></td>
				</tr>
			</table>
				<table class="grid_table">
                    <tr >
					  <th>序号</th>
					  <th>客户名称</th>
					  <th>合同号</th>
					  <th>起租日</th>
					  <th>拨款日</th>
					  <!-- <th>总期数</th> -->
					</tr>
					
					<tbody>
					<c:forEach items="${resultList }" var="item" varStatus="status">
					  <tr>
					  <td >${status.count }</td>
					    <td >${item.CUST_NAME }</td>
					    <td class="cursor: pointer;" onclick="showDetail('${item.RECP_ID}')">${item.LEASE_CODE }</td>
					    <td >${item.START_DATE }</td>
					    <td >${item.FINANCECONTRACT_DATE }</td>
					    <%-- <td >${item.LEASE_PERIOD }</td> --%>
					   <%--  <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: center;">${item.PAY_DATE }</td>
					    <td class="ui-widget-content jqgrow ui-row-ltr" style="text-align: right;"><fmt:formatNumber type="currency" value="${item.REN_PRICE }" pattern="#,##0.00"/></td>--%>
					  </tr>
					   
					   <tr>
						<th class="pact" colspan="6">
							<div id="pactAffix_${item.RECP_ID}" align="center"
								style="margin-left:15px ;margin-right:15px;margin-top:10px;margin-bottom:20px;  display: none; width: 97%">
								<img src="${ctx }/images/loading.gif">
							</div>
						</th>
					  </tr>
					</c:forEach>
					</tbody>

				</table>
				<%@ include file="/common/pageControl.jsp"%>
			</div>
		</div>
	</form>
		<br><br>
		<font color="red">*</font>${backDate }之数据<br>
        <font color="red">*</font>重车：含税利息<br>
        <font color="red">*</font>设备及乘用车:未税利息<br>
</body>
</html>