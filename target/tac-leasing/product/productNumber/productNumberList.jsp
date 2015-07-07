<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>产品机号信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${ctx}/product/productNumber/js/productNumber.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body> 
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher" id="form1"  method="post">
		<input type="hidden" name="__action" value="productNumber.findAllProductNumber" />
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
	   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;产品机号</span>
	   	</div>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
           <div class="zc_grid_body jqgrowleft">
			<div>
				 <table width="845" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td width="110">&nbsp;</td>
				        <td width="60" class="ss_o">&nbsp;</td>
				        <td width="439" class="ss_t">&nbsp;&nbsp;
				          <input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:395px; height:20px;"></td>
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();""  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<!-- 
					<td><input type="button" onclick="addNumberDiv()" style="padding: 2px 10px;" class="ui-state-default ui-corner-all" value="添加"></td>
				-->
				<td><%@ include file="/common/pageControlTop.jsp"%></td>
			</tr>
		</table>	
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
			<thead>
			<tr class="ui-jqgrid-labels">
				<td width="4%" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
					 序号
				</td>
				<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
					合同号
				</td>
				<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
					产品机号
				</td>
				<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
					型号名称
				</td>
				<td width="20%" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
					产品名称
				</td>
				<td width="8%" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
					制造商
				</td>
				<!-- 
					<td width="10%" class="ui-state-default ui-th-ltr zc_grid_head" align="center">
						操作
					</td>
				-->
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.rs}" var="result" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count }&nbsp;</td>
					<td style="text-align: center;">${result.LEASE_CODE}&nbsp;</td>
					<td style="text-align: center;">${result.THING_NUMBER }&nbsp;</td>
					<td style="text-align: center;">${result.PRODUCTNAME}&nbsp;</td>
					<td style="text-align: center;">${result.KINDNAME}&nbsp;</td>
					<td style="text-align: center;">${result.TYPENAME}&nbsp;</td>	
					<!-- 				
						<td style="text-align: center;"><a href="javascript:void(0)" onclick="showNumberDiv('${result.ID}')">查看</a> <a href="javascript:void(0)" onclick="updateNumberDiv('${result.ID}')">修改</a> <a href="javascript:void(0)" onclick="deleteNumber('${result.ID}')">删除</a> </td>
					-->
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/pageControl.jsp"%>
	</div>
				</div>
			</div>
	</form>
	<!-- 
	<div id="addProductNumber" style="display: none;" title="产品机号添加">
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=productNumber.createNumber" method="post" id="addForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td colspan="1">制造商</td><td><select name="type_id" style="width: 80px" id="type_id" onchange="getKind() ;this.options[this.selectedIndex].text"></select> </td>	
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td colspan="1">产品名称</td><td><select name="kind_id" id="kind_id" onchange="getProduct() ;"><option value="0">--请选择--</option></select>  </td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td colspan="1">产品型号</td><td><select name="product_id" id="product_id"><option value="0">--请选择--</option></select>  </td>
		</tr>
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="30%">产品机号</td>
			<td><input type="text" name="Name" id="Name" onblur="checkProductNumber()"/></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><input type="text" name="Memo"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" value="增加" id="buttonAdd" class="ui-state-default ui-corner-all" onclick="addNumber()" disabled="disabled"></input>
				<input type="button" value="关闭" class="ui-state-default ui-corner-all" onclick="closeDialog(addProductNumber);"/>
			</center>
			</td>
		</tr>
	</table>
	</div>
			</div>
		</div>
</form>
	</div>
	
	<div id="showProductNumber" style="display: none;" title="产品机号查看">
	<form action="" method="post" >
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>制造商</td>
			<td><span id="showTypeName"></span></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品名称</td>
			<td><span id="showKindName"></span></td>
		</tr>
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品型号</td>
			<td><span id="showProductName"></span></td>
		</tr>
		<tr id="5" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品机号</td>
			<td><span id="showNumberName"></span></td>
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
	
	<div id="updateProductNumber" style="display: none;" title="产品机号修改">
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=productNumber.updateNumberById" method="post" id="updateForm">
	<input type="hidden" name="id" id="id"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>制造商</td>
			<td><select name="update_type_id" style="width: 80px" id="update_type_id" onchange="getUpdateKind();"></select></td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品名称</td>
			<td><select name="update_kind_id" style="width: 90px" id="update_kind_id" onchange="getUpdateProduct()"></select></td>
		</tr>
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品型号</td>
			<td><select name="update_product_id" style="width: 90px" id="update_product_id" ></select></td>
		</tr>
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品机号</td>
			<td><input type="text" name="updateName" id="updateName"/></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><input type="text" name="updateMemo" id="updateMemo" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" class="ui-state-default ui-corner-all" value="确定" onclick="update()">
				<input type="button" class="ui-state-default ui-corner-all" value="关闭" onclick="closeDialog(updateProductNumber);"/>
			</center>
			</td>
		</tr>
	</table>
	</div>
				</div>
			</div>
</form>
	</div>
	-->
</body>
</html>