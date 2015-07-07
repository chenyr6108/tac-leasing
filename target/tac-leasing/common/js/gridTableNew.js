$(function (){
	$(".grid_table").each(function (){
		$(this).find('tr').each(function (){
			$(this).children("td").data("oldColor", "#FFFFFF");
			$(this).bind("mouseover", function (){
					$(this).children("td").css("backgroundColor", "#A6C9E2");
				}
			);
			$(this).bind("mouseout", function (){
					$(this).children("td").css("backgroundColor", $(this).find("td").eq(0).data("oldColor"));
				}
			); 
			$(this).bind("click", function (){
					if($(this).children("td").eq(0).data("oldColor") == "#FFFFFF"){
						$(this).parent().eq(0).children("tr").children("td").css("backgroundColor", "#FFFFFF");
						$(this).parent().eq(0).children("tr").children("td").data("oldColor", "#FFFFFF");
						$(this).children("td").css("backgroundColor", "#A6C9E2");
						$(this).children("td").data("oldColor", "#A6C9E2");
					} else {
						$(this).parent().eq(0).children("tr").children("td").data("oldColor", "#FFFFFF");
					}
				}
			);
		});
	});
});