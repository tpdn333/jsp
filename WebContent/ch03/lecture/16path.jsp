<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상대적 경로 (현재 파일 기준)</h2>
<h4>같은 경로</h4>
<a href="15form_method.jsp">15번 파일</a>

<h4>상위 경로</h4>
<a href="../17path.jsp">17번 파일</a>

<h4>하위 경로</h4>
<a href="subLecture/18path.jsp">18번 파일</a>

<h4>다른 경로</h4>
<a href="../textbook/viewHeaderList.jsp">viewHeaderList</a>
</body>
</html>