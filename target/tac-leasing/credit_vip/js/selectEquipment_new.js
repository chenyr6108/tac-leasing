var kindData;
var manufacturerData;
var insureTypeList;
var supl_map = null;
$(function (){
	//getManufacturer
	//$("input[id^='MANUFACTURER']").dropDownList({"__action": "suplEquipment.getManufacturer"});
	$("#progressbar").dialog({
		closeOnEscape : false,
		modal : true,
		resizable : false,
		draggable : false,
		title : "数据加载中... ..."
	});
	if(supl_map == null){
		$.ajax({
			url : "../servlet/defaultDispatcher",
			data : {"__action" : "suplEquipment.getSupl"},
			dataType : "json",
			success : function (data){
				supl_map = $.map(data, function (item){
					return{
						label : item.display_name,
						value : item.option_value
					};
				});
				loadData(supl_map);
			}
		});
	} else {
		loadData(supl_map);
	}
	
	
	/**/
});

function loadData(map){
	var length = $("input[id^='SUPPIER'].dropDownList").length;
	if(length <= 0){
		$("#progressbar").dialog("close");
	}
	$.each($("input[id^='SUPPIER'].dropDownList"), function (i, e){
		var index = $(this).attr("id").replace("SUPPIER", "");
		$("#TYPE" + index).bind("afterSelect", function (){
			$("#MANUFACTURER" + index)
			.cleanValue()
			.dropDownList({
				"__action" : "suplEquipment.getManufacturer",
				"TYPE_ID" : $(this).getValue()
			});
			$("#KIND" + index)
			.cleanValue()
			.dropDownList({
				"__action" : "suplEquipment.getKind",
				"TYPE_ID" : $(this).getValue(),
				"SUPPLIER_ID" : $("#SUPPIER" + index).getValue()
			});
			$("#PRODUCT" + index).cleanValue();
			$("#TYPE_NAME" + index).val($(this).val());
		});
		
		$("#KIND" + index).bind("afterSelect", function (){
			$("#PRODUCT" + index)
			.cleanValue()
			.dropDownList({
				"__action" : "suplEquipment.getProduct",
				"KIND_ID" : $(this).getValue(),
				"SUPPLIER_ID" : $("#SUPPIER" + index).getValue()
			});
			$("#KIND_NAME" + index).val($(this).val());
		});
		
		$("#PRODUCT" + index).bind("afterSelect", function (){
			$("#PRODUCT_NAME" + index).val($(this).val());
		});
		
		$("#SUPPIER" + index).bind("afterSelect", function (){
			$("#TYPE" + index)
			.cleanValue()
			.dropDownList({
				"__action" : "suplEquipment.getType",
				"SUPPLIER_ID" : $(this).getValue()
			});
			$("#SUPPIER_NAME" + index).val($(this).val());
			$("#KIND" + index).cleanValue();
			$("#TYPE" + index).cleanValue();
			$("#MANUFACTURER" + index).cleanValue();
		})
		.bind("afterLoad", function (){
			$("#TYPE" + index).bind("afterLoad", function (){
				$("#MANUFACTURER" + index).dropDownList({
					"__action" : "suplEquipment.getManufacturer",
					"TYPE_ID" : $(this).getValue()
				});
				$("#KIND" + index).bind("afterLoad", function (){
					$("#PRODUCT" + index).bind("afterLoad", function (){
						if(length == i + 1){
							$("#progressbar").dialog("close");
						}
					})
					.dropDownList({
						"__action" : "suplEquipment.getProduct",
						"KIND_ID" : $(this).getValue(),
						"SUPPLIER_ID" : $("#SUPPIER" + index).getValue()
					});
				})
				.dropDownList({
					"__action" : "suplEquipment.getKind",
					"TYPE_ID" : $(this).getValue(),
					"SUPPLIER_ID" : $("#SUPPIER" + index).getValue()
				});
			})
			.dropDownList({
				"__action" : "suplEquipment.getType",
				"SUPPLIER_ID" : $("#SUPPIER" + index).getValue()
			});
		})
		.dropDownList(supl_map);
		
		$("#UNIT" + index).dropDownList([
		    {
		    	label: "台",
		    	value: "台"
		    },
		    {
		    	label: "辆",
		    	value: "辆"
		    },
		    {
		    	label: "套",
		    	value: "套"
		    },
		    {
		    	label: "件",
		    	value: "件"
		    },
		    {
		    	label: "批",
		    	value: "批"
		    },
		]);
		$("#LOCK_CODE" + index).bind("afterSelect", function (){
			checkLockCode(index);
		})
		.dropDownList([
	 	    {
		    	label: "间接",
		    	value: "1"
		    },
		    {
		    	label: "异常",
		    	value: "2"
		    },
		    {
		    	label: "直接",
		    	value: "3"
		    },
		    {
		    	label: "无",
		    	value: "4"
		    }
		]);
	});
}

