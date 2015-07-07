<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx }/common/js/check.js"></script>
<script type="text/javascript" src="${ctx }/credit/js/autoquery.js"></script>
<!-- Add by ZhangYizhou on 2014-06-20 Begin -->
<!-- IT201406077:补全供应商及厂牌的autocomplete功能 -->
<script type="text/javascript" src="${ctx}/common/js/jquery.autocomplete.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/jquery.autocomplete.css" />
<!-- Add by ZhangYizhou on 2014-06-20 End -->
<title>分配供应商提供的产品</title>
</head>
<script type="text/javascript">

//$(function(){
//	//加载供应商
//	$.ajax({
//		type:"get",
//		url:"../../servlet/defaultDispatcher",
//		data:"__action=suplEquipment.getAllSupplier",
//		dataType:"json",
//		success:function(json){
//			var arraylist = json;
//			var htmls="<option value='0'>--请选择--</option>";
//			for( var i=0;i<arraylist.length;i++){
//				htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
//			}
//			$("#Supplier_id").html(htmls);	
//		},
//		error:function(){
//			alert('加载供应商发生错误!');
//		     }
//	     });
//	//加载制造商
//	$.ajax({
//		type:"get",
//		url:"../../servlet/defaultDispatcher",
//		data:"__action=suplEquipment.getAllType",
//		dataType:"json",
//		success:function(json){
//			var arraylist = json;
//			var htmls="<option value='0'>--请选择--</option>";
//			for( var i=0;i<arraylist.length;i++){
//				htmls = htmls+"<option value='"+arraylist[i].ID+"'>"+arraylist[i].NAME+"</option>";
//			}
//			$("#types").html(htmls);	
//		},
//		error:function(){
//			alert('加载制造商发生错误!');
//		     }
//	     });
//     
//});	


