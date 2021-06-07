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
			<thead class="thead-dark">
				<tr>
					<th class="col-md-2">#</th>
					<th class="col-md-5">제목</th>
					<th class="col-md-2">작성자</th>
					<th class="col-md-3">작성 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boards }" var="board" varStatus="status">
					<tr>
						<th scope="row">${board.boardId }</th>
						<td><a href="<%= request.getContextPath()%>/sample2/board/detail?boardId=${board.boardId }">${board.title}</a></td>
						<td>${board.memberName }</td>
						<td>${board.timeAgo }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>