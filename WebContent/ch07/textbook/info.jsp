<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>INFO</title>
</head>
<body>
	<div class="container">
		<table width="100%" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>제품번호</td>
			<td>XXXX</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>10,000원</td>
		</tr>	
		</table>
		
		<jsp:include page="infoSub.jsp">
			<jsp:param value="B" name="type"/>
		</jsp:include>
	</div>
</body>
</html>