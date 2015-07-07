function creditfile(id) {
	$("#creditfile").toggle(
			function() {
				$("#creditfile").load("../servlet/defaultDispatcher?__action=riskAudit.queryCreditFile&prcd_id="+id+"&cardFlag=0");
			});	
	$('#creditfile').dialog({
		modal:true,
		autoOpen: false,
		width: 830
	});	
	$('#creditfile').dialog('open');
  }
function supportRiskDelete(id){
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=supportRiskDelete.supportRiskDelete&prc_id='+id,
		dataType:'json',
		success:function(dataBack){   
   			if(dataBack.rentMap=="0"){
				if(confirm('您确定要删除此风控吗？')){
					location.href='../servlet/defaultDispatcher?__action=supportRiskDelete.delete&prc_id='+id;
				}else{
					return false;
				}		   					
        	}
        	else{
        		alert("此风控已生成合同,请先删除合同,再删除风控!");
        	}
        }   
	});
}