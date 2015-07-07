function addOtherPrice(){
	tab=document.getElementById("otherPriceTab");
	var row = tab.insertRow(tab.rows.length-1);
	var sed = document.getElementById("otherPriceTab").rows.length;
	 cell = row.insertCell(0); 
	 cell.className = "ui-widget-content jqgrow ui-row-ltr";
	 cell.align='center'; 
	 cell.innerHTML ="<input id=\"OTHER_NAME"+sed+"\" name=\"OTHER_NAME\"/>";
	 row.appendChild(cell);
	 cell = row.insertCell(1); 
	 cell.className = "ui-widget-content jqgrow ui-row-ltr";
	 cell.align='center'; 
	 cell.innerHTML ="<input id=\"OTHER_PRICE"+sed+"\" name=\"OTHER_PRICE\" style=\"text-align:right;\" onchange=\"changeOtherPrice();\">";
	 row.appendChild(cell);
	 cell = row.insertCell(2); 
	 cell.className = "ui-widget-content jqgrow ui-row-ltr";
	 cell.align='center'; 
	 cell.innerHTML ="<input id=\"OTHER_DATE"+sed+"\" name=\"OTHER_DATE\" readonly='readonly'>"
	 row.appendChild(cell);
	 cell = row.insertCell(3); 
	 cell.className = "ui-widget-content jqgrow ui-row-ltr";
	 cell.align='center'; 
	 cell.innerHTML ="<input id='OTHER_MEMO"+sed+"' name=\"OTHER_MEMO\" size=\"30\">";
	 row.appendChild(cell);
	 cell = row.insertCell(4); 
	 cell.className = "ui-widget-content jqgrow ui-row-ltr";
	 cell.align='center'; 
	 cell.innerHTML ="<img src=\"../images/u103.gif\"><a href=\"javascript:void(0)\" onclick=\"deleteRow3.call(this)\">删除</a>";
	 row.appendChild(cell); 
	dateClick()
}

 function deleteRow3(){
        var tr = this.parentNode.parentNode;
        tr.parentNode.removeChild(tr); 
        changeOtherPrice();
    }