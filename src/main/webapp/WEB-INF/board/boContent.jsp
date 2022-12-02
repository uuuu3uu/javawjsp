<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>boContent.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function goodCheck() {
			$.ajax({
				type : "post",
				url	 : "${ctp}/boGood.bo",
				data : {idx : ${vo.idx}},  //문자열일때는 data : {idx : '${vo.idx}'}
				success : function(res) {
					location.reload();
				},
				error : function() {
					alert("전송오류 안나겠지만!");
				}
			});	
	}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class=text-center>글 내 용 보 기</h2>
	<br/>
	<table class="table table-borderless">
		<tr>
			<td class="text-right">hostIp : ${vo.hostIp}</td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<th>글쓴이</th>
			<td>${vo.nickName}</td>
			<th>글쓴날짜</th>
			<td>${vo.wDate}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${vo.title}</td>
		</tr>
		<tr>
			<th>전자메일</th>
			<td>${vo.email}</td>
			<th>조회수</th>
			<td>${vo.readNum}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td>${vo.homePage}</td>
			<th>좋아요</th>
			<td> <!-- content에 들어와있기 때문에 idx값 안넘겨줘도 된다❤ -->
				<c:if test="${vo.good == 0}"><a href="javascript:goodCheck()">🤍 </a>${vo.good}</c:if>
				<c:if test="${vo.good >= 1}"><a href="javascript:goodCheck()">❤️ ️</a>${vo.good}</c:if>
			</td> 
			<!-- <td>👍 👎</td> -->
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3" style="height:220px">${vo.content}</td>
		</tr>
		<tr>
			<td colspan="4" class="text-center">
				<input type="button" value="돌아가기" onclick="location.href='${ctp}/boList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary"/>
			</td>
		</tr>
		
	</table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>