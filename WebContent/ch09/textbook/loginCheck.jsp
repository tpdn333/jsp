<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="util.Cookies" %>
<%
	request.setCharacterEncoding("utf-8");
	Cookies cookies = new Cookies(request);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>로그인 여부 검사</title>
</head>
<body>
	<div class="container">
		<%
			if( cookies.exists("AUTH")) {
		%>
			아이디 <%= cookies.getValue("AUTH") %> 로 로그인 한 상태
		<%			
			} else {
		%>
			로그인 하지 않은 상태
		<%		
			}
		%>
	</div>
</body>
</html>