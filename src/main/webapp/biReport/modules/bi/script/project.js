$(function(){
	$("#tabs-project .tab-detial").tabs();
	$("#tabs-project .tabs-project-list tr.line").click(function(){
		$(this).siblings(".detial").hide();
		$(this).next().show();
	});
	
	$("#tabs-project .tabs-project-list tr.detial:first").show();

	$(".tabs-project-lnk-analysis").click(function(){
		$("<div>")
		.append($("<iframe>").addClass("analysis").attr("src","tab-project-analysis.html"))
		.dialog({
			title:"方案分析",
			width:900,
			height:400,
			open:function(){
				$("<div>").addClass("zoomFrameBgIframe").appendTo("body").show();
			},
			close:function(){
				$(".zoomFrameBgIframe").remove();
			}
		});
	});
});