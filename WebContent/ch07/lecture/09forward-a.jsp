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
		<h1>a.jsp</h1>
		<!-- forward 이전은 무시됨 -->
		<jsp:forward page="09forward-b.jsp"></jsp:forward>
		<!-- forward 이후는 실행안함 -->
	</div>
</body>
</html>