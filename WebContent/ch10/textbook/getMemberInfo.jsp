<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>세션에 정보 출력</title>
</head>
<body>
	<div class="container">
		MemberId : <%= session.getAttribute("MEMBERID") %><br>
		Name : <%= session.getAttribute("NAME") %>	
	</div>
</body>
</html>