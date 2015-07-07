function secBoard(n)
{ 
	for(i=0;i<=3;i++)
	$("#tbody"+i).css("display","none");
	$("#tbody"+n).css("display","");
	for(i=0;i<=3;i++)
	{
		$("#td"+i).removeClass();
		$("#td"+i).addClass("sec1");
	} 
	$("#td"+n).addClass("sec2");
}

function selectCard(n){
	var prcd_id=$("#prcd_id").val();
	var CONTRACT_TYPE=$("#CONTRACT_TYPE").val();
	if(n==0){
			$("#creditfile").load("../servlet/defaultDispatcher?__action=riskAudit.queryCreditFile&prcd_id="+prcd_id+"&cardFlag=0&CONTRACT_TYPE="+CONTRACT_TYPE);
	}
	if(n==1){
			$("#creditfile").load("../servlet/defaultDispatcher?__action=riskAudit.queryCreditFile&prcd_id="+prcd_id+"&cardFlag=1&CONTRACT_TYPE="+CONTRACT_TYPE);		 
	}	
	if(n==2){
			$("#creditfile").load("../servlet/defaultDispatcher?__action=riskAudit.queryCreditFile&prcd_id="+prcd_id+"&cardFlag=2&CONTRACT_TYPE="+CONTRACT_TYPE); 
	}	 
}