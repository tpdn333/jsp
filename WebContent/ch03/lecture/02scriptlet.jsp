<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scriptlet</h1>
	<p>java code를 작성할 수 있는 요소</p>
	
	<%--
	java code를 작성할 수 있는 jsp 요소
	1. scriptlet
	2. expression
	3. declaration
	 --%>
	 
	 <%
	 // java code 주석
	 /*
	 java code 작성 가능...
	 
	 */
	 System.out.println("Hello world");
	 %>
</body>
	<% 
	String str = "Hello";
	out.write("<h1>scriptlet으로 작성한 코드</h1>");
	%>
</html>