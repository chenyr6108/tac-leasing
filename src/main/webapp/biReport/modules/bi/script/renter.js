$(function(){
	$("#tabs-renter .tab-detial").tabs();
	$("#tabs-renter .tabs-project-list tr.line").click(function(){
		$(this).siblings(".detial").hide();
		$(this).next().show();
	});
	
	$("#tabs-renter .tabs-project-list tr.detial:first").show();
});