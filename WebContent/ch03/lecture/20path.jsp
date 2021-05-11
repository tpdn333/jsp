<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>++654Insert title here</title>
</head>
<body>
	<h1>context root(context path)</h1>
	<p><%= request.getContextPath() %>
	<h2>절대 경로</h2>
	<h4>같은 경로</h4>
	<a href="<%= request.getContextPath() %>/ch03/lecture/15form_method.jsp">15번 파일</a>

	<h4>상위 경로</h4>
	<a href="<%= request.getContextPath() %>/ch03/17path.jsp">17번 파일</a>

	<h4>하위 경로</h4>
	<a href="<%= request.getContextPath() %>/ch03/lecture/subLecture/18path.jsp">18번 파일</a>

	<h4>다른 경로</h4>
	<a href="<%= request.getContextPath() %>/ch03/textbook/viewHeaderList.jsp">viewHeaderList</a>
</body>
</html>