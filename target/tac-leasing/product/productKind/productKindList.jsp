<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>产品名称信息</title>

<script type="text/javascript" src="${ctx }/common/js/check.js"></script>	
<script src="${ctx }/product/productKind/js/productKind.js" type="text/javascript"></script> 
<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css"></link>
<script type="text/javascript">
	$(function () {
		var content = {
			      tipInfo: "<font style='font-size:13px;'>查询内容包括产品名称和厂牌!<br></font>"
			};
			$("#searchValue").showTip(content);
			
			if($("#TYPE1").val()=='NO_DATA') {
				$("#TYPE2 option").each(function() {
					$(this).remove();
				});
				$("#TYPE2").get(0).options.add(new Option("--无--",""));
			} else if($("#TYPE1").val()=='') {
				$("#TYPE2").attr("disabled",false);
			} else if($("#TYPE1").val()!='NO_DATA'&&$("#TYPE1").val()!='') {
				$("#TYPE2").attr("disabled",false);
			}
	});
	
	function maintaninceType(name,type1,type2) {
		
		$("#save").attr("disabled",false);
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=productKind.getProductType1',
			dataType:'json',
			success: function(data) {
				$("#TYPE_1 option").each(function() {
					$(this).remove();
				});
				
				var code  = "";
				for(var i=0;i<data.length;i++){
					var option = new Option(data[i].CODE,data[i].FLAG);
					if(type1 == data[i].CODE){
						option.setAttribute("selected","selected");
						code = data[i].CODE;
					}
					$("#TYPE_1").get(0).options.add(option);
				}
				if(code==""){
					code = data[0].CODE;
				}
				
				$.ajax({
					type:'post',
					url:'../servlet/defaultDispatcher',
					data:'__action=productKind.getProductType2&TYPE1='+code,
					dataType:'json',
					success: function(data) {
										
						$("#TYPE_2 option").each(function() {
							$(this).remove();
						});
						
						for(var i=0;i<data.length;i++){
							var option = new Option(data[i].CODE,data[i].FLAG);
							if(type2 == data[i].CODE){
								option.setAttribute("selected","selected");
							}
							$("#TYPE_2").get(0).options.add(option);
						}
						
					}
				}); 
		}
		});
		
		$("#TYPE_NAME").val(name);
		$("#maintaninceProductType").dialog({modal:true, autoOpen:false, width:600, height:150});
		$("#maintaninceProductType").dialog("open");
	}
	
	function changeType1() {
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=productKind.getProductType2&TYPE1='+$("#TYPE_1").val(),
			dataType:'json',
			success: function(data) {
				$("#TYPE_2 option").each(function() {
					$(this).remove();
				});
				
				for(var i=0;i<data.length;i++){
					$("#TYPE_2").get(0).options.add(new Option(data[i].CODE,data[i].FLAG));
				}
			}
		});	
	}
	
	function saveType() {
		
		$("#save").attr("disabled","disabled");
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=commonCommand.saveProductType&TYPE_1='+$("#TYPE_1").val()+"&TYPE_2="+$("#TYPE_2").val()+"&PRODUCT_NAME="+$("#TYPE_NAME").val(),
			dataType:'json',
			success: function(flag) {
				if(flag) {
					alert("保存成功!");
					$("#form1").submit();
				} else {
					alert("保存失败!");
				}
			}
		});
	}
	
	function changeType() {
		if($("#TYPE1").val()=="NO_DATA") {
			$("#TYPE2 option").each(function() {
				$(this).remove();
			});
			$("#TYPE2").get(0).options.add(new Option("--无--",""));
			$("#TYPE2").attr("disabled","disabled");
			return;
		}
		$("#TYPE2").attr("disabled",false);
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=productKind.getProductType2&TYPE1='+$("#TYPE1").val(),
			dataType:'json',
			success: function(data) {
				$("#TYPE2 option").each(function() {
					$(this).remove();
				});
				
				$("#TYPE2").get(0).options.add(new Option("--全部--",""));
				for(var i=0;i<data.length;i++){
					$("#TYPE2").get(0).options.add(new Option(data[i].CODE,data[i].FLAG));
				}
			}
		});
	}
	
	function getType2() {
		
		$.ajax({
			type:'post',
			url:'../servlet/defaultDispatcher',
			data:'__action=productKind.getProductType2&TYPE1='+$("#TYPE_1").val(),
			dataType:'json',
			success: function(dataList) {
				var options = {
						minChars : 1,
						max : 25,
						mustMatch: false,
						width:260,
						matchContains: true,
						formatItem : function(row, i, max) {
							return row.FLAG;
						},
						formatMatch : function(row, i, max) {
							return row.CODE + " " + row.FLAG;
						},
						formatResult : function(row) {
							return row.FLAG;
						}
					   };
		
				$("#TYPE_2").autocomplete(dataList, options);
				$("#TYPE_2").result(function(event, data, formatted) {
					$("#TYPE_2_HIDDEN").val(data.CODE);
				});
			}
		});
	}
	
	function exportExcel() {
		window.parent.callBirt("birtReport/exportProductType/productType.rptdesign","xls",{"CONTENT":encodeURI($("#searchValue").val()),"TYPE_1":encodeURI($("#TYPE1").val()),"TYPE_2":encodeURI($("#TYPE2").val()),"PRODUCT_LEVEL":encodeURI($("#PRODUCT_LEVEL").val())});
	}
