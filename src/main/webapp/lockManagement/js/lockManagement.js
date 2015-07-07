function doSubmit(){
	var email = document.getElementById("renter_email").value;
	var name = document.getElementById("renter_name").value;
	var mobile = document.getElementById("renter_phone").value;
	 var THING_NUMBER= document.getElementById("THING_NUMBER").value;
	if(name != null && name.length>0){
		if(THING_NUMBER == null|| THING_NUMBER==""){
		     alert("请填写产品机号");
		     return false;
		   }
		if((email==null||email=="")&&(mobile==null||mobile=="")){
			alert("请填写EMAIL或手机号");
		}else{
				var x=0;
				if(email!=null && email.length>0){
					if(email.indexOf("@")!=-1&&email.indexOf("@")!=0){
						x++;
					}else{
						alert("请正确填写EMAIL");
						return false;
					}
				}
				//Modify by Michael 2012 6-18 因台湾手机号码规则不一致，所以取消验证手机号码规则
//				if(mobile != null&& mobile.length>0){
//					if(phone(document.getElementById("renter_phone"),'手机号码')){
//						return false;
//					}else{
//						x++;
//					}
//				}
				
				if(x!=0){
					$("#form1").submit();
				}
			
		}
	}else{
		alert("请填写设备维护人");
	}
}

function onRes(){
	document.form1.reset();
	var s = $("#table1 tr td").eq(2).text();
	$("#first").attr('value',s.trim());
	//$("#first").val(s);
}

$(function() {
	var s = $("#table1 tr td").eq(2).text();
	$("#first").val(s.trim());
	$("#datebegin").change(function(){
		var firstDate= $("#table1 tr td").eq(2).text();
		var secondDate = $("#datebegin").val();
		if(secondDate==""){
			return;
		}
		var count = reduceDate(firstDate,secondDate);
		$("#count").val(count);
		var arrys = $("input[name='payDate']");
		var arr = $("input[name='lock_date']");
		for(var i=0;i<arr.length;i++){
			//var s = arr[i].value;
			//var s = arrys[i].value;
			var s=secondDate;
			d = new Date(s.replace(/-/g, "/"));
			d.addMonths(i);
			//d.addDays(count);
			$(arr[i]).val(d.Format("yyyy-MM-dd"));
		}
		paydateToRemindayssssss();
	});
	paydateToRemindayssssss();
//	$("input[name='payDate']").change(function(){
//		alert(111);
//		paydateToReminday();
//	});
});
// 计算提醒日
function paydateToReminday(th){
	var lock_date = $(th).val();
	d = new Date(lock_date.replace(/-/g, "/"));
	d.setDate(d.getDate() - 7);
	$(th).parent().parent().find("td").eq(8).find("input").val(d.Format("yyyy-MM-dd"));
}
function paydateToRemindayssssss(){
	var arrys = $("input[name='lock_date']");
	var arr = $("input[name='remin_day']");
	for(var i=0;i<arr.length;i++){
		var s = arrys[i].value;
		d = new Date(s.replace(/-/g, "/"));
		d.setDate(d.getDate() - 7);
		$(arr[i]).val(d.Format("yyyy-MM-dd"));
	}
}


// 相差天数
function reduceDate(firstDate,secondDate){
	var s1 = firstDate.replace(/-/g, "/");
	var s2 = secondDate.replace(/-/g, "/");
	d1 = new Date(s1);
	d2 = new Date(s2);
	
	var time= d2.getTime() - d1.getTime();
	var days = parseInt(time / (1000 * 60 * 60 * 24));
	
	return days;
}

// 时间格式化
Date.prototype.Format = function(fmt) 
{
    //author: meizz 
    var o =
    { 
        "M+" : this.getMonth() + 1, //月份 
        "d+" : this.getDate(), //日 
        "h+" : this.getHours(), //小时 
        "m+" : this.getMinutes(), //分 
        "s+" : this.getSeconds(), //秒 
        "q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
        "S" : this.getMilliseconds() //毫秒 
    }; 
    if (/(y+)/.test(fmt)) 
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length)); 
    for (var k in o) 
        if (new RegExp("(" + k + ")").test(fmt)) 
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length))); 
    return fmt; 
}


Date.prototype.addDays = function(d)
{
    this.setDate(this.getDate() + d);
};


