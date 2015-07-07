$(function(){
	var domHead = $("#page_head");
	var domContent = $("#page_content");
	var domFoot = $("#page_foot");
	var domMenu = $("#page_menu");
	var domBody = $("#page_body");
	var htmlBody = $("body");
	var menuContainer = $("#menu_container");
	var iframeContainer = $("#iframe_container");
	var tabContainer = $("#tab_container");
	var tabContainer$tabs = $("#tab_container .tabs");
	
	$.autoWindows(function(){
		domContent.css({
			height:function(){return htmlBody.innerHeight()-domHead.outerHeight()-domFoot.outerHeight();}
		});
		domMenu.css({
			height:function(){return domContent.innerHeight();}
		});
		domBody.css({
			width:function(){return htmlBody.innerWidth()-domMenu.outerWidth(true);},
			height:function(){return domContent.innerHeight()-$(this).outerHeight(true)+$(this).innerHeight();},
			left:function(){return domMenu.outerWidth(true);}
		});
		menuContainer.css({
			width:function(){return domMenu.innerWidth()-$(this).outerWidth(true)+$(this).innerWidth();},
			height:function(){return domMenu.innerHeight()-$(this).outerHeight(true)+$(this).innerHeight();}
		});
		tabContainer.css({
			"top":function(){return domHead.innerHeight()-$(this).outerHeight(true);}
		});
		tabContainer$tabs.css({
			width:function(){return domBody.innerWidth()-$("#tab_container .tab-content-menu").outerHeight(true);},
			"margin-left":function(){return domMenu.outerWidth(true);}
		});
	});
	domMenu.resizable({
		handles: 'e',
		maxWidth:400,
		helper: 'page_menu-ui-state-highlight',
		start:function(){iframeContainer.hide();},
		resize:function(){$.autoWindows();},
		stop:function(){iframeContainer.show();$.autoWindows();}
	});
	tabContainer.dblclick(function(e){
		var t = $(e.target);
		if(t.is(".btnTab *")){
			//Begin隐藏头部
			var styleheight = domHead.height();
			domHead.data("margin-top",domHead.data("margin-top")||domHead.css("margin-top"));
			var dataHeight = domHead.data("height")||tabContainer.height();
			domHead.data("height",styleheight);
			domHead.animate(
				{"margin-top":dataHeight-styleheight},
				"fast",
				"linear",
				function(){
					$("#logo").toggle();
					//$("#fisheye").toggle();
					domHead.css({
						"margin-top":domHead.data("margin-top"),
						height:dataHeight
					});
					//Begin隐藏脚部
					height = domFoot.height();
					domFoot.height(domFoot.data("height")||0);
					domFoot.data("height",height);
					//End隐藏脚部
					$.autoWindows();
				}
			);
			//End隐藏头部
		}
	});
	
	menuContainer.click(function(e){
		var target = $(e.target);
		if(target.is(".type > span")){
			target.toggleClass("expanded").parent().next().toggle("fast");
		}else if(target.is(".childs > .item")){
			target.parent().parent().parent().find(".item").removeClass("selected");
			target.addClass("selected"); 
		}else if(target.is(".type")){
			target.parent().parent().find(".item").removeClass("selected");
			target.addClass("selected"); 
		}else if(target.is(".type > b")){
			target.parent().parent().parent().find(".item").removeClass("selected");
			target.parent().addClass("selected"); 
		}
	});
});



