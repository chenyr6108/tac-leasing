<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>制造商信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ctx }/product/productType/js/productType.js" type="text/javascript"></script> 
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>	

</head>
<body> 
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher" id="form1"  method="post">
		<input type="hidden" name="__action" value="productType.findAllProductType" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;制造商</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
			<div>
				<table width="755" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="75">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<td><input type="button" onclick="addTypeDiv()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加"></td>
				<td><%@ include file="/common/pageControlTop.jsp"%></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
			<tr class="ui-jqgrid-labels">
				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">序号</th>
				<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">制造商</th>
				<th width="30%" class="ui-state-default ui-th-ltr zc_grid_head">产品厂牌</th>
				<th width="15%" class="ui-state-default ui-th-ltr zc_grid_head">创建日期</th>
				<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.rs}" var="result" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count}</td>
					<td style="text-align: center;">${result.MANUFACTURER}</td>
					<td style="text-align: center;">${result.NAME }</td>
					<td style="text-align: center;"><fmt:formatDate value="${result.CREATE_DATE}" pattern="yyyy-MM-dd"/></td>
					<td style="text-align: center;"><a href="javascript:void(0)" onclick="showTypeDiv('${result.ID}')">查看</a> <a href="javascript:void(0)" onclick="updateTypeDiv('${result.ID}')">修改</a> <a href="javascript:void(0)" onclick="deleteType('${result.ID}')">删除</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
		</div>
				</div>
			</div>
	</form>
	
	<div id="addProductType" style="display: none;" title="制造商添加">
		<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=productType.createProduct" method="post" id="addForm" name="addForm">

	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">制造商</td>
			<td><input type="text" name="Manufacturer" id="manufacturer"/></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">产品厂牌</td>
			<td><input type="text" name="Name" id="Name"/></td>
		</tr>		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><input name="Memo" type="text"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" value="增加" class="ui-state-default ui-corner-all" onclick="checkType()"/><input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(addProductType);"/>
			</center>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
	</div>
	
	<div id="showProductType" style="display: none;" title="制造商查看">
	<form action="" method="post" >
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>制造商</td>
			<td><span id="showManufacturer"></span></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品厂牌</td>
			<td><span id="showName"></span></td>
		</tr>		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><span id="showMemo"></span></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
	</div>
	
	<div id="updateProductType" style="display: none;" title="修改制造商">
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=productType.updateProduct" method="post" id="updateForm" name="updateForm">
	<input type="hidden" name="id" id="id"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">制造商信息</td>
			<td><input type="text" name="Manufacturer" id="Manufacturer"></input></td>
		</tr>
		<tr class="ui-widget-content jqgrow ui-row-ltr">
			<td width="10%">产品厂牌</td>
			<td><input type="text" name="name" id="name"></input></td>
		</tr>		
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><input type="text" name="memo" id="memo"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" class="ui-state-default ui-corner-all" value="修改" onclick="update()"></input>
					 <input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(updateProductType);"/>
			</center>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</form>
	</div>
	
</body>
</html>