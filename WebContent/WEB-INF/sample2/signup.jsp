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
		<form action="<%=request.getContextPath() %>/sample2/signup" method="post">
			아이디 : <br>
			<input type="text" name="id"/> <br>
			비밀번호 : <br>
			<input type="password" name="password"/> <br>
			이름 : <br>
			<input type="text" name="name"/> <br>
			생년월일 : <br>
			<input type="date" name="birth"/> <br>
			<input type="submit" value="가입"/> <br>
			
		</form>
	</div>
</body>
</html>