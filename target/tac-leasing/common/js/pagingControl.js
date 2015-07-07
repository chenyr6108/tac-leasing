function changePageTo10(){
	$("#__pageSize").val("10");
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

function changePageTo100(){
	$("#__pageSize").val("100");
	$("#__currentPage").val("1");
	$("#form1").submit();
}

function changePageTo300(){
	$("#__pageSize").val("300");
	$("#__currentPage").val("1");
	$("#form1").submit();
}

function gotoN(){
	$("#__currentPage").val(parseInt($("#__currentPage").val())+1); 
	$("#form1").submit();
}

function gotoP(){
    $("#__currentPage").val(parseInt($("#__currentPage").val())-1);
	$("#form1").submit();
}

function gotoF(){
	$("#__currentPage").val("1");
	$("#form1").submit();
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

function jumpTo_t(count){
	jump=$("#jump_t").val();
	if(jump >= count){
		$("#__currentPage").val(count);
	}else if(jump <= 1){
		$("#__currentPage").val(1);
	}else{
		$("#__currentPage").val(jump);
	}
	$("#form1").submit();
}

function doSort(orderBy, currentOrderBy, currentOrderType){
	$("#__orderBy").val(orderBy);
	if(orderBy == currentOrderBy){
		if("ASC" == currentOrderType){
			$("#__orderType").val("DESC");
		} else if("DESC" == currentOrderType) {
			$("#__orderType").val("ASC");
		}
	}
	$("#form1").submit();
}

function doSearch(){
	$("#__currentPage").val("1");
	$("#form1").submit();
}


























