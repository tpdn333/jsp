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
		\${true ? 'a' : 'b' } : ${true ? 'a' : 'b' } <br>
		\${false ? 'a' : 'b' } : ${false ? 'a' : 'b' } <br>
	</div>
</body>
</html>