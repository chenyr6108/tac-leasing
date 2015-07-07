<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="screen" href="common/js/css.css" />
<link rel="stylesheet" type="text/css" media="screen" href="common/js/progressbar.css" />

<script src="common/js/jquery-1.3.2.js" type="text/javascript" ></script>
<script src="common/js/jquery.blockUI.js" type="text/javascript" ></script>
<script src="common/js/jqueryprogressbar.js" type="text/javascript" ></script>


<script language="javascript">
var req;
var uploadCount = 1;
 var startTime = new Date();


function getProgress(){

	$.getJSON("/servlet/FileUploadServlet?p=" + new Date(), function(json){
	
			//alert(json.finished);
	
		// No need to iterate since there will only be one set of lines
		var myBytesRead = json.bytesRead;
		var myContentLength = json.contentLength;
		var myPercent = json.percentComplete;
		var item = json.item;
		var state = json.UPLOADSTATE;
		
		switch(state){
		
			case 'RECIVING':
			
				var now = new Date();
				var pastTime = (now - startTime) / 1000;
				
				var speed = Math.round(myBytesRead / pastTime);
				$('#speed').html( fancySize(speed) + '/S');
				
				var remainTime = Math.round((myContentLength - myBytesRead) / speed);
				 $('#remain').html( fancyTime(remainTime));    
				
				
				if (myPercent < 100) {
					$('#bytesRead').html("item " + item + " : " + myBytesRead + " of " + myContentLength + " bytes read");	
					// Sleep then call the function again
					window.setTimeout("getProgress();", 500);				
				}
				
				$("#progress")[0].style.width = myPercent+"%";	
				$("#info").text(myPercent==100?'Done':(myPercent+"%"));	

			   break;

			   
			case 'READY':
			
				$("#info").text('initializing');	
				window.setTimeout("getProgress();", 300);
				
				break;
				
			case 'NOFILE':
				$("#info").text('请选择文件');
				break;
				
			case 'OUTOFSIZE':
				$("#info").text('文件超大');
				break;				
				
			case 'ERROR':
				$("#info").text('出现错误');
				break;
				
			case 'OK':
				
				break;
				
			
		}	

				
	});
}

$(document).ready(function(){
	//$("#progress")[0].style.width = "100%";
});

function fancySize(bytes)
{
    var result = 0;
    var unit   = "bytes";
    switch(true)
    {
        case bytes >= 1024 * 1024 * 1024 :
              result = Math.round(bytes / 1024 / 1024 / 1024 * 100) / 100;
              unit   = "GB";
              break;
        case bytes >= 1024 * 1024 :
              result = Math.round(bytes / 1024 / 1024 * 100) / 100;
              unit   = "MB";
              break;
        case bytes >= 1024 :
              result = Math.round(bytes / 1024 * 100) / 100;
              unit   = "KB";
              break;
        default:
              result = bytes;
    }
    
    result += " " + unit;
    return result;
}

function fancyTime(sec)
{
    var result = "";
    switch(true)
    {
        case sec >= 3600 :
              hours    = Math.ceil(sec / 3600);
              hours    = hours < 10 ? "0" + hours + ":": hours + ":";
              minutes  = Math.ceil(sec % 3600 / 60);
              minutes  = minutes < 10 ? "0" + minutes + ":": minutes + ":";
              secs     = Math.ceil(sec % 60);
              secs     = secs < 10 ? "0" + secs : secs;
              result  += hours + minutes + secs;
              break;
        case sec >= 60 :
              minutes  = Math.ceil(sec / 60);
              minutes  = minutes < 10 ? "0" + minutes + ":": minutes + ":";
              secs     = Math.ceil(sec % 60);
              secs     = secs < 10 ? "0" + secs : secs;
              result  += minutes + secs;
              break;
        default:
              sec      = sec < 10 ? "0" + sec : sec;
              result   = "00:" + sec;
    }
    
    return result;
}



</script>
</head>
<body>
	<iframe id="uploadFrameID" name="uploadFrame" height="200" width="200" frameborder="0" scrolling="yes"></iframe>              
	<form id="myForm" enctype="multipart/form-data" method="post" target="uploadFrame" action="servlet/defaultDispatcher" onsubmit="getProgress();">
		<input type="hidden" name="__action" value="document.createFile" /><br />	
		<input type="hidden" name="fldrUid" value="${param.uid}" /><br />	   
	    <input type="file" name="txtFile1" id="txtFile" /><br />	    
	    <input type="submit" id="submitID" name="submit" value="Upload" />
	</form>
	
	
<DIV id="progressbar">
	<div id="progress" ></div>	<div id="info"></div>
</DIV>
速度:<span id="speed"></span> &nbsp;&nbsp; 剩余时间：<span id="remain"></span>

</body>
</html>