<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s1" tagdir="/WEB-INF/tags/sample" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<s1:navbar/>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="board" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><a href="detail?index=${status.index }">${board.title}</a></td>
						<td>${board.writer }</td>
						<td><fmt:formatDate value="${board.time }" pattern="yy-MM-dd / hh:mm:ss"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>