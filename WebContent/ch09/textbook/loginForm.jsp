<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>로그인폼</title>
</head>
<body>
	<div class="container">
		<form action="<%=request.getContextPath()%>/ch09/textbook/login.jsp"
			method="post">
			<div class="form-group">
				<label for="id1">아이디 </label> <input type="text" name="id"
					class="form-control" id="id1" aria-describedby="idHelp" size="10">
				<small id="idHelp" class="form-text text-muted">영대소문자 숫자 조합</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">암호</label> <input type="password"
					class="form-control" id="exampleInputPassword1" name="password"
					size="10">
			</div>
			<input type="submit" value="로그인" class="btn btn-primary">
		</form>
	</div>
</body>
</html>