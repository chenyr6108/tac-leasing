<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>设备选取</title>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/common/css/tab.css" />
		<script type="text/javascript"
			src="${ctx }/credit/js/selectEquipment.js"></script>
		<script src="${ctx }/common/js/jquery-1.3.2.js" type="text/javascript"></script>
	</head>

	<body onload="loadEquipmentTypes();">
		<h2 align="center">
			设备选取
		</h2>
		<form action="../servlet/defaultDispatcher" name="form1" id="form1"
			method="post">
			<input type="hidden" name="__action"
				value="creditReport.createEquipment">
			<table id="equipmentTab" align="center" width="99%"  border="0" cellspacing="1" cellpadding="0" class="STYLE2"  bgcolor="#798d98">
				<tr>
					<td colspan="8" class="keda_kuang_top"> 
						<strong>客户购买意向</strong> 
					</td>
					<td colspan="3" class="keda_kuang_top">
						相关操作：<img src="${ctx }/images/u100.gif">&nbsp;<a href="#" style="cursor: pointer;" onclick="addEquipmentRow();">添加设备</a> 
					</td>
				</tr>
				<tr>
					<td align="center" width="10%">
						<strong>厂牌</strong>
					</td>
					<td align="center" width="10%">
						<strong>产品名称</strong>
					</td>
					<td align="center" width="10%">
						<strong>规格型号</strong>
					</td>
					<td align="center" width="10%">
						<strong>供应商</strong>
					</td>
					<td align="center" width="10%">
						<strong>留购价(元)</strong>
					</td>
					<td align="center" width="10%">
						<strong>单价(元)</strong>
					</td>
					<td align="center" width="5%">
						<strong> 数量</strong>
					</td>
					<td align="center" width="6%">
						<strong> 单位</strong>
					</td>
					<td align="center" width="14%">
						<strong> 合计</strong>
					</td>
					<td align="center" width="10%">
						<strong>备注</strong>
					</td>
					<td align="center" width="5%">
						<strong>操作</strong>
					</td>
				</tr>
				<tr>
					<td align="center">
						<select id="type0" name="type" onchange="loadEquipmentKinds(kind0,this.value);">
							<option>--类型--</option>
						</select>
					</td>
					<td align="center"> 
						<select id="kind0" name="kind" onchange="loadEquipmentProducts(product0,this.value);">
							<option>--名称--</option>
						</select>
					</td>
					<td align="center">
						<select id="product0" name="product" onchange="loadEquipmentSuppliers(supplier0,this.value);">
							<option>--型号--</option>
						</select>
					</td>
					<td align="center">
						<select id="supplier0" name="supplier">
							<option value="-1">--供应商--</option>
						</select>
					</td>
					<td align="center">
						<input type="text" size=8>
					</td>
					<td align="center">
						<input type="text" size=12>
					</td>
					<td align="center">
						<input type="text" size=3>
					</td>
					<td align="center">
						<select>
							<option value='台'>-台-</option>
							<option value='辆'>-辆-</option>
							<option value='套'>-套-</option>
							<option value='件'>-件-</option>
						</select>
					</td>
					<td align="center">
						<input type="text" size=17>
					</td>
					<td align="center">
						<input type="text" size=12>
					</td>
					<td align="center">
						<img src="${ctx }/images/u103.gif"><a href="#" onclick="deleteRow.call(this)">删除</a>
					</td>
				 </tr>
				 <tr>
				 	<td colspan="11" align="center">
				 		<input type="submit" value="提  交">
				 	</td>
				 </tr>
			</table>
		</form>
	</body>
</html>
