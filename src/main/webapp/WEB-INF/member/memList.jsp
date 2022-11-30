<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>memList.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	
  	function midSearch() {
			let mid = myform.mid.value;
			if(mid.trim() == '') {
				alert("아이디를 입력하세요");
				myform.mid.focus();
			}
			else {
				myform.submit();
			}
	}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>전체 회원 리스트</h2>
	<br/>
	<form name="myform" method="post" action="${ctp}/memMemberSearch.mem">
		<div class="row mb-2">
			<div class="col form-inline">
				<input type="text" name="mid" class="form-control" autofocus />
				<input type="button" value="아이디 개별검색" onclick="midSearch();" class="btn btn-secondary"/>
			</div>
			<div class="col text-right"><button type="button" onclick="location.href='${ctp}/memList.mem';'" class="btn btn-secondary">전체검색</button></div>
		</div>
	</form>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>성명</th>
			<th>성별</th>
		</tr>
	 	<c:forEach var="vo" items="${vos}" varStatus="st">
	 		<tr>
	 			<td>${vo.idx}</td>			<!-- 겟방식으로 ${vo.mid}의 값을 mid라는 이름의 변수로 memInfor.mem 로 보내준다   -->
	 			<td><a href="${ctp}/memInfor.mem?mid=${vo.mid}&pag=${pag}">${vo.mid}</a></td>
	 			<td>${vo.nickName}</td>
	 			<td>${vo.name}<c:if test="${sLevel == 0 && vo.userInfor == '비공개'}"><font color="red">(비공개)</font></c:if></td> 
	 			<td>${vo.gender}</td>
	 		</tr>
		</c:forEach>
		<tr><td colspan="5" class="m-0 p-0"></td></tr>
	</table>
</div>
<!-- 과제 페이징 처리  -->
<div class="text-center">
	<ul class="pagination justify-content-center">
		<c:if test="${pag > 1}">
			<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=1"> 첫페이지</a></li>
		</c:if>
		<c:if test="${curBlock > 0}">
			<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		</c:if>
		<c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
			<c:if test="${i <= totPage && i == pag}">
				<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/memList.mem?pag=${i}">${i}</a></li>
			</c:if>
			<c:if test="${i <= totPage && i != pag}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${curBlock < lastBlock}">
			<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		</c:if>
		<c:if test="${pag < totPage}">
			<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${totPage}"> 마지막페이지</a></li>
		</c:if>	
	</ul>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>