</script>
</head>
<body> 
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher" id="form1"  method="post">
	<input type="hidden" name="__action" value="productKind.findAllProductKind" />
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;产品名称</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
         <div class="zc_grid_body jqgrowleft">
			<div>
				<table width="80%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				      <tr>
				      <td>&nbsp;</td>
				        <td class="ss_o">&nbsp;</td>
				        <td class="ss_t"><table>
				          <tr>
				          <td>
				          	&nbsp;&nbsp;&nbsp;&nbsp;内容：<input type="text" id="searchValue" name="searchValue" value="${searchValue }" style="width:150px; height:20px;"/>
							&nbsp;&nbsp;&nbsp;&nbsp;大项：<select name="TYPE1" id="TYPE1" style="width: 100px;" onchange="changeType()"><option value="">--全部--</option><option value="NO_DATA" <c:if test="${TYPE1 eq 'NO_DATA' }">selected='selected'</c:if>>--无--</option>
							<c:forEach items="${typeList1 }" var="item">
								<option <c:if test="${item.CODE eq TYPE1 }">selected='selected'</c:if> value="${item.CODE }">${item.FLAG }</option>
							</c:forEach>
							</select>
							&nbsp;&nbsp;小项：<select name="TYPE2" id="TYPE2" style="width: 100px;" disabled="disabled"><option value="">--全部--</option>
							<c:forEach items="${typeList2 }" var="item">
								<option <c:if test="${item.CODE eq TYPE2 }">selected='selected'</c:if> value="${item.CODE }">${item.FLAG }</option>
							</c:forEach>
							</select>
							
							&nbsp;&nbsp;级别：<select name="PRODUCT_LEVEL" ID="PRODUCT_LEVEL">
								<option value="" <c:if test="${PRODUCT_LEVEL eq '' }">selected='selected'</c:if>>-请选择-</option>
								<option value="A" <c:if test="${PRODUCT_LEVEL eq 'A' }">selected='selected'</c:if>>A</option>
								<option value="AA" <c:if test="${PRODUCT_LEVEL eq 'AA' }">selected='selected'</c:if>>AA</option>
								<option value="AAA" <c:if test="${PRODUCT_LEVEL eq 'AAA' }">selected='selected'</c:if>>AAA</option>
								<option value="B" <c:if test="${PRODUCT_LEVEL eq 'B' }">selected='selected'</c:if>>B</option>
								<option value="BB" <c:if test="${PRODUCT_LEVEL eq 'BB' }">selected='selected'</c:if>>BB</option>
								<option value="BBB" <c:if test="${PRODUCT_LEVEL eq 'BBB' }">selected='selected'</c:if>>BBB</option>
							</select>							
				          </td>	
					 </tr>
					</table>				  
				         
				        <td width="55" class="ss_th" valign="top">&nbsp;</td>
				        <td><a href="#" name="search" id="search" onclick="doSearch();"  class="blue_button">搜 索</a></td>
				      </tr>
				    </table>
				    </div>
		<div class="ui-state-default ui-jqgrid-hdiv ">
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
			<tr >
				<td><input type="button" onclick="addKindDiv();" class="ui-state-default ui-corner-all" value="添加" style="cursor: pointer;">&nbsp;&nbsp;<input type="button" onclick="exportExcel();" class="ui-state-default ui-corner-all" value="导出Excel" style="cursor: pointer;"></td>
				<td>
					<page:pagingToolbarTop pagingInfo="${dw }"/>
				</td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title grid_table" id="#table1">
			<thead>
			<tr class="ui-jqgrid-labels">
				<th width="4%" class="ui-state-default ui-th-ltr zc_grid_head">
					序号
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					产品名称
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					大项
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					小项
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					级别
				</th>
				<th class="ui-state-default ui-th-ltr zc_grid_head">
					厂牌
				</th>
				<th width="10%" class="ui-state-default ui-th-ltr zc_grid_head">
					操作
				</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${dw.resultList}" var="result" varStatus="status">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center;">${status.count}</td>
					<td style="text-align: center;">${result.NAME }</td>
					<td style="text-align: center;">${result.TYPE1 }&nbsp;</td>
					<td style="text-align: center;">${result.TYPE2 }&nbsp;</td>
					<td style="text-align: center;">${result.PRODUCT_LEVEL }&nbsp;</td>
					<td style="text-align: center;">${result.TYPE_NAME }</td>
					<td style="text-align: center;"><a href="javascript:void(0)" onclick="showKindDiv('${result.ID}')">查看</a> <a href="javascript:void(0)" onclick="updateKindDiv('${result.ID}')">修改</a> <a href="javascript:void(0)" onclick="deleteKind('${result.ID}')">删除</a> <a href="javascript:void(0)" onclick="maintaninceType('${result.NAME }','${result.TYPE1 }','${result.TYPE2 }')">标的物分类维护</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:pagingToolbar pagingInfo="${dw }"/>
		</div>
		</div>
		</div>
	</form>
	
	
	<div id="addProductKind" style="display: none;" title="产品名称添加">
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=productKind.createProduct" method="post" id="addForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	<input type="hidden" name="Type" value="1">
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td>厂牌</td>
			    <td><input type="text" name="type_name" id="type_name" onblur="getChild();"/><input type="hidden"name="type_id" id="type_id" /></td>
		</tr>
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="30%">产品名称</td>
			<td><input type="text" id="Name" name="Name" onblur="checkKind()"/></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><input type="text" name="Memo"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<input type="button" id="buttonAdd" class="ui-state-default ui-corner-all" value="增加" onclick="add()" disabled="disabled"></input>
				  <input type="button" class="ui-state-default ui-corner-all" onclick="closeDialog(addProductKind);" value="关闭" style="cursor: pointer;">
			</center>
			</td>
		</tr>
	</table>
	</div>
				</div>
				</div>
