<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="<%= request.getContextPath()%>/sample2/main" >Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%= request.getContextPath()%>/sample2/main" >메인</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath()%>/sample2/signup">회원가입</a>
      </li>
      <c:if test="${empty sessionScope.userLogined }">
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath()%>/sample2/login">로그인</a>
	      </li>
      </c:if>
      <c:if test="${not empty sessionScope.userLogined }">
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath()%>/sample2/info">정보보기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath()%>/sample2/logout">로그아웃</a>
      </li>
      </c:if>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath()%>/sample2/list">목록보기</a>
      </li>
    </ul>
  </div>
</nav>

<%-- <div>
	<a href="<%= request.getContextPath()%>/sample2/main">메인</a>
	|
	<a href="<%= request.getContextPath()%>/sample2/signup">회원가입</a>
	|
	<a href="<%= request.getContextPath()%>/sample2/login">로그인</a>
	|
	<a href="<%= request.getContextPath()%>/sample2/info">정보보기</a>
	|
	<a href="<%= request.getContextPath()%>/sample2/list">목록보기</a>
</div> --%>