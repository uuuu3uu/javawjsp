<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	int level = session.getAttribute("sLevel")==null? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<script>
	'use strict';	
	function memberDel() {
		let ans = confirm("정말로 탈퇴하시겠습니까?");
		if(ans) {
			ans = confirm("탈퇴 후 1개월간은 같은 아이디로 가입하실 수 없습니다. \n 탈퇴하시겠습니까?");
			if(ans) location.href="${ctp}/memDelete.mem";
		}	
	}
</script>

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
	        <a class="nav-link" href="${ctp}/boList.bo">BORAD</a> <!-- 게시판 -->
	      </li>
	      <c:if test="${level != 1}">
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/pdsList.pds">PDS</a>	<!-- 자료실 -->
	      </li> 
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">STUDY1</a>
	        <div class="dropdown-menu">
		      	<a class="dropdown-item" href="${ctp}/pass.st">비밀번호 암호화</a>
		      	<a class="dropdown-item" href="${ctp}/ajax1.st">AJax연습1</a>
		      	<a class="dropdown-item" href="${ctp}/userList.st">AJax연습2</a>
		      	<a class="dropdown-item" href="${ctp}/upLoad1.st">싱글파일업로드</a>
		      	<a class="dropdown-item" href="${ctp}/upLoad2.st">멀티파일업로드1</a>
		      	<a class="dropdown-item" href="${ctp}/upLoad3.st">멀티파일업로드2</a>
		      	<a class="dropdown-item" href="${ctp}/upLoad4.st">멀티파일업로드3</a>
	    		</div>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">STUDY2</a>
	        <div class="dropdown-menu">
		      	<a class="dropdown-item" href="${ctp}/calendar1.st">달력1</a>
		      	<a class="dropdown-item" href="${ctp}/calendar2.st">달력2</a>   	
	    		</div>
	      </li>
	      </c:if>
	      <!-- 회원정보수정 -->
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">My Page</a>
	        <div class="dropdown-menu">
		      	<a class="dropdown-item" href="${ctp}/memMain.mem">회원방</a>
		      	<a class="dropdown-item" href="${ctp}/schedule.sc">일정관리</a>
		      	<c:if test="${level != 1}"><a class="dropdown-item" href="${ctp}/memList.mem">회원리스트</a></c:if>
		      	<a class="dropdown-item" href="${ctp}/memUpdatePwd.mem">회원비밀번호변경</a>
		      	<a class="dropdown-item" href="${ctp}/memPwdCheck.mem">회원정보변경</a>
		      	<a class="dropdown-item" href="javascript:memberDel()">회원탈퇴</a>
		      	<c:if test="${level == 0}"><a class="dropdown-item" href="${ctp}/adMain.ad">관리자</a></c:if> 
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