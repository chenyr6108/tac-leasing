//日期选择
$(function(){
//	alert(1)
	$("#COMPTLINK_DATE").datepicker($.datepicker.regional['zh-CN']);
	
	//网页内按下回车触发 搜索按钮 
document.onkeydown=showEntey;
function showEntey(event){    
		
        if(event.keyCode==13)
        {
                doSearch();   
                                              
        }
 } 

})
function reverseBack(){
	window.location.href="../servlet/defaultDispatcher?__action=customerlink.queryLinkCompetitor"
}

function AddCustLinkCompetitor(){
	window.location.href='../customer/createLinkCompetitor.jsp';
}

function showLinkCompetitor(id){
	window.location.href="../servlet/defaultDispatcher?__action=customerlink.showLinkCompetitor&flage=1&CULT_ID="+id;
}


function updateComp(id){
	
	window.location.href="../servlet/defaultDispatcher?__action=customerlink.showLinkCompetitor&CULT_ID="+id;
}



//添加竞争对手记录
function submitAddCustLinkCompetitor() {
	var cust_id = $.trim($("#cust_id").val());
	var COMPTLINK_PRINCIPAL = $.trim($("#COMPTLINK_PRINCIPAL").val());
	var COMPETITOR_NAME = $.trim($("#COMPETITOR_NAME").val());
	var LINK_CUSTOMER = $.trim($("#LINK_CUSTOMER").val());
	var COMPTLINK_DATE = $.trim($("#COMPTLINK_DATE").val());
	var DANGEROUS_LEVEL = $.trim($("#DANGEROUS_LEVEL").val());
	var COMPETITOR_PRODUCT = $.trim($("#COMPETITOR_PRODUCT").val());
	var LINK_SUPERIORITY = $.trim($("#LINK_SUPERIORITY").val());
	var LINK_MEMO = $.trim($("#LINK_MEMO").val());
	var LINK_DISADVANTAGE = $.trim($("#LINK_DISADVANTAGE").val());
	var LINK_TACTICS = $.trim($("#LINK_TACTICS").val());
	
	if (COMPTLINK_PRINCIPAL == ''){
		alert("请输入竞争对手的负责人！");
		return ;
	}
	if (COMPETITOR_NAME == ''){
		alert("请输入竞争对手的名称！");
		return ;
	}
	if (COMPTLINK_DATE == ''){
		alert("请输入日期！");
		return ;
	}
	if (LINK_CUSTOMER == ''){
		alert("请输入客户！");
		return ;
	}
	if (LINK_SUPERIORITY == ''){
		alert("请输入优势！");
		return ;
	}
	if (LINK_DISADVANTAGE == ''){
		alert("请输入劣势！");
		return ;
	}
	
	if (LINK_TACTICS == ''){
		
		alert("请输入策略！");
		return ;
	}
	
	var param = {"CUST_ID":cust_id,
		"LINK_PRINCIPAL":COMPTLINK_PRINCIPAL,"COMPETITOR_NAME":COMPETITOR_NAME,
		"COMPETITOR_PRODUCT":COMPETITOR_PRODUCT,
		"LINK_DATE":COMPTLINK_DATE,"LINK_MEMO":LINK_MEMO,"LINK_SUPERIORITY":LINK_SUPERIORITY,
		"LINK_DISADVANTAGE":LINK_DISADVANTAGE,"LINK_TACTICS":LINK_TACTICS,"DANGEROUS_LEVEL":DANGEROUS_LEVEL,
		"__action":"customerlink.createCustLinkCompetitor"
	};
	
	
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			window.location.href="../servlet/defaultDispatcher?__action=customerlink.queryLinkCompetitor"
			
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			return ;
		}
	
	});
}
//删除竞争对手记录
function delLinkCompetitor(id){
	var msg = "您确定要删除此条竞争对手记录吗？";
	if (confirm(msg)) {
	
		$.ajax({
			type: "POST",
			data: {
				"CULT_ID": id,
				"__action": "customerlink.deleteLinkCompetitor"
			},
			url: "../servlet/defaultDispatcher",
			dataType: "json",
			success: function(callback){
				if (callback.result == 1) {
					
					$("#CustLinkCompetitor" + id).remove();
					return;
				}
				else {
					
					alert("操作失败，请稍后刷新页面重试或联系系统管理员！");
					return;
				}
			},
			error: function(callback){
				
				alert("网络错误，请稍后刷新页面重试或联系系统管理员！");
				return;
			}
		});
	}
}


//修改竞争对手记录
function updateCompetitor() {
	var cust_id = $.trim($("#cust_id").val());
	var CULT_ID = $.trim($("#CULT_ID").val());
	var COMPTLINK_PRINCIPAL = $.trim($("#COMPTLINK_PRINCIPAL").val());
	var COMPETITOR_NAME = $.trim($("#COMPETITOR_NAME").val());
	var LINK_CUSTOMER = $.trim($("#LINK_CUSTOMER").val());
	var COMPTLINK_DATE = $.trim($("#COMPTLINK_DATE").val());
	var DANGEROUS_LEVEL = $.trim($("#DANGEROUS_LEVEL").val());
	var COMPETITOR_PRODUCT = $.trim($("#COMPETITOR_PRODUCT").val());
	var LINK_SUPERIORITY = $.trim($("#LINK_SUPERIORITY").val());
	var LINK_MEMO = $.trim($("#LINK_MEMO").val());
	var LINK_DISADVANTAGE = $.trim($("#LINK_DISADVANTAGE").val());
	var LINK_TACTICS = $.trim($("#LINK_TACTICS").val());
	
	if (COMPTLINK_PRINCIPAL == ''){
		alert("请输入竞争对手的负责人！");
		return ;
	}
	if (COMPETITOR_NAME == ''){
		alert("请输入竞争对手的名称！");
		return ;
	}
	if (COMPTLINK_DATE == ''){
		alert("请输入日期！");
		return ;
	}
	if (LINK_CUSTOMER == ''){
		alert("请输入客户！");
		return ;
	}
	if (LINK_SUPERIORITY == ''){
		alert("请输入优势！");
		return ;
	}
	if (LINK_DISADVANTAGE == ''){
		alert("请输入劣势！");
		return ;
	}
	
	if (LINK_TACTICS == ''){
		
		alert("请输入策略！");
		return ;
	}
	
	var param = {"CUST_ID":cust_id,"CULT_ID":CULT_ID,
		"LINK_PRINCIPAL":COMPTLINK_PRINCIPAL,"COMPETITOR_NAME":COMPETITOR_NAME,
		"COMPETITOR_PRODUCT":COMPETITOR_PRODUCT,
		"LINK_DATE":COMPTLINK_DATE,"LINK_MEMO":LINK_MEMO,"LINK_SUPERIORITY":LINK_SUPERIORITY,
		"LINK_DISADVANTAGE":LINK_DISADVANTAGE,"LINK_TACTICS":LINK_TACTICS,"DANGEROUS_LEVEL":DANGEROUS_LEVEL,
		"__action":"customerlink.updateLinkCompetitor"
	};
	
	
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			if(callback.result == 1){ 
				
				window.location.href="../servlet/defaultDispatcher?__action=customerlink.queryLinkCompetitor"
			}
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			return ;
		}
	
	});
}
