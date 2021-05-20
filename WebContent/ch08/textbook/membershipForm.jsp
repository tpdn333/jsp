<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>회원가입 입력 폼</title>
</head>
<body>
	<div class="container">
		<form action="processJoining.jsp" method="post">
			<table class="table">
				<thead class="thead-dark">
					<tr>
					<td scope="col">아이디</td>
					<td scope="col"><input type="text" name="id" size="10"/></td>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td>이름</td>
					<td><input type="text" name="name" size="10"/></td>
					<td>이메일</td>
					<td><input type="text" name="email" size="30"/></td>
				<tr>
				<tr>
					<td colspan="4" align="center">
					<input type="submit" value="Sign in" class="btn btn-primary"/>
				</td>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>