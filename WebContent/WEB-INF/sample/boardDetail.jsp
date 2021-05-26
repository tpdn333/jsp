<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/ch16/lecture" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/ch16/textbook" %>
<%@ taglib prefix="s1" tagdir="/WEB-INF/tags/sample" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			$("#form1").find("input, textarea").removeAttr("readonly");
			$("#submit1").removeAttr("hidden");
		});
		$("#delete").click(function() {
			var contextPath = '<%= request.getContextPath() %>';
			var result = confirm("게시글을 삭제하시겠습니까?");
			if(result) {
				location.href = contextPath + "/sample/delete";
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
	<s1:navbar/>
		<div class="row justify-content-center">
			<div class="col-8">
				<form id="form1" action="${pageContext.request.contextPath }/sample/modify" method="post">
					<div class="form-group">
						<label for="title1">제목</label> 
						<input readonly value="${board.title }" name="title" type="text" class="form-control" id="title1" aria-describedby="titleHelp"> 
					</div>
					<div class="form-group">
						<label for="writer1">작성자</label> 
						<input readonly value="${board.writer }" name="writer" type="text" class="form-control" id="writer1" />
					</div>
					<div class="form-group">
						<label for="textarea1">본문</label>
						<textarea readonly name="body" class="form-control" id="textarea1" rows="3"><c:out value="${board.body }"/></textarea>
					</div>
					<input type="text" value="${param.index }" hidden name="index"/>
					<button type="button" class="btn btn-primary" id=btn1>수정</button>
					<!-- 버튼이 form안에있으면 submit이다 type 변경 -->
					<input hidden type="submit" class="btn btn-primary" id="submit1" value="등록"/>
					<button type="button" class="btn btn-primary" id="delete">삭제</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>