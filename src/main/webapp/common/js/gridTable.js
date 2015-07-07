$(function (){
	$(".grid_table").each(function (){
		var xyFlag = false;
		if($(this).hasClass("xy")){
			xyFlag = true;
		}
		$.each($(this).get(0).rows, function (){
			$.each($(this).get(0).cells, function (){
				if($(this).attr("tagName") == "TD"){
					$(this).data("oldColor", "#FFFFFF");
					$(this).bind("mouseover", function (){
						overTr($(this).parent().get(0));
						if(xyFlag){
							var cellIndex = $(this).attr("cellIndex");
							var rowIndex = $(this).attr("rowIndex");
							$(this).parent().parent().children().each(function (){
								$(this).children("td").eq(cellIndex).css("backgroundColor", "#A6C9E2");
							});
						}
					});
					$(this).bind("mouseout", function (){
						resetAllTr($(this).parent().get(0));
					}); 
					$(this).bind("click", function (){
							if($(this).parent().children("td").data("oldColor") == "#FFFFFF"){
								$(this).parent().parent().eq(0).children("tr").children("td").css("backgroundColor", "#FFFFFF");
								$(this).parent().parent().eq(0).children("tr").children("td").data("oldColor", "#FFFFFF");
								$(this).parent().children("td").css("backgroundColor", "#A6C9E2");
								$(this).parent().children("td").data("oldColor", "#A6C9E2");
							} else {
								$(this).parent().parent().eq(0).children("tr").children("td").data("oldColor", "#FFFFFF");
							}
						}
					);
				}
			});
		});
	});
});

function overTr(tr){
	$.each(tr.cells, function (){
		if($(this).attr("tagName") == "TD"){
			$(this).css("backgroundColor", "#A6C9E2");
		}
	});
}

function resetAllTr(tr){
	$.each(tr.cells, function (){
		if($(this).attr("tagName") == "TD"){
			$(this).css("backgroundColor", $(this).data("oldColor"));
		}
	});
}
