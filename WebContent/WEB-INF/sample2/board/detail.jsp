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
		<%-- $("#delete").click(function() {
			var contextPath = '<%= request.getContextPath() %>';
			var result = confirm("게시글을 삭제하시겠습니까?");
			if(result) {
				location.href = contextPath + "/sample2/board/remove";
			}
		}); --%>
		$("#delete").click(function(e) {
			e.preventDefault();
			
			if (confirm("삭제 하시겠습니까?")) {
				var path = '${pageContext.request.contextPath }/sample2/board/remove';
				$("#form1").attr("action", path);
				$("#form1").submit();
			}
			
		});
	});
</script>
<style>
textarea:focus {
	outline: none;
}
#CommentTextarea {
	padding: 5px 5px;
	resize: none;
}

</style>
</head>
<body>
	<div class="container">
		<s2:navbar/>
		<h1>글 보기</h1>
		<div class="justify-content-center">
			<form id="form1" action="${pageContext.request.contextPath }/sample2/board/modify?boardId=${boards.boardId }" method="post">
				<div class="form-group">
					<label for="title1">제목</label> 
					<input readonly value="${boards.title }" name="title" type="text" class="form-control" id="title1" aria-describedby="titleHelp"> 
				</div>
				<div class="form-group">
					<label for="writer1">작성자</label> 
					<input readonly value="${boards.memberName }" name="memberId" type="text" class="form-control" id="memberId" />
				</div>
				<div class="form-group">
					<label for="textarea1">본문</label>
					<textarea readonly name="body" class="form-control" id="textarea1" rows="3"><c:out value="${boards.body }"/></textarea>
				</div>
				<div class="form-group">
					<label for="date1">작성 시간</label>
					<input readonly class="form-control" id="date1" value="${boards.timeAgo }"></input>
				</div>
				<c:if test="${sessionScope.userLogined.id == boards.memberId }">
					<button type="button" class="btn btn-primary" id=btn1>수정</button>
					<!-- 버튼이 form안에있으면 submit이다 type 변경 -->
					<input hidden type="submit" class="btn btn-primary" id="submit1" value="등록"/>
					<button type="button" class="btn btn-primary" id="delete">삭제</button>
					<input type="number" value="${boards.boardId }" name="boardId" hidden >
				</c:if>
				<button type="button" class="btn btn-primary" id="addBody">추가</button>
			</form>
		</div>
		<s2:message/>
	</div>
	<c:if test="${not empty sessionScope.userLogined }">
		<div class="container mt-5">
			<h3>댓글</h3>
			<div class="justify-content-center">
				<form action="${pageContext.request.contextPath }/sample2/comment/add" method="post">
					<div class="CommentWriter" style="border:2px solid">
						<textarea id="CommentTextarea" placeholder="댓글을 남겨보세요" name="comment" style="width:100%"></textarea>
						<input hidden name="memberId" value="${sessionScope.userLogined.id }"readonly/>
						<input hidden name="boardId"  value="${boards.boardId }" readonly/>
						<input class="btn btn-primary" type="submit" value="댓글작성"/>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	<div id="commentBox" class="container mt-5">
		<h3>댓글 보기</h3>
		<c:forEach items="${comments }" var="comment">
			<script type="text/javascript">
				$(document).ready(function(){
					var $form = $('#' + 'comment${comment.id }Form'); 
					var $commentModify = $('#' + 'comment${comment.id }Modify');
					var $commentDelete = $('#' + 'comment${comment.id }Delete');
					var $commentSubmit = $('#' + 'comment${comment.id }Submit');
					var $commentByComment = $('#' +'comment${comment.id}ByComment');
					
					$commentModify.click(function(e) {
						e.preventDefault();
						$form.find("textarea").removeAttr("readonly");
						$(this).attr("hidden", "hidden");
						$commentSubmit.removeAttr("hidden");
					});
					
					$commentDelete.click(function(e) {
						e.preventDefault();
						if(confirm("댓글을 삭제 하시겠습니까?")) {
							$form.attr("action", "${pageContext.request.contextPath }/sample2/comment/remove");
							$form.submit();
						}
					});
				});
			</script>
			<form id="comment${comment.id }Form" action="${pageContext.request.contextPath }/sample2/comment/modify" method="post">
				<input name="commentId" value="${comment.id }" hidden/>
				<input name="boardId" value="${boards.boardId }" hidden/>
				<textarea name="comment" readonly>${comment.comment }</textarea>
				<span>${comment.memberName }</span>
				<span>${comment.timeAgo }</span>
				<c:if test="${not empty sessionScope.userLogined }">
					<button id="comment${comment.id}ByComment }">답글쓰기</button>
				</c:if>
				<div class="comment${comment.id }If">
				<c:if test="${sessionScope.userLogined.id == comment.memberId }">
					<button id="comment${comment.id }Modify">수정</button>
					<button id="comment${comment.id }Submit" hidden>전송</button>
					<button id="comment${comment.id }Delete">삭제</button>
				</c:if>
				</div>
			</form>
		</c:forEach>
	</div>
</body>
</html>