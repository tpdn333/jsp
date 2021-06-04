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
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>가입날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${member }" var="member" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${member.id }</td>
						<td>${member.password }</td>
						<td>${member.name }</td>
						<td>${member.birth }</td>
						<td>${member.gender }</td>
						<td>${member.inserted }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>