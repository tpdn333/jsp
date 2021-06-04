<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s2" tagdir="/WEB-INF/tags/sample2" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>

	<div class="container">
	<s2:navbar/>
		<h1> 로그인</h1>
		<form action="${pageContext.request.contextPath }/sample2/login" method="post">
			아이디 <br>
			<input type="text" name="id"/><br>
			비밀번호 <br>
			<input type="password" name="password"/><br>
			<input type="submit" value="로그인"/>
		</form>
		<c:if test="${not empty message }">
			<div>
				${message }
			</div>
		</c:if>
	</div>
</body>
</html>