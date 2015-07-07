 
// autocomplete选项
var options = {
	minChars : 1,
	max : 20,
	mustMatch: false,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.NAME;
		if (row.MOBILE != null && row.MOBILE.length > 0) {
			rs += "【" + row.MOBILE + "】";

		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.id + " " + row.NAME;
	},
	formatResult : function(row) {
		return row.NAME;
	}
};

// autocomplete选项
var options2 = {
	minChars : 1,
	max : 20,
	mustMatch: true,
	matchContains: true,
	formatItem : function(row, i, max) {
		var rs = row.NAME;
		if (row.MOBILE != null && row.MOBILE.length > 0) {
			rs += "【" + row.MOBILE + "】";

		}
		return rs;
	},
	formatMatch : function(row, i, max) {
		return row.id + " " + row.NAME;
	},
	formatResult : function(row) {
		return row.NAME;
	}
};
// autocomplete初始化函数
function initAutoComplete(data) { 
	dataList = data.employees; 
	$("#clerk_name").autocomplete(dataList, options2);
	$("#clerk_name").result(function(event, data, formatted) {
				if(data!=null){
					$("#clerk_mobile").val(data.MOBILE);
					$("#clerk_id").val(data.ID); 
				}
				
			}); 	
}

function initAutoComplete2(data) { 
	dataList = data.customers; 
	$("#cust_name").autocomplete(dataList, options);
	$("#cust_name").result(function(event, data, formatted) {
				if(data!=null){
					$("#cust_idcard").val(data.MOBILE); 
					$("#cust_idcard2").val(data.MOBILE); 
					for (var i=0;i<18;i++) {
					     $("#cust_idcard_field_"+i).val(data.MOBILE.charAt(i));
				        }
					$("#corp_oragnization_code").val(data.MOBILE); 
					getCustInfo(data.ID);
				}	
			}); 	
} 

function getCustInfo(id){

	$.ajax({
		type:'post',
		url:'../servlet/defaultDispatcher',
		data:'__action=creditCustomer.getCustInfo&custId='+id,
		dataType:'json',
		success:function(dataBack){ 
			custInfo = dataBack.custInfo;
			grantcustInfo = dataBack.grantcustInfo;
			custLevel = dataBack.custLevel;
			$("#sum1").html(custInfo.SUM1);
			$("#sum2").html(custInfo.SUM2);
			$("#sum3").html(custInfo.SUM3);
			$("#custLevel").html(custInfo.custLevel);
			if(parseInt(custInfo.SUM3)>0){
				$("#type").val("续签客户");
			}
			if(parseInt(custInfo.SUM3)==0&&grantcustInfo==null&&parseInt(custInfo.SUM3)==0&&parseInt(custInfo.SUM1)+parseInt(custInfo.SUM2)>1){
				$("#type").val("已提交");
			}
	        var groupNumIdlist= dataBack.groupNumIdlist;
	        var group='';
	        var group3='---请选择---';
			$("#ACTILOG_ID option").remove();
			$("<option value='"+group+"'>"+group3+"</option>").appendTo($("#ACTILOG_ID"));
			for(var i=0;i<groupNumIdlist.length;i++)
			{   
				$("<option value='"+groupNumIdlist[i].ACTILOG_ID+"'>"+groupNumIdlist[i].PRODUCTSABOUT+"</option>").appendTo($("#ACTILOG_ID"));
			}
			if(grantcustInfo!=null){
				$("#grantprice").html(grantcustInfo.GRANT_PRICE);
				
			}else{
				$("#grantprice").html("");
			}
			if(grantcustInfo!=null){
				$("#grantlastprice").html(grantcustInfo.LAST_PRICE);
				
			}else{
				$("#grantlastprice").html("");
			}
			
			

		}
	});

}
