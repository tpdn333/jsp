<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="util.Cookies"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if (id.equals(password)) {
		// ID와 암호가 같으면 로그인에 성공한 것으로 판단.
		response.addCookie(Cookies.createCookie("AUTH", id, request.getContextPath(), -1));
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>로그인 성공!</title>
</head>
<body>
	<div class="container">로그인에 성공했습니다.</div>
</body>
</html>
<%
	} else { // 로그인 실패시
%>
<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
</script>
<%
	}
%>