function checkLockCode(i){
	var lockCode = $("#LOCK_CODE" + i).val();
	var suplName = $("#SUPPIER_NAME" + i).val();
	$.getJSON("../servlet/defaultDispatcher",
		{
			"__action" : "creditReport.checkLockCode",
			"SUPPIER_NAME": suplName,
			"credit_id" : $("#credit_id").val()
		}, function (data){
			if(data.msg != null){
				alert(data.msg);
			}
		}, "json");
}
function loadEquipmentTypes(){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=suplEquipment.getAllTypes',
		dataType:'json',
		success:function(dataBack){ 
//   			kindData=dataBack.types;  
   			manufacturerData = dataBack.manufacturer;
   			insureTypeList=dataBack.insureTypeList;
   			var tid = document.getElementById("equipmentTab"); 
   			if(dataBack.manufacturer!=null){ 
   			for(j=1;j<=tid.rows.length-3;j++){
//   				var str=$("#TYPE"+j+" option:selected").text(); 
   				var str1=$("#MANUFACTURER"+j+" option:selected").text(); 
//   				document.getElementById("TYPE"+j).remove(0);
   				document.getElementById("MANUFACTURER"+j).remove(0);
//   					for(i=0;i<dataBack.types.length;i++){   
//   						/*if(str.indexOf(dataBack.types[i].TYPE_NAME)==-1){
//   						 	$("#TYPE"+j).get(0).options.add(new Option(dataBack.types[i].TYPE_NAME,dataBack.types[i].TYPE_ID));
//   						}else{
//   							$("#TYPE"+j).get(0).options.add(new Option(dataBack.types[i].TYPE_NAME,dataBack.types[i].TYPE_ID));
//   							document.getElementById("TYPE"+j).options[i].selected=true;
//   						}*/
//   						if(str.trim()==(dataBack.types[i].TYPE_NAME)){
//   						 	$("#TYPE"+j).get(0).options.add(new Option(dataBack.types[i].TYPE_NAME,dataBack.types[i].TYPE_ID));
//   							document.getElementById("TYPE"+j).options[i].selected=true;
//   						}else{
//   							$("#TYPE"+j).get(0).options.add(new Option(dataBack.types[i].TYPE_NAME,dataBack.types[i].TYPE_ID));
//   						}
//   					}
   					for(i=0;i<dataBack.manufacturer.length;i++){   
   						if(str1.trim()==(dataBack.manufacturer[i].MANUFACTURER)){
   						 	$("#MANUFACTURER"+j).get(0).options.add(new Option(dataBack.manufacturer[i].MANUFACTURER,dataBack.manufacturer[i].MANUFACTURER));
   							document.getElementById("MANUFACTURER"+j).options[i].selected=true;
   						}else{
   							$("#MANUFACTURER"+j).get(0).options.add(new Option(dataBack.manufacturer[i].MANUFACTURER,dataBack.manufacturer[i].MANUFACTURER));
   						}
   					}
        		}
   			} 
        }   
	});
}
         
function loadEquipmentManufacturer(id,value){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=suplEquipment.getAllTypesByManufacturer&MANUFACTURER='+value,
		dataType:'json',
		success:function(dataBack){   
   			var htm="<option  value='-1'>--厂牌--</option>";
   			if(dataBack.manufacturer !=null ){
   			for(i=0;i<dataBack.manufacturer.length;i++){
   				htm=htm+"<option value="+dataBack.manufacturer[i].ID+">"+dataBack.manufacturer[i].NAME+"</option>";
        	}
        	}
        	$(id).html(htm);
        }   
	});
}
function loadEquipmentKinds(id,value,count){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=suplEquipment.getAllKindsByTypeId&type_id='+value,
		dataType:'json',
		success:function(dataBack){   
   			var htm="<option  value='-1'>--名称--</option>";
   			if(dataBack.kinds!=null ){
	   			for(i=0;i<dataBack.kinds.length;i++){
	   				htm=htm+"<option value="+dataBack.kinds[i].KIND_ID+">"+dataBack.kinds[i].KIND_NAME+"</option>";
	        	}
        	}
        	$(id).html(htm);
        }   
	});
}

