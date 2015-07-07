//获取银行下的账号信息
function showbankno(){
	var bankname= $("#sel_bankname").val();
	$.ajax({
		url:"../servlet/defaultDispatcher",
		type:"POST",
		data:"__action=decompose.queryBankNo&sel_bankname="+bankname,
		datatype:"json",
		success:backshowbankno
	})
}
function backshowbankno(callback){
	eval("map="+callback);
	var map=map;
	var item=map.bankNoList;
	eval("arraylist="+item);
	var arraylist=arraylist;
	var html="<option value='全部'>全部</option>";
	for(var i=0;i<arraylist.length;i++){
		var bank=arraylist[i];
		html+="<option value='"+bank.ACCOUNT_NO+"'>"+bank.ACCOUNT_NO+"</option>";
	}
	$("#sel_bankno").html(html);
}
function selectincome(){
	var startmoney=$("#sel_startmoney").val();
	var endmoney=$("#sel_endmoney").val();
	var reg = /^(-  ¦\+)?\d+(\.\d+)?$/ ;
	if(startmoney!=null&&startmoney!=""){
 		if(!reg.test(startmoney)){
	 		alert("非法数字！！！");
	 		document.getElementById("startmoney").focus();
	 		return false;
 		}
 	}
 	if(endmoney!=null&&endmoney!=""){
 		if(!reg.test(endmoney)){
	 		alert("非法数字！！！");
	 		$("#sel_endmoney").focus();
	 		return false;
	 	}
 	}
 	$("#form1").submit();
}