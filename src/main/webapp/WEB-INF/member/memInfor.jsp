<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memInfor.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회원정보 상세보기</h2>
	<br/>
	<table class="table">
		<tr><td>아이디: ${vo.mid}</td></tr>
		<tr><td>닉네임: ${vo.nickName}</td></tr>
		<tr><td>성명: ${vo.name}</td></tr>
		<tr><td>성별: ${vo.gender}</td></tr>
		<tr><td>생일: ${vo.birthday}</td></tr>
		<tr><td>전화번호: ${vo.tel}</td></tr>
		<tr><td>주소: ${vo.address}</td></tr>
		<tr><td>이메일: ${vo.email}</td></tr>
		<tr><td>홈페이지: ${vo.homePage}</td></tr>
		<tr><td>직업: ${vo.job}</td></tr>
		<tr><td>취미: ${vo.hobby}</td></tr>
		<tr><td>자기소개: ${vo.content}</td></tr>
		<tr><td>등급: ${strLevel}</td></tr>
		<tr><td>총방문횟수: ${vo.visitCnt}</td></tr>
		<tr><td>최초가입일: ${vo.startDate}</td></tr>
		<tr><td>마지막방문일: ${vo.lastDate}</td></tr>
		<tr><td>오늘 방문횟수: ${vo.todayCnt}</td></tr>
		<c:if test="${sLevel == 0}">
			<tr><td>포인트: ${vo.point}</td></tr>
			<tr><td>공개유무: ${vo.userInfor}</td></tr>
		</c:if>
		<tr><td>사진: <img src="${ctp}/data/member/${vo.photo}" width="150px"/></td></tr>
	</table>
	
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>