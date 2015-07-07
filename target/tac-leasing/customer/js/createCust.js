var idCardMap;
IdCard.onReady(function() {
	idCardMap = {
		IdCode: new IdCard('natu_idcard')
	};
});
/**
变换承租人类型时转换
*/
choiceCustType = function(){
	var type = $("input[name='cust_type']:checked").val();
	if (type == 0){
		$("#n_natu_mobile").css("display","block");
		$("#div_natu_mobile").css("display","block");
		$("#n_corp_head_signature").css("display","none");
		$("#div_corp_head_signature").css("display","none");
		
		$("#n_natu_idcard").css("display","block");
		$("#div_natu_idcard").css("display","block");
		$("#n_corp_oragnization_code").css("display","none");
		$("#div_corp_oragnization_code").css("display","none");
		
		$("#n_natu_work_units").css("display","block");
		$("#div_natu_work_units").css("display","block");
		$("#n_corp_hs_link_mode").css("display","none");
		$("#div_corp_hs_link_mode").css("display","none");
	} else {
		$("#n_natu_mobile").css("display","none");
		$("#div_natu_mobile").css("display","none");
		$("#n_corp_head_signature").css("display","block");
		$("#div_corp_head_signature").css("display","block");
		
		$("#n_natu_idcard").css("display","none");
		$("#div_natu_idcard").css("display","none");
		$("#n_corp_oragnization_code").css("display","block");
		$("#div_corp_oragnization_code").css("display","block");
		
		$("#n_natu_work_units").css("display","none");
		$("#div_natu_work_units").css("display","none");
		$("#n_corp_hs_link_mode").css("display","block");
		$("#div_corp_hs_link_mode").css("display","block");
	}
}
//检验承租人是否存在
checkCustomerExist = function(){
	
	var cust_type = $("input[name='cust_type']:checked").val();
	var cust_name = $.trim($("#cust_name").val());
	if (cust_name == ''){
		alert("请输入承租人名称！");
		return ;
	}
	if (cust_type == 0){
		var natu_idcard = $.trim($("#natu_idcard").val());
		if (natu_idcard.length <15){
			alert("请正确输入承租人身份证号");
			return ;
		}
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"cust_id":'',"cust_type":cust_type,"cust_name":cust_name,"natu_idcard":natu_idcard,"__action":"customer.checkCustomer"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rs.COUNT == 'undefined'){
					alert("系统错误，请联系系统管理员！");
					hideoverlayer();
					return ;
				} else if (callback.rs.COUNT > 0) {
					alert("该承租人已存在，不可添加，请核实！");
					hideoverlayer();
					return ;
				} else {
					alert("该承租人不存在，可添加！");
					hideoverlayer();
					return ;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试！");
				hideoverlayer();
				return ;
			}
		});
		
	} else {
		//Modify by Michael 2012 4-23 组织机构代码证加限制条件	
//		var corp_oragnization_code = $.trim($("#corp_oragnization_code").val());
//		if (corp_oragnization_code.length == ''){
//			alert("请输入法人的组织机构代码证号");
//			return ;
//		}
		var corp_oragnization_code = $.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val());
		if (corp_oragnization_code.length !=10){
			alert("请输入正确的法人的组织机构代码证号");
			return false;
		}	
		document.getElementById("corp_oragnization_code").value= $.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val());
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"cust_id":'',"cust_type":cust_type,"cust_name":cust_name,"corp_oragnization_code":corp_oragnization_code,"__action":"customer.checkCustomer"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rs.COUNT == 'undefined'){
					alert("系统错误，请联系系统管理员！");
					hideoverlayer();
					return ;
				} else if (callback.rs.COUNT > 0) {
					alert("该承租人已存在，不可添加，请核实！");
					hideoverlayer();
					return ;
				} else {
					alert("该承租人不存在，可添加！");
					hideoverlayer();
					return ;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试！");
				hideoverlayer();
				return ;
			}
		});
	}
}
// 新建承租人
createCust = function () {
	var cust_type = $("input[name='cust_type']:checked").val();
	var cust_name = $.trim($("#cust_name").val());
	if (cust_name == ''){
		alert("请输入承租人名称！");
		return ;
	}
	var province_id = $.trim($("#province_id").val());
	if (province_id == -1){
		alert("请选择承租人所在省市！");
		return ;
	}
	if (cust_type == 0){
		var natu_idcard = $.trim($("#natu_idcard").val());
		if (natu_idcard.length <15){
			alert("请正确输入承租人身份证号");
			return ;
		}
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"cust_id":'',"cust_type":cust_type,"cust_name":cust_name,"natu_idcard":natu_idcard,"__action":"customer.checkCustomer"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rs.COUNT == 'undefined'){
					alert("系统错误，请联系系统管理员！");
					hideoverlayer();
					return ;
				} else if (callback.rs.COUNT > 0) {
					alert("该承租人已存在，不可添加，请核实！");
					hideoverlayer();
					return ;
				} else {
					$("#searchForm").submit();
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试！");
				hideoverlayer();
				return ;
			}
		});
		
	} else {
		//Modify by Michael 2012 4-23 组织机构代码证加限制条件		
//		var corp_oragnization_code = $.trim($("#corp_oragnization_code").val());
//		if (corp_oragnization_code.length == ''){
//			alert("请输入法人的组织机构代码证号");
//			return ;
//		}
		var corp_oragnization_code = $.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val());
		if (corp_oragnization_code.length !=10){
			alert("请输入正确的法人的组织机构代码证号");
			return false;
		}		
		
		document.getElementById("corp_oragnization_code").value= $.trim($("#corp_oragnization_code_before").val())+"-"+$.trim($("#corp_oragnization_code_end").val());
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"cust_id":'',"cust_type":cust_type,"cust_name":cust_name,"corp_oragnization_code":corp_oragnization_code,"__action":"customer.checkCustomer"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rs.COUNT == 'undefined'){
					alert("系统错误，请联系系统管理员！");
					hideoverlayer();
					return ;
				} else if (callback.rs.COUNT > 0) {
					alert("该承租人已存在，不可添加，请核实！");
					hideoverlayer();
					return ;
				} else {
					$("#searchForm").submit();
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试！");
				hideoverlayer();
				return ;
			}
		});
	}
}