$(document).ready(function () {  
	PageLoad('#customerInfo tr');
	TabLoad('contractEquip','creditEquip','EQUIPMENT');
	PageLoad('#schemaInfo tr');
	TabLoad('contractInsure','creditInsure','INSURE');
	TabLoad('contractOtherPrice','creditOtherPrice','OTHERPRICE');
});

function PageLoad(obj){
	$(obj).each(function(i) {
		if (i > 1) {
			var td = $('td:eq(3)',this); 
			var text = $('td:eq(1)',this).text();
			var text1 = $('td:eq(2)',this).text();
			if($.trim(text)==$.trim(text1)){
				$('span:eq(0)',  td).hide();
			}else{ 
				$('td:eq(1)',this).css("background-color","#FFC864");
				$('td:eq(2)',this).css("background-color","#FFC864");
				$('td:eq(3)',this).css("background-color","#FFC864");
			}
			$('input:eq(4)', td).focus(function() {
				
				$('input:eq(0)', td).attr('checked', false);
				$('input:eq(1)', td).attr('checked', false);
			});
		} 
	});
}

function TabLoad(tab1,tab2,name){ 
	var table1=$("#"+tab1)[0];
	var table2=$("#"+tab2)[0];
	$("<input type='hidden' name='"+name+"status' value='1'>").appendTo($(table2.rows[table2.rows.length-1].cells[0]));	
	if(table1.rows.length!=table2.rows.length){
				$(table1.rows).each(function(i){
					if(i>=2){ 
						$(this.cells).css("background-color","#FFC864");
						$("input[name='"+name+"status']").val("2");
					}
				});  
					$(table2.rows).each(function(i){
					if(i!=table2.rows.length-1&&i!=0){
						$(this.cells).css("background-color","#FFC864");
						$("input[name='"+name+"status']").val("2");
					}
				});
				 
	}else{ 
	for(i=2;i<table1.rows.length;i++){
		row=table1.rows[i];
		row1=table2.rows[i-1];
		var cell;
		var cell1;
		if (row !=null && row1 != null && typeof row != 'undefined' && row1 != 'undefined') {
			
			if (row.cells.length >0 && row1.cells.length ==0) {
				$(row.cells).each(function(){
					$(this).css("background-color","#FFC864");
					$("input[name='"+name+"status']").val("2");
				});
			} else if (row.cells.length > 0 && row1.cells.length ==1) {

			} else if (row.cells.length == 0 && row1.cells.length >0) {
				$(row1.cells).each(function(){
					$(this).css("background-color","#FFC864");
					$("input[name='"+name+"status']").val("2");
				}); 
			} else if (row.cells.length >0 && row1.cells.length >0) {
				for (var j = 0; j < row.cells.length; j++) {
					cell = row.cells[j];
					cell1 = row1.cells[j];
					if (cell != null && cell1 != null && 
						typeof cell != 'undefined' && typeof cell1 != 'undefined') {
						if (cell.innerHTML != cell1.innerHTML){ 
								$(row.cells).each(function(){
									$(this).css("background-color","#FFC864");
									$("input[name='"+name+"status']").val("2");
								});
								$(row1.cells).each(function(){
									$(this).css("background-color","#FFC864");
									$("input[name='"+name+"status']").val("2");
								}); 
							break;
						}
					}
				}
			} 
		
		} else {
			continue;
		}	 
	}
	}
}


function saveDif(flag,obj){ 
	$(obj).attr("disabled","disabled");
	$("input[name='flag']").val(flag);
	$("form[name='rentContractForm']").submit();
}
