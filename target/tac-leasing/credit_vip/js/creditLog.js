		//弹出
			function openLogandsee(divName){
				$("#"+divName).dialog({
					modal:true,
					autoOpen: false,
					width: 970
				});
				$("#"+divName).dialog('open');
			}
			function closeDialog(msg){
				$(msg).dialog('close');
			}




//日志弹出层
function creditLog(){
	
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

function showBusinessLog(prjt,prcd){
   
	if(prcd==null||prcd==''){
   		//showLog(prjt,1, 0);
		prcd = 1;
   }
   if(prjt==null||prjt==''){
   
   		//showLog(1,prcd, 0);
	   prjt = 1;
   } 
	showLog(prjt,prcd, 0);
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
        data: '__action=businessLog.showBusinessLog&PRJT_ID=' + id + '&pageNum=' + pageNum+'&PRCD_ID='+prcd,
        dataType: 'json',
        success: function(json){
        
            $("#data1 tr").each(function(){
                if ($(this).attr("id") != "data2") {
                    $(this).remove();
                }
            })
            var pageNum = json.count.pageNum;
            var total = json.count.total;
            var barNum = json.count.barNum;
            $("#pageNum").empty();
            $("#total").empty();
            $("#barNum").empty();
            $("#pageNum").append(pageNum);
            $("#total").append(total);
            $("#barNum").append(barNum);
            var log = json.log
            
            for (var i = 0; i < log.length; i++) {
                $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center'>" +(i+1) + "</td><td style='text-align:center'>" + log[i].LOG_CODE + " &nbsp;</td><td style='text-align:center'>" + log[i].LOG_TYPE + " &nbsp;</td><td style='text-align:center'>" + log[i].LOG_TITLE + " &nbsp;</td><td style='text-align:center'>" + log[i].USER_NAME + " &nbsp;</td><td style='text-align:center'>" + log[i].CREATE_DATE + "&nbsp;</td><td style='text-align:center'>" + log[i].MEMO + " &nbsp;</td></tr>");
                
            }
            openLogandsee('showBusinessLog');
        }
        
    })
    
}
