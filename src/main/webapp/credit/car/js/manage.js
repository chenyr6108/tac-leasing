function creditfile(id) {
	$("#creditfile").toggle(
			function() {
				$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReport.queryRentFile&prcd_id="+id+"&cardFlag=0");
			});	
	$('#creditfile').dialog({
		modal:true,
		autoOpen: false,
		width: 800
	});	
	$('#creditfile').dialog('open');
  }