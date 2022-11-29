<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>1120 member.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function searchMid() {
  		let mid = prompt("찾고자 하는 아이디를 입력하세요");
  		
  		location.href="${pageContext.request.contextPath}/database/SearchMid?mid="+mid;
		
	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원전용방</h2>
	<p><font color="blue">${sMid}</font>님 로그인 중이십니다</p>
	<hr/>
	<p><img src="${pageContext.request.contextPath}/images/100.jpg" width="300px"/></p>
	<hr/>
	<p>
		현재 보유중인 포인트 : ${point}<br/>	 <!--  -->
		최종 방문일자 : <font color='red'><b>${sLastdate}</b></font>
	</p>
	<hr/>
	<div><a href="javascript:searchMid()" class="btn btn-success form-control mb-3">개별회원조회</a></div>
	<div><a href="${pageContext.request.contextPath}/database/MemberList" class="btn btn-success form-control mb-3">회원전체조회</a></div>
	<div class="row">
		<div class="col"><a href="${pageContext.request.contextPath}/database/LogOut" class="btn btn-success form-control">로그아웃</a></div>
	</div>
</div>
<p><br/></p>
</body>
</html>