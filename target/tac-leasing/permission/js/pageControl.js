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
