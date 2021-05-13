<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
	
	response.sendRedirect("27redirect-attribute2.jsp");

%>