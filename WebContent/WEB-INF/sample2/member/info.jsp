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
		$("#buttonModify").click(function() {
			$("#inputPW, #inputName, #inputBirth").removeAttr("readonly");
			$("#inputGender1").attr("hidden", "hidden");
			$("#inputGender2").removeAttr("hidden");
			$("#submitForm1").removeAttr("hidden");
		});
		
		$("#submitDelete").click(function(e) {
			e.preventDefault();
			console.log("submitDelete clicked.....");
			
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
<s2:main_header/>
<s2:navbar/>
<div class="container">
	<form id="form1" action="${pageContext.request.contextPath }/sample2/member/modify" method="post">
		아이디 : <br>
		<input id="inputId" type="text" name="id" value="${member.id }" readonly> <br>
		비밀번호 : <br>
		<input id="inputPW" type="password" name="password" value="${member.password }" readonly> <br>
		이름 : <br>	
		<input id="inputName" type="text" name="name" value="${member.name }" readonly> <br>
		생년월일: <br>
		<input id="inputBirth" type="date" name="birth" value="${member.birth }" readonly> <br>
		성별 : <br>
		<input id="inputGender1" type="text" value="${member.gender }" readonly> <br>
		<select id="inputGender2" name="gender" hidden>
			<option value="">성별</option>
			<option value="Male">남자</option>
			<option value="Female">여자</option>
			<option value="NULL">선택 안함</option>
		</select> <br>
		<button id="buttonModify" type="button" >수정</button>
		<input type="submit" id="submitForm1" value="전송" hidden>
	</form>
	
	<s2:message/>
</div>
<div class="container">
	작성한 게시물 : <span>${member.numberOfBoard}</span>개 <br>
	작성한 댓글 : <span>${member.numberOfComment }</span>개
	
</div>
<div class="container">
	<form id="form2" action="${pageContext.request.contextPath}/sample2/member/remove" method="post">
		<input id="submitDelete" type="submit" value="탈퇴">
	</form>
</div>
</body>
</html>