function loadEquipmentProducts(id,value){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=suplEquipment.getAllProductsByKindId&kind_id='+value,
		dataType:'json',
		success:function(dataBack){   
   			var htm="<option value='-1'>--型号--</option>";
   			if(dataBack.products!=null){
   			for(i=0;i<dataBack.products.length;i++){
   				htm=htm+"<option value="+dataBack.products[i].PRODUCT_ID+">"+dataBack.products[i].PRODUCT_NAME+"</option>";
        	}
        	}
        	$(id).html(htm);
        }   
	});
}

function loadEquipmentSuppliers(id,value){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=suplEquipment.getAllSuppliersByProductId&product_id='+value,
		dataType:'json',
		success:function(dataBack){   
   			var htm="<option value='-1'>--供应商--</option>";
   			if(dataBack.suppliers!=null){
   			for(i=0;i<dataBack.suppliers.length;i++){
   				htm=htm+"<option value="+dataBack.suppliers[i].SUEQ_ID+">"+dataBack.suppliers[i].SUPPLIER_NAME+"</option>";
        	}
        	}
        	$(id).html(htm);
        }   
	});
}

function addEquipmentRow(){
	$("#progressbar").dialog({
		closeOnEscape : false,
		modal : true,
		resizable : false,
		draggable : false,
		title : "数据加载中... ..."
	});
	var body = $("#eqBody");
	var eq_count = parseInt($("#eq_count").val());
	var index = eq_count + 1;
	var tr = $("<tr>");
	var td = null;
	var text = null;
	var select = null;
	tr.attr("id", "eq_tr_" + index);
	//供应商
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "SUPPIER" + index).attr("name", "SUPPIER").css("width", "100px").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//厂牌
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "TYPE" + index).attr("name", "TYPE").css("width", "100px").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//制造商
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "MANUFACTURER" + index).attr("name", "MANUFACTURER").css("width", "100px").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//产品名称
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "KIND" + index).attr("name", "KIND").css("width", "80px").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//规格型号
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "PRODUCT" + index).attr("name", "PRODUCT").css("width", "60px").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//留购价
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "STAYBUY_PRICE" + index).attr("name", "STAYBUY_PRICE").css("width", "55px").bind("change", function (){
		positive($(this), '租赁物留购价');setFormatCurrency($(this));
	})
	.appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//含税单价
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "SHUI_PRICE" + index).attr("name", "SHUI_PRICE").css("width", "100px").bind("change", function (){
		hunewupdateTotal(index, $("#H_CONTRACT_TYPE").val());
		setFormatCurrency($(this));
	})
	.appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//单价
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "UNIT_PRICE" + index).attr("name", "UNIT_PRICE").attr("readonly", true).css("width", "100px").bind("change", function (){
		updateTotal(index);
	}).appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//数量
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "AMOUNT" + index).attr("name", "AMOUNT").css("width", "20px").bind("change", function (){
		updateTotal(index);
	}).appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//单位
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "UNIT" + index).attr("name", "UNIT").css("width", "30px").addClass("dropDownList").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//合计
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "TOTAL" + index).attr("name", "TOTAL").css("width", "100px").attr("readonly", true).appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//锁码方式
	td = $("<td>");
	text = $("<input>");
	text.attr("id", "LOCK_CODE" + index).attr("name", "LOCK_CODE").css("width", "50px").addClass("dropDownList").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	//操作
	td = $("<td>");
	var img = $("<img>");
	var a = $("<a>");
	a.attr("href", "javascript:void(0);");
	a.data("index", index);
	a.bind("click", function (){
		//alert($(this).data("index"));
		$("#MOUNTINGS_tr_" + $(this).data("index")).remove();
		$("#eq_tr_" + $(this).data("index")).remove();
	});
	img.attr("src", "../images/u103.gif").appendTo(a);
	a.append("删除");
	a.appendTo(td);
	
	$("<br>").appendTo(td);
	//隐藏域
	text = $("<input>");
	text.attr("id", "TYPE_NAME" + index).attr("type", "hidden").attr("name", "TYPE_NAME").css("width", "100px").appendTo(td);
	text = $("<input>");
	text.attr("id", "KIND_NAME" + index).attr("type", "hidden").attr("name", "KIND_NAME").css("width", "100px").appendTo(td);
	text = $("<input>");
	text.attr("id", "PRODUCT_NAME" + index).attr("type", "hidden").attr("name", "PRODUCT_NAME").css("width", "100px").appendTo(td);
	text = $("<input>");
	text.attr("id", "SUPPIER_NAME" + index).attr("type", "hidden").attr("name", "SUPPIER_NAME").css("width", "100px").appendTo(td);
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	tr.appendTo(body);
	
	//配件说明
	tr = $("<tr>");
	tr.attr("id", "MOUNTINGS_tr_" + index);
	td = $("<td>");
	td.html("配件说明:");
	td.addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	
	td = $("<td>");
	text = $("<textarea>");
	text.attr("cols","100").attr("id", "MOUNTINGS" + index).attr("name", "MOUNTINGS").appendTo(td);

	td.attr("colspan",12).addClass("ui-widget-content jqgrow ui-row-ltr").appendTo(tr);
	$("<br>").appendTo(td);
	tr.appendTo(body);
	
	
	$("#eq_count").val(index);
	
	$("#TYPE" + index).bind("afterSelect", function (){
		$("#MANUFACTURER" + index)
		.cleanValue()
		.dropDownList({
			"__action" : "suplEquipment.getManufacturer",
			"TYPE_ID" : $(this).getValue()
		});
		$("#KIND" + index)
		.cleanValue()
		.dropDownList({
			"__action" : "suplEquipment.getKind",
			"TYPE_ID" : $(this).getValue(),
			"SUPPLIER_ID" : $("#SUPPIER" + index).getValue()
		});
		$("#PRODUCT" + index).cleanValue();
		$("#TYPE_NAME" + index).val($(this).val());
	});
	
	$("#KIND" + index).bind("afterSelect", function (){
		$("#PRODUCT" + index)
		.cleanValue()
		.dropDownList({
			"__action" : "suplEquipment.getProduct",
			"KIND_ID" : $(this).getValue(),
			"SUPPLIER_ID" : $("#SUPPIER" + index).getValue()
		});
		$("#KIND_NAME" + index).val($(this).val());
	});
	
	$("#PRODUCT" + index).bind("afterSelect", function (){
		$("#PRODUCT_NAME" + index).val($(this).val());
	});
	
	$("#SUPPIER" + index).bind("afterLoad", function (){
		$("#progressbar").dialog("close");
	}).bind("afterSelect", function (){
		$("#TYPE" + index)
		.cleanValue()
		.dropDownList({
			"__action" : "suplEquipment.getType",
			"SUPPLIER_ID" : $(this).getValue()
		});
		$("#MANUFACTURER" + index).cleanValue();
		$("#KIND" + index).cleanValue();
		$("#PRODUCT" + index).cleanValue();
		$("#SUPPIER_NAME" + index).val($(this).val());
	}).dropDownList(supl_map);
	$("#UNIT" + index).dropDownList([
	    {
	    	label: "台",
	    	value: "台"
	    },
	    {
	    	label: "辆",
	    	value: "辆"
	    },
	    {
	    	label: "套",
	    	value: "套"
	    },
	    {
	    	label: "件",
	    	value: "件"
	    },
	    {
	    	label: "批",
	    	value: "批"
	    },
	]);
	$("#LOCK_CODE" + index).bind("afterSelect", function (){
		checkLockCode(index);
	})
	.dropDownList([
 	    {
	    	label: "间接",
	    	value: "1"
	    },
	    {
	    	label: "异常",
	    	value: "2"
	    },
	    {
	    	label: "直接",
	    	value: "3"
	    },
	    {
	    	label: "无",
	    	value: "4"
	    }
	]);
	/*$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditReport.lockManager',
		dataType:'json',
		success:function(dataBack){   
   			lockList = dataBack.lockList;
   			var htmq='';
   			for(i=0;i<lockList.length;i++){
		 		htmq=htmq+"<option value='"+lockList[i].CODE+"'>"+lockList[i].FLAG+"</option>"
		 	}
			 var tid = document.getElementById("equipmentTab");
			 var row = tid.insertRow(tid.rows.length-1);
//			 addCell(row,0,'TYPE','select',null,'','',null);	
//			 addCell(row,1,'KIND','select',null,'','',null);	
//			 addCell(row,2,'PRODUCT','select',null,'','',null);	
//			 addCell(row,3,'SUPPIER','select',null,'','',null);	
//			 addCell(row,4,'STAYBUY_PRICE','text',null,'','8',null);	
//			 addCell(row,5,'UNIT_PRICE','text',null,'','12',null);	
//			 addCell(row,6,'AMOUNT','text',null,'','3',null);	
//			 addCell(row,7,'UNIT','select',null,'','',null);	
//			 addCell(row,8,'TOTAL','text',null,'','17',null);	
//			 addCell(row,9,'SHUI_PRICE','text',null,'','12',null);	
//			 addCell(row,10,'LOCK_CODE','select',htmq,'','',null);	
//			 addCell(row,11,'','a',null,'','',null);
//			 
			 addCell(row,0,'MANUFACTURER','select',null,'','',null);	
			 addCell(row,1,'TYPE','select',null,'','',null);	
			 addCell(row,2,'KIND','select',null,'','',null);	
			 addCell(row,3,'PRODUCT','select',null,'','',null);	
			 addCell(row,4,'SUPPIER','select',null,'','',null);	
			 addCell(row,5,'STAYBUY_PRICE','text',null,'','8',null);
			 addCell(row,6,'SHUI_PRICE','text',null,'','12',null);		
			 addCell(row,7,'UNIT_PRICE','text',null,'','12',null);	
			 addCell(row,8,'AMOUNT','text',null,'','3',null);	
			 addCell(row,9,'UNIT','select',null,'','',null);	
			 addCell(row,10,'TOTAL','text',null,'','17',null);	
			
			 addCell(row,11,'LOCK_CODE','select',htmq,'','',null);	
			 addCell(row,12,'','a',null,'','',null);
			 
			 if((tid.rows.length-1)>=4) {
				 $("#del"+(tid.rows.length-1)).html("");
			 }
        }   
	});*/
}

