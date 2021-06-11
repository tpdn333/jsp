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
<s2:navbar/>
	<div class="container">
		<h1>글 작성</h1>
		<form action="${pageContext.request.contextPath }/sample2/board/write" method="post">
			<div class="form-group">
				<label for="title1">제목</label> 
				<input name="title" type="text" class="form-control" id="title1" aria-describedby="titleHelp"> 
				<small id="titleHelp" class="form-text text-muted">필수</small>
			</div>
			<div class="form-group">
				<label for="textarea1">본문</label>
				<textarea rows="7" name="body" class="form-control" id="textarea1" ></textarea>
			</div>
			<input class="btn btn-primary" type="submit" value="등록" />
		</form>
	</div>
</body>
</html>