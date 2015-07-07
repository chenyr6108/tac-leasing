	function checkEmail(value){
		var res=true;
		var email = value; 
		var pattern = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/; 
		flag = pattern.test(email); 
		if(!flag){
			res=false;
		}
		if(email.length!=0){
			if (email.charAt(0)=="." || email.charAt(0)=="@"|| email.indexOf('@', 0) == -1 || email.indexOf('.', 0) == -1 || email.lastIndexOf("@")==email.length-1 || email.lastIndexOf(".")==email.length-1){
				res = false;
			}
		}
		return res;
	}

//显示联系人的弹出层
showDivAddCustLinkMan = function () {
	//showoverlayer();
	//goodDrag("divAddCustLinkman","divAddCustLinkmanTitle");
	//$("#divAddCustLinkman").css("top",($(window).height()-200)/2);
	//$("#divAddCustLinkman").css("left",($(window).width()-400)/2);
	//$("#divAddCustLinkman").css("z-index",10);
	//$("#divAddCustLinkman").fadeIn("slow");
	$('#divAddCustLinkman').dialog({
		modal:true,
		autoOpen: false	,
		width:660,
	});
	$('#divAddCustLinkman').dialog('open');	
}
//显示查看联系人的弹出层
 function showDivShowCustLinkMan(culm_id) {
	$.ajax({
			type:"post",
			url:"../servlet/defaultDispatcher",
			data:"__action=customer.showCustLinkManById&culm_id="+culm_id,
			dataType:"json",
			success:function(dataBack){
			$("#link_name_s").html(dataBack.culm.LINK_NAME);
			$("#link_gender_s").html(dataBack.culm.LINK_GENDER);
			$("#link_relation2cust_s").html(dataBack.culm.LINK_RELATION2CUST);
			$("#link_age_s").html(dataBack.culm.LINK_AGE);
			$("#link_mobile_s").html(dataBack.culm.LINK_MOBILE);
			$("#link_phone_s").html(dataBack.culm.LINK_PHONE);
			$("#link_idcard_s").html(dataBack.culm.LINK_IDCARD);
			$("#link_zip_s").html(dataBack.culm.LINK_ZIP);
			$("#link_email_s").html(dataBack.culm.LINK_EMAIL);
			$("#link_idcardAddr_s").html(dataBack.culm.LINK_IDCARD_ADDRESS);
			$("#link_home_address_s").html(dataBack.culm.LINK_HOME_ADDRESS);
			$("#link_work_units_s").html(dataBack.culm.LINK_WORK_UNITS);
			$("#link_duty_s").html(dataBack.culm.LINK_DUTY);
			$("#link_work_address_s").html(dataBack.culm.LINK_WORK_ADDRESS);
			$('#divShowCustLinkman').dialog({
				modal:true,
				autoOpen: false	,
				width:660,
			});
			$('#divShowCustLinkman').dialog('open');
	    },
	});		
}

//关闭联系人的弹出层，同时将form重置
//closeDivAddCustLinkman = function(){
	//$("#divAddCustLinkman").hide();
	//hideoverlayer();
