<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form>
			<input type="checkbox" name="fruit" value="100"> 사과 <br>
			<input type="checkbox" name="fruit" value="150"> 바나나 <br>
			<input type="checkbox" name="fruit" value="200"> 딸기 <br>
			<input type="checkbox" name="fruit" value="300"> 키위 <br>
			<input type="checkbox" name="fruit" value="500"> 망고 <br>
			<input type="checkbox" name="fruit" value="1000"> 수박 <br>
			
			<input type="submit" value="합계">
		</form>
	</div>
	<hr>
	<div class="container">
		<%
			int sum = 0;
			String[] value = request.getParameterValues("fruit");
			if(value != null && value.length > 0) {
				for(int i = 0; i < value.length; i++) {
					sum += Integer.parseInt(value[i]);
					/* sum += Integer.valueOf(value[i]); */
				}
			}
		%>
		합계 : <%= sum %>원
	</div>
</body>
</html>