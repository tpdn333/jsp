<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	response.addCookie(new Cookie("my-cookie", "my-value"));
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		Cache-control : ${header["cache-control"] }<br>
		cookie : ${header.cookie } <br>
	</div>
</body>
</html>