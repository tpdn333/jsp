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
		<h1>application에 attribute 추가</h1>
		<%
		request.setAttribute("req-att1", "req-value1");
		session.setAttribute("session-att1", "session-value1");
		application.setAttribute("app-att1", "app-value1");
		
		%>
	</div>
</body>
</html>