//用户修改密码
//点击弹出
function changePassword(id){
	newDialog()
	$("#thisID").val(id)
	openChangePassDiv('anotherPassword');
}
//提交
//ajax请求
function changeThePass(id){
	var flag = true;
	if(valueisPassword2('oldPassword')){
		flag=false;
	}
	if(valueisPassword2('password1')){
		flag=false;
	}
	if(valueisPassword2('password2')){
		flag=false;
	}
	if (($("#iforNot").val() != 5)) {
		alert("请先校验旧密码!");
		flag=false;
	}
	if(flag){
		if(PasswordMD5()){
			flag=false;
		}
		/*if(newPasswordValue()){
			flag=false;
		}*/
		if(checkPassword()){
			flag=false;
		}
	}
	if (flag) {
		
		$.ajax({
				type: "post",
				url: "../servlet/defaultDispatcher",
				data: "__action=acl.changePassword&needPassword="+($("#password2").val()),
				dataType: "json",
				success: function(json){
					
					if (json.password==1) {
						$("#lastResult").append("<font>修改成功</font>");
						setTimeout("closeblog()",4000);
						document.location.reload();
					}
				},
				error: function(){
						$("#lastResult").append("<font color='red'>操作失败 ！！</font>");
				}
			});
			
			
		
	}
}
function closeblog(){
	closeDialog('anotherPassword');
}
//重置
function newDialog(){
	$("#oldPassword").val("");
	$("#oldPassword").removeAttr('disabled');
	$("#password1").val("");
	$("#password2").val("");
	$("#behindoldPassword").empty();
	$("#behindpassword1").empty();
	$("#behindpassword2").empty();
	$("#iforNot").val(0);

}
//旧密码AJAX验证
function checkThisPassword(){
	var val1=  $.trim(($("#oldPassword").val()));
	if (!(val1.length == 0)) {
		$("#oldPassword2").val($("#oldPassword").val());
			$("#oldPassword").val(CalcuMD5('oldPassword', '1544164164644', false));
			$.ajax({
				type: "post",
				url: "../servlet/defaultDispatcher",
				data: "__action=acl.GETPassword",
				dataType: "json",
				success: function(json){
					
					if (json.password.PA == $("#oldPassword").val()) {
						
						$("#oldPassword").attr('disabled','disabled');
						$("#check1").hide();
						$("#behindoldPassword").empty();
						$("#behindoldPassword").append("<font>旧密码正确!</font>");
						
						$("#iforNot").val(5);
						return false;
					}
					else {
						$("#behindoldPassword").empty();
						$("#behindoldPassword").append("<font color='red'>旧密码不正确!</font>");
						return true;
					}
				},
				error: function(){
						return true;
				}
			});
		
		
	}
	
}

//表单提交验证
function valueisPassword2(id){
	var val1=  $.trim(($("#"+id).val()));
	$("#behind"+id).empty();
		if (val1.length == 0) {
			$("#behind" + id).append("<font color='red'>请填写！</>")
			
			return true
		}else {
			return false
		}
}
//内容改变则清除提示文字 
function changeThenClean(id){
	$("#behind"+id).empty();
}
//保存
function fillIn(){
	$("#oldPassword2").val($("#oldPassword").val());
}

//MD5
function PasswordMD5(){
		
		if ($("#password1").val() == $("#password2").val()) {
			
			$("#password1").val(CalcuMD5('password1', '1544164164644', false));
			$("#password2").val(CalcuMD5('password2', '1544164164644', false));
			return false;
			}
			else{
				
				$("#behindpassword2").empty();
				$("#behindpassword2").append("<font color='red'>密码与确认密码不相同!!</>");
				return true;
			}
}
//新密码验证
function newPasswordValue(){
	var val1= $.trim(($("#password1").val()));
	
	$("#behindpassword1").empty();

		if(!(val1.length == 0)) {
			var regex1=/[a-zA-Z]/;
			//var regex2=/[A-Z]/;
			var regex3=/[0-9]/;
			//var regex4=/[~!@#$%^&*,]/;
			if(!regex1.test(val1)||!regex3.test(val1)||val1.length<8) {//加入密码必须带有特殊字符 add by ShenQi
				$("#behindpassword1").append("<font color='red'>密码至少8位,需要包含字母和数字</font>");//大小写,包含下列至少1个特殊字符<br>~!@#$%^&*,
				$("input[name=subbut]").attr("disabled","disabled");
				$("input[name=subbut]").css("color","gray");
				return true;
			} else {
				$("input[name=subbut]").attr("disabled","");
				$("input[name=subbut]").css("color","");
			}
			if($("#oldPassword2").val()==$("#password1").val()) {
				$("#behindpassword1").empty();
				$("#behindpassword1").append("<font color='red'>旧密码与新密码相同</font>");
				$("input[name=subbut]").attr("disabled","disabled");
				$("input[name=subbut]").css("color","gray");
				return true;
			} else {
				$("input[name=subbut]").attr("disabled","");
				$("input[name=subbut]").css("color","");
			}
			return false;
			
		}
}
//确认新密码验证
function checkPassword(){
	$("#behindpassword2").empty();
	var val1= $.trim(($("#password2").val()));
		if(!(val1.length == 0)) {
			if($("#password2").val()!=$("#password1").val()) {
				$("#behindpassword2").empty();
				$("#behindpassword2").append("<font color='red'>密码与确认密码不相同</>");
				return true;
			}
			return false;
		}
}
