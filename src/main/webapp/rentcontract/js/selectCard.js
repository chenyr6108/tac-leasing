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

function selectCard(n,forShow,TRFS_STATE,RECT_STATUS){
	var prcd_id=$("#prcd_id").val();
	var CONTRACT_TYPE=$("#CONTRACT_TYPE").val();
	if(n==0){
			$("#rentfile").load("../servlet/defaultDispatcher?__action=rentFile.queryRentFile&prcd_id="+prcd_id+"&cardFlag=0&CONTRACT_TYPE="+CONTRACT_TYPE+"&forShow="+forShow+"&TRFS_STATE="+TRFS_STATE+"&RECT_STATUS="+RECT_STATUS);
	}
	if(n==1){
			$("#rentfile").load("../servlet/defaultDispatcher?__action=rentFile.queryRentFile&prcd_id="+prcd_id+"&cardFlag=1&CONTRACT_TYPE="+CONTRACT_TYPE+"&forShow="+forShow+"&TRFS_STATE="+TRFS_STATE+"&RECT_STATUS="+RECT_STATUS); 
	}	
	if(n==2){
			$("#rentfile").load("../servlet/defaultDispatcher?__action=rentFile.queryRentFile&prcd_id="+prcd_id+"&cardFlag=2&CONTRACT_TYPE="+CONTRACT_TYPE+"&forShow="+forShow+"&TRFS_STATE="+TRFS_STATE+"&RECT_STATUS="+RECT_STATUS);
	}	 
}