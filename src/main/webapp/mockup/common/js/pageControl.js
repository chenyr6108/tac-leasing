function gotoF(){
	$("#__currentPage").val("1");
	$("#form1").submit();
}
function gotoP(){
	currentPage=$("#__currentPage").val();
	if(currentPage<=1){
		$("#form1").submit();
	}else{
	    $("#__currentPage").val(parseInt(currentPage)-1);
		$("#form1").submit();
	}
}
function gotoN(count){
	currentPage=$("#__currentPage").val();
	if(currentPage>=count){
		$("#form1").submit();
	}else{
		 $("#__currentPage").val(parseInt(currentPage)+1); 
		$("#form1").submit();
	}
}
function gotoL(count){
	$("#__currentPage").val(count);
	$("#form1").submit();
}

function jumpTo(count){
	jump=$("#jump").val();
	if(jump>=count){
		$("#__currentPage").val(count);
	}else if(jump<=1){
		$("#__currentPage").val(1);
	}else{
		$("#__currentPage").val(jump);
	}
	$("#form1").submit();
}

function jumpTo2(count){
	jump=$("#jumpTop").val();
	if(jump>=count){
		$("#__currentPage").val(count);
	}else if(jump<=1){
		$("#__currentPage").val(1);
	}else{
		$("#__currentPage").val(jump);
	}
	$("#form1").submit();
}


function doSearch(){
	 $("#__currentPage").val("1");
	 $("#form1").submit();
}

function changePageTo10(){
	 $("#__pageSize").val("10");
	 $("#__currentPage").val("1");
	  $("#form1").submit();
}

function changePage(msg){
	 $("#__pageSize").val(msg.value);
	 $("#__currentPage").val("1");
	  $("#form1").submit();
}

function changePageTo20(){
	 $("#__pageSize").val("20");
	  $("#__currentPage").val("1");
	  $("#form1").submit();
}

function changePageTo50(){
	 $("#__pageSize").val("50");
	  $("#__currentPage").val("1");
	  $("#form1").submit();
}
function searchKeyup(event){
 	var myEvent = event || window.event;
   	var keyCode = myEvent.keyCode;
   	if (keyCode == 13) {
   		$("#form1").submit();
   	}
}