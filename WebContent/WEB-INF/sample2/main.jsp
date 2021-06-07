<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s2" tagdir="/WEB-INF/tags/sample2" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<s2:navbar/>
		<h1> 환영합니다. </h1>
		<form action="<%= request.getContextPath()%>/sample2/member/email">
		<input type="text" name="email"/>
		<button>제출</button>
		</form>
		
	</div>
</body>
</html>