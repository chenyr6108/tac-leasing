function addOtherPrice(){
	tab=document.getElementById("otherPriceTab");
	var row = tab.insertRow(tab.rows.length-1);
	var sed = document.getElementById("otherPriceTab").rows.length;
	 cell = row.insertCell(0); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"OTHER_NAME"+sed+"\" name=\"OTHER_NAME\"/>";
	 row.appendChild(cell);
	 cell = row.insertCell(1); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input class=\"input_right\" onchange=\"changeField('OTHER_PRICE',this);\"  id=\"OTHER_PRICE"+sed+"\" name=\"OTHER_PRICE\">";
	 row.appendChild(cell);
	 cell = row.insertCell(2); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"OTHER_DATE"+sed+"\" name=\"OTHER_DATE\">";
	 row.appendChild(cell);
	 cell = row.insertCell(3); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<input id=\"OTHER_MEMO"+sed+"\" name=\"OTHER_MEMO\" size=\"30\">";
	 row.appendChild(cell);
	 cell = row.insertCell(4); 
	 cell.align='center'; 
	 cell.className='ui-widget-content jqgrow ui-row-ltr';
	 cell.innerHTML ="<img src=\"../images/u103.gif\"><a href=\"javascript:void(0)\" onclick=\"deleteOtherPriceRow.call(this)\">删除</a>"
	 	+"<input type=\"hidden\" name=\"RECO_ID\" value=\"0\" id=\"RECO_ID"+sed+"\">";
	 row.appendChild(cell); 
}
function deleteOtherPriceRow(){
        var tr = this.parentNode.parentNode;
        tr.parentNode.removeChild(tr); 
        changeField('OTHER_PRICE');
} 