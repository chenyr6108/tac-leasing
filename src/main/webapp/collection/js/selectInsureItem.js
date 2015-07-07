function addInsureItem(){
	tab=document.getElementById("insureTab");
	var row = tab.insertRow(tab.rows.length-1);
	var sed = document.getElementById("insureTab").rows.length;
	var cell = row.insertCell(0); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';	 
	 var htmls = "<select id=\"INSURE_ITEM"+sed+"\" name=\"INSURE_ITEM\">" +"<option value=\"-1\">" +"-请选择-" +"</option>";
 	 for(i=0;i<insureTypeData.length;i++){
 		htmls=htmls+"<option value='"+insureTypeData[i].INTP_ID+"'>"+insureTypeData[i].INTP_NAME+"</option>"
 	 }
	 htmls = htmls+"</select>";

	 cell.innerHTML = htmls;
	 row.appendChild(cell);
	 cell = row.insertCell(1); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"START_DATE"+sed+"\" name=\"INSURE_START_DATE\" size=\"11\" /> 到 "
						+" <input id=\"END_DATE"+sed+"\" name=\"INSURE_END_DATE\" size=\"11\" />";
	 row.appendChild(cell);
	  cell = row.insertCell(2); 
	 cell.align='center';
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"INSURE_RATE"+sed+"\" name=\"INSURE_RATE\" size=\"4\">%";
	 row.appendChild(cell);
	  cell = row.insertCell(3); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input class=\"input_right\" onchange=\"changeField('INSURE_PRICE',this);\"  id=\"INSURE_PRICE"+sed+"\" name=\"INSURE_PRICE\" size=\"15\">";
	 row.appendChild(cell);
	 cell = row.insertCell(4); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"INSURE_MEMO"+sed+"\"  name=\"INSURE_MEMO\" size=\"25\">";
	 row.appendChild(cell);
	 cell = row.insertCell(5); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<img src=\"../images/u103.gif\"><a href=\"javascript:void(0)\" onclick=\"deleteInsureItemRow.call(this)\">删除</a>"
	 	+"<input type=\"hidden\" name=\"RECI_ID\" value=\"0\" id=\"RECI_ID"+sed+"\">";
	 row.appendChild(cell);
}
function deleteInsureItemRow(){
    var tr = this.parentNode.parentNode;
    tr.parentNode.removeChild(tr); 
    //changeInsureTotal();
    changeField('INSURE_PRICE');
}  
