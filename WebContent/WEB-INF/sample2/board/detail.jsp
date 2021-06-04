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
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			$("#form1").find("#title1, #textarea1").removeAttr("readonly");
			$("#submit1").removeAttr("hidden");
		});
		$("#delete").click(function() {
			var contextPath = '<%= request.getContextPath() %>';
			var result = confirm("게시글을 삭제하시겠습니까?");
			if(result) {
				location.href = contextPath + "/sample2/board/delete";
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<s2:navbar/>
		<h1>글 보기</h1>
		<div class="row justify-content-center">
			<div class="col-8">
				<form id="form1" action="${pageContext.request.contextPath }/sample2/board/modify" method="post">
					<div class="form-group">
						<label for="title1">제목</label> 
						<input readonly value="${board.title }" name="title" type="text" class="form-control" id="title1" aria-describedby="titleHelp"> 
					</div>
					<div class="form-group">
						<label for="writer1">작성자</label> 
						<input readonly value="${board.memberId }" name="memberId" type="text" class="form-control" id="memberId" />
					</div>
					<div class="form-group">
						<label for="textarea1">본문</label>
						<textarea readonly name="body" class="form-control" id="textarea1" rows="3"><c:out value="${board.body }"/></textarea>
					</div>
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