<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s2" tagdir="/WEB-INF/tags/sample2"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
<script type="text/javascript">
	var url = "${pageContext.request.contextPath}" + "/sample2/member/checked";
	$(document).ready(function () {
		$("#button1").click(function() {
			var id = $("#ID").val();
			$.post(url, {id : id}, function(data) {
				if(data == 'ok') {
					// 가입가능 메세지
					$("#idHelp").text("사용가능한 아이디 입니다.");
					$("#idHelp").attr("style", "color : #8080ff");
				} else {
					// 가입불가능 메세지
					$("#idHelp").text("중복된 아이디 입니다.");
					$("#idHelp").css("color", "#ff6666");
				}
			}) ;
		});
		$("#pwsuccess, #pwdanger, #needpw").hide();
		$("#PASSWORD1, #PASSWORD2").on("keyup", function() {
			$("#needpw").hide();
			var pw1 = $("#PASSWORD1").val();
			var pw2 = $("#PASSWORD2").val();
			if(pw1 != "" || pw2 != ""){
				if(pw1 == pw2) {
					$("#pwsuccess").show();
					$("#pwdanger").hide();
					$("#submit1").removeAttr("disabled");
				} else {
					$("#pwsuccess").hide();
					$("#pwdanger").show();
					$("#submit1").attr("disabled", "disabled");
				}
			
			}
			
		});
	});
</script>
</head>
<body>
	<s2:main_header/>
	<s2:navbar/>
	<div class="container mt-3">
		<form id="signup" action="<%=request.getContextPath()%>/sample2/member/signup" method="post">
			<div class="row form-group">
				<div class="col-10">
					<label for="ID">아이디</label> 
					<input id="ID" class="form-control" type="text" name="id" aria-describedby="idHelp" required/>
					<small style="color: red" id="idHelp" ></small>
				</div>
				<div class="col-2">
					<button style="width: 100%" class="btn btn-primary mt-3" id="button1" type="button">중복확인</button>
				</div>
			</div>
			<div class="form-group">
				<label for="PASSWORD1">비밀번호</label> 
				<input id="PASSWORD1" class="form-control" type="password" name="password" required/>
			</div>
			<div class="form-group">
				<label for="PASSWORD2">비밀번호 확인</label> 
				<input id="PASSWORD2" class="form-control" type="password" aria-describedby="passworHelp" required/>
			</div>
			<div id="needpw" class="alert alert-primary" role="alert">비밀번호를 입력해야 합니다.</div>
			<div id="pwsuccess" class="alert alert-success" >비밀번호가 일치합니다.</div>
			<div id="pwdanger" class="alert alert-danger" >비밀번호가 일치하지 않습니다.</div>
			<div class="form-group">
				<label for="NAME">이름</label>
				<div id="NAME" class="input-group">
					<input placeholder="성" type="text" aria-label="Last name" class="form-control" name="lastName" required> 
					<input placeholder="이름" type="text" aria-label="First name" class="form-control" name="firstName" required>
				</div>
			</div>
			<s2:birth />
			<div class="form-group">
				<label for="GENDER">성별</label> 
				<select class="form-control" name="gender">
					<option value="">성별</option>
					<option value="Male">남자</option>
					<option value="Female">여자</option>
					<option value="NULL">선택 안함</option>
				</select>
			</div>
			<input disabled id="submit1" style="width: 100%" type="submit" class="btn btn-primary" value="가입하기"/>
			<c:if test="${not empty message }">
				<div class="alert alert-danger" >가입실패</div>
			</c:if>
		</form>
	</div>
</body>
</html>