function getSupplier(){
     $("#Supplier_id").val("") ;
     if($("#Supplier_name").val() != null && $("#Supplier_name").val() != ""){
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:"__action=suplEquipment.checkSupplier&supplier_name="+$("#Supplier_name").val(),
				dataType:"json",
				success:function(json){						
					var temp = json ;
					var supplier_id = temp.supplier_id ;
					if(supplier_id == null || supplier_id == ""){
						alert("供应商名字名字不存在请重新输入!") ;
						$("#buttonAdd").attr("disabled",true);
					} else {
						$("#Supplier_id").val(supplier_id) ;
						$("#buttonAdd").attr("disabled",false);
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
     if($("#typesName").val() != null && $("#typesName").val() != ""){
    	 var type_name=$("#typesName").val();
			$.ajax({
				type:"get",
				url:"../../servlet/defaultDispatcher",
				data:{
					__action:'suplEquipment.checkProductType',
					type_name:type_name
				},
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
}
function getProduct(){
	$.ajax({
		type:"get",
		url:"../../servlet/defaultDispatcher",
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

addSuplEqipment =function(){
	 if($("#Supplier_id").val()==0){
		 	alert("请选择供应商");
			return false;
		 }
	 if($("#types").val()==0){
		 	alert("请选择产品厂牌");
			return false;
		 }
	 if($("#kind_id").val()==0){
		 	alert("请选择产品");
			return false;
		 }
	 if($("#product_id").val()==0){
		 	alert("请选择产品型号");
			return false;
		 }
	
	 var n =  $("#Guidance_price").val() ;
	 if($("#Guidance_price").val() == null | $("#Guidance_price").val() == ''){
	 	
		 alert("请输入指导价");
		 return false;
	
   	 }else{
   	 
			if(notPositive(document.addForm.Guidance_price,'指导价')){   	
			return ;
	 }
   	
   }
   if($("#Ex_factory_price").val() ==null | $("#Ex_factory_price").val() ==''){
   	
	   alert("请输入出场价");
	   return false;
		
   }else{
   	
	   if(notPositive(document.addForm.Ex_factory_price,'出厂价')){  	
		return ;
	   }
   }
   
   if ($("#Unit").val() ==null || $("#Unit").val() =='') {
	   alert("请选择单位");
	   return false;
   }
   
   if ($("#Price_unit").val() ==null || $("#Price_unit").val() =='') {
	   alert("请选择货币单位");
	   return false;
   }
   
   if ($("#useExpire").val() == null |$("#useExpire").val().trim() == '') {
   		
	   alert("请请输入使用年限");
	   return false;
   }else{
	   	if(!/^\d+$/.test($.trim($("#useExpire").val()))){
	 		alert("使用年限必须是整数") ;
	 		$("#useExpire").focus();
	 		return false ;
	 	}
   }
	
   $.ajax({
   	  type:'post',
   	  dataType:'json',
   	  url:'../../servlet/defaultDispatcher',
   	  data:'__action=suplEquipment.validateProduct&Supplier_id='+$("#Supplier_id").val()+"&product_id="+$("#product_id").val(),
   	  success:function(dataBack){ 
   	  	  if(dataBack.count>0){
   	  	  	alert("供应商已添加该型号产品！");
   	  	  }else{
   	  	  	$("#addForm").submit();
   	  	  }
   	  }
   });	   

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


/* Add by ZhangYizhou on 2014-06-20 Begin */
/* IT201406077:补全供应商及厂牌的autocomplete功能 */
var options = {
		minChars : 1,
		max : 20,
		mustMatch: false,
		matchContains: true,
		formatItem : function(row, i, max) {
			var rs = row.NAME;
			return rs;
		},
		formatMatch : function(row, i, max) {
			return row.id + " " + row.NAME;
		},
		formatResult : function(row) {
			return row.NAME;
		}
	};
$(function(){
	$.ajax({
		type:'post',
		url:'../../servlet/defaultDispatcher',
		data:'__action=suplEquipment.getSuppliersForHint',
		dataType:'json' ,
		success: function (data) { 
			dataList = data.suppliers; 
			$("#Supplier_name").autocomplete(dataList, options);
		}
	});
	$.ajax({
		type:'post',
		url:'../../servlet/defaultDispatcher',
		data:'__action=suplEquipment.getProductTypesForHint',
		dataType:'json' ,
		success: function (data) { 
			dataList = data.productTypes; 
			$("#typesName").autocomplete(dataList, options);
			$("#typesName").result(function(event, data, formatted) {
				getKind();
			}); 
		}
	});
});
/* Add by ZhangYizhou on 2014-06-20 End */




--></script>
<body> 
<form action="${pageContext.request.contextPath}/servlet/defaultDispatcher?__action=suplEquipment.createSuplEquipment" method="post" name="addForm" id="addForm">
	<div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix" style="height: 30px">
   		<span class="ui-jqgrid-title" style="line-height: 30px; font-size: 15px;" >&nbsp;&nbsp;分配供应商提供的产品</span>
   	</div>
	<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="main">
    <div class="zc_grid_body jqgrowleft">
	<div class="ui-state-default ui-jqgrid-hdiv ">
	
	<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
		<tr id="1" class="ui-widget-content jqgrow ui-row-ltr">
			<!-- Modify by ZhangYizhou on 2014-06-20 Begin -->
			<!-- IT201406077:补全供应商及厂牌的autocomplete功能 -->
			<td colspan="2" >
				供应商<font style="color:red;">*</font>：
				<input type="text" name="Supplier_name" id="Supplier_name" autocomplete="off" onblur="setTimeout('getSupplier()',500)"><input type="hidden" name="Supplier_id" id="Supplier_id">
				厂牌<font style="color:red;">*</font>：
				<input type="text" id="typesName" onchange="setTimeout('getKind()',500)" name="typesName" size="40" autocomplete="off"><input type="hidden" name="types" id="types"/>
				产品<font style="color:red;">*</font>：
				<select name="kind_id" onchange="getProduct()" id="kind_id" >
					<option value="0">--请选择--</option>
				</select>
				产品型号<font style="color:red;">*</font>：
				<select name="product_id" id="product_id">
					<option value="0">--请选择--</option>
				</select>
			</td>
			<!-- Modify by ZhangYizhou on 2014-06-20 End -->
		</tr>
		<!--
		<tr id="2" class="ui-widget-content jqgrow ui-row-ltr">
			<td width="30%">库存</td>
			<td><input type="text" size="10" name="Stock" ></input></td>	
		</tr>
		<tr id="3" class="ui-widget-content jqgrow ui-row-ltr">
			<td>二手设备</td>
			<td><select name="Second_hand">
					<option>--请选择--</option>
					<option value="1">是</option>
					<option value="0">否</option>
				</select></td>
		</tr>
		-->
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>指导价<font style="color:red;">*</font></td>
			<td><input type="text" name="Guidance_price" id="Guidance_price" size="20"/></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>出厂价<font style="color:red;">*</font></td>
			<td><input type="text" name="Ex_factory_price" id="Ex_factory_price" size="20"/></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>单位<font style="color:red;">*</font></td>
			<td><select id="Unit" name="Unit">
					<option value="">--请选择--</option>
					<option value="0">台</option>
					<option value="1">件</option>
					<option value="2">辆</option>
					<option value="3">批</option>
				</select></td>
		</tr>
		<tr id="4" class="ui-widget-content jqgrow ui-row-ltr">
			<td>货币单位<font style="color:red;">*</font></td>
			<td><select id="Price_unit" name="Price_unit">
					<option value="">--请选择--</option>
					<option value="0">美元</option>
					<option value="1">欧元</option>
					<option value="2">人民币</option>
				</select></td>
		</tr>
	<!--	<tr id="6">
			<td>创建人</td>
			<td>
				<input type="text" name="Create_person" />
			</td>
		</tr>
	-->	<tr id="7" class="ui-widget-content jqgrow ui-row-ltr">
			<td>使用年限<font style="color:red;">*</font></td>
			<td><input type="text" name="useExpire" id="useExpire" /></td>
		</tr>
		<tr id="8" class="ui-widget-content jqgrow ui-row-ltr">
			<td>产品说明</td>
			<td><textarea rows="2" cols="50" name="Product_desc" ></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<center>
					<input type="button" class="ui-state-default ui-corner-all" value="增  加" onclick="addSuplEqipment()" id="buttonAdd"></input>&nbsp;<input type="reset" class="ui-state-default ui-corner-all" value="重  置"></input>
					<input type="button" class="ui-state-default ui-corner-all" value="返  回" onclick="javascript:history.go(-1);"></input>
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