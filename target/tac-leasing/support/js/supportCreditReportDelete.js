function checkRent(id){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportCreditReportDelete.checkRent&credit_id='+id,
		dataType:'json',
		success:function(dataBack){   
   			if(dataBack.rentMap=="0"){
		   			if(dataBack.controlMap=="0"){
						if(confirm('该资信没有生成合同和风控,您确定要删除此资信吗？')){
							location.href='../servlet/defaultDispatcher?__action=supportCreditReportDelete.delete&credit_id='+id;
						}else{
							return false;
						}		   				
		   			}
		   			else{
		   						$("#sub").bind("click", function(event) {		
									location.href='../servlet/defaultDispatcher?__action=supportCreditReportDelete.delete&credit_id='+id;				
		   						});
		   						var sed = document.getElementById("table1").rows.length;
								for(i=1;i<sed;i++){ 								        
								        var tid = document.getElementById("table1");
								        tid.deleteRow(i); 					 	
								}		   						
								for(i=0;i<dataBack.controlList.length;i++){ 
									 var tid = document.getElementById("table1");
									 var row = tid.insertRow(tid.rows.length);
									 addCell(row,0,dataBack.controlList[i].PRC_HAO,'0');
									 addCell(row,1,dataBack.controlList[i].SEC_SUGGESTION,'1');	
									 addCell(row,2,dataBack.controlList[i].SYNTHESIZE_SUGGESTION,'1');	
									 addCell(row,3,dataBack.controlList[i].GM_SUGGESTION,'1');
									 addCell(row,4,dataBack.controlList[i].STATE);									 	
								}   			
							$('#rentDiv').dialog({
						        modal: true,
						        autoOpen: false,
						        width: 800
							});
							$('#rentDiv').dialog('open'); 	   			
		   			}			
        	}
        	else{
        		alert("此资信已生成合同,请先删除合同,再删除资信!");
        	}
        }   
	});
}

function closeDialog(msg){
	$(msg).dialog('close');
}

function addCell(row,index,value,type){
	 var sed = document.getElementById("table1").rows.length;
	 var html='<tr class="ui-widget-content jqgrow ui-row-ltr">'; 
	 if(type=='0'){
	 	html=html+"<td width=\"30%\">"+value+"</td>";
	 }
	 else{
		 if(value==null){
		 	html=html+"<td width=\"11%\">"+"否"+"</td>";	
		 }
		 else{
		 	html=html+"<td width=\"11%\">"+"是"+"</td>";
		 }		 
	 }
  	 html=html+"</tr>"
	 var cell = row.insertCell(index); 
	 cell.align='center';
	 cell.innerHTML =html;
	 row.appendChild(cell);
	 return;
}