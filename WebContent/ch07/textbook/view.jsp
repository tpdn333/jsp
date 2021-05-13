<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String code = request.getParameter("code");
	String viewPageURI = null;
	
	if(code.equals("A")) {
		viewPageURI = "/ch07/textbook/a.jsp";
	} else if (code.equals("B")) {
		viewPageURI = "/ch07/textbook/b.jsp";
	} else if (code.equals("C")) {
		viewPageURI = "/ch07/textbook/c.jsp";
	}
%>
<jsp:forward page="<%= viewPageURI %>"></jsp:forward>