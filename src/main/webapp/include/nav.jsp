<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int level = session.getAttribute("sLevel")==null? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="http://192.168.50.250:9090/javawjsp/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/guest/guList.gu">GUEST</a> <!-- href = " 컨트롤러로 보낸다 "-->
      </li>
      <c:if test="${level <= 4}">
	      <li class="nav-item">
	        <a class="nav-link" href="#">BORAD</a> <!-- 게시판 -->
	      </li>
	      <c:if test="${level != 1}">
	      <li class="nav-item">
	        <a class="nav-link" href="#">PDS</a>	<!-- 자료실 -->
	      </li> 
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">STUDY</a>
	        <div class="dropdown-menu">
		      	<a class="dropdown-item" href="${ctp}/pass.st">비밀번호 암호화</a>
		      	<a class="dropdown-item" href="#">Link 2</a>
		      	<a class="dropdown-item-text" href="#">Text Link</a>
	    		</div>
	      </li>
	      </c:if>
	      <!-- 회원정보수정 -->
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">My Page</a>
	        <div class="dropdown-menu">
		      	<a class="dropdown-item" href="${ctp}/memMain.mem">회원방</a>
		      	<c:if test="${level != 1}"><a class="dropdown-item" href="${ctp}/memList.mem">회원리스트</a></c:if>
		      	<a class="dropdown-item" href="${ctp}/memUpdatePwd.mem">회원비밀번호변경</a>
		      	<a class="dropdown-item" href="${ctp}/memPwdCheck.mem">회원정보변경</a>
		      	<a class="dropdown-item" href="${ctp}/memDelete.mem">회원탈퇴</a>
	    		</div>
	      </li>      
      </c:if>
      <li class="nav-item">
      	<c:if test="${level > 4}"><a class="nav-link" href="${ctp}/memLogin.mem">Login</a></c:if>
      	<c:if test="${level <= 4}"><a class="nav-link" href="${ctp}/memLogout.mem">Logout</a></c:if>
      </li>
      
      <li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/memJoin.mem">Join</a></c:if>
      </li>    
    </ul>
     
  </div>  
</nav>