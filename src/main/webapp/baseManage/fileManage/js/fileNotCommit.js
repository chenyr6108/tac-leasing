function showDiv(){
		
			getFile();
			
				$("#showfileLog").dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#showfileLog").dialog('open');
			
}

function getFile(start,end)

{
		var start=$("#start_date").val();
		var end=$("#end_date").val();
	$.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=fileService.queryFile&start_date='+start+'&end_date='+end,
        dataType: 'json',
        success: function(json){
        
            $("#data1 tr").each(function(){
                if ($(this).attr("id") != "data2") {
                    $(this).remove();
                }
            })
            var log = json.logMoreList.rs;
            
            for (var i = 0; i < log.length; i++) {
           
                  $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center'>" +(i+1) + "</td><td style='text-align:center'>" + log[i].CUSTNAME + " &nbsp;</td><td style='text-align:center'>" + log[i].FILENAME + " &nbsp;</td>");
                
            }
            $("#barNum").html(json.logMoreList.recordCount);
            $("#total").html(json.logMoreList.pageCount);
            $("#pageNum").html(json.logMoreList.currentPage);
        }
        
    })
}



function assignPage(){
     var num = $.trim($("#assign").val());
	if (num == null || num == '') {
		return;
	}
	else {
	 var flag =cheumber(num);
	
	if (flag) {
			var tol = $("#total").text();
			if (num <= 1) {
				firstPage();
			}
			if (tol <= num) {
				lastPage();
			}
			
			showLog($("#logRecordid").val(), num);
		}
	}
}


function firstPage(){
    if ($("#pageNum").text() == 1) {
        return;
    }
    
    showLog($("#logRecordid").val(),$("#fuse").val(), 0)
    
}

function prevPage(){
    if ($("#pageNum").text() == 1) {
        return;
    }
    var num = $("#pageNum").text();
    showLog($("#logRecordid").val(),$("#fuse").val(), (num - 1));
}

function lastPage(){
    if ($("#total").text() == $("#pageNum").text()) {
        return
    }
    showLog($("#logRecordid").val(),$("#fuse").val(), $("#total").text());
}

function nextPage(){
    if ($("#total").text() == $("#pageNum").text()) {
        return
    }
   
    var mun = $("#pageNum").text()
    showLog($("#logRecordid").val(), $("#fuse").val(),(mun-1+2 ));
}

//日志的弹出层js   select t.credit_id,t.contract_id from t_sys_businesslog t where  contract_id='521' and credit_id is not null 
function showLog(id,prcd, pageNum){
    $("#logRecordid").val("");
	$("#fuse").val("");
    $("#logRecordid").val(id);
	$("#fuse").val(prcd);
    
    $.ajax({

            type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=fileService.queryFile&__currentPage='+pageNum,
        dataType: 'json',
        success: function(json){
        
            $("#data1 tr").each(function(){
                if ($(this).attr("id") != "data2") {
                    $(this).remove();
                }
            })
            var log = json.logMoreList.rs;
            
            for (var i = 0; i < log.length; i++) {
                 $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center'>" +(i+1) + "</td><td style='text-align:center'>" + log[i].CUSTNAME + " &nbsp;</td><td style='text-align:center'>" + log[i].FILENAME + " &nbsp;</td>");
                
            }
             $("#barNum").html(json.logMoreList.recordCount);
            $("#total").html(json.logMoreList.pageCount);
            $("#pageNum").html(json.logMoreList.currentPage);
            $("#showfileLog").dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#showfileLog").dialog('open');
        }
        
    })
    
}
