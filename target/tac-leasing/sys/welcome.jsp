<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <% String path=request.getContextPath(); %>   
<html>
<head>
<script type="text/javascript">
	function doload(){ 
		top.location.href="<%=path%>/sys/acl/login.jsp";
	}
</script>
</head>
<body onload="doload();"></body>
</html>