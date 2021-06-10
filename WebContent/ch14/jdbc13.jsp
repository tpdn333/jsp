<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<fmt:formatNumber value="${15/10+(1-(10/2%1))%1 }" pattern="#"/><br>


		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>City</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customers }" var="customer">
					<tr>
						<th>${customer.id }</th>
						<th>${customer.name }</th>
						<th>${customer.city }</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a></li>
					<c:forEach begin="1" end="10" var="i">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/JDBC13Servlet?page=${i}">${i }</a></li>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>