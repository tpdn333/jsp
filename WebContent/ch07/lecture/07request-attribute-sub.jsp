<%@ page import="ch07.Page"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	//String startStr = request.getParameter("start");
//String endStr = request.getParameter("end");
Page p = (Page) request.getAttribute("page");

int s = p.getStart();
int e = p.getEnd();
%>
<nav aria-label="Page navigation example">
	<ul class="pagination">
		<li class="page-item"><a class="page-link" href="#">Previous</a></li>
		<%
			for (int i = s; i <= e; i++) {
		%>
		<li class="page-item"><a class="page-link" href="#"><%=i%></a></li>
		<%
			}
		%>
		<li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
</nav>