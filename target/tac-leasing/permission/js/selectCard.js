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
	
	roleId=$("#id").val();
	if(n==0){
		location.href="../servlet/defaultDispatcher?__action=role.loadRoleForDeploy&id="+roleId+"&cardFlag=0";
	}
	if(n==1){
	  	location.href="../servlet/defaultDispatcher?__action=role.loadResourcesForDeploy&id="+roleId+"&cardFlag=1";
		 
	}	
	if(n==2){
	  	location.href="../servlet/defaultDispatcher?__action=role.loadUserForDeploy&id="+roleId+"&cardFlag=2";
	 
	}
	if(n==3){
	  	location.href="../servlet/defaultDispatcher?__action=role.loadUserNoForDeploy&id="+roleId+"&cardFlag=3";
	 
	}	 
}