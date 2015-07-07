//var kindData;
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
   			/*if(dataBack.types!=null){
   				for(i=0;i<dataBack.types.length;i++){
   					$("#TYPE0").get(0).options.add(new Option(dataBack.types[i].TYPE_NAME,dataBack.types[i].TYPE_ID));
        		}
   			} */
			manufacturerData = dataBack.manufacturer;
   				insureTypeList=dataBack.insureTypeList;
   			var tid = document.getElementById("equipmentTab"); 
   			if(manufacturerData !=null){ 
   			for(j=0;j<=tid.rows.length-2;j++){
   			var str1=$("#MANUFACTURER"+j+" option:selected").text(); 
   				document.getElementById("MANUFACTURER"+j).remove(0);
   				for(i=0;i<manufacturerData.length;i++){   
   						if(str1.trim()==(manufacturerData[i].MANUFACTURER)){
   						 	$("#MANUFACTURER"+j).get(0).options.add(new Option(manufacturerData[i].MANUFACTURER,manufacturerData[i].MANUFACTURER));
   							document.getElementById("MANUFACTURER"+j).options[i].selected=true;
   						}else{
   							$("#MANUFACTURER"+j).get(0).options.add(new Option(manufacturerData[i].MANUFACTURER,manufacturerData[i].MANUFACTURER));
   						}
   					}
           		}
   			}
   			}
	});
}

