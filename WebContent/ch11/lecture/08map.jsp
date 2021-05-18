<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Map<String, String> map = new HashMap<>();
	map.put("java", "spring");
	map.put("css", "bootstrap");
	map.put("js", "jquery");
	map.put("python", "ML");
	map.put("h-t-m-l", "html");
	map.put("hello world!", "hi");
	
	pageContext.setAttribute("map", map);
	pageContext.setAttribute("py", "python");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<!-- map의 java키를 가진 value가 꺼내진다 -->
		java : ${map.java }<br>
		css : ${map.css }<br>
		<hr>
		key를 string으로 <br>
		java : ${map["java"] }<br>
		<hr>
		python : ${map[py] }<br>
		<hr>
		특수기호들이 있는 key<br>
		h-t-m-l : ${map["h-t-m-l"] } ( \${map["h-t-m-l"] } )<br>
		hello world! : ${map["hello world!"] } ( \${map["hello world!"] } )<br>
	</div>
</body>
</html>