function addCell(row, index, name,type,cls,value,size,height){
	var sed = document.getElementById("equipmentTab").rows.length;
	 var html='';
	 if(type=='select' && name=='MANUFACTURER'){
		html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"'  onchange='loadEquipmentManufacturer(TYPE"+sed+",this.value);'>"
	 	+"<option value='-1'>--制造商--</option>"
	 	for(i=0;i<manufacturerData.length;i++){
	 		html=html+"<option value='"+manufacturerData[i].MANUFACTURER+"'>"+manufacturerData[i].MANUFACTURER+"</option>"
	 	}
	 	html=html+"</select>";	
	 }
	 if(type=='select'&&name=='TYPE'){
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"'  onchange='loadEquipmentKinds(KIND"+sed+",this.value);$(\"#TYPE_NAME"+sed+"\").val(this.options[this.selectedIndex].text);'>"
	 	+"<option value='-1'>--厂牌--</option>"
//	 	for(i=0;i<kindData.length;i++){
//	 		html=html+"<option value='"+kindData[i].TYPE_ID+"'>"+kindData[i].TYPE_NAME+"</option>"
//	 	}
	 	html=html+"</select>";	
	 }
	 if(type=='select'&&name=='KIND'){
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' onchange='loadEquipmentProducts(PRODUCT"+sed+",this.value);$(\"#KIND_NAME"+sed+"\").val(this.options[this.selectedIndex].text);'>"
	 	+"<option value='-1'>--名称--</option></select>";	
	 }
	 if(type=='select'&&name=='PRODUCT'){
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' onchange='loadEquipmentSuppliers(SUPPIER"+sed+",this.value);$(\"#PRODUCT_NAME"+sed+"\").val(this.options[this.selectedIndex].text);'>"
	 	+"<option value='-1'>--型号--</option></select>";	
	 }
	 if(type=='select'&&name=='SUPPIER'){
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' onchange='showApplyGrants(SUPPIER"+sed+",this.value);$(\"#SUPPIER_NAME"+sed+"\").val(this.options[this.selectedIndex].text);'>"
	 	+"<option value='-1'>--供应商--</option></select>";	
	 }
	 if(type=='select'&&name=='UNIT'){
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' >"
	 	+"<option value='台'>-台-</option><option value='辆'>-辆-</option><option value='套'>-套-</option><option value='件'>-件-</option></select>";	
	 }
	 if(type=='select'&&name=='LOCK_CODE'){
	 	html=html+"<select name='"+name+"'>"+cls;
	 	html=html+"</select>";	
	 }
	 if(type=='text'){
	 	html=html+"<input type='text' id='"+name+sed+"' name='"+name+"'  size='"+size+"' value='"+value+"' ";
	 	if(name=='STAYBUY_PRICE'){
	 		html=html+"style='text-align: right;' onchange=\"positive(this,\'租赁物留购价\');setFormatCurrency(this);\"/>";
	 	}else if(name=='UNIT_PRICE'){
	 		//Add By Michael 2011 12/6  设备单价不能修改
	 		html=html+"style='text-align: right;' readonly='readonly' onchange=\"updateTotal('"+sed+"');\"/>";
	 	}else if(name=='AMOUNT'){
	 		html=html+" onchange=\"updateTotal('"+sed+"');\"/>";
	 	}else if(name=='TOTAL'){
	 		html=html+" style='text-align: right;' readonly='readonly'/>";
	 	}else if(name=='SHUI_PRICE'){
	 		var contracttype=$("#H_CONTRACT_TYPE").val();
	 		html=html+" style='text-align: right;' onchange=\"hunewupdateTotal('"+sed+"','"+contracttype+"');setFormatCurrency(this);\"/>";
	 	}else{
	 		html=html+"/>";
	 	}
	 }
	 
	 if(type=='a'){
	 	html=html+"<a href='javascript:void(0)' onclick='deleteRow.call(this)'><span id='del"+sed+"'><img src='../images/u103.gif'>删除</span></a>"
				 +"<input type='hidden' name='TYPE_NAME' ID='TYPE_NAME"+sed+"'>"
				  +"<input type='hidden' name='KIND_NAME' ID='KIND_NAME"+sed+"'>"
				  +"<input type='hidden' name='PRODUCT_NAME' ID='PRODUCT_NAME"+sed+"'>"
				 +"<input type='hidden' name='SUPPIER_NAME' ID='SUPPIER_NAME"+sed+"'>";
	 }
	 var cell = row.insertCell(index); 
	 cell.align='center';
	 if (height != null) {
                cell.height = height;
            }
	 cell.innerHTML =html;
	 row.appendChild(cell);
	 return;
}

 function deleteRow(){
	 var sed=document.getElementById("equipmentTab").rows.length;
     if(sed>=4) {
     	$("#del"+(sed-1)).html("<img src='../images/u103.gif'>删除");
     }
        var tr = this.parentNode.parentNode;
        tr.parentNode.removeChild(tr); 
        changeField('');
    }
		
function showApplyGrants(id,value){
			$.ajax({
				type:'post',
				url:'../servlet/defaultDispatcher',
				data:'__action=creditReport.getApplyGrantBySupperId&supperid='+value,
				dataType:'json',
				success:function(dataBack){ 
					supperGrantMap = dataBack.supperGrantMap;
					var grantprice="当前供应商："+supperGrantMap.SUPNAME+"的授信额度是："+supperGrantMap.GRANT_PRICE+"授信余额是："+supperGrantMap.LAST_PRICE;
					$("#shownowgrant").html(grantprice);		
					$("#shownowgranttr").show();
					$("#shownowgranthidden").hide();
				}
			});		
}  

//Add by Michael 2012 01/16  如果改变租赁方式就修改价格
function clearUnitPrice(){
	 $("input[ID^='UNIT_PRICE']").each(function(){
		 $(this).val(0.0);		 
	 });
	 $("input[ID^='TOTAL']").each(function(){
		 $(this).val(0.0);		 
	 });
	 $("input[ID^='SHUI_PRICE']").each(function(){
		 $(this).val(0.0);		 
	 });
	 document.schemeForm.LEASE_TOPRIC.value=0.0;
    var value = 0.0;
    document.getElementById('leaseTopricBig').innerHTML = atoc(value);
}