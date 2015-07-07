<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>标的物分类</title>
<script type="text/javascript">
	function delProductType(productName) {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=commonCommand.delProductType&PRODUCT_NAME='+productName,
			dataType:'json',
			success: function(flag) {
				if(flag) {
					alert("删除成功!");
					$("#form1").submit();
				} else {
					alert("删除失败!");
				}
			}
		});
	}
	
	function addProductType() {
		$("#TYPE_1").val("");
		$("#TYPE_2").val("");
		$("#TYPE_NAME").val("");
		$("#addProductType").dialog({modal:true, autoOpen:false, width:600, height:150});
		$("#addProductType").dialog("open");
	}
	
	function saveProductType() {
		if($("#TYPE_1").val().trim()=="") {
			alert("大项不能为空");
			return;
		}
		if($("#TYPE_2").val().trim()=="") {
			alert("小项不能为空");		
			return;
		}
		if($("#TYPE_NAME").val().trim()=="") {
			alert("细项(系统产品名称)不能为空");
			return;
		}
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=commonCommand.saveProductType&TYPE_1='+$("#TYPE_1").val()+"&TYPE_2="+$("#TYPE_2").val()+"&PRODUCT_NAME="+$("#TYPE_NAME").val(),
			dataType:'json',
			success: function(flag) {
				if(flag) {
					alert("添加成功!");
					$("#form1").submit();
				} else {
					alert("添加失败!");
				}
			}
		});
	}
</script>
</head>
<body>
	<form action="../servlet/defaultDispatcher" name="form1" id="form1" method="post">
		<input type="hidden" name="__action" id="__action" value="commonCommand.getProductType">
		<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
		   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;">&nbsp;&nbsp;标的物分类维护</span>
	   	</div>
	   	<br>
	   	<div>
	   	<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tr>
				<td width="8">&nbsp;</td>
				<td width="60" class="ss_o"></td>
				<td width="40%" class="ss_t">
					<table style="margin-left: 10px;">
						<tr>
							<td colspan="5">&nbsp;&nbsp;细项(系统产品名称)<input name="PRODUCT_NAME" value="${productName }"></td>
						</tr>
					</table></td>
				<td width="55" class="ss_th" valign="top">&nbsp;</td>
				<td width="20%"><a href="#" name="search" id="search"
					onclick="doSearch();" class="blue_button">搜 索</a>
				</td>
			</tr>
		</table>
   		</div>
      		<br>
      	<input value="添加标的物分类" type="button" class="ui-state-default ui-corner-all" onclick="addProductType()" style="cursor: pointer;">
      	<br><br>
		<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
	           <div class="zc_grid_body jqgrowleft">
				 <div class="ui-state-default ui-jqgrid-hdiv">
				<page:pagingToolbarTop pagingInfo="${pagingInfo }"/>
					<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table">
						<tr>
							<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head">序号</td>
							<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head"><page:pagingSort orderBy="TYPE_1" pagingInfo="${pagingInfo }">大项</page:pagingSort></td>
							<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head"><page:pagingSort orderBy="TYPE_2" pagingInfo="${pagingInfo }">小项</page:pagingSort></td>
							<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head"><page:pagingSort orderBy="PRODUCT_LEVEL" pagingInfo="${pagingInfo }">级别</page:pagingSort></td>
							<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head"><page:pagingSort orderBy="PRODUCT_NAME" pagingInfo="${pagingInfo }">细项(系统产品名称)</page:pagingSort></td>
							<td style="text-align: center" class="ui-state-default ui-th-ltr zc_grid_head">操作</td>
						</tr>
						<c:forEach items="${pagingInfo.resultList }" var="item" varStatus="index">
							<tr class="ui-widget-content jqgrow ui-row-ltr" style="cursor: pointer;">
								<td style="text-align: center">${index.count }</td>
								<td style="text-align: center">${item.TYPE_1 }</td>
								<td style="text-align: center">${item.TYPE_2 }</td>
								<td style="text-align: center">${item.PRODUCT_LEVEL }</td>
								<td style="text-align: center">${item.PRODUCT_NAME }</td>
								<td style="text-align: center"><a href="javascript:void(0)" onclick="delProductType('${item.PRODUCT_NAME}')">删除</a></td>
							</tr>
						</c:forEach>
					</table>
				<page:pagingToolbar pagingInfo="${pagingInfo }"/>
				</div>
		   </div>
		</div>
	</form>
	<div id="addProductType" style="display: none;" title="维护标的物类别">
		<br>
		<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=commonCommand.addProductType" method="post" id="productForm">
			<input type="hidden" name="maintaninceId" id="maintaninceId"/>
			<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
			    <div class="zc_grid_body jqgrowleft">
					<div class="ui-state-default ui-jqgrid-hdiv ">
						<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" style="width:300px;margin: 0 auto">
							<tr>
								<td style="text-align: center;">大项</td>
								<td style="text-align: center;">小项</td>
								<td style="text-align: center;">细项(系统产品名称)</td>
							</tr>
							<tr>
								<td style="text-align: center;"><input name="TYPE_1" id="TYPE_1"></td>
								<td style="text-align: center;"><input name="TYPE_2" id="TYPE_2"></td>
								<td style="text-align: center;"><input name="TYPE_NAME" id="TYPE_NAME"></td>
							</tr>
							<tr>
								<td colspan="3" style="text-align: center;"><input type="button" class="ui-state-default ui-corner-all" value="保存" onclick="saveProductType()" style="cursor:pointer;"/></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
<!--导数据使用 add by ShenQi 请误删除 <div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
   <div class="zc_grid_body jqgrowleft">
		<div class="ui-widget-content jqgrow ui-row-ltr ">
			<form action="../servlet/defaultDispatcher?__action=commonCommand.uploadExcel" method="post" enctype="multipart/form-data">
			<input type="hidden" name="type" value="excel">
				<table cellspacing="1" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
					<tr>
						<td align="left" class="ui-widget-content jqgrow ui-row-ltr"><b>上传附件</b>
						</td>
						<td class="ui-widget-content jqgrow ui-row-ltr"><input type="file" id="excel" name="excel" class="ui-state-default ui-corner-all"></td>
					</tr>
					<tr>
						<td colspan="2" id="button_flag" style="text-align:center;">
						<br>
							<input type="submit" value="保&nbsp;存" class="ui-state-default ui-corner-all" style="cursor:pointer;">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div> -->