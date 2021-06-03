<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s2" tagdir="/WEB-INF/tags/sample2"%>


<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$("#button1").click(function() {
			$("#input2, #input3, #input4").removeAttr("readonly");
			$("#input5").attr("hidden", "hidden");
			$("#input6").removeAttr("hidden");
			$("#submit1").removeAttr("hidden");
		});
		
		$("#submit2").click(function(e) {
			e.preventDefault();
			console.log("submit2 clicked.....");
			
			var con = confirm("탈퇴 하시겠습니까??");
			
			console.log(con);
			
			if (con) {
				$("#form2").submit();
			}
		});
	});
</script>

</head>
<body>
<div class="container">
	<s2:navbar/>
	<form id="form1" action="${pageContext.request.contextPath }/sample2/modify" method="post">
		아이디 : <br>
		<input id="input1" type="text" name="id" value="${member.id }" readonly> <br>
		비밀번호 : <br>
		<input id="input2" type="password" name="password" value="${member.password }" readonly> <br>
		이름 : <br>	
		<input id="input3" type="text" name="name" value="${member.name }" readonly> <br>
		생년월일: <br>
		<input id="input4" type="date" name="birth" value="${member.birth }" readonly> <br>
		성별 : <br>
		<input id="input5" type="text" value="${member.gender }" readonly> <br>
		<select id="input6" name="gender" hidden>
			<option value="">성별</option>
			<option value="Male">남자</option>
			<option value="Female">여자</option>
			<option value="NULL">선택 안함</option>
		</select> <br>
		<button id="button1" type="button" >수정</button>
		<input type="submit" id="submit1" value="전송" hidden>
	</form>
	
	<c:if test="${not empty message }">
		<div>
			${message }
		</div>
	</c:if>
</div>

<div class="container">
	<form id="form2" action="${pageContext.request.contextPath}/sample2/remove" method="post">
		<input id="submit2" type="submit" value="탈퇴">
	</form>
</div>
</body>
</html>





