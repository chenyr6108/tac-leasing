<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商提供的产品详细信息</title>
</head>
<script type="text/javascript">

</script>
<body>
<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;供应商提供的产品详细信息</span>
</div>
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
<div class="zc_grid_body jqgrowleft">
<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="20%">供应商</td>
			<td>${rs.SUPPLIER_NAME} </td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品型号</td>
			<td>${rs.PRODUCT_NAME }</td>
			
		</tr>
		<!--
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>库存</td>
			<td>${rs.STOCK }</td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>二手设备</td>
			<td><c:if test="${rs.SECOND_HAND eq 0}">否</c:if><c:if test="${rs.SECOND_HAND eq 1}">是</c:if></td>
		</tr>
		-->
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>指导价</td>
			<td><fmt:formatNumber  value="${rs.GUIDANCE_PRICE }"  type="currency"  ></fmt:formatNumber></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>出厂价</td>
			<td><fmt:formatNumber  value="${rs.EX_FACTORY_PRICE }"  type="currency"  ></fmt:formatNumber></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>单位</td>
			<td><c:if test="${rs.UNIT eq 0}">台</c:if><c:if test="${rs.UNIT eq 1}">件</c:if><c:if test="${rs.UNIT eq 2}">辆</c:if><c:if test="${rs.UNIT eq 3}">批</c:if></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>货币单位</td>
			<td><c:if test="${rs.PRICE_UNIT eq 0}">美元</c:if><c:if test="${rs.PRICE_UNIT eq 1}">欧元</c:if><c:if test="${rs.PRICE_UNIT eq 2}">人民币</c:if></td>
		</tr>
		<tr id="7" class="ui-widget-content jqgrow ui-row-ltr">
			<td>使用年限</td>
			<td>${rs.USEEXPIRE }</td>
		</tr>
		<tr id="8" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品说明</td>
			<td>${rs.PRODUCT_DESC }&nbsp;</td>
		</tr>
	</table> 
	<div>
		<center>
			<input type="button" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1);" value="返  回"></input>
		</center>
	</div>			
	</div>
				</div>
			</div>
</body>
</html>