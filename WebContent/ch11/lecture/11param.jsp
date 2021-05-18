<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h3>param</h3>
		param : ${param } <br>
		<b>\${param.name }</b> <br>
		name : ${param.name }	<br>
		age : ${param.age } <br>
		<%
			String[] names = request.getParameterValues("name");
		%>
			<%= names[0] %> <br>
			<%= names[1] %> <br>
		<hr>
		<h3>paramValues</h3>
		<b>\${paramValues.name[0] }</b> <br>
		${paramValues.name[0] }	<br>
		${paramValues.name[1] }	<br>
	</div>
</body>
</html>