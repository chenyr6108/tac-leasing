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
	if(n==0){
			$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReportVip.queryRentFile&prcd_id="+prcd_id+"&cardFlag=0");
	}
	if(n==1){
			$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReportVip.queryRentFile&prcd_id="+prcd_id+"&cardFlag=1");		 
	}	
	if(n==2){
			$("#creditfile").load("../servlet/defaultDispatcher?__action=creditReportVip.queryRentFile&prcd_id="+prcd_id+"&cardFlag=2"); 
	}	 
}

//承租人添加资料或修改资料
var tab1=function (){ 	
	//中间表ID
	var aa = document.getElementsByName("refd_id");
	var refd_id="";	
	for(var i=0;i<aa.length;i++){ 
		refd_id=refd_id+aa[i].value+"@";	
		}
	//资料ID
	var bb = document.getElementsByName("refi_id");
	var refi_id="";	
	for(var i=0;i<bb.length;i++){ 
		refi_id=refi_id+bb[i].value+"@";	
		}
	//签字文件ID
	var cc = document.getElementsByName("FILE_COUNT");
	var FILE_COUNT="";	
	for(var i=0;i<cc.length;i++){ 	
		if (cc[i].value.search("^-?\\d+$") != 0) {
			   alert("份数为数字");  
			   return false;
			}	
		FILE_COUNT=FILE_COUNT+cc[i].value+"@";	
		}
	//复印件ID
	var dd = document.getElementsByName("COPYFILE_COUNT");
	var COPYFILE_COUNT="";	
	for(var i=0;i<dd.length;i++){ 
		if (dd[i].value.search("^-?\\d+$") != 0) {
			   alert("份数为数字");  
			   return false;
			}
		COPYFILE_COUNT=COPYFILE_COUNT+dd[i].value+"@";	
		}
	//备注ID
	var ee = document.getElementsByName("MEMO");
	var MEMO="";	
	for(var i=0;i<ee.length;i++){ 
		if(ee[i].value==""){
			ee[i].value="备注信息";
		}	
		MEMO=MEMO+ee[i].value+"@";	
		}	
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditReport.insorupd&prcd_id='+$("#prcd_id").val()
		+'&cardFlag='+$("#cardFlag").val()+'&refd_id='+refd_id
		+'&refi_id='+refi_id+'&FILE_COUNT='+FILE_COUNT+'&COPYFILE_COUNT='+COPYFILE_COUNT+'&MEMO='+MEMO,
		dataType:'json',
		success: function(dataBack){
			selectCard(0);
	    }
});	
}


//担保人添加资料或修改资料
var tab2=function (){ 	
	//中间表ID
	var aa = document.getElementsByName("refd_id2");
	var refd_id="";	
	for(var i=0;i<aa.length;i++){ 
		refd_id=refd_id+aa[i].value+"@";	
		}
	//资料ID
	var bb = document.getElementsByName("refi_id2");
	var refi_id="";	
	for(var i=0;i<bb.length;i++){ 
		refi_id=refi_id+bb[i].value+"@";	
		}
	//签字文件ID
	var cc = document.getElementsByName("FILE_COUNT2");
	var FILE_COUNT="";	
	for(var i=0;i<cc.length;i++){ 
		if (cc[i].value.search("^-?\\d+$") != 0) {
			   alert("份数为数字");  
			   return false;
			}
		FILE_COUNT=FILE_COUNT+cc[i].value+"@";	
		}
	//复印件ID
	var dd = document.getElementsByName("COPYFILE_COUNT2");
	var COPYFILE_COUNT="";	
	for(var i=0;i<dd.length;i++){ 
		if (dd[i].value.search("^-?\\d+$") != 0) {
			   alert("份数为数字");  
			   return false;
			}
		COPYFILE_COUNT=COPYFILE_COUNT+dd[i].value+"@";	
		}
	//备注ID
	var ee = document.getElementsByName("MEMO2");
	var MEMO="";	
	for(var i=0;i<ee.length;i++){ 
		if(ee[i].value==""){
			ee[i].value="备注信息";
		}	
		MEMO=MEMO+ee[i].value+"@";	
		}	
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditReport.insorupd&prcd_id='+$("#prcd_id").val()
		+'&cardFlag='+$("#cardFlag").val()+'&refd_id='+refd_id
		+'&refi_id='+refi_id+'&FILE_COUNT='+FILE_COUNT+'&COPYFILE_COUNT='+COPYFILE_COUNT+'&MEMO='+MEMO,
		dataType:'json',
		success: function(dataBack){
			selectCard(1);
	    }
});	
}


//合同添加资料或修改资料
var tab3=function (){ 	
	//中间表ID
	var aa = document.getElementsByName("refd_id3");
	var refd_id="";	
	for(var i=0;i<aa.length;i++){ 
		refd_id=refd_id+aa[i].value+"@";	
		}
	//资料ID
	var bb = document.getElementsByName("refi_id3");
	var refi_id="";	
	for(var i=0;i<bb.length;i++){ 
		refi_id=refi_id+bb[i].value+"@";	
		}
	//签字文件ID
	var cc = document.getElementsByName("FILE_COUNT3");
	var FILE_COUNT="";	
	for(var i=0;i<cc.length;i++){ 	
		if (cc[i].value.search("^-?\\d+$") != 0) {
			   alert("份数为数字");  
			   return false;
			}
		FILE_COUNT=FILE_COUNT+cc[i].value+"@";	
		}
	//复印件ID
	var dd = document.getElementsByName("COPYFILE_COUNT3");
	var COPYFILE_COUNT="";	
	for(var i=0;i<dd.length;i++){ 
		if (dd[i].value.search("^-?\\d+$") != 0) {
			   alert("份数为数字");  
			   return false;
			}
		COPYFILE_COUNT=COPYFILE_COUNT+dd[i].value+"@";	
		}
	//备注ID
	var ee = document.getElementsByName("MEMO3");
	var MEMO="";	
	for(var i=0;i<ee.length;i++){ 
		if(ee[i].value==""){
			ee[i].value="备注信息";
		}	
		MEMO=MEMO+ee[i].value+"@";	
		}	
	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditReport.insorupd&prcd_id='+$("#prcd_id").val()
		+'&cardFlag='+$("#cardFlag").val()+'&refd_id='+refd_id
		+'&refi_id='+refi_id+'&FILE_COUNT='+FILE_COUNT+'&COPYFILE_COUNT='+COPYFILE_COUNT+'&MEMO='+MEMO,
		dataType:'json',
		success: function(dataBack){
			selectCard(2);
	    }
});	
}