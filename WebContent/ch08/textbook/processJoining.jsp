<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="ch08.MemberInfo" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	List<MemberInfo> list = (List<MemberInfo>) application.getAttribute("list");
	if(list == null) {
		list = new ArrayList<>();
		application.setAttribute("list", list);
	}
%>
<jsp:useBean id="memberInfo" class="ch08.MemberInfo"/>
<jsp:setProperty name="memberInfo" property="*"/>
<jsp:setProperty name="memberInfo" property="password" value="<%=memberInfo.getId() %>"/>
<%
	list.add(memberInfo);
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>가입</title>
</head>
<body>
	<div class="container">
		<table border="1" width="400" cellpadding="0" cellspacing="0">
		<tr>
			<td>아이디</td>
			<td>암호</td>
			<td>이름</td>
			<td>이메일</td>
		</tr>
		<% 
			for(MemberInfo mem : list) {
				out.print("<tr>");
				out.print("<td>");
				out.print(mem.getId());
				out.print("</td>");
				out.print("<td>");
				out.print(mem.getPassword());
				out.print("</td>");
				out.print("<td>");
				out.print(mem.getName());
				out.print("</td>");
				out.print("<td>");
				out.print(mem.getEmail());
				out.print("</td>");
				out.print("</tr>");
			}
		%>
		<%-- <tr>
			<td>이름</td>
			<td><jsp:getProperty property="name" name="memberInfo"/></td>
			<td>이메일</td>
			<td><jsp:getProperty property="email" name="memberInfo"/></td>
		</tr> --%>
		</table>
	</div>
</body>
</html>