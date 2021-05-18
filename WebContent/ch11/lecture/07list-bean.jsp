<%@page import="ch08.Book"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	Book book = new Book();
	book.setTitle("java book");
	book.setWriter("kim");
	
	Book book2 = new Book();
	book2.setTitle("db book");
	book2.setWriter("lee");
	
	Book[] arr = { book, book2 };
	pageContext.setAttribute("list", arr);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h3> book </h3>
		title : ${list[0].title }<br>
		writer : ${list[0].writer }<br>
		<hr>
		<h3> book2 </h3>
		title : ${list[1].title }<br>
		writer : ${list[1].writer }<br>
	</div>
</body>
</html>