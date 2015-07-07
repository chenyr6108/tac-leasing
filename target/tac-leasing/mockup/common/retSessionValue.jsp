<%=session.getAttribute("error")==null?(String)session.getAttribute("msg")==null?"":(String)session.getAttribute("msg"):session.getAttribute("error")%>
<%
	session.removeAttribute("msg");
	session.removeAttribute("error");
%>