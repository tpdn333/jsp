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
	$(document).ready(function () {
		$("#pwsuccess, #pwdanger").hide();
		$("#PASSWORD1, #PASSWORD2").on("keyup", function() {
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
	<div class="container mt-3">
	<s2:navbar/>
		<form id="signup" action="<%=request.getContextPath()%>/sample2/signup" method="post">
			<div class="form-group">
				<label for="ID">아이디</label> 
				<input id="ID" class="form-control" type="text" name="id" />
			</div>
			<div class="form-group">
				<label for="PASSWORD1">비밀번호</label> 
				<input id="PASSWORD1" class="form-control" type="password" name="password" />
			</div>
			<div class="form-group">
				<label for="PASSWORD2">비밀번호 확인</label> 
				<input id="PASSWORD2" class="form-control" type="password" aria-describedby="passworHelp"/>
			</div>
			<div id="pwsuccess" class="alert alert-success" >비밀번호가 일치합니다.</div>
			<div id="pwdanger" class="alert alert-danger" >비밀번호가 일치하지 않습니다.</div>
			<div class="form-group">
				<label for="NAME">이름</label>
				<div id="NAME" class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">이름</span>
					</div>
					<input placeholder="성" type="text" aria-label="Last name" class="form-control" name="lastName"> 
					<input placeholder="이름" type="text" aria-label="First name" class="form-control" name="firstName">
				</div>
			</div>
			<s2:birth />
			<div class="form-group">
				<label for="GENDER">성별</label> 
				<select class="form-control" name="gender">
					<option value="">성별</option>
					<option value="Male">남자</option>
					<option value="Female">여자</option>
					<option value="">선택 안함</option>
				</select>
			</div>
			<input disabled id="submit1" style="width: 100%" type="submit" class="btn btn-primary" value="가입하기"/>
		</form>
	</div>
</body>
</html>