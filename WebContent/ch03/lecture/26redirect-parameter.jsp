<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.sendRedirect("26redirect-parameter2.jsp?name=java&age=30");
%>