//获取银行下的账号信息
function showbankno() {
	var bankname = $("#search_bankname").val();
	$.ajax({url:"../servlet/defaultDispatcher", type:"POST", data:"__action=decompose.queryBankNo&search_bankname=" + bankname, datatype:"json", success:backshowbankno});
}
function backshowbankno(callback) {
	eval("map=" + callback);
	var map = map;
	var item = map.bankNoList;
	eval("arraylist=" + item);
	var arraylist = arraylist;
	var html = "<option value='\u5168\u90e8'>\u5168\u90e8</option>";
	for (var i = 0; i < arraylist.length; i++) {
		var bank = arraylist[i];
		html += "<option value='" + bank.ACCOUNT_NO + "'>" + bank.ACCOUNT_NO + "</option>";
	}
	$("#search_bankno").html(html);
}
//分解确认搜索
function searchcheck() {
	var startmoney = $("#search_beginincomemoney").val();
	var endmoney = $("#search_endincomemoney").val();
	var reg = /^(-  ¦\+)?\d+(\.\d+)?$/;
	if (startmoney != null && startmoney != "") {
		if (!reg.test(startmoney)) {
			alert("\u975e\u6cd5\u6570\u5b57\uff01\uff01\uff01");
			document.getElementById("startmoney").focus();
			return false;
		}
	}
	if (endmoney != null && endmoney != "") {
		if (!reg.test(endmoney)) {
			alert("\u975e\u6cd5\u6570\u5b57\uff01\uff01\uff01");
			$("#search_endmoney").focus();
			return false;
		}
	}
	$("#form1").submit();
}
//选择标签页
function selectCard(n){
	
	if(n==0){
		location.href="../servlet/defaultDispatcher?__action=checkDecompose.showCheckDecomposeInfo&cardFlag=0";
	}
	if(n==1){
	  	location.href="../servlet/defaultDispatcher?__action=checkDecompose.showCheckDecomposeInfo&cardFlag=1";
	}	
	if(n==2){
	  	location.href="../servlet/defaultDispatcher?__action=checkDecompose.showCheckDecomposeInfo&cardFlag=2";
	}
	if(n==3){
	  	location.href="../servlet/defaultDispatcher?__action=checkDecompose.showCheckDecomposeInfo&cardFlag=3";
	}	 	 
}


function autoAllIncome(){
	var chk_value =[];   
	$('input[name="ids"]:checked').each(function(){   
		chk_value.push($(this).val());   
	});   
	if(chk_value.length==0){
		alert("请选择分解单！");
		return false;
	}		
	var action = $("#__action").val() ;
	var ids = "" ;
	for(var i = 0 ;i<chk_value.length;i++){
		ids += chk_value[i] + "@" ;
	}
	 $.ajax({
        type: 'post',
        url: '../servlet/defaultDispatcher',
        data: '__action=checkDecompose.autoAllIncome&ids='+ids,
        dataType: 'json',
        success: function(callback){
        	alert(callback.returnStr);
        	/*$.ajax({
				type:"POST",
				url:"../servlet/defaultDispatcher",
				data: '__action=checkDecompose.showCheckDecomposeInfoAjax',
				dataType:"json",
				success:function(callback){
					alert(123);
				},
				error:function(callback){
					alert("网络错误，请稍后重试！");
					return ;
				}
				});*/
			window.location.href="../servlet/defaultDispatcher?__action=checkDecompose.showCheckDecomposeInfo";
           
        },
        error:function(callback){
					alert("网络错误，请稍后重试！");
					return ;
				}
    });
}

function checkAll(e, itemName)
		{
		  var aa = document.getElementsByName(itemName);
		  for (var i=0; i<aa.length; i++)
		   aa[i].checked = e.checked;
		}