//}
//弹出层返回按钮
function closeDialog(msg){
	$(msg).dialog('close');
}
/*2011/12/21 Yang Yun move to jsp page 
//添加联系人
submitAddCustLinkman = function () {
	var cust_id = $.trim($("#cust_id").val());
	var link_name = $.trim($("#link_name").val());
	var link_relation2cust = $.trim($("#link_relation2cust").val());
	var link_gender = $.trim($("input[name='link_gender']:checked").val());
	var link_age = $.trim($("#link_idcardAge").val());
	var link_mobile = $.trim($("#link_mobile").val());
	var link_phone = $.trim($("#link_phone").val());
	var link_idcard = $.trim($("#link_idcards").val());
	var link_zip = $.trim($("#link_zip").val());
	var link_idcard_address = $.trim($("#link_idcardAddr").val());
	var link_home_address = $.trim($("#link_home_address").val());
	var link_work_units = $.trim($("#link_work_units").val());
	var link_duty = $.trim($("#link_duty").val());
	var link_work_address = $.trim($("#link_work_address").val());
	var link_email=$.trim($("#link_email").val());
	if (link_name == ''){
		alert("请输入联系人的名字！");
		return ;
	}
	if (link_relation2cust == ''){
		alert("请输入联系人与承租人的关系！");
		return ;
	}
	if (link_mobile == '' && link_phone == ''){
		alert("请输入联系人的手机！");
		return ;
	}
	
	var param = {"cust_id":cust_id,
		"link_name":link_name,"link_relation2cust":link_relation2cust,
		"link_gender":link_gender,"link_age":link_age,
		"link_mobile":link_mobile,"link_phone":link_phone,
		"link_idcard":link_idcard,"link_zip":link_zip,
		"link_idcard_address":link_idcard_address,"link_home_address":link_home_address,
		"link_work_units":link_work_units,"link_duty":link_duty,
		"link_work_address":link_work_address,
		"link_email":link_email,
		"__action":"customer.createCustLinkMan"
	};
	
	$("#divAddCustLinkman").css("z-index",0);
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			var spans = $("span[id='custLinkmanIndex']")
			$(spans).each(function(i){
				var index = new Number($.trim($(spans[i]).html()));
				$(spans[i]).html(index+1);
			})
			var obj = callback.custLinkman;
			var status = obj.STATUS == 0 ? '启用' : '作废';
			var html = "<tr id=\"CustLinkman_"+obj.CULM_ID+"\"><td  class='ui-widget-content jqgrow ui-row-ltr'><span id=\"custLinkmanIndex\">1</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>"
				+(obj.LINK_NAME == null ? '&nbsp;' : obj.LINK_NAME)+"   </td>"
				+"<td  class='ui-widget-content jqgrow ui-row-ltr'>"+obj.LINK_GENDER+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>"+(obj.LINK_RELATION2CUST == null ? '&nbsp;' : obj.LINK_RELATION2CUST)
				+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(obj.LINK_MOBILE == null ? '&nbsp;' : obj.LINK_MOBILE)
				+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(obj.LINK_PHONE == null ? '&nbsp;' : obj.LINK_PHONE)
				+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(obj.LINK_EMAIL == null ? '&nbsp;' : obj.LINK_EMAIL)
				+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>联系人</td><td class='ui-widget-content jqgrow ui-row-ltr'>    <span id=\"custLinkman_status_"+obj.CULM_ID+"\">"+status
				+"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>   <span  id=\"custLinkman_opteration_"+obj.CULM_ID +"\"><a href=\"javascript:void(0)\" onclick=\"disabledCustLinkMan('"+obj.CULM_ID +"');\">作废</a></span>  "
				+"| <a href=\"javascript:void(0)\" onclick=\"showDivShowCustLinkMan('"+obj.CULM_ID+"');\">查看</a> | <a href=\"javascript:void(0)\" onclick=\"showDivUpdateCustLinkMan('"+obj.CULM_ID+"');\">修改</a></td></tr>";
				
			$("#divCustLinkman").prepend(html);
			$("#closeCustLinkmanButs").click();
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			$("#closeCustLinkmanButs").click();
			return ;
		}
	
	});
}
*/
//修改联系人
function submitUpdateCustLinkman() {
	var culm_id = $.trim($("#culm_id_u").val());
	var cust_id = $.trim($("#cust_id").val());
	var link_name = $.trim($("#link_name_u").val());
	var link_relation2cust = $.trim($("#link_relation2cust_u").val());
	var link_gender = $.trim($("input[name='link_gender_u']:checked").val());
	var link_age = $.trim($("#link_idcardAge_u").val());
	var link_mobile = $.trim($("#link_mobile_u").val());
	var link_phone = $.trim($("#link_phone_u").val());
	var link_idcard = $.trim($("#link_idcard_u").val());
	var link_zip = $.trim($("#link_zip_u").val());
	var link_idcard_address = $.trim($("#link_idcardAddr_u").val());
	var link_home_address = $.trim($("#link_home_address_u").val());
	var link_work_units = $.trim($("#link_work_units_u").val());
	var link_duty = $.trim($("#link_duty_u").val());
	var link_work_address = $.trim($("#link_work_address_u").val());
	var link_email=$.trim($("#link_email_u").val());
	if (link_name == ''){
		alert("请输入联系人的名字！");
		return ;
	}
	if (link_relation2cust == ''){
		alert("请输入联系人与承租人的关系！");
		return ;
	}
	if (link_mobile == '' && link_phone == ''){
		alert("请输入联系人的手机或固话！");
		return ;
	}
	/*2011/12/21 Yang Yun Add idcard and work address validate. Start*/
	if(link_work_address == ''){
		alert("请输入邮寄地址！");
		return;
	}
	

	if(link_email!=null && link_email.length>0){
/*		if (!/^\w+@\w+.\w+$/.test(link_email)){
			 alert("Email输入格式不正确！");
			 return;
		}*/
		
		if(!checkEmail(link_email)){
			alert("Email输入格式不正确！");
			return;
		}
	}
	/*Add by Michael 2012 6-18 增加Email为必key 项目*/
//	if(link_email == ''){
//		alert("请输入Email！");
//		return;
//	}
	
	$("#closeCustLinkmanButu").click();
	/*2011/12/21 Yang Yun Add idcard and work address validate. End*/
	
	var param = {"culm_id":culm_id,"cust_id":cust_id,
		"link_name":link_name,"link_relation2cust":link_relation2cust,
		"link_gender":link_gender,"link_age":link_age,
		"link_mobile":link_mobile,"link_phone":link_phone,
		"link_idcard":link_idcard,"link_zip":link_zip,
		"link_idcard_address":link_idcard_address,"link_home_address":link_home_address,
		"link_work_units":link_work_units,"link_duty":link_duty,
		"link_work_address":link_work_address,
		"link_email":link_email,
		"__action":"customer.updateCustLinkManById"
	};
	
	$("#divUpdateCustLinkman").css("z-index",0);
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(dataBack){
		/*2011/12/21 Yang Yun draw all link man gridpanel.Start*/
		/*var html = "";
			if(dataBack.custLinkman!=null){
	   			for(i=0;i<dataBack.custLinkman.length;i++){
	   				var status = dataBack.custLinkman[i].STATUS == 0 ? '启用' : '作废';
	   				var statu = dataBack.custLinkman[i].STATUS == 0 ? "<a href=\"javascript:void(0)\" onclick=\"disabledCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">作废</a>" : "<a href=\"javascript:void(0)\" onclick=\"abledCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">启用</a>";
	   				var n = 1;
	   				html=html+"<tr id=\"CustLinkman_"+dataBack.custLinkman[i].CULM_ID+"\"><td  class='ui-widget-content jqgrow ui-row-ltr'><span id=\"custLinkmanIndex\">"+n+"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>"
							 +(dataBack.custLinkman[i].LINK_NAME == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_NAME)+"   </td>"
							 +"<td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_GENDER == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_GENDER)+"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>"+(dataBack.custLinkman[i].LINK_RELATION2CUST == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_RELATION2CUST)
							 +"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_MOBILE == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_MOBILE)
							 +"</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_PHONE == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_PHONE)
							 +"&nbsp;</td><td  class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(dataBack.custLinkman[i].LINK_EMAIL == null ? '&nbsp;' : dataBack.custLinkman[i].LINK_EMAIL)
							 +"&nbsp;</td><td  class='ui-widget-content jqgrow ui-row-ltr'>  联系人  </td><td class='ui-widget-content jqgrow ui-row-ltr'>    <span id=\"custLinkman_status_"+dataBack.custLinkman[i].CULM_ID+"\">"+status
							 +"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'>   <span  id=\"custLinkman_opteration_"+dataBack.custLinkman[i].CULM_ID +"\">"+statu+"</span>"
							 +"| <a href=\"javascript:void(0)\" onclick=\"showDivShowCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">查看</a> | <a href=\"javascript:void(0)\" onclick=\"showDivUpdateCustLinkMan('"+dataBack.custLinkman[i].CULM_ID+"');\">修改</a></td></tr>";
	        	}
		    }
				
			$("#divCustLinkman").html(html);
			$("#closeCustLinkmanButu").click();*/
			if(dataBack.custLinkman!=null){
				$("#divCustLinkman").html(drawGridPanel(dataBack));
				alert("操作已成功！");
		    } else {
		    	alert("网络错误，请稍后重试或联系系统管理员！");
				return ;
		    }
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			//$("#closeCustLinkmanBut").click();
			/*2011/12/21 Yang Yun draw all link man gridpanel.Start*/
			return ;
		}
	
	});
}
// 添加承租人本人为联系人 -- 自然人
addNatuAsLinkMan = function (){
	var cust_id = $.trim($("#cust_id").val());
	var link_name = $.trim($("#cust_name").val());
	var link_relation2cust = "本人";
	var link_gender = $.trim($("input[name='natu_gender']:checked").val());
	var link_age = $.trim($("#natu_idcardAge").val());
	var link_mobile = $.trim($("#natu_mobile").val());
	var link_phone = $.trim($("#natu_phone").val());
	var link_idcard = $.trim($("#natu_idcard").val());
	var link_zip = $.trim($("#natu_zip").val());
	var link_idcard_address = $.trim($("#natu_idcardAddr").val());
	var link_home_address = $.trim($("#natu_home_address").val());
	var link_work_units = $.trim($("#natu_work_units").val());
	var link_duty = '';
	var link_work_address = $.trim($("#natu_work_address").val());
	
	if (link_name == ''){
		alert("请输入承租人的名字！");
		return ;
	}
	if (link_mobile == '' && link_phone == ''){
		alert("请输入承租人的联系方式！");
		return ;
	}
	
	var param = {"cust_id":cust_id,
		"link_name":link_name,"link_relation2cust":link_relation2cust,
		"link_gender":link_gender,"link_age":link_age,
		"link_mobile":link_mobile,"link_phone":link_phone,
		"link_idcard":link_idcard,"link_zip":link_zip,
		"link_idcard_address":link_idcard_address,"link_home_address":link_home_address,
		"link_work_units":link_work_units,"link_duty":link_duty,
		"link_work_address":link_work_address,
		"__action":"customer.createCustLinkMan"
	};
	
	$("#divAddCustLinkman").css("z-index",0);
	//showoverlayer();
	
	$.ajax({
		type:"POST",
		data:param,
		url:"../servlet/defaultDispatcher",
		dataType:"json",
		success:function(callback){
			var spans = $("span[id='custLinkmanIndex']")
			$(spans).each(function(i){
				var index = new Number($.trim($(spans[i]).html()));
				$(spans[i]).html(index+1);
			})
			var obj = callback.custLinkman;
			var status = obj.STATUS == 0 ? '启用' : '作废';
			var html = "<tr id=\"CustLinkman_"+obj.CULM_ID+"\"><td class='ui-widget-content jqgrow ui-row-ltr'><span id=\"custLinkmanIndex\">1</span></td><td>"
				+(obj.LINK_NAME == null ? '&nbsp;' : obj.LINK_NAME)+"</td>"
				+"<td class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+obj.LINK_GENDER+"</td><td>"+(obj.LINK_RELATION2CUST == null ? '&nbsp;' : obj.LINK_RELATION2CUST)
				+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(obj.LINK_MOBILE == null ? '&nbsp;' : obj.LINK_MOBILE)
				+"</td><td class='ui-widget-content jqgrow ui-row-ltr'>&nbsp;"+(obj.LINK_PHONE == null ? '&nbsp;' : obj.LINK_PHONE)
				+"</td><td class='ui-widget-content jqgrow ui-row-ltr'><span id=\"custLinkman_status_"+obj.CULM_ID+"\">"+status
				+"</span></td><td class='ui-widget-content jqgrow ui-row-ltr'><span  id=\"custLinkman_opteration_"+obj.CULM_ID +"\"><a href=\"javascript:void(0)\" onclick=\"disabledCustLinkMan('"+obj.CULM_ID +"');\">作废</a></span></td></tr>";
				
			$("#divCustLinkman").prepend(html);
			$("#closeCustLinkmanBut").click();
		},
		error:function(callback){
			alert("网络错误，请稍后重试或联系系统管理员！");
			$("#closeCustLinkmanBut").click();
			return ;
		}
	});
}
// 添加承租人本人为联系人 -- 法人
addCorpAsLinkMan = function () {
	$("#link_name").val($.trim($("#corp_head_signature").val()));
	$("#link_relation2cust").val("法人")
	var corp_hs_idcard = $.trim($("#corp_hs_idcard").val());
	$("#link_idcard").val(corp_hs_idcard);
	$("#link_home_address").val($.trim($("#corp_hs_home_address").val()));
	for (var i=0;i<18;i++) {
    	$("#link_idcard_field_"+i).val(corp_hs_idcard.charAt(i));
    }
	$("#link_mobile").val($.trim($("#corp_hs_link_mode").val()));
	
	// 还需要填写相关的信息
	showDivAddCustLinkMan();
}

