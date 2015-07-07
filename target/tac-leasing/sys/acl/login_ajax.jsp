<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="screen" href="/common/js/css.css" />

<script src="/common/js/jquery-1.3.2.js" type="text/javascript" ></script>
<script src="/common/js/jquery.blockUI.js" type="text/javascript" ></script>


<script type="text/javascript" >

$().ready(function() {   
  
  $("#login_submit").click(function(){
  	 
		$.each($('#dialog > input[class="f9"]'), function(){
		
			if($(this).val() == ''){
				$(this).toggleClass("error");
				return;
			}
			  	
		});	
		
		$('#growlUI').text("正在验证");
		
		$.blockUI({ 
            message: $('#growlUI'), 
            fadeIn: 300, 
            fadeOut: 500,             
            showOverlay: false, 
            centerY: false, 
            css: { 
                width: '350px', 
                top: '10px', 
                left: '', 
                right: '10px', 
                border: 'none', 
                padding: '5px', 
                backgroundColor: '#ccc', 
                '-webkit-border-radius': '10px', 
                '-moz-border-radius': '10px', 
                opacity: '.6', 
                color: '#fff' 
            } 
        }); 
		
		$.getJSON("/servlet/defaultDispatcher",
			{__action:"acl.login", ssn:$('#ssn').val(), pwd:$("#pwd").val(),__verifycode:$("#__verifycode").val()},  
			function(json){
		  		//alert("JSON Data: " + json.errList);
		  		if(json.errList.length>0){
		  		    var msg = '';
		  			$.each( json.errList, function(i, n){
					  msg += n  ;
					});
					
					//$('#growlUI').removeClass();
					$('#growlUI').addClass("err");
					$.blockUI.addTimeout(2000);
					
					$('#growlUI').text(msg);		
				}else if(!json.rs){
					$.blockUI.addTimeout(2000);
					$('#growlUI').addClass("err");
					$('#growlUI').text("无此用户!");		
								
				}else{				
				    $('#growlUI').addClass("ok");
				    $('#logInfo').html('欢迎: ' + json.rs.name + '&nbsp;<a href="/user/query.jsp">人员查询</a>&nbsp;<a href="/servlet/defaultDispatcher?__action=acl_logout">退出</a>');
				    $('#growlUI').text("登录成功!");
					$.blockUI.addTimeout(2000);
					window.location.href = "/";
				}
			}
		);			
		
		$('#growlUI').click(function(){
			$.unblockUI();
		});	
		
		
  	 
  });

     
});


</script>

</head>
<body>


<hr>
		用户名 <!-- input type="text" class="f9" name="ssn" id="ssn"  value="${__context.contextMap.ssn}" size="10" -->
		<input type="text" class="f9" name="ssn" id="ssn"  value="111" size="10">
		
		<br>
		口&nbsp;&nbsp;&nbsp;&nbsp;令 <input class="f9" id="pwd" type="password" name="pwd" size="10" value="111">
		<br>
		 验证码 <img align="absmiddle" src='/getimg' id="verifyimg"><input id="__verifycode"  class="f9" name="__verifycode" type="text"  size="6">
		 <br>		

		<input type="submit" value="Login" name="submit" id="login_submit">	
		
		<hr>




        <div id="growlUI" class="err" style="display:none">
        </div>

</body>
</html>