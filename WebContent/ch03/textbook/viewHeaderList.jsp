<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 목록 출력</title>
</head>
<body>
	<%
		Enumeration<String> headerEnum = request.getHeaderNames();
	while (headerEnum.hasMoreElements()) {
		String headerName = headerEnum.nextElement();
		String headerValue = request.getHeader(headerName);
	%>
	<%=headerName%> <b>=</b> <%=headerValue%>
	<br>
	<%
		}
	%>
</body>
</html>