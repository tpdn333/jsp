<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>옵션화면 선택</title>
</head>
<body>
	<div class="container">
		<form action="<%=request.getContextPath() %>/ch07/textbook/view.jsp">
		<div class="form-group">
			<label for="select1"> 보고싶은 페이지 선택 : </label> 
			<select name="code" class="custom-select" id="select1">
				<option selected>select page</option>
				<option value="A">A 페이지</option>
				<option value="B">B 페이지</option>
				<option value="C">C 페이지</option>
			</select>
		</div>
		<input type="submit" value="이동" class="btn btn-primary">
		</form>
	</div>
</body>
</html>