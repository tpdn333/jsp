<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	request.setAttribute("name", "최범균");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>EL Object</title>
</head>
<body>
	<div class="container">
		요청 URI : ${pageContext.request.requestURI }<br>
		request의 name 속성 : ${requestScope.name }<br>
		code 파라미터 : ${param.code }<br>
	</div>
	
</body>
</html>