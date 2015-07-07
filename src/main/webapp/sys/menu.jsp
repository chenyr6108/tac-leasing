<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<title>jQuery UI Accordion - Fill space</title>
	<link type="text/css" href="/common/js/jui/themes/base/ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="/common/js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="/common/js/jui/ui/ui.core.js"></script>
	<script type="text/javascript" src="/common/js/jui/ui/ui.accordion.js"></script>
	
	<link type="text/css" href="/common/js/jui/demos.css" rel="stylesheet" />
	
	
	
	<style>
		body{
		
			height:100%;
		}
		
	</style>

	<script type="text/javascript">
	$(function() {
		$("#accordion").accordion({animated:false});
	});
	</script>
</head>
<body> 



<div id="demo">
<div id="accordion">
	<h3><a href="#">管理</a></h3>
	<div>
		<p>
			<a href="user/create.jsp" target="main">新建用户</a><br>
			<a href="user/query.jsp" target="main">查询用户</a><br>
			<a href="../fileUpload.jsp" target="main">上传文件</a><br>
		</p>
	</div>
	<h3><a href="#">设置</a></h3>
	<div>
		<p>		
		</p>
	</div>
</div>
</div>



</body>
</html>

