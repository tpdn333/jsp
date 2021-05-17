<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="book1" scope="page" class="ch08.Book"/>
<jsp:useBean id="book2" scope="request" class="ch08.Book"/>
<jsp:useBean id="book3" scope="session" class="ch08.Book"/>
<jsp:useBean id="book4" scope="application" class="ch08.Book"/>
<div class="container">
	<h3>scope2.jsp</h3>
	책1 제목 : <jsp:getProperty property="title" name="book1"/> <br>
	책2 제목 : <jsp:getProperty property="title" name="book2"/> <br>
	책3 제목 : <jsp:getProperty property="title" name="book3"/> <br>
	책4 제목 : <jsp:getProperty property="title" name="book4"/> <br>
</div>