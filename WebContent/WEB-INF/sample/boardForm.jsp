<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/ch16/lecture"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/ch16/textbook"%>
<%@ taglib prefix="s1" tagdir="/WEB-INF/tags/sample" %>
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
		<s1:navbar/>
		<div class="row justify-content-center">
			<div class="col-2">
				<p>dropdown</p>			
			</div>
			<div class="col-8">
				<form action="" method="post">
					<div class="form-group">
						<label for="title1">제목</label> 
						<input name="title" type="text" class="form-control" id="title1" aria-describedby="titleHelp"> 
						<small id="titleHelp" class="form-text text-muted">필수</small>
					</div>
					<div class="form-group">
						<label for="writer1">작성자</label> 
						<input name="writer" type="text" class="form-control" id="writer1" />
					</div>
					<div class="form-group">
						<label for="textarea1">본문</label>
						<textarea rows="7" name="body" class="form-control" id="textarea1" rows="3"></textarea>
					</div>
					<input class="btn btn-primary" type="submit" value="등록" />
				</form>
			</div>
			<div class="col-2">
				<p>광ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ고</p>
			</div>
		</div>
	</div>
</body>
</html>