<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ tag import = "java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();
%>
<%= cal.get(Calendar.YEAR) %> 년
<%= cal.get(Calendar.MONDAY) +1 %> 월
<%= cal.get(Calendar.DATE) %> 일
