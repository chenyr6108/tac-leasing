function addInsureItem(){
				tab=document.getElementById("insureTab");
				var row = tab.insertRow(tab.rows.length-1);
				var sed = document.getElementById("insureTab").rows.length;
				var cell = row.insertCell(0);  
				cell.className = "ui-widget-content jqgrow ui-row-ltr";
				 cell.align='center';   
				 html="<select id=\"INSURE_ITEM"+sed+"\" name=\"INSURE_ITEM\">";
				 html1="";
				 for(i=0;i<insureTypeList.length;i++){
						html1=html1+"<option value='"+insureTypeList[i].INTP_ID+"'>"+insureTypeList[i].INTP_NAME+"</option>"			 
				 } 
				 cell.innerHTML =html+html1+"</select>";
				 row.appendChild(cell);
				 cell = row.insertCell(1); 
				 cell.className = "ui-widget-content jqgrow ui-row-ltr";
				 cell.align='center'; 
				 cell.innerHTML ="<input id=\"START_DATE"+sed+"\" name=\"START_DATE_\" size=\"11\" /> 到 "
									+" <input id=\"END_DATE"+sed+"\" name=\"END_DATE\" size=\"11\" />";
				 row.appendChild(cell);
				  cell = row.insertCell(2); 
				  cell.className = "ui-widget-content jqgrow ui-row-ltr";
				 cell.align='center'; 
				 cell.innerHTML ="<input id=\"INSURE_RATE"+sed+"\" name=\"INSURE_RATE\" size=\"4\">%";
				 row.appendChild(cell);
				  cell = row.insertCell(3); 
				  cell.className = "ui-widget-content jqgrow ui-row-ltr";
				 cell.align='center'; 
				 cell.innerHTML ="<input id=\"INSURE_PRICE"+sed+"\" name=\"INSURE_PRICE\" size=\"15\" onchange=\"changeInsurePrice();\" style=\"text-align: right\">";
				 row.appendChild(cell);
				 cell = row.insertCell(4); 
				 cell.className = "ui-widget-content jqgrow ui-row-ltr";
				 cell.align='center'; 
				 cell.innerHTML ="<input id=\"INSURE_MEMO"+sed+"\"  name=\"INSURE_MEMO\" size=\"25\">";
				 row.appendChild(cell);
				 cell = row.insertCell(5); 
				 cell.className = "ui-widget-content jqgrow ui-row-ltr";
				 cell.align='center'; 
				 cell.innerHTML ="<img src=\"../images/u103.gif\"><a href=\"javascript:void(0)\" onclick=\"deleteRow2.call(this)\">删除</a>";
				 row.appendChild(cell);  
					dateClick();
}

 function deleteRow2(){
        var tr = this.parentNode.parentNode;
        tr.parentNode.removeChild(tr); 
        changeInsurePrice();
    }  