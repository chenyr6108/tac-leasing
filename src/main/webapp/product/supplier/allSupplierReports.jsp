<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>供应商财务报表</title> 
		<link rel="stylesheet" type="text/css" href="${ctx}/common/css/tab.css">
		<script type="text/javascript"> 
    	$(function() {
			$("#tabsss").tabs();
			$("#tabsss").tabs('select',${showFlag});
		});
    </script>
    <script type="text/javascript" src="${ctx }/product/supplier/js/reportConfirm.js"></script>
	</head>
	<body>
		<center>
			<form name="reportForm" id="reportForm" action="../servlet/defaultDispatcher" method="post">
				<input type="hidden" name="__action" id="__action" value="supplierReports.saveSupplierReports">
				<input type="hidden" name="supplier_id" value="${supplier_id}">
				<div id="tabsss">
					<ul> 
						<li><a href="#tabsss-1" onclick="javascript:location.href='${ctx }/servlet/defaultDispatcher?__action=supplier.findSupplierById&flag=1&id=${supplier_id }'">供应商信息</a></li>
						<li><a href="#tabsss-2">BSPL-1</a></li>
						<li><a href="#tabsss-3" id="bs_2">BSPL-2</a></li>
						<li><a href="#tabsss-4" onclick="initReportConfirmData();">RATIO</a></li>
					</ul>
					<div id="tabsss-1"> 
						<%@ include file="supplierDetail.jsp"%>
						<br/>
					</div>
					<div id="tabsss-2">
						<c:if test="${not empty obj1}">
							<%@ include file="supplierPropertyAndDebt.jsp"%>
						</c:if>
						<c:if test="${empty obj1}">
							<%@ include file="supplierPropertyAndDebtInit.jsp"%>
						</c:if>
						<br/>
					</div>
					<div id="tabsss-3">
						<c:if test="${not empty obj1}">
							<%@ include file="supplierPropertyAndDebt2.jsp"%>
						</c:if>
						<c:if test="${empty obj1}">
							<%@ include file="supplierPropertyAndDebtInit2.jsp"%>
						</c:if>
						<br/>
					</div>
					<div id="tabsss-4"> 
						<%@ include file="reportConfirm.jsp"%>
						<br/>
					</div>
					
			</div>
		</form>
		</center>
	</body>
</html>
	