function loadEquipmentKinds(id,value){
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

function loadEquipmentSuppliers(id,value,numberId){
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
		data:'__action=rentContract.lockManager',
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
			 addCell(row,5,'UNIT_PRICE','UNIT_PRICE',null,'0','12',null);	
			 addCell(row,6,'AMOUNT','AMOUNT',null,'1','3',null);	
			 addCell(row,7,'UNIT','select',null,'','',null);	
			 addCell(row,8,'TOTAL','TOTAL',null,'0','17',null);	
			 addCell(row,9,'SHUI_PRICE','SHUI_PRICE',null,'0','12',null);	
			 addCell(row,10,'LOCK_CODE','select',htmq,'','',null);	
			 addCell(row,11,'','a',null,'','',null);
			 */	
			 addCell(row,0,'MANUFACTURER','select',null,'','',null);	
			 addCell(row,1,'TYPE','select',null,'','',null);	
			 addCell(row,2,'KIND','select',null,'','',null);	
			 addCell(row,3,'PRODUCT','select',null,'','',null);
			 addCell(row,4,'SUPPIER','select',null,'','',null);	
			 addCell(row,5,'NUMBER','number',null,'','',null);	
			 addCell(row,6,'STAYBUY_PRICE','text',null,'','8',null);
			 addCell(row,7,'SHUI_PRICE','SHUI_PRICE',null,'0','12',null);	
			 addCell(row,8,'UNIT_PRICE','UNIT_PRICE',null,'0','12',null);	
			 addCell(row,9,'AMOUNT','AMOUNT',null,'1','3',null);	
			 addCell(row,10,'UNIT','select',null,'','',null);	
			 addCell(row,11,'TOTAL','TOTAL',null,'0','17',null);	
				
			 addCell(row,12,'LOCK_CODE','select',htmq,'','',null);	
			 addCell(row,13,'','a',null,'','',null);
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
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' onchange='loadEquipmentKinds(KIND"+sed+",this.value);$(\"#TYPE_NAME"+sed+"\").val(this.options[this.selectedIndex].text);'>"
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
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' onchange='loadEquipmentSuppliers(SUPPIER"+sed+",this.value,NUMBER"+sed+");$(\"#PRODUCT_NAME"+sed+"\").val(this.options[this.selectedIndex].text);'>"
	 	+"<option value='-1'>--型号--</option></select>";	
	 }
	  if(type=='number'&&name=='NUMBER'){          
	 	html=html+"<input type='text' id='"+name+sed+"' name='"+name+"' onchange='$(\"#NUMBER_NAME"+sed+"\").val(this.value);' onblur='checkThingNumber(this) ;' />"
	 }
	 if(type=='select'&&name=='SUPPIER'){
	 	html=html+"<select id='"+name+sed+"' name='"+name+"' class='"+cls+"' onchange='$(\"#SUPPIER_NAME"+sed+"\").val(this.options[this.selectedIndex].text);'>"
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
	 if(type=='UNIT_PRICE'){
	 	html=html+"<input type='text' class=\"input_right\" id='"+name+sed+"' onchange=\"changeField('UNIT_PRICE',this);\"  name='"+name+"'  size='"+size+"' value='"+value+"' />";
	 }
	 if(type=='AMOUNT'){
	 	html=html+"<input type='text' id='"+name+sed+"' onchange=\"changeField('AMOUNT',this);\"  name='"+name+"'  size='"+size+"' value='"+value+"' />";
	 }
	 if(type=='TOTAL'){
	 	html=html+"<input type='text' class=\"input_right\" id='"+name+sed+"' readonly=\"readonly\"  name='"+name+"'  size='"+size+"' value='"+value+"' />";
	 }
	 if(type=='SHUI_PRICE'){
	 	var contracttype=$("#H_CONTRACT_TYPE").val();
	 	html=html+"<input type='text' class=\"input_right\" id='"+name+sed+"' onchange=\"changeFields('SHUI_PRICE',this,'"+contracttype+"');\"  name='"+name+"'  size='"+size+"' value='"+value+"' />";
	 }
	 if(type=='text'){
	 	html=html+"<input type='text' id='"+name+sed+"' name='"+name+"'  size='"+size+"' value='"+value+"' />";
	 }
	 if(type=='a'){
	 	html=html+"<img src='../images/u103.gif'><a href='javascript:void(0);' onclick='deleteRow.call(this)'>删除</a>"
				 +"<input type='hidden' name='TYPE_NAME' ID='TYPE_NAME"+sed+"'>"
				  +"<input type='hidden' name='KIND_NAME' ID='KIND_NAME"+sed+"'>"
				  +"<input type='hidden' name='PRODUCT_NAME' ID='PRODUCT_NAME"+sed+"'>"
				   +"<input type='hidden' name='NUMBER_NAME' ID='NUMBER_NAME"+sed+"'>"
				 +"<input type='hidden' name='SUPPIER_NAME' ID='SUPPIER_NAME"+sed+"'>"
				 +"<input type='hidden' name='EQMT_ID' ID='EQMT_ID"+sed+"' value='0'>";
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

function changeField(eventName,field) {
 	//isDirty = true;
 	if (eventName == 'UNIT_PRICE') {
 		verifyNumber(field);
 		changeLeaseTopic();
 	} else if (eventName == 'AMOUNT') {
 		valueIsNumber1(field);
 		changeLeaseTopic();
 	} else if (eventName == 'LEASE_TOPRIC') {
 		changeLeaseTopic();
 		changePledgePrice();
 	} else if (eventName == 'PLEDGE_PRICE_RATE') {
		changePledgePrice();
		changeRZE();
	} else if (eventName == 'PLEDGE_PRICE') {
		verifyNumber(field);
		changePledgePriceRate();
		changeRZE();
    } else if (eventName == 'HEAD_HIRE_PERCENT') {
       	changeHeadHire();
       	changeRZE();
    } else if (eventName == 'HEAD_HIRE') {
		verifyNumber(field);
       	changHeadHirePercent();
       	changeRZE();
    } else if (eventName == 'MANAGEMENT_FEE_RATE') {
		changeManagementFee();     
    } else if (eventName == 'MANAGEMENT_FEE') {
    	verifyNumber(field);
        changeManagementFeeRate();
    } else if (eventName == 'FLOAT_RATE') {
    	verifyNumber(field);
       	changeYearInterest();
    } else if (eventName == 'YEAR_INTEREST') {
       	changFloatRate();
    } else if (eventName == 'LEASE_PERIOD') {
       	changeYearInterest();
       	changeManagementFee();
    } else if (eventName == 'LEASE_TERM') {
        changeYearInterest();
       	changeManagementFee();
    } else if (eventName == 'INSURE_PRICE') {
        changeInsureTotal();
    } else if (eventName == 'OTHER_PRICE') {
        changeOtherFeeTotal();
    } else if (eventName == 'PAY_WAY') {
       changeRZE();
    } 

    else {
        console.error('else ', eventName);
    }
}
function changeFields(eventName,field,contracttype) {
		
		verifyNumber(field);
 		changeHuLeaseTopic(contracttype);
}

function deleteRow(){
   var tr = this.parentNode.parentNode;
   tr.parentNode.removeChild(tr); 
   changeLeaseTopic();
}