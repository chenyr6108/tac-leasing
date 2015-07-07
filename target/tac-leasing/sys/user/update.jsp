<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" media="screen" href="/common/js/validate/css.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/common/js/css.css" />

<script src="/common/js/jquery-1.3.2.js" type="text/javascript" ></script>
<script src="/common/js/jquery.form.js" type="text/javascript" ></script>
<script src="/common/js/jquery.blockUI.js" type="text/javascript" ></script>
<script src="/common/js/validate/jquery.validate.js" type="text/javascript"></script>


<script type="text/javascript">
$().ready(function() {
	
	$("#theForm").validate({
		
		rules: {

			ssn: {
				required: true,
				minlength: 3
			},
			name: {
				required: true,
				minlength: 3
			},
			email: {
				required: true,
				minlength: 3 ,
				email: false
			}
		},

		submitHandler: function(form) {
			
			
			$.blockUI({ 
	    	message: $('#info'),
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
			
			//ajax提交表单,需要jQuery.Form插件
			$(form).ajaxSubmit({
				
				
				dataType:'json',
				success : function(json){
					
					if(json.errList.length>0){
			  		   
						$('#info').text(json.errList[0]);
						$.blockUI.addTimeout(2000);
						
						return;
					}
					
					$('#info').text('修改成功。');
					$.blockUI.addTimeout(1000);										
					
				}
				
				
			});
			return false;
		},
		
		
		// set this class to error-labels to indicate valid fields
		success: function(label) {
			// set &nbsp; as text for IE
			label.html("&nbsp;").addClass("checked");
		}		
		
		
	});

	
	$('#info').click(function(){
			$.unblockUI();
	});	
	
	$.getJSON("/servlet/defaultDispatcher",
		{__action:"user.read", uuid:$('#uuid').val()},  
		function(json){
	  		
	  		if(json.user){
				$('#name').val(json.user.name);		
				$('#ssn').val(json.user.ssn);	
				$('#email').val(json.user.email);
			}
		}
	);			
		
	

});
</script>



</head>
<body>
<br/><br/>
<div id="info" style="display:none;">正在提交数据，请稍候</div>
<br/>
<form id="theForm" name="theForm" width="500" method="post" action="/servlet/defaultDispatcher">  

	<table align="center" border="1" width="500"  class="f9">
	

	<tr height="25">
		<td width="100">登录名</td><td><input type="text" id="ssn" name="ssn"></td>
	</tr>
	<tr height="25">
		<td width="100">姓名</td><td><input type="text" id="name" name="name"></td>
	</tr>
	<tr height="25">
		<td width="100">msn</td><td><input type="text" id="msn" name="msn"></td>
	</tr>
	<tr  height="25">
		<td width="100">email</td><td><input type="text" id="email" name="email"></td>
	</tr>
	<tr  height="25">
		<td  colspan="2" align="right">
		<input type="hidden" name="__action" value="user.update"/>
		<input type="hidden" id="uuid" name="uuid" value="${param.uuid}"/>
		<input type="submit" name="submit" value="提交"/></td>
	</tr>
	
	</table>
</form>	

</body>
</html>