Date.prototype.addWeeks = function(w)
{
    this.addDays(w * 7);
};


Date.prototype.addMonths= function(m)
{
    var d = this.getDate();
    this.setMonth(this.getMonth() + m);

    if (this.getDate() < d)
        this.setDate(0);
};


Date.prototype.addYears = function(y)
{
    var m = this.getMonth();
    this.setFullYear(this.getFullYear() + y);

    if (m < this.getMonth()) 
    {
        this.setDate(0);
    }
};


//
function sendLock()
{
	var lockid=$("#itemLockId").val();
	var pay_Date=$("#itempaydate").val();
	var count=$("#itemstatuscount").val();
	var employeeid=$("#employeeid").val();//(创建人)
	var passwords=$.trim($("#" + count+"passwords").val());//PASSWORDS(密码)
	var leaseCode=$("#thisleaseCode").val();
	var rentdetailid=$("#thisrentdetailid").val();//RENT_DETAIL_ID(合同设备关联信息表ID)
	var collrecdid=$("#" + count+"collrent_id").val();//RENT_ID(支付表明细ID)
	var lockdate=$("#"+count+"lock_date").val();//LOCK_DATE(锁码时间)
	var isunlock=$("#"+count+"isunlock").val();//ISUNLOCK(是否解锁)
	var unlockdate=$("#"+count+"unlock_date").val();//UNLOCK_DATE(解锁日期)
	var sendway=$("#"+count+"send_way").val();//send_way(发送方式)
	var remark=$("#"+count+"remark").val();//remark(备注)
	
	var rentername = $("#renter_name").val();
	var renteremail = $("#renter_email").val();
	var renterphone = $("#renter_phone").val();
	
	
	var thing_name="";
	var model_spec="";
	
	if(lockid!=null&&lockid.length>0){
	
	
		if(rentername != null && rentername.length>0){
				if((renteremail==null||renteremail=="")&&(renterphone==null||renterphone=="")){
					alert("请填写EMAIL或手机号");
				}else{
					if(renteremail != null &&renteremail.length>0){
						if(renteremail.indexOf("@")!=-1&&renteremail.indexOf("@")!=0){
								if(passwords.length==0)
								{
									alert("请填写密码！");
									return false;
								}
								else{
								$.ajax({
									type:"POST",
									data:{"lease_Code":leaseCode,"recd_id":rentdetailid,"__action":"lockManagement.custShow"},
									url:"../servlet/defaultDispatcher",
									dataType:"json",
									success:function(callback){
										if (renteremail == 'undefined'){
											alert("没有填写邮箱，请填写完邮箱在发送！");
											return ;
										} else if (renteremail == '' || renteremail ==null) {
											alert("没有填写邮箱，请填写完邮箱在发送！");
											return ;
										} else {
											var email=renteremail;
											var subject="锁码开通";
												$.ajax({
												type:"POST",
												data:{"subject":subject,"toAddress":email,"pay_Date":pay_Date,
												"thing_name":callback.queryCustManager.THING_NAME,"model_spec":callback.queryCustManager.MODEL_SPEC,
												"amount":callback.queryCustManager.AMOUNT,"unit":callback.queryCustManager.UNIT,
												"cust_name":callback.queryCustManager.CUST_NAME,"pass":passwords,"__action":"lockManagement.sendEmail"},
												url:"../servlet/defaultDispatcher",
												dataType:"json",
												success:function(callback){
												
														if(callback.returnStr=='邮件发送成功')
														{
														
															$.ajax({
																type:"POST",
																data:{"lock_id":lockid,"sendemail":email,"rent_id":collrecdid,"rent_detail_id":rentdetailid,"passwords":passwords,"pass":passwords,"send_way":0,"state":7,"SENDSTATE":1,"__action":"lockManagement.updateLockSendEmail"},
																url:"../servlet/defaultDispatcher",
																dataType:"json",
																success:function(callback)
																{
																	
																},
																error:function(callback){
																alert("网络错误，请稍后重试！");
																return ;
																}
															});
														}
														else
														{
															$.ajax({
																type:"POST",
																data:{"lock_id":lockid,"sendemail":email,"rent_id":collrecdid,"rent_detail_id":rentdetailid,"passwords":passwords,"pass":passwords,"send_way":0,"state":7,"SENDSTATE":2,"__action":"lockManagement.updateLockSendEmailError"},
																url:"../servlet/defaultDispatcher",
																dataType:"json",
																success:function(callback)
																{
																	
																},
																error:function(callback){
																alert("网络错误，请稍后重试！");
																return ;
																}
															});
														}
													
													alert(callback.returnStr);
													if(phone1(document.getElementById("renter_phone"),'手机号码'))
													{
														window.location.href = "../servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id="+$("#rect_id1").val()+"&eqmt_id="+$("#eqmt_id1").val()+"&recp_id="+$("#recp_id1").val();;
													}
													
												},
												error:function(callback){
													alert("网络错误，请稍后重试！");
													return ;
												}															
											});
										}
									},
									error:function(callback){
										alert("网络错误，请稍后重试！");
										return ;
									}
								});
								
								}//eles 结束
							}else{
								alert("请正确填写EMAIL");
								return false;
							}
					}
				
				}
				
			}else{
				alert("请填写设备维护人");
				return false;
			}
			
			
			
			
			
			
			
			
				if(renterphone != null&& renterphone.length>0){
						if(phone(document.getElementById("renter_phone"),'手机号码')){
							return false;
						}else{
							if(passwords.length==0)
							{
								alert("请填写密码！");
								return false;
							}
							else{
							$.ajax({
								type:"POST",
								data:{"lease_Code":leaseCode,"recd_id":rentdetailid,"__action":"lockManagement.custShow"},
								url:"../servlet/defaultDispatcher",
								dataType:"json",
								success:function(callback){
									if (renterphone == 'undefined'){
										alert("没有填写电话号码，请填写完电话号码发送！");
										return ;
									} else if (renterphone == '' || renterphone ==null) {
										alert("没有填写电话号码，请填写完电话号码发送！");
										return ;
									} else {
										var phone=renterphone;
										var subject="锁码";
										/*$.ajax({
										type:"POST",
										data:{"subject":subject,"toAddress":phone,"pay_Date":pay_Date,
										"thing_name":callback.queryCustManager.THING_NAME,"model_spec":callback.queryCustManager.MODEL_SPEC,
										"amount":callback.queryCustManager.AMOUNT,"unit":callback.queryCustManager.UNIT,
										"cust_name":callback.queryCustManager.CUST_NAME,"pass":passwords,"__action":"lockManagement.sendMessage"},
										url:"../servlet/defaultDispatcher",
										dataType:"json",
										success:function(callback){
										if(callback.returnStr=='短信发送成功')
										{*/
											$.ajax({
												type:"POST",
												data:{"LOCK_ID":lockid,"MTEL":phone,"MESSAGE":"您好，"+callback.queryCustManager.CUST_NAME+"，设备："+callback.queryCustManager.THING_NAME+"，型号："+callback.queryCustManager.MODEL_SPEC+"，支付时间："+pay_Date+"，密码："+passwords,"RECD_ID":collrecdid,"RENT_DETAIL_ID":rentdetailid,"PASSWORDS":passwords,"pass":passwords,"SEND_WAY":1,"__action":"lockManagement.updateLockSendManager"},
												url:"../servlet/defaultDispatcher",
												dataType:"json",
												success:function(callback){
												
													alert(callback.returnStr);
													window.location.href = "../servlet/defaultDispatcher?__action=lockManagement.getLockManagement&rect_id="+$("#rect_id1").val()+"&eqmt_id="+$("#eqmt_id1").val()+"&recp_id="+$("#recp_id1").val();
												},
												error:function(callback){
												alert("网络错误，请稍后重试！");
												return ;
												}
											});
										/*}
											
											alert(callback.returnStr);
										},
										error:function(callback){
											alert("网络错误，请稍后重试！");
											return ;
										}
										});*/
									}
								},
								error:function(callback){
									alert("网络错误，请稍后重试！");
									return ;
								}
							});
							}
						}
					}
			
			
			
			
						
	}else{
		alert("请先建立锁码");
	}
	
}

// 电话
function phone1(field, name) {
    var value = field.value;
    value = value.trim();

    if (!checkPhone(value)) {
        return true;
    } else {
        field.value = value;
        return false;
    }
}