/*2011/12/21 Yang Yun Delete Move to jsp page.
//作废联系人
disabledCustLinkMan = function (culm_id){
	var msg = "您确定要作废此承租人的联系方式吗？";
	if (confirm(msg)){
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"status":"1","__action":"customer.operteCustLinkManStatus"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rsCount == 1){
					alert("操作已成功！");
					$("#custLinkman_status_"+culm_id).html("作废");
					$("#custLinkman_opteration_"+culm_id).html("<a href=\"javascript:void(0)\" onclick=\"abledCustLinkMan('"+culm_id+"');\">启用</a>");
					hideoverlayer();
					return;
				} else {
					alert("操作失败，请稍后重试或联系系统管理员！");
					hideoverlayer();
					return;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试或联系系统管理员！");
				$("#closeCustLinkmanBut").click();
				return ;
			}
		});
	}
}
//启用联系人
abledCustLinkMan = function (culm_id){
	var msg = "您确定要启用此承租人的联系方式吗？";
	if (confirm(msg)){
		showoverlayer();
		$.ajax({
			type:"POST",
			data:{"culm_id":culm_id,"status":"0","__action":"customer.operteCustLinkManStatus"},
			url:"../servlet/defaultDispatcher",
			dataType:"json",
			success:function(callback){
				if (callback.rsCount == 1){
					alert("操作已成功！");
					$("#custLinkman_status_"+culm_id).html("启用");
					$("#custLinkman_opteration_"+culm_id).html("<a href=\"javascript:void(0)\" onclick=\"disabledCustLinkMan('"+culm_id+"');\">作废</a>");
					hideoverlayer();
					return;
				} else {
					alert("操作失败，请稍后重试或联系系统管理员！");
					hideoverlayer();
					return;
				}
			},
			error:function(callback){
				alert("网络错误，请稍后重试或联系系统管理员！");
				$("#closeCustLinkmanBut").click();
				return ;
			}
		});
	}
}*/