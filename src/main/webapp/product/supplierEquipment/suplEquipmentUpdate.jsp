<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新供应商提供的产品</title>
</head>

<script type="text/javascript" src="${ctx}/product/supplierEquipment/js/suplEquipment.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
<script type="text/javascript">

function getSupplier(){
     $("#Supplier_id").val("") ;
     if($("#Supplier_name").val() != null && $("#Supplier_name").val() != ""){
			$.ajax({
				type:"get",
				url:"../servlet/defaultDispatcher",
				data:"__action=suplEquipment.checkSupplier&supplier_name="+$("#Supplier_name").val(),
				dataType:"json",
				success:function(json){						
					var temp = json ;
					var supplier_id = temp.supplier_id ;
					if(supplier_id == null || supplier_id == ""){
						alert("供应商名字名字不存在请重新输入!") ;
						$("#buttonUpdate").attr("disabled",true);
					} else {
						$("#Supplier_id").val(supplier_id) ;
						$("#buttonUpdate").attr("disabled",false);
					}
				},
				error:function(){
					alert('查询供应商发生错误!');
				     }
			     });
	}
}
function getKind(){
     $("#types").val("") ;
			$.ajax({
				type:"get",
				url:"../servlet/defaultDispatcher",
				data:"__action=suplEquipment.checkProductType&type_name="+$("#typesName").val(),
				dataType:"json",
				success:function(json){						
					var temp = json ;
					var type_id = temp.type_id ;
					$("#types").val(type_id) ;
					var htmls="<option  value='0'>--请选择--</option>";
					if(temp.kindList != null){
						for( var i=0;i<temp.kindList.length;i++){
							htmls = htmls+"<option value='"+temp.kindList[i].ID+"'>"+temp.kindList[i].NAME+"</option>";
						}		
					}
					$("#kind_id").html(htmls);
				},
				error:function(){
					alert('加载产品类型发生错误!');
				     }
			     });
}
function getProduct(){
	$.ajax({
		type:"get",
		url:"../servlet/defaultDispatcher",
		data:"__action=suplEquipment.getProductByKindId&kind_id="+$("#kind_id").val(),
		dataType:"json",
		success:function(json){
			var arraylist = json;
			if (arraylist.length<=0) {
				return;
			} else {
				var htmls="<option value='0'>--请选择--</option>";
				for( var i=0;i<arraylist.length;i++){
					htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
				}
				$("#product_id").html(htmls);
			}
		},
		error:function(){
			alert('加载产品型号发生错误!');
		     }
	     });
}
updateSuplEquipment = function(sueq_id){
   //$("#Stock").val()
	 if($("#kind_id").val()==0){
		 	alert("请选择产品");
			return false;
		 }
	 if($("#product_id").val()==0){
		 	alert("请选择产品型号");
			return false;
		 }
   if($("#Guidance_price").val() == null){
   		$("#Guidance_price").val(0)
	
   }else{
	   if(notPositive(document.updateForm.Guidance_price,'指导价')){   	
		return ;
	   }
   	
   }
   if($("#Ex_factory_price").val() ==null){
   	
		$("#Ex_factory_price").val(0)
		
   }else{
   	
	   if(notPositive(document.updateForm.Ex_factory_price,'出厂价')){  	
		return ;
	   }
   }
   
   if ($("#useExpire").val() == null |$("#useExpire").val().trim() == '') {
   		
		$("#useExpire").val(0)
   }else{
   		if(!/^\d+$/.test($.trim($("#useExpire").val()))){
	 		alert("使用年限必须是整数") ;
	 		$("#useExpire").focus();
	 		return false ;
	 	}
   }
   
	$("#Sueq_id").val(sueq_id);
	$("#updateForm").submit();
}
function notPositive(field, name) {
    var value = $.trim(field.value);
    value = value.replace(/[￥,]/g, '');
    if (!/^\d+(\.\d+)?$/.test(value)) {
        alert(name + '只能输入数字！');
        field.focus();
        return true;
    } else {
        value = '' + parseFloat(value);
        field.value = value
        return false;
    }
}
</script>
<body> 
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=suplEquipment.updateSuplEquipmentById" method="post" name="updateForm" id="updateForm">
	<input  type="hidden" name="Sueq_id" id="Sueq_id"/> 
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;更新供应商提供的产品</span>
   	</div>
   	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
          <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<td colspan="2">供应商：<input <c:if test="${count > 0}">readonly='readonly'</c:if> type="text" name="Supplier_name" id="Supplier_name" onblur="getSupplier() ;" <c:forEach items="${rs.allSuppliers}" var="supplier"><c:if test="${supplier.ID eq rs.SUPPLIER_ID}">value="${supplier.NAME}"</c:if></c:forEach>/><input type="hidden" name="Supplier_id" id="Supplier_id" value="${rs.SUPPLIER_ID}"  />厂牌：<input type="text" id="typesName" onblur="getKind();" name="typesName" <c:forEach items="${rs.allTypes}" var="type"><c:if test="${type.ID eq rs.TYPE_ID}">value="${type.NAME }"</c:if></c:forEach> <c:if test="${count > 0}">readonly='readonly'</c:if> /><input type="hidden" value="${rs.TYPE_ID}" name="types" id="types">产品：<c:if test="${count > 0}">${rs.KIND_NAME }&nbsp;</c:if><c:if test="${!(count > 0)}"><select name="kind_id" onchange="getProduct()" id="kind_id" >
					<option value="${rs.KIND_ID }">${rs.KIND_NAME }</option>
				</select></c:if>产品型号：<c:if test="${count > 0}">${rs.PRODUCT_NAME }&nbsp;</c:if><c:if test="${!(count > 0)}"><select name="product_id" id="product_id"><option value="${rs.PRODUCT_ID }">${rs.PRODUCT_NAME}</option>
				</select></c:if></td>			
		</tr>
		<!--
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="20%">库存</td>
			<td><input id="Stock" type="text" size="10" name="Stock" value="${rs.STOCK }"></input></td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>二手设备</td>
			<td><select name="Second_hand">
					<option value="1" <c:if test="${rs.SECOND_HAND eq 1}">selected="selected"</c:if>>是</option>
					<option value="0" <c:if test="${rs.SECOND_HAND eq 0}">selected="selected"</c:if>>否</option>
				</select></td>
		</tr>
		-->
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>指导价</td>
			<td><input type="text" name="Guidance_price" id="Guidance_price" size="20" value="<fmt:formatNumber  value="${rs.GUIDANCE_PRICE }"  type="currency"  />" /></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>出厂价</td>
			<td><input type="text" name="Ex_factory_price" id="Ex_factory_price" size="20" value="<fmt:formatNumber  value="${rs.EX_FACTORY_PRICE }"  type="currency"  />"/></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>单位</td>
			<td><select name="Unit">
					<option value="0" <c:if test="${rs.UNIT eq 0}">selected="selected"</c:if>>台</option>
					<option value="1" <c:if test="${rs.UNIT eq 1}">selected="selected"</c:if>>件</option>
					<option value="2" <c:if test="${rs.UNIT eq 2}">selected="selected"</c:if>>辆</option>
					<option value="3" <c:if test="${rs.UNIT eq 3}">selected="selected"</c:if>>批</option>
				</select></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>货币单位</td>
			<td><select name="Price_unit">					
					<option value="0" <c:if test="${rs.PRICE_UNIT eq 0}">selected="selected"</c:if>>美元</option>
					<option value="1" <c:if test="${rs.PRICE_UNIT eq 1}">selected="selected"</c:if>>欧元</option>
					<option value="2" <c:if test="${rs.PRICE_UNIT eq 2}">selected="selected"</c:if>>人民币</option>
				</select></td>
		</tr>
		<tr id="7" class="ui-widget-content jqgrow ui-row-ltr">
			<td>使用年限</td>
			<td><input type="text" name="useExpire" id="useExpire" value="${rs.USEEXPIRE }"/></td>
		</tr>
		<tr id="8" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品说明</td>
			<td><textarea rows="2" cols="50" name="Product_desc">${rs.PRODUCT_DESC}</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
				<div>
					<input type="button" value="更新" class="ui-state-default ui-corner-all" onclick="updateSuplEquipment('${rs.SUEQ_ID}')" id="buttonUpdate"></input>					
					<input type="reset" class="ui-state-default ui-corner-all" value="重置"></input>
					<input type="button" value="返回" class="ui-state-default ui-corner-all" onclick="javascript:history.go(-1);"></input>
				</div>
			</center>
			</td>
		</tr>
	</table>
	</div>
				</div>
			</div>
</form>
</body>
</html>