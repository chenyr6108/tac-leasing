<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

   
<%
	if(session.getAttribute("ssn")==null){
		//request.getRequestDispatcher("/acl/login.jsp").forward(request, response);
		response.sendRedirect("acl/login.jsp");
	}
%>


<frameset cols="*,260px">
	
	  <frame src="welcome.jsp" name="main">
	  <frame src="menu.jsp" name="menu" scrolling="no" >
		
</frameset>

