<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="util.FormatUtil" %>
<%
	request.setCharacterEncoding("utf-8");
	request.setAttribute("price", 12345L);
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>EL 함수 호출</title>
</head>
<body>
	<div class="container">
		가격은 <b>${FormatUtil.number(price, '#,##0' }</b>원 입니다.
	</div>
</body>
</html>