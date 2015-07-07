function creditfile(id) {
	$("#creditfile").toggle(
			function() {
				$("#creditfile").load("../servlet/defaultDispatcher?__action=riskAudit.queryCreditFile&prcd_id="+id+"&cardFlag=0");
			});	
	$('#creditfile').dialog({
		modal:true,
		autoOpen: false,
		width: 830
	});	
	$('#creditfile').dialog('open');
  }
  
  function creditfiles(id,contract_type) {
	$("#creditfile").toggle(
			function() {
				$("#creditfile").load("../servlet/defaultDispatcher?__action=riskAudit.queryCreditFile&prcd_id="+id+"&cardFlag=0&CONTRACT_TYPE="+contract_type);
			});	
	$('#creditfile').dialog({
		modal:true,
		autoOpen: false,
		width: 830
	});	
	$('#creditfile').dialog('open');
  }
  
function cheumber(checkStr)
{
    var regex = /^[\+\-]?\d+(\.\d+)?$/;
    return regex.test(checkStr);
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
			showOrderOther($("#credit_id").val(),$("#prc_id").val(), num);
		}
	}
}


function firstPage(){
    if ($("#pageNum").text() == 1) {
        return;
    }
    
    showOrderOther($("#credit_id").val(),$("#prc_id").val(),1);
    
}

function prevPage(){
    if ($("#pageNum").text() == 1) {
        return;
    }
    var num = $("#pageNum").text();
    showOrderOther($("#credit_id").val(),$("#prc_id").val(), (num - 1));
}

function lastPage(){
    if ($("#total").text() == $("#pageNum").text()) {
        return;
    }
    showOrderOther($("#credit_id").val(),$("#prc_id").val(), $("#total").text());
}

function nextPage(){
    if ($("#total").text() == $("#pageNum").text()) {
        return;
    }
    var mun = $("#pageNum").text();
    showOrderOther($("#credit_id").val(),$("#prc_id").val(),(parseInt(mun)+1 ));
}

function showFenOrder(credit_id,prc_id){  
	showOrder(credit_id,prc_id,0);
}


function showOrder(credit_id,prc_id,pageNum){
    $("#credit_id").val("");
	$("#prc_id").val("");
    $("#credit_id").val(credit_id);
	$("#prc_id").val(prc_id); 	
    $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=riskAuditSee.fenOrder&prc_id=' + prc_id + '&pageNum=' + pageNum+'&credit_id='+credit_id,
        dataType: 'json',
        success: function(json){
        
            $("#data1 tr").each(function(){
                if ($(this).attr("id") != "data2") {
                    $(this).remove();
                }
            })
            if(json.risk_state.STATE==0){
            	var barNum = parseInt(json.count.barNum)-1;
            }
            else{
            	var barNum = json.count.barNum;
            }
            
            var avg_point = Math.round((json.sumMap.SUM_POINT/barNum)*100);
            var sum_point = json.fenMap.SUM_POINT;            
            $("#cout").empty();
            $("#sump").empty();
            $("#poi").empty();
            $("#cout").append(barNum);
            $("#sump").append(avg_point/100);
            $("#poi").append(sum_point);   
                     
            var pageNum = json.count.pageNum;
            var total = json.count.total;
            var barNum = json.count.barNum;
            $("#pageNum").empty();
            $("#total").empty();
            $("#barNum").empty();
            $("#pageNum").append(pageNum);
            $("#total").append(total);
            $("#barNum").append(barNum);
            var fenOrderList = json.fenOrderList;       
            for (var i = 0; i < fenOrderList.length; i++) {
	            if(fenOrderList[i].PRC_ID==prc_id){
	                $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" +fenOrderList[i].LEV + "</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CREDIT_CODE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_NAME+ " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_CODE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].COMMIT_WIND_DATE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].LEASE_RZE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].SUM_POINT  + " &nbsp;</td></tr>");                       
	            }
	            else{
	                $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" +fenOrderList[i].LEV + "</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CREDIT_CODE + " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_NAME + " &nbsp;</td><td style='text-align:center;' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_CODE+ " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].COMMIT_WIND_DATE + " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].LEASE_RZE + " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].SUM_POINT  + " &nbsp;</td></tr>");                       
	            }
            }
			$('#fenOrder').dialog({
				modal:true,
				autoOpen: false,
				width: 830
			});	            
            $('#fenOrder').dialog('open');
        }      
    })   
}  

function showOrderOther(credit_id,prc_id,pageNum){
    $("#credit_id").val("");
	$("#prc_id").val("");
    $("#credit_id").val(credit_id);
	$("#prc_id").val(prc_id); 	
    $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=riskAuditSee.fenOrderOther&prc_id=' + prc_id + '&pageNum=' + pageNum+'&credit_id='+credit_id,
        dataType: 'json',
        success: function(json){
        
            $("#data1 tr").each(function(){
                if ($(this).attr("id") != "data2") {
                    $(this).remove();
                }
            })
            if(json.risk_state.state==0){
            	var barNum = parseInt(json.count.barNum)-1;
            }
            else{
            	var barNum = json.count.barNum;
            }            
            var pageNum = json.count.pageNum;
            var total = json.count.total;
            $("#pageNum").empty();
            $("#total").empty();
            $("#barNum").empty();
            $("#pageNum").append(pageNum);
            $("#total").append(total);
            $("#barNum").append(barNum);
            var fenOrderList = json.fenOrderList;       
            for (var i = 0; i < fenOrderList.length; i++) {
	            if(fenOrderList[i].PRC_ID==prc_id){
	                $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" +fenOrderList[i].LEV + "</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CREDIT_CODE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_NAME+ " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_CODE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].COMMIT_WIND_DATE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].LEASE_RZE + " &nbsp;</td><td style='text-align:center;color:red' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].SUM_POINT  + " &nbsp;</td></tr>");                       
	            }
	            else{
	                $("#data1").append("<tr class='ui-widget-content jqgrow ui-row-ltr'><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" +fenOrderList[i].LEV + "</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CREDIT_CODE + " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_NAME + " &nbsp;</td><td style='text-align:center;' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].CUST_CODE+ " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].COMMIT_WIND_DATE + " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].LEASE_RZE + " &nbsp;</td><td style='text-align:center' class='ui-widget-content jqgrow ui-row-ltr'>" + fenOrderList[i].SUM_POINT  + " &nbsp;</td></tr>");                       
	            }
            }
			$('#fenOrder').dialog({
				modal:true,
				autoOpen: false,
				width: 830
			});	            
            $('#fenOrder').dialog('open');
        }      
    })   
}  