</form>
	</div>
	
	<div id="showProductKind" style="display: none;" title="产品名称查看">
	<form action="" method="post" id="showForm">
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td>厂牌</td>
			<td><span id="showTypeName"></span></td>
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品名称</td>
			<td><span id="showName"></span></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><span id="showMemo"></span></td>
		</tr>
	</table>
		</div>
				</div>
				</div>
</form>
	</div>

<div id="maintaninceProductType" style="display: none;" title="维护标的物类别">
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
								<td style="text-align: center;"><select name="TYPE_1" id="TYPE_1" onchange="changeType1()"></select></td>
								<td style="text-align: center;"><select name="TYPE_2" id="TYPE_2"></select></td>
								<td style="text-align: center;"><input name="TYPE_NAME" id="TYPE_NAME" readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan="3" style="text-align: center;"><input id="save" type="button" class="ui-state-default ui-corner-all" value="保存" onclick="saveType()" style="cursor:pointer;"/></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</form>
</div>
<div id="updateProductKind" style="display: none;" title="产品名称修改">
	<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=productKind.updateProductById" method="post" id="updateForm">
	<input type="hidden" name="id" id="id"/>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title" id="#table1">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr" >
			<td>厂牌</td>
			<td><input type="text" name="updateTypeName" id="updateTypeName" onblur="getChildUpdate();"><input type="hidden" name="type_id" id="updateTypeID"style="width: 94%"></td></tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品名称</td>
			<td><input type="text" id="updateName" name="updateName" />&nbsp;</td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>描述</td>
			<td><input type="text" id="updateMemo" name="updateMemo"/></td>
		</tr>

		<tr>
			<td colspan="2">
			<center>
				<input type="button" class="ui-state-default ui-corner-all"  id="buttonUpdate" value="确定" onclick="update()" />
				<input type="button" class="ui-state-default ui-corner-all" value="关闭" onclick="closeDialog(updateProductKind);"/>
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