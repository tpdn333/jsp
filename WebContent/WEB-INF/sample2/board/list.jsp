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
<style>
	a:link {text-decoration: none; color: black;}
	a:visited {text-decoration: none; color: black;}
	a:active {text-decoration: none; color: black;}
	a:hover {text-decoration: underline; color: #a6a6a6;}
</style>
</head>
<body>
	<s2:main_header/>
	<s2:navbar/>
	<div class="container">
		<h3>글 목록<span style="font-size:15px"> 전체글 ${totalNum }개</span></h3>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th class="col-md-1">#</th>
					<th class="col-md-5">제목</th>
					<th class="col-md-2">작성자</th>
					<th class="col-md-3">작성 시간</th>
					<th class="col-md-1">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boards }" var="board" varStatus="status">
					<tr>
						<th scope="row">${board.boardId }</th>
						<td><a href="<%= request.getContextPath()%>/sample2/board/detail?boardId=${board.boardId }&b_memberId=${board.memberId }">
							${board.title} 
							</a>
							<c:if test="${board.numberOfComment ne 0 }">
								<span style="font-style: normal; color: #ff2f3b">[${board.numberOfComment }]</span>
								<!-- <div class="fa-2x">
									<span class="fa-layers fa-fw" style="background:White">
								    	<i class="fas fa-envelope"></i>
								    	<span class="fa-layers-counter" style="background:Tomato">${board.numberOfComment }</span>
								  	</span>
								</div> -->
							</c:if>
						</td>
						<td>${board.memberName }</td>
						<td>${board.timeAgo }</td>
						<td>${board.views }</td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:forEach var="i" begin="1" end="${(totalNum / 10) + ( 1 - ( (totalNum / 10) % 1 ) ) % 1 }">
			    	<li class="page-item"><a class="page-link" href="<%= request.getContextPath()%>/sample2/board/list?page=${i }">${i }</a></li>
			    	
				</c:forEach>
		  	</ul>
		</nav>
	</div>
</body>
</html>