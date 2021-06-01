<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/ch16/lecture" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/ch16/textbook" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="" method="post">
			id <input type="text" readonly name="id" value="${cus.id }"/> <br>
			Name : <input type="text" name="name" value="${cus.name }"/> <br>
			Contact Name : <input type="text" name="contactName" value="${cus.contactName }"/> <br>
			Address : <input type="text" name="address" value="${cus.address }"/> <br>
			City : <input type="text" name="city" value="${cus.city }" /> <br>
			Postal Code : <input type="text" name="postalCode" value="${cus.postalCode }"/> <br>
			Country : <input type="text" name="country" value="${cus.country }"/> <br>
			<input type="submit" />
		</form>
	</div>
</body>
</html>