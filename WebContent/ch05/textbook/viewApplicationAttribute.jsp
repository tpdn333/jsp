<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>기본 객체 속성 보기</title>
</head>
<body>
	<div class="container">
		<%
			Enumeration<String> attrEnum = application.getAttributeNames();
			while(attrEnum.hasMoreElements()) {
				String name = attrEnum.nextElement();
				Object value = application.getAttribute(name);
		%>
		application 속성 : <b><%=name %> = <%= value %></b> <br>
		<%
			}
		%>
	</div>
</body>
</html>