var kindData;
var manufacturerData;
var insureTypeList;
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
	$.ajax({
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
			/* addCell(row,0,'TYPE','select',null,'','',null);	
			 addCell(row,1,'KIND','select',null,'','',null);	
			 addCell(row,2,'PRODUCT','select',null,'','',null);	
			 addCell(row,3,'SUPPIER','select',null,'','',null);	
			 addCell(row,4,'STAYBUY_PRICE','text',null,'','8',null);	
			 addCell(row,5,'UNIT_PRICE','text',null,'','12',null);	
			 addCell(row,6,'AMOUNT','text',null,'','3',null);	
			 addCell(row,7,'UNIT','select',null,'','',null);	
			 addCell(row,8,'TOTAL','text',null,'','17',null);	
			 addCell(row,9,'SHUI_PRICE','text',null,'','12',null);	
			 addCell(row,10,'LOCK_CODE','select',htmq,'','',null);	
			 addCell(row,11,'','a',null,'','',null);
			 */	
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
        }   
	});
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
	 	html=html+"<img src='../images/u103.gif'><a href='javascript:void(0)' onclick='deleteRow.call(this)'>删除</a>"
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
    