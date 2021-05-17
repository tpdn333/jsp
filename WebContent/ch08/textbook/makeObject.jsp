<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="ch08.MemberInfo" scope="request"></jsp:useBean>
<%
	/* member.setId("tpdn1234");
	member.setName("최범균"); */
%>
<jsp:setProperty name="member" value="최범균" property="name"/>
<jsp:setProperty name="member" value="madvirus" property="id"/>
<jsp:forward page="useObject.jsp"/>