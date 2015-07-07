<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>报告担保人查看</title> 
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css"> 
		<script type="text/javascript"> 
    	$(function() {
			//添加选项卡
			$("#tabs").tabs();
		});
    </script>

	</head>
	<body>
	<table width="1100px;" align="center">
		<tr>
		<td>
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;现场调查报告查看
	   			<c:if test="${creditMap.VIP_FLAG == 1 }">
					（绿色通道）
				</c:if>
	   		</span>
	   	</div>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">   				
			<tr class="ui-widget-content jqgrow ui-row-ltr">
				<td>承租人姓名：${creditMap.CUST_NAME }</td>
				<td>客户编号：${creditMap.CUST_CODE }</td>
				<td>区域主管：${creditMap.CLERK_NAME }</td>
				<td>客户经理：${creditMap.SENSOR_NAME }</td>
				<td>公司代号：${creditMap.COMPANY }</td>
				<td>客户来源：${creditMap.CUSTOMER_COME }</td>
				<c:if test="${!empty creditMap.LINK_NAME }">
					<td>供应商联系人：${creditMap.LINK_NAME}(${creditMap.LINK_MOBILE})</td>
				</c:if>
				<c:if test="${empty creditMap.LINK_NAME }">
					<td>供应商联系人：无</td>
				</c:if>
			</tr>
		</table>
		<div id="tabs">
			<ul>
				<li>
				<a href="#tabs-4" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=creditVoucher.getCreditVouchersShowForSupport&credit_id=${creditMap.ID }&commit_flag=${commit_flag}'">担保人信息</a> 
				</li>
			</ul>
			<div id="tabs-4">
			 	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			    <div class="zc_grid_body jqgrowleft">
				<c:if test="${not empty corpList}">
				 	<%@ include file="../credit/creditVoucherCorpShow.jsp"%>
				</c:if>
				<br>
				<c:if test="${not empty natuList}">
					<%@ include file="../credit/creditVoucherNatuShow.jsp"%>
				</c:if>
				</div> 
				</div>
			</div>
		</div>	
		</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="返回" onclick="goBack()"/>
			</td>
		</tr>
	</table>			
	</body>
	<script>
	function goBack(){
		window.location.href="${ctx}/servlet/defaultDispatcher?__action=supportCreditReportDelete.creditManageForGuarantor";
	}
	</script>
</html>
