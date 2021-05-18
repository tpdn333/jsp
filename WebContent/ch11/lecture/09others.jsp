<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	pageContext.setAttribute("myReq", request);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>expression 방식</h2>
		expression : <%= request.getContextPath() %> <br>
		expression : <%= request.getMethod() %> <br>
		expression : <%= request.getRequestedSessionId() %>
		<hr>
		자바빈이 아니여도 빈처럼 사용가능 <br>
		el : ${myReq.contextPath } <br>
		method : ${myReq.method } <br>
		requestedSessionId : ${myReq.requestedSessionId }
		
	</div>
</body>
</html>