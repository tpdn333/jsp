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
		<b>pageContext : </b> ${pageContext }<br>
		<b>request : </b> ${pageContext.request } <br>
		<b>session : </b> ${pageContext.session } <br>
		<b>application : </b> ${pageContext.servletContext } <br>
		<b>contextPath : </b> ${pageContext.request.contextPath } <br>
	</div>
</body>
</html>