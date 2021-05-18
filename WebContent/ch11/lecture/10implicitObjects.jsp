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
		<h1>el 기본객체 11개</h1>
		<ul>
			<li>pageContext (객체)</li>
			<li>pageScope</li>
			<li>requestScope</li>
			<li>SessionScope</li>
			<li>applicationScope</li>
			<li>param</li>
			<li>paramValues</li>
			<li>header</li>
			<li>headerValues</li>
			<li>cookie</li>
			<li>initParam</li>
			
		</ul>
	</div>
</body>
</html>