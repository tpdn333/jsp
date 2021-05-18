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
		cookie1 : ${cookie["my-cookie"] }
		<br>
		cookie2 : ${cookie.JSESSIONID}
		<br>

		<hr>
		cookie value1 : ${cookie["my-cookie"].value }
		<br>
		cookie value2 : ${cookie.JSESSIONID.value }
		<br>

		<hr>
		cookies httpOnly1 : ${cookie["my-cookie"].httpOnly }
		<br>
		cookies httpOnly2 : ${cookie.JSESSIONID.httpOnly }
		<br>
	</div>
